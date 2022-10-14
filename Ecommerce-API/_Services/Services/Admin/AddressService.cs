using Aspose.Cells;
using DEcommerce_API.Models;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class AddressService:IAddressService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        private readonly IFunctionUtility _functionUtility;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public AddressService(IRepositoryAccessor repositoryAccessor,IFunctionUtility functionUtility,IWebHostEnvironment webHostEnvironment){
            _repositoryAccessor =repositoryAccessor;
            _functionUtility = functionUtility;
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<List<KeyValuePair<string, string>>> GetDistricts(string provinceID)
        {
            if (string.IsNullOrEmpty(provinceID))
                return new List<KeyValuePair<string, string>>();
            var result = await _repositoryAccessor.District
                        .FindAll(x=>x.ProvinceCode==provinceID)
                        .OrderBy(x=>x.Name)
                        .Select(x => new KeyValuePair<string, string>(x.Code, x.Name))
                        .ToListAsync();

            return result;
        }

        public async Task<List<KeyValuePair<string, string>>> GetProvinces()
        {
            var result = await _repositoryAccessor.Province.FindAll().OrderBy(x=>x.Name).Select(x=> new KeyValuePair<string,string>(x.Code,x.Name)).ToListAsync();

            return result;
        }

        public async Task<List<KeyValuePair<string, string>>> GetWards(string districtID)
        {
            if (string.IsNullOrEmpty(districtID))
                return new List<KeyValuePair<string, string>>();
            var result = await _repositoryAccessor.Ward.FindAll(x=>x.DistrictCode==districtID).OrderBy(x=>x.Name).Select(x => new KeyValuePair<string, string>(x.Code, x.Name)).ToListAsync();
            
            return result;
        }

        public async Task<OperationResult> UploadExcel(IFormFile excelFile)
        {
             if (excelFile == null)
                return new OperationResult(false, "DATA_NOT_FOUND");

            var subfolder = Path.Combine("uploaded", "excel");
            var fileName = await _functionUtility.UploadAsync(excelFile, subfolder, "default");

            if (fileName == null)
                return new OperationResult(false, "UPLOAD_FAILED");

            var filePath = Path.Combine(_webHostEnvironment.WebRootPath, subfolder, fileName);

            var designer = new WorkbookDesigner();
            designer.Workbook = new Workbook(filePath);
            var ws = designer.Workbook.Worksheets[0];
            int rows = ws.Cells.MaxDataRow;
            var excelModels = new List<ExcelDto>();

            for (int i = 1; i <= rows; i++)
            {
                var model = new ExcelDto
                {
                    ProvinceName = ws.Cells[i, 0]?.StringValue,
                    ProvinceID = ws.Cells[i, 1]?.StringValue,
                    DistrictName = ws.Cells[i, 2]?.StringValue,
                    DistrictID = ws.Cells[i, 3]?.StringValue,
                    WardName = ws.Cells[i, 4]?.StringValue,
                    WardID = ws.Cells[i, 5]?.StringValue,
                    WardLevel = ws.Cells[i, 6]?.StringValue,
                    WardEnglishName = ws.Cells[i, 7]?.StringValue,
                };

                excelModels.Add(model);
            }

            var wards = excelModels
                .Where(x => !string.IsNullOrEmpty(x.WardID))
                .Select(x => new Ward
                {
                    Code = x.WardID!,
                    Name = x.WardName!,
                    Level = x.WardLevel,
                    WardEnglishName = x.WardEnglishName,
                    DistrictCode = x.DistrictID!
                }).ToList();
            
            var districts = excelModels
                .Where(x => !string.IsNullOrEmpty(x.DistrictID))
                .GroupBy(x => x.DistrictID)
                .Select(x => new District
                {
                    Code = x.Key!,
                    Name = x.FirstOrDefault()?.DistrictName!,
                    ProvinceCode = x.FirstOrDefault()?.ProvinceID!
                }).ToList();

            var provinces = excelModels
                .Where(x => !string.IsNullOrEmpty(x.ProvinceID))
                .GroupBy(x => x.ProvinceID)
                .Select(x => new Province
                {
                    Code = x.Key!,
                    Name = x.FirstOrDefault()?.ProvinceName!
                }).ToList();

            var wardList = await _repositoryAccessor.Ward.FindAll().ToListAsync();
            var districtList = await _repositoryAccessor.District.FindAll().ToListAsync();
            var provinceList = await _repositoryAccessor.Province.FindAll().ToListAsync();

            _repositoryAccessor.Ward.RemoveMultiple(wardList);
            _repositoryAccessor.District.RemoveMultiple(districtList);
            _repositoryAccessor.Province.RemoveMultiple(provinceList);

            _repositoryAccessor.Ward.AddMultiple(wards);
            _repositoryAccessor.District.AddMultiple(districtList);
            _repositoryAccessor.Province.AddMultiple(provinces);
            
            try
            {
                await _repositoryAccessor.Save();
                return new OperationResult(true);
            }
            catch (System.Exception error)
            {
                  return new OperationResult(false,error);
            }
        }
    }
}