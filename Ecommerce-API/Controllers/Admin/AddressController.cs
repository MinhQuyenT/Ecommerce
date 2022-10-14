using Ecommerce_API._Services.Interfaces.Admin;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class AddressController:ApiController
    {
        private IAddressService _addressService;
        public AddressController(IAddressService addressService){
            _addressService = addressService;
        }

        [HttpGet("Provinces")]
        public async Task<IActionResult> GetProvinces()
        {
            var result = await _addressService.GetProvinces();
            return Ok(result);
        }

        [HttpGet("Districts")]
        public async Task<IActionResult> GetDistricts([FromQuery] string provinceID)
        {
            var result = await _addressService.GetDistricts(provinceID);
            return Ok(result);
        }

        [HttpGet("Wards")]
        public async Task<IActionResult> GetWards([FromQuery] string districtID)
        {
            var result = await _addressService.GetWards(districtID);
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> UploadExcel([FromForm] IFormFile excelFile)
        {
            var result = await _addressService.UploadExcel(excelFile);
            return Ok(result);
        }
    }
}