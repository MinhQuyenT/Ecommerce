using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Common;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;

namespace Ecommerce_API._Services.Services.Admin
{
    public class CategoryService : ICategoryService
    {
        private readonly IRepositoryAccessor _repoAccessor;
        public CategoryService(IRepositoryAccessor repoAccessor)
        {
            _repoAccessor = repoAccessor;
        }

        public async Task<bool> AddCategory(ProductCategoryDto model)
        {
            var fn = new FunctionUtility();
            var code = ConvertUtility.RandomStringUpper(2) + ConvertUtility.RandomNumber(4);
            var pictureFileName = await fn.UploadAsync(model.Avartar, "Category", code + Guid.NewGuid().ToString().Substring(0, 4));
            var picturePath = "Category/" + pictureFileName;

            var categoryNew = new ProductCategory();
            categoryNew.Code = code;
            categoryNew.Name_en = model.Name_en;
            categoryNew.Name_vi = model.Name_vi;
            categoryNew.Title = model.Title;
            categoryNew.Description = model.Description;
            categoryNew.Avartar = picturePath;
            categoryNew.Thumb = picturePath;
            categoryNew.CreateBy = "Admin";
            categoryNew.CreateTime = DateTime.Now;

            _repoAccessor.ProductCategory.Add(categoryNew);
            var save = await _repoAccessor.Save();
            return true;
        }

        public async Task<ProductCategory> CategoryInCode(string code)
        {
            return await _repoAccessor.ProductCategory.FindSingle(x => x.Code.Trim() == code.Trim());
        }

        public async Task<bool> EditCategory(ProductCategoryDto model)
        {
            var category = await _repoAccessor.ProductCategory.FindSingle(x => x.Id == model.Id);
            category.Name_en = model.Name_en;
            category.Name_vi = model.Name_vi;
            category.Title = model.Title;
            category.Description = model.Description;
            if(model.Avartar != category.Avartar) {
                var fn = new FunctionUtility();
                var code = ConvertUtility.RandomStringUpper(2) + ConvertUtility.RandomNumber(4);
                var pictureFileName = await fn.UploadAsync(model.Avartar, "Category", code + Guid.NewGuid().ToString().Substring(0, 4));
                var picturePath = "Category/" + pictureFileName;
                category.Avartar = picturePath;
                category.Thumb = picturePath;
            }
            var save = await _repoAccessor.Save();
            return save;
        }

        public async Task<PaginationUtility<ProductCategory>> Search(PaginationParam pagination, string param)
        {
            var predCategory = PredicateBuilder.New<ProductCategory>(true);
            if (!string.IsNullOrEmpty(param))
            {
                param = param.ToUpper();
                predCategory.And(x => x.Code.ToUpper().Contains(param) || x.Name_vi.Contains(param) || x.Name_en.ToUpper().Contains(param));
            }
            var data = _repoAccessor.ProductCategory.FindAll(predCategory);
            return await PaginationUtility<ProductCategory>.CreateAsync(data, pagination.PageNumber, pagination.PageSize);
        }
    }
}