using AgileObjects.AgileMapper;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;

namespace Ecommerce_API._Services.Services.Admin
{
    public class PropertyMaterialService : IPropertyMaterialService
    {
        private readonly IRepositoryAccessor _repo;
       private readonly IFunctionUtility _utility;
        public PropertyMaterialService(IRepositoryAccessor repo, IFunctionUtility utility)
        {
            _repo = repo;
            _utility = utility;
        }
        public async Task<PaginationUtility<Material>> GetDataAll(PaginationParam pagination, string searchParam)
        {
            var preData = PredicateBuilder.New<Material>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                string keySearch = _utility.RemoveUnicode(searchParam).Trim();
                preData = preData.And(x => x.Name_vi.Contains(keySearch) || x.Name_en.Contains(searchParam));
            }
            var result = _repo.Material.FindAll(preData);
            return await PaginationUtility<Material>.CreateAsync(result, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<OperationResult> Add(MaterialDto materialDto)
        {
            var result = Mapper.Map(materialDto).ToANew<Material>();
            _repo.Material.Add(result);
            await _repo.Save();
            return new OperationResult(true, result);
        }

        public async Task<OperationResult> Update(MaterialDto materialDto)
        {
            var material = await _repo.Material.FindSingle(x => x.Id == materialDto.Id);
            if (material == null)
            {
                return new OperationResult(false);
            }
            var result = Mapper.Map(materialDto).Over(material);
            await _repo.Save();
            return new OperationResult(true, result);
        }

        public async Task<bool> Delete(int id)
        {
            var material = await _repo.Material.FindById(id);
            if (material == null)
            {
                return false;
            }
            _repo.Material.Remove(material);
            await _repo.Save();
           
            return true;
        }
    }
}