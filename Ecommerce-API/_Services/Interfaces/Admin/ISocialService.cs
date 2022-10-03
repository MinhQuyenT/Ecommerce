using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface ISocialService
    {
        Task<PaginationUtility<Social>> GetAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Post(List<SocialDto> socialDto);
    }
}