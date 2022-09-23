using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Common;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce_API.Controllers.Admin
{
    public class CategoryController : ApiController
    {
        private readonly ICategoryService _serviceCategory;
        public CategoryController(ICategoryService serviceCategory) {
            _serviceCategory = serviceCategory;
        }

        [HttpGet("search")]
        public async Task<IActionResult> Search([FromQuery]PaginationParam pagination, string param) {
            var data = await _serviceCategory.Search(pagination, param);
            return Ok(data);
        }

        [HttpPost("addCategory")]
        public async Task<IActionResult> AddCategory([FromBody]ProductCategoryDto model) {
            var data = await _serviceCategory.AddCategory(model);
            return Ok(data);
        }

        [HttpGet("categoryInCode")]
        public async Task<IActionResult> CategoryInCode(string code) {
            var data = await _serviceCategory.CategoryInCode(code);
            return Ok(data);
        }
        
        [HttpPut("editCategory")]
        public async Task<IActionResult> EditCategory([FromBody]ProductCategoryDto model) {
            var data = await _serviceCategory.EditCategory(model);
            return Ok(data);
        }
    }
}