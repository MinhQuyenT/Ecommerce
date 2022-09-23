using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class PropertyMaterialController : ApiController
    {
        private readonly IPropertyMaterialService _service;
        public PropertyMaterialController(IPropertyMaterialService service)
        {
            _service = service;
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll([FromQuery] PaginationParam pagination, string searchParam)
        {
            return Ok(await _service.GetDataAll(pagination, searchParam));
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] MaterialDto materialDto)
        {
            return Ok(await _service.Add(materialDto));
        }

        [HttpPut("Update")]
        public async Task<IActionResult> Update([FromBody] MaterialDto materialDto)
        {
            return Ok(await _service.Update(materialDto));
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await _service.Delete(id));
        }
    }
}