using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IPropertyMaterialService
    {
        Task<PaginationUtility<Material>> GetDataAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Add(MaterialDto materialDto);
        Task<OperationResult> Update(MaterialDto materialDto);
        Task<bool> Delete(int id);
    }
}