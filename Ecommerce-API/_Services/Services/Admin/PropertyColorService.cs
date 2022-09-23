using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API._Repositories;
using Ecommerce_API.Models;
using AgileObjects.AgileMapper;
using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using LinqKit;

namespace Ecommerce_API._Services.Services.Admin
{
    public class PropertyColorService : IPropertyColorService
    {
        private readonly IRepositoryAccessor _repo;
        private readonly IFunctionUtility _utility;
        public PropertyColorService(IRepositoryAccessor repo, IFunctionUtility utility)
        {
            _repo = repo;
            _utility = utility;
        }

        public async Task<PaginationUtility<Color>> GetDataAll(PaginationParam pagination, string searchParam)
        {
            var preData = PredicateBuilder.New<Color>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                string keySearch = _utility.RemoveUnicode(searchParam).Trim();
                preData = preData.And(x => x.Name_en.Contains(keySearch) || x.Name_vi.Contains(searchParam));
            }
            var result = _repo.Color.FindAll(preData);
            return await PaginationUtility<Color>.CreateAsync(result, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<OperationResult> Add(ColorDto colorDto)
        {
            var result = Mapper.Map(colorDto).ToANew<Color>();
            _repo.Color.Add(result);

            await _repo.Save();

            return new OperationResult(true, result);
        }

        public async Task<OperationResult> Update(ColorDto colorDto)
        {
            var color = await _repo.Color.FindSingle(x => x.Id == colorDto.Id);
            if (color == null)
            {
                return new OperationResult(false);
            }
            var result = Mapper.Map(colorDto).Over(color);
            await _repo.Save();
            return new OperationResult(true, result);
        }

        public async Task<bool> Delete(int id)
        {
            var color = await _repo.Color.FindById(id);
            if (color == null)
            {
                return false;
            }
            _repo.Color.Remove(color);
            await _repo.Save();

            return true;
        }
    }
}