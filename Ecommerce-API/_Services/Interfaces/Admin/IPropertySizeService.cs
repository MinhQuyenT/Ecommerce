using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IPropertySizeService
    {
        Task<PaginationUtility<Size>> GetDataAll(PaginationParam pagination, string searchParam);
        Task<Size> GetSize(int id);
        Task<OperationResult> Add(SizeDto sizeDto);
        Task<OperationResult> Update(SizeDto sizeDto);
        Task<bool> Delete(int id);
    }
}