using CloudinaryDotNet;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;

namespace Ecommerce_API._Services.Services.Admin
{
    public class SysImageService : ISysImageService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        private readonly IConfiguration _configuration;
        private Cloudinary _cloudinary;
        private readonly string ECOMMERCE;
        public SysImageService(IRepositoryAccessor repositoryAccessor, IConfiguration configuration)
        {
            _repositoryAccessor = repositoryAccessor;
            _configuration = configuration;
            _cloudinary = new Cloudinary(_configuration.GetSection("AppSettings:CLOUDINARY_URL").Value);
            ECOMMERCE = _configuration.GetSection("AppSettings:ECOMMERCE_FOLDER").Value;
        }

        public Task DestroyMedia(int? image_ID)
        {
            throw new NotImplementedException();
        }

        public Task<string> GetMediaUrl(int? image_ID)
        {
            throw new NotImplementedException();
        }

        public Task<int?> UpsertMedia(IFormFile file, string mediaName, int? image_ID)
        {
            throw new NotImplementedException();
        }
    }
}