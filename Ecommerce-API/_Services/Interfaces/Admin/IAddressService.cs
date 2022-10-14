using Ecommerce_API.Helpers.Utilities;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface IAddressService
    {
        Task<List<KeyValuePair<string, string>>> GetDistricts(string provinceID);
        Task<List<KeyValuePair<string, string>>> GetProvinces();
        Task<List<KeyValuePair<string, string>>> GetWards(string districtID);
        Task<OperationResult> UploadExcel(IFormFile excelFile); 
    }
}