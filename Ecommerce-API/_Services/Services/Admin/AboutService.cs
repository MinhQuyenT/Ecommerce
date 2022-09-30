using AgileObjects.AgileMapper;
using CloudinaryDotNet;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class AboutService : IAboutService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _webhostEnv;
        private readonly IConfiguration _configuration;
        private Cloudinary _cloudinary;
        private readonly string ECOMMERCE;
        public AboutService(IRepositoryAccessor repositoryAccessor, IMapper mapper, IWebHostEnvironment webhostEnv, IConfiguration configuration)
        {
            _repositoryAccessor = repositoryAccessor;
            _mapper = mapper;
            _webhostEnv = webhostEnv;
            _configuration = configuration;
            _cloudinary = new Cloudinary(_configuration.GetSection("AppSettings:CLOUDINARY_URL").Value);
            ECOMMERCE = _configuration.GetSection("AppSettings:ECOMMERCE_FOLDER").Value;
        }

        public async Task<AboutDto> GetAbout()
        {
            var about = await _repositoryAccessor.About.FindAll().Project().To<AboutDto>().FirstOrDefaultAsync();

            return about ?? null;
        }

        public Task<ImageDto> GetThum()
        {
            throw new NotImplementedException();
        }

        public async Task<OperationResult> Upload(AboutDto aboutDto)
        {
            var about = Mapper.Map(aboutDto).ToANew<About>();

            var image = await _repositoryAccessor.About.FindSingle(x => x.Id == aboutDto.Id);
            if (image != null)
            {

            }


            throw new NotImplementedException();
        }

        public Task<OperationResult> UploadThum()
        {
            throw new NotImplementedException();
        }
    }
}