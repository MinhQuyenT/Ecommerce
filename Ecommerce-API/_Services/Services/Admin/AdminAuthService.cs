using AgileObjects.AgileMapper;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helper.Utilities;
using Ecommerce_API.Helpers.Params.Admins;
using Ecommerce_API.Models;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class AdminAuthService : IAdminAuthService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        private readonly IJwtUtility _jwtUtility;

        public AdminAuthService(
            IRepositoryAccessor repositoryAccessor,
            IJwtUtility jwtUtility)
        {
            _repositoryAccessor = repositoryAccessor;
            _jwtUtility = jwtUtility;
        }

        public async Task<UserForLoggedDto> Login(UserForLoginParam userForLogin)
        {
            var dtNow = DateTime.Now;

            // Kiểm tra tên đăng nhập và mật khẩu
            if (string.IsNullOrEmpty(userForLogin.Username) || string.IsNullOrEmpty(userForLogin.Password))
            {
                return null;
            }

            // Tiến hành đăng nhập
            var adminUser = await _repositoryAccessor.AdminUser
                .FindAll(x =>
                    x.UserAccount.Trim() == userForLogin.Username.Trim() &&
                    x.Password.Trim() == userForLogin.Password &&
                    x.ValidFrom <= dtNow &&
                    x.ValidTo >= dtNow)
                .FirstOrDefaultAsync();

            // Không tồn tại username hoặc mật khẩu
            if (adminUser == null)
                return null;

            // Đăng nhập thành công, tiến hành lấy roles
            var adminRoles = await GetUserRoles(userForLogin.Username);

            // Tạo Token và Refresh Token
            var jwtToken = _jwtUtility.GenerateJwtToken(adminUser);
            var refreshToken = _jwtUtility.GenerateRefreshToken(adminUser);

            // Xoá các Refresh Token hết hạn hoặc không hợp lệ
            await RemoveOldRefreshTokens(adminUser);

            // Lưu Refersh Token mới vào DB
            _repositoryAccessor.RefreshToken.Add(refreshToken);

            // Cập nhật lần cuối đăng nhập
            adminUser.LastLogin = dtNow;
            _repositoryAccessor.AdminUser.Update(adminUser);
            await _repositoryAccessor.Save();

            // Khởi tạo user trả về
            var userToReturn = new UserForLoggedDto
            {
                UserAccount = adminUser.UserAccount,
                Username = adminUser.UserName,
                Roles = adminRoles,
                Token = jwtToken,
                RefreshToken = refreshToken.Token
            };

            return userToReturn;
        }

        public async Task<UserForLoggedDto> RefreshToken(string token)
        {
            var adminUser = await GetUserByRefreshToken(token);

            if (adminUser == null)
                return null;

            var refreshToken = await _repositoryAccessor.RefreshToken.FindSingle(x => x.Token == token);

            // Trường hợp Token bị thu hồi rồi thì thu hồi tất cả Token con cháu
            if (refreshToken.IsRevoked)
                await RevokeDescendantRefreshTokens(refreshToken, adminUser, $"Attempted reuse of revoked ancestor token: {token}");

            // Trường hợp Token không hoạt động
            if (!refreshToken.IsActive)
                return null;

            // Tạo Refresh Token mới
            var newRefreshToken = await RotateRefreshToken(refreshToken, adminUser);
            _repositoryAccessor.RefreshToken.Add(newRefreshToken);
            await _repositoryAccessor.Save();

            // Xoá Refresh Token cũ
            await RemoveOldRefreshTokens(adminUser);

            // Tạo Token mới
            var jwtToken = _jwtUtility.GenerateJwtToken(adminUser);

            // Lấy roles
            var adminRoles = await GetUserRoles(adminUser.UserAccount);

            var userToReturn = new UserForLoggedDto
            {
                UserAccount = adminUser.UserAccount,
                Username = adminUser.UserName,
                Roles = adminRoles,
                Token = jwtToken,
                RefreshToken = newRefreshToken.Token
            };

            return userToReturn;
        }

        private async Task<List<AdminCoreRoleDto>> GetUserRoles(string userAccount)
        {

            var adminUserRole = await _repositoryAccessor.AdminUserRole.FindAll().ToListAsync();
            var userRole = await _repositoryAccessor.AdminRole.FindAll().ToListAsync();

            var roles = await _repositoryAccessor.AdminUserRole
                .FindAll(r => r.UserAccount.Trim() == userAccount.Trim())
                .Join(_repositoryAccessor.AdminRole.FindAll(), x => x.RoleUnique, y => y.RoleUnique, (x, y) => new AdminCoreRoleDto
                {
                    RoleName = y.RoleName,
                    RoleNote = y.RoleNote,
                    RoleUnique = y.RoleUnique,
                    RoleType = y.RoleType,
                    Routing = y.Routing,
                    Url = y.Url,
                    RoleSequence = y.RoleSequence,
                    ParentId = y.ParentId
                }).OrderBy(x => x.RoleSequence)
                .ToListAsync();

            return roles;
        }

        private async Task RemoveOldRefreshTokens(AdminUser user)
        {
            // Lấy ra các Refresh Token hết hạn (sau 2 ngày) hoặc không hợp lệ
            var refreshTokens = await _repositoryAccessor.RefreshToken
                .FindAll(x => x.UserAccount.Trim() == user.UserAccount.Trim())
                .ToListAsync();

            refreshTokens = refreshTokens.Where(x => !x.IsActive && x.CreatedTime.AddDays(2) <= DateTime.Now).ToList();

            // Xoá các Refresh Token
            _repositoryAccessor.RefreshToken.RemoveMultiple(refreshTokens);
            await _repositoryAccessor.Save();
        }

        private async Task<AdminUser> GetUserByRefreshToken(string token)
        {
            var userAccount = await _repositoryAccessor.RefreshToken
                .FindAll(x => x.Token == token)
                .Select(x => x.UserAccount)
                .FirstOrDefaultAsync();

            if (userAccount == null)
                return null;

            var adminUser = await _repositoryAccessor.AdminUser
                .FindAll(x => x.UserAccount == userAccount)
                .FirstOrDefaultAsync();

            return adminUser;
        }

        private async Task RevokeDescendantRefreshTokens(RefreshToken refreshToken, AdminUser user, string reason)
        {
            // Đệ quy tìm tất cả Refresh Token con cháu và thu hồi tất cả
            if (!string.IsNullOrEmpty(refreshToken.ReplacedByToken))
            {
                var childToken = await _repositoryAccessor.RefreshToken.FindSingle(x => x.Token == refreshToken.ReplacedByToken);

                if (childToken.IsActive)
                    await RevokeRefreshToken(childToken, reason);
                else
                    await RevokeDescendantRefreshTokens(childToken, user, reason);
            }
        }

        private async Task RevokeRefreshToken(RefreshToken token, string reason = null, string replacedByToken = null)
        {
            token.RevokedTime = DateTime.Now;
            token.ReasonRevoked = reason;
            token.ReplacedByToken = replacedByToken;

            _repositoryAccessor.RefreshToken.Update(token);
            await _repositoryAccessor.Save();
        }

        private async Task<RefreshToken> RotateRefreshToken(RefreshToken refreshToken, AdminUser user)
        {
            var newRefreshToken = _jwtUtility.GenerateRefreshToken(user);
            await RevokeRefreshToken(refreshToken, "Replaced by new token", newRefreshToken.Token);
            return newRefreshToken;
        }

        public async Task RevokeToken(string token)
        {
            var adminUserDto = await GetUserByRefreshToken(token);

            if (adminUserDto != null)
            {
                var refreshToken = await _repositoryAccessor.RefreshToken.FindSingle(x => x.Token == token);

                if (refreshToken.IsActive)
                    await RevokeRefreshToken(refreshToken, "Revoked without replacement");
            }
        }
    }
}