using AgileObjects.AgileMapper;
using AgileObjects.AgileMapper.Extensions;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helpers.Params.Admins;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class AdminService : IAdminUserService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;

        public AdminService(IRepositoryAccessor repositoryAccessor)
        {
            _repositoryAccessor = repositoryAccessor;
        }

        public async Task<OperationResult> AddUser(AdminUserDto empDto, string userAccount)
        {
            if (string.IsNullOrEmpty(empDto.UserAccount?.Trim()))
                return new OperationResult(false);

            var checkExists = await _repositoryAccessor.AdminUser.FindAll(x => x.UserAccount.Trim() == empDto.UserAccount.Trim()).AnyAsync();

            if (checkExists)
                return new OperationResult(false);

            var emp = empDto.Map().ToANew<AdminUser>(c => c.MapEntityKeys());
            emp.UpdateBy = userAccount;
            emp.UpdateTime = DateTime.Now;

            _repositoryAccessor.AdminUser.Add(emp);
            await _repositoryAccessor.Save();
            return new OperationResult(true, emp);
        }

        public async Task<OperationResult> DeleteUser(EmployeeParam param)
        {
            if (string.IsNullOrEmpty(param.UserAccount?.Trim()))
                return new OperationResult(false);

            var adminUser = await _repositoryAccessor.AdminUser.FindSingle(x => x.UserAccount.Trim() == param.UserAccount.Trim());

            if (adminUser == null)
                return new OperationResult(false);

            var userRoles = await _repositoryAccessor.AdminUserRole.FindAll(x => x.UserAccount.Trim() == param.UserAccount.Trim()).ToListAsync();

            _repositoryAccessor.AdminUser.Remove(adminUser);
            _repositoryAccessor.AdminUserRole.RemoveMultiple(userRoles);
            await _repositoryAccessor.Save();
            return new OperationResult(true);
        }

        public async Task<OperationResult> EditUser(AdminUserDto empDto, string userAccount)
        {
            var checkExists = await _repositoryAccessor.AdminUser.FindAll(x => x.UserAccount == empDto.UserAccount).AnyAsync();
            if (!checkExists)
                return new OperationResult(false);

            var emp = empDto.Map().ToANew<AdminUser>(c => c.MapEntityKeys());
            emp.UpdateBy = userAccount;
            emp.UpdateTime = DateTime.Now;

            _repositoryAccessor.AdminUser.Update(emp);
            await _repositoryAccessor.Save();
            return new OperationResult(true, emp);
        }

        public async Task<AdminUserDto> GetUser(EmployeeParam param)
        {
            var emp = await _repositoryAccessor.AdminUser.FindSingle(x => x.UserAccount.Trim() == param.UserAccount.Trim());
            var empDto = emp.Map().ToANew<AdminUserDto>();
            return empDto;
        }

        public async Task<List<UserAuthorizeDto>> GetUserRoles(EmployeeParam param)
        {
            if (string.IsNullOrEmpty(param.UserAccount))
                return null;

            var roles = await _repositoryAccessor.AdminRole.FindAll().ToListAsync();
            var userRoles = await _repositoryAccessor.AdminUserRole.FindAll(x => x.UserAccount.Trim() == param.UserAccount.Trim()).ToListAsync();
            var resource = roles
                .Select(x => new UserAuthorizeDto
                {
                    UserAccount = param.UserAccount.Trim(),
                    RoleName = x.RoleName,
                    RoleNote = x.RoleNote,
                    RoleSequence = x.RoleSequence,
                    RoleType = x.RoleType,
                    RoleUnique = x.RoleUnique,
                    Routing = x.Routing,
                    UpdateBy = x.UpdateBy,
                    UpdateTime = x.UpdateTime,
                    Url = x.Url,
                    ParentId = x.ParentId,
                    Status = userRoles.Any(y => y.RoleUnique.Trim() == x.RoleUnique.Trim())
                }).OrderBy(x => x.RoleSequence)
                .ToList();


            var result = GetRoleChildren(resource, null);
            result.ForEach(x =>
            {
                x.Children = GetRoleChildren(resource, x.RoleUnique);
                x.Children.ForEach(y =>
                {
                    y.Children = GetRoleChildren(resource, y.RoleUnique);
                    y.Children.ForEach(z =>
                    {
                        z.Children = GetRoleChildren(resource, z.RoleUnique);
                    });
                });
            });

            return result;
        }

        public async Task<PaginationUtility<AdminUserDto>> GetUsers(EmployeeParam param, PaginationParam pagination, bool isPaging = true)
        {
            var empPred = PredicateBuilder.New<AdminUser>(true);

            if (!string.IsNullOrEmpty(param.Email?.Trim()))
                empPred = empPred.And(x => x.Email.Contains(param.Email.Trim()));

            if (!string.IsNullOrEmpty(param.UserAccount?.Trim()))
                empPred = empPred.And(x => x.UserAccount.Contains(param.UserAccount.Trim()));

            if (!string.IsNullOrEmpty(param.UserName?.Trim()))
                empPred = empPred.And(x => x.UserName.Contains(param.UserName.Trim()));

            var empQuery = _repositoryAccessor.AdminUser.FindAll(empPred).Project().To<AdminUserDto>();
            var result = await PaginationUtility<AdminUserDto>.CreateAsync(empQuery, pagination.PageNumber, pagination.PageSize, isPaging);
            return result;
        }

        public async Task<OperationResult> UpdateUserRoles(List<UserAuthorizeDto> roles, string userAccount, string updateBy)
        {
            var dtNow = DateTime.Now;
            var adminUserRoles = new List<AdminUserRole>();

            roles = roles.Where(x => x.Status).ToList();
            roles.ForEach(x =>
            {
                adminUserRoles.Add(new AdminUserRole
                {
                    CreateBy = updateBy,
                    CreateTime = dtNow,
                    RoleUnique = x.RoleUnique,
                    UserAccount = userAccount
                });

                x.Children = x.Children?.Where(y => y.Status)?.ToList();
                x.Children?.ForEach(y =>
                {
                    adminUserRoles.Add(new AdminUserRole
                    {
                        CreateBy = updateBy,
                        CreateTime = dtNow,
                        RoleUnique = y.RoleUnique,
                        UserAccount = userAccount
                    });

                    y.Children = y.Children?.Where(z => z.Status)?.ToList();
                    y.Children?.ForEach(z =>
                    {
                        adminUserRoles.Add(new AdminUserRole
                        {
                            CreateBy = updateBy,
                            CreateTime = dtNow,
                            RoleUnique = z.RoleUnique,
                            UserAccount = userAccount
                        });
                    });
                });
            });

            var oldRoles = await _repositoryAccessor.AdminUserRole.FindAll(x => x.UserAccount == userAccount).ToListAsync();

            _repositoryAccessor.AdminUserRole.RemoveMultiple(oldRoles);
            _repositoryAccessor.AdminUserRole.AddMultiple(adminUserRoles);
            await _repositoryAccessor.Save();
            return new OperationResult(true);
        }

        private List<UserAuthorizeDto> GetRoleChildren(List<UserAuthorizeDto> roles, string roleUnique)
        {
            return roles.Where(x => x.ParentId == roleUnique).ToList();
        }
    }
}