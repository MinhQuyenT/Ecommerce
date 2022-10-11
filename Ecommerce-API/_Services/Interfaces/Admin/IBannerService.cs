using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IBannerService
    {
        Task<PaginationUtility<BannerDto>> GetAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Add(BannerDto _bannerDto);
        Task<OperationResult> Update(BannerDto _bannerDto);
        Task<bool> Delete(int id);
    }
}