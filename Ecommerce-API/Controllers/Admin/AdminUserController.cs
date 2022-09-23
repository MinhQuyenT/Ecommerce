using System.Security.Claims;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins;
using Ecommerce_API.Helpers.Params.Admins;
using Ecommerce_API.Helpers.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class AdminUserController : ApiController
    {
        private readonly IAdminUserService _employeeService;

        public AdminUserController(IAdminUserService employeeService)
        {
            _employeeService = employeeService;
        }

        [HttpGet("All")]
        public async Task<IActionResult> GetUsers([FromQuery] EmployeeParam param, [FromQuery] PaginationParam pagination, [FromQuery] bool isPaging = true)
        {
            var result = await _employeeService.GetUsers(param, pagination, isPaging);
            return Ok(result);
        }

        [HttpGet]
        public async Task<IActionResult> GetUser([FromQuery] EmployeeParam param)
        {
            var result = await _employeeService.GetUser(param);
            return Ok(result);
        }

        [HttpGet("UserRoles")]
        public async Task<IActionResult> GetUserRoles([FromQuery] EmployeeParam param)
        {
            var result = await _employeeService.GetUserRoles(param);
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddUser([FromBody] AdminUserDto empDto)
        {
            var username = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var result = await _employeeService.AddUser(empDto, username);
            return Ok(result);
        }

        [HttpPost("UserRoles")]
        public async Task<IActionResult> UpdateUserRoles([FromBody] List<UserAuthorizeDto> roles, [FromQuery] string userAccount)
        {
            var username = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var result = await _employeeService.UpdateUserRoles(roles, userAccount, username);
            return Ok(result);
        }

        [HttpPut]
        public async Task<IActionResult> EditUser([FromBody] AdminUserDto empDto)
        {
            var username = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            var result = await _employeeService.EditUser(empDto, username);
            return Ok(result);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteUser([FromQuery] EmployeeParam param)
        {
            var result = await _employeeService.DeleteUser(param);
            return Ok(result);
        }
    }
}