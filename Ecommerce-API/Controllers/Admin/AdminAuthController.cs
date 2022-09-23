using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helpers.Params.Admins;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminAuthController : ControllerBase
    {
        private readonly IAdminAuthService _adminAuthService;
        private readonly IConfiguration _configuration;

        public AdminAuthController(
            IAdminAuthService adminAuthService,
            IConfiguration configuration)
        {
            _adminAuthService = adminAuthService;
            _configuration = configuration;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login(UserForLoginParam userForLogin)
        {
            var user = await _adminAuthService.Login(userForLogin);

            if (user == null)
                return Unauthorized();

            return Ok(new UserReturnedDto
            {
                Token = user.Token,
                RefreshToken = user.RefreshToken,
                User = user
            });
        }

        [HttpPost("RefreshToken")]
        public async Task<IActionResult> RefreshToken([FromBody] TokenRequestParam tokenRequest)
        {
            var user = await _adminAuthService.RefreshToken(tokenRequest.Token);

            if (user == null)
                return Unauthorized();

            return Ok(new
            {
                token = user.Token,
                refreshToken = user.RefreshToken,
                user = user
            });
        }

        [HttpPost("RevokeToken")]
        public async Task<IActionResult> RevokeToken([FromBody] TokenRequestParam tokenRequest)
        {
            if (!string.IsNullOrEmpty(tokenRequest.Token))
                await _adminAuthService.RevokeToken(tokenRequest.Token);

            return NoContent();
        }
    }
}