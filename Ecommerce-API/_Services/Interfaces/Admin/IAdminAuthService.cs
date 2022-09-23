using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helpers.Params.Admins;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IAdminAuthService
    {
        Task<UserForLoggedDto> Login(UserForLoginParam userForLogin);
        Task<UserForLoggedDto> RefreshToken(string token);
        Task RevokeToken(string token);
    }
}