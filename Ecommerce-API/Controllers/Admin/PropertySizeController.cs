using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class PropertySizeController : ApiController
    {
        private readonly IPropertySizeService _service;
        public PropertySizeController(IPropertySizeService service)
        {
            _service = service;
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll([FromQuery] PaginationParam pagination, string searchParam)
        {
            return Ok(await _service.GetDataAll(pagination, searchParam));
        }

        [HttpGet("GetSize")]
        public async Task<IActionResult> GetSize(int id)
        {
            return Ok(await _service.GetSize(id));
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] SizeDto sizeDto)
        {
            return Ok(await _service.Add(sizeDto));
        }

        [HttpPut("Update")]
        public async Task<IActionResult> Update([FromBody] SizeDto sizeDto)
        {
            return Ok(await _service.Update(sizeDto));
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _service.Delete(id));
        }
    }
}