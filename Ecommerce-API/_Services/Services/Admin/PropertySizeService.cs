using AgileObjects.AgileMapper;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;

namespace Ecommerce_API._Services.Services.Admin
{
    public class PropertySizeService : IPropertySizeService
    {
        private readonly IRepositoryAccessor _repo;
        private readonly IFunctionUtility _utility;
        public PropertySizeService(IRepositoryAccessor repo, IFunctionUtility utility)
        {
            _repo = repo;
            _utility = utility;
        }

        public async Task<PaginationUtility<Size>> GetDataAll(PaginationParam pagination, string searchParam)
        {
            var preData = PredicateBuilder.New<Size>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                string keySearch = _utility.RemoveUnicode(searchParam).Trim();
                preData = preData.And(x => x.Name.Contains(keySearch) || x.Description.Contains(searchParam));
            }
            var result = _repo.Size.FindAll(preData);

            return await PaginationUtility<Size>.CreateAsync(result, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<Size> GetSize(int id)
        {
            var data = await _repo.Size.FindById(id);
            if (data == null)
            {
                return null;
            }
            return data;
        }

        public async Task<OperationResult> Add(SizeDto sizeDto)
        {
            var result = Mapper.Map(sizeDto).ToANew<Size>();
            _repo.Size.Add(result);
            await _repo.Save();
            return new OperationResult(true, result);
        }

        public async Task<OperationResult> Update(SizeDto sizeDto)
        {
            var size = await _repo.Size.FindSingle(x => x.Id == sizeDto.Id);
            if (size == null)
            {
                return new OperationResult(false);
            }
            var result = Mapper.Map(sizeDto).Over(size);
            await _repo.Save();
            return new OperationResult(true, result);
        }

        public async Task<bool> Delete(int id)
        {
            var size = await _repo.Size.FindById(id);
            if (size == null)
            {
                return false;
            }
            _repo.Size.Remove(size);
            await _repo.Save();

            return true;
        }
    }
}