using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helpers.Params.Admins;
using Ecommerce_API.Helpers.Utilities;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IAdminUserService
    {
        Task<PaginationUtility<AdminUserDto>> GetUsers(EmployeeParam param, PaginationParam pagination, bool isPaging = true);
        Task<OperationResult> AddUser(AdminUserDto empDto, string userAccount);
        Task<AdminUserDto> GetUser(EmployeeParam param);
        Task<OperationResult> EditUser(AdminUserDto empDto, string userAccount);
        Task<List<UserAuthorizeDto>> GetUserRoles(EmployeeParam param);
        Task<OperationResult> UpdateUserRoles(List<UserAuthorizeDto> roles, string userAccount, string updateBy);
        Task<OperationResult> DeleteUser(EmployeeParam param);
    }
}