using Ecommerce_API.Dtos.Admins.Properties;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IPropertyColorService
    {
        Task<PaginationUtility<Color>> GetDataAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Add(ColorDto colorDto);
        Task<OperationResult> Update(ColorDto colorDto);
        Task<bool> Delete(int id);
    }
}