using Ecommerce_API.Dtos.Common;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface ICategoryService
    {
        Task<PaginationUtility<ProductCategory>> Search(PaginationParam pagination, string param);
        Task<bool> AddCategory(ProductCategoryDto model);
        Task<ProductCategory> CategoryInCode(string code);
        Task<bool> EditCategory(ProductCategoryDto model);
    }
}