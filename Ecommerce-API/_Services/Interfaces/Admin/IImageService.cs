using Ecommerce_API.Dtos;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IImageService
    {
        Task<ImageDto> Upload(IFormFile file);
        Task<ImageDto> Upload(string base64String);
        Task<bool> Delete(string fileName);

    }
}