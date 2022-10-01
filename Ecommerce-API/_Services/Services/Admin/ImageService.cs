using System.Drawing;
using System.IO;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers;
using Ecommerce_API.Helpers.Utilities;

namespace Ecommerce_API._Services.Services.Admin
{
    public class ImageService : IImageService
    {
        private readonly IWebHostEnvironment _webHostEnv;
        public ImageService(IWebHostEnvironment webHostEnv)
        {
            _webHostEnv = webHostEnv;
        }

        public async Task<bool> Delete(string fileName)
        {
            var file = Path.Combine(_webHostEnv.WebRootPath, @"upload/image", fileName);
            try
            {
                if (File.Exists(file))
                {
                    await Task.Run(() => File.Delete(file));
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<ImageDto> Upload(IFormFile file)
        {
            var uu = new FunctionUtility();

            if (file.ContentType.Contains("image"))
            {
                var base64StringFile = string.Empty;
                var extension = Path.GetExtension(file.FileName).Replace(".", "");
                // todo: UPLOAD IMAGE
                using (var memoryStream = new MemoryStream())
                {
                    await file.CopyToAsync(memoryStream);
                    using (var image = Image.FromStream(memoryStream))
                        base64StringFile = Base64String(image, extension);
                }
                var fileName = await uu.UploadAsync(base64StringFile, Guid.NewGuid().ToString());
                return new ImageDto { FileName = fileName };
            }
            else
            {
                var fileName = await uu.UploadAsync(file, Guid.NewGuid().ToString());
                return new ImageDto { FileName = fileName };
            }
        }

        public async Task<ImageDto> Upload(string base64String)
        {
            var uu = new FunctionUtility();

            if (base64String.Contains("image"))
            {
                // Convert base64String to Image
                var base64StringFile = string.Empty;
                var extension = $"{base64String.Split(';')[0].Split('/')[1]}";
                var base64 = base64String.Substring(base64String.IndexOf(',') + 1);
                base64 = base64.Trim('\0');
                var bytes = Convert.FromBase64String(base64);
                using (var memoryStream = new MemoryStream(bytes))
                {
                    using (var image = Image.FromStream(memoryStream))
                        base64StringFile = Base64String(image, extension);
                }
                // todo: UPLOAD IMAGE
                var fileName = await uu.UploadAsync(base64StringFile, Guid.NewGuid().ToString());
                return new ImageDto { FileName = fileName };
            }
            else
            {
                var fileName = await uu.UploadAsync(base64String, Guid.NewGuid().ToString());
                return new ImageDto { FileName = fileName };
            }
        }


        public string Base64String(Image image, string extension)
        {
            var result = string.Empty;
            using (var resultStream = new MemoryStream())
            {
                image.Save(resultStream, image.RawFormat);
                byte[] imageBytes = resultStream.ToArray();
                result = $"data:image/{extension};base64,{Convert.ToBase64String(imageBytes)}";
            }
            return result;
        }
    }
}