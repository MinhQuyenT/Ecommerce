using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IAboutService
    {
        Task<AboutDto> GetAbout();
        Task<OperationResult> Upload(AboutDto aboutDto);
        Task<OperationResult> UploadThum();
        Task<ImageDto> GetThum();
    }
}