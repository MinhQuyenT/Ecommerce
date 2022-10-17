using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class ContactController:ApiController
    {
        private readonly IContactService _contacService; 
        public ContactController(IContactService contacService){
            _contacService = contacService;
        }

        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll([FromQuery]PaginationParam pagination, string param){
           var data = await _contacService.GetAll(pagination,param);
           return Ok(data); 
        }
        
        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody]ContactDto model){
           var data = await _contacService.Add(model);
           return Ok(data); 
        }

        [HttpPut()]
        public async Task<IActionResult> Edit([FromBody]ContactDto model){
           var data = await _contacService.Add(model);
           return Ok(data); 
        }

        [HttpDelete()]
        public async Task<IActionResult> Delete([FromQuery]int id){
           var data = await _contacService.Delete(id);
           return Ok(data); 
        }
    }
}