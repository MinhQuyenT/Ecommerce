using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IContactService
    {
        Task<PaginationUtility<Contact>> GetAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Add(ContactDto _contactDto);
        Task<OperationResult> Update(ContactDto _contactDto);
        Task<bool> Delete(int id);
    }
}