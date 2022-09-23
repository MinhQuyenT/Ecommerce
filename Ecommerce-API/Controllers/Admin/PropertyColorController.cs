using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class PropertyColorController : ApiController
    {
        private readonly IPropertyColorService _service;
        public PropertyColorController(IPropertyColorService service)
        {
            _service = service;
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll([FromQuery] PaginationParam pagination, string searchParam)
        {
            return Ok(await _service.GetDataAll(pagination, searchParam));
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] ColorDto colorDto)
        {
            return Ok(await _service.Add(colorDto));
        }

        [HttpPut("Update")]
        public async Task<IActionResult> Update([FromBody] ColorDto colorDto)
        {
            return Ok(await _service.Update(colorDto));
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _service.Delete(id));
        }
    }
}