namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface ISysImageService
    {
        Task DestroyMedia(int? image_ID);
        Task<string> GetMediaUrl(int? image_ID);
        Task<int?> UpsertMedia(IFormFile file, string mediaName, int? image_ID);
    }
}