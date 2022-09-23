namespace Ecommerce_API.Helpers.Utilities
{
    public static class ExtensionMethods
    {
        /// <summary>
        /// Chuyển value về dạng chuỗi.
        /// Trả về dạng chuỗi của value
        /// </summary>
        /// <param name="input">Giá trị cần chuyển đổi. </param>
        /// <returns>Trả về danh sách 12 tháng kể từ tháng hiện tại.</returns>
        public static List<string> GetLast12Months(int year, int month)
        {
            //Your code goes here
            DateTime date = new DateTime(year, month, 1);
            List<string> listMonth = new List<string>();
            for (int i = 11; i >= 0; i--)
            {
                string monthLast = date.AddMonths(-i).ToString("yyyyMM");
                listMonth.Add(monthLast);
            }
            return listMonth;

        }


        /// <summary>
        /// Chuyển value về dạng chuỗi.
        /// Trả về dạng chuỗi của value
        /// </summary>
        /// <param name="currentYear">Giá trị cần chuyển đổi. </param>
        /// <returns>Trả về danh sách 5 năm kể từ năm  hiện tại.</returns>
        public static List<string> GetLast5Years(int currentYear)
        {
            //Your code goes here
            DateTime date = new DateTime(currentYear, 1, 1);
            List<string> listYear = new List<string>();
            for (int i = 4; i >= 0; i--)
            {
                string lastYear = date.AddYears(-i).ToString("yyyy");
                listYear.Add(lastYear);
            }
            return listYear;
        }

        /// <summary>
        /// Chuyển value về dạng chuỗi.
        /// Trả về dạng chuỗi của value
        /// </summary>
        /// <param name="input">Giá trị cần chuyển đổi. </param>
        /// <returns>Trả về danh sách 24 tháng kể từ tháng hiện tại.</returns>
        public static List<string> GetLast24Months(int year, int month)
        {
            //Your code goes here
            DateTime date = new DateTime(year, month, 1);
            List<string> listMonth = new List<string>();
            for (int i = 23; i >= 0; i--)
            {
                string monthLast = date.AddMonths(-i).ToString("yyyyMM");
                listMonth.Add(monthLast);
            }
            return listMonth;

        }


        public static List<string> GetMonthsFrom1ToCurrent(string year, int monthOfYear)
        {
            List<string> listMonth = new List<string>();
            for (int i = 1; i <= monthOfYear; i++)
            {
                var date = year + (i <= 9 ? $"0{i}" : i.ToString());
                listMonth.Add(date);
            }
            return listMonth.OrderByDescending(x => x).ToList();
        }

        /// <summary>
        /// Convert string date to begin time of DateTime. Default, return today.
        /// </summary>
        /// <param name="date"></param>
        /// <returns>DateTime (yyyy/MM/dd 00:00:00).</returns>
        public static DateTime ToBeginDate(this string date)
        {
            if (string.IsNullOrEmpty(date))
                date = DateTime.Now.ToString("yyyy/MM/dd");
            return Convert.ToDateTime($"{date} 00:00:00");
        }

        /// <summary>
        /// Convert DateTime to begin time of DateTime. Default, return today.
        /// </summary>
        /// <param name="date"></param>
        /// <returns>DateTime (yyyy/MM/dd 00:00:00).</returns>
        public static DateTime ToBeginDate(this DateTime date)
        {
            return new DateTime(date.Year, date.Month, date.Day, 0, 0, 0);
        }

        /// <summary>
        /// Convert string date to end time of DateTime. Default, return today.
        /// </summary>
        /// <param name="date"></param>
        /// <returns>DateTime (yyyy/MM/dd 23:59:59).</returns>
        public static DateTime ToEndDate(this string date)
        {
            if (string.IsNullOrEmpty(date))
                date = DateTime.Now.ToString("yyyy/MM/dd");
            return Convert.ToDateTime($"{date} 23:59:59");
        }

        /// <summary>
        /// Convert DateTime to end time of DateTime. Default, return today.
        /// </summary>
        /// <param name="date"></param>
        /// <returns>DateTime (yyyy/MM/dd 23:59:59).</returns>
        public static DateTime ToEndDate(this DateTime date)
        {
            return new DateTime(date.Year, date.Month, date.Day, 23, 59, 59);
        }
    }

    public class MediaUploadUtility
    {
        private readonly IWebHostEnvironment _webHostEnv;

        public MediaUploadUtility(IWebHostEnvironment webHostEnv)
        {
            _webHostEnv = webHostEnv;
        }

        /// <summary>
        /// Upload image or video file to wwwroot folder. Return file name with extension, default return null.
        /// </summary>
        /// <param name="file">File to upload.</param>
        /// <param name="fileNameWithoutExtension">File name without extension.</param>
        /// <returns>File name with extension.</returns>
        public async Task<string> UploadAsync(IFormFile file, string fileNameWithoutExtension)
        {
            if (file == null)
                return null;

            var extension = Path.GetExtension(file.FileName);
            if (string.IsNullOrEmpty(extension))
                return null;

            extension = extension.ToLower();
            var folderPath = extension == ".mp4" ? Path.Combine(_webHostEnv.WebRootPath, @"uploaded\video")
                                                 : Path.Combine(_webHostEnv.WebRootPath, @"uploaded\images");

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            var fileName = $"{fileNameWithoutExtension}{extension}";
            var filePath = Path.Combine(folderPath, fileName);

            if (System.IO.File.Exists(filePath))
                System.IO.File.Delete(filePath);

            try
            {
                using (FileStream fs = System.IO.File.Create(filePath))
                {
                    await file.CopyToAsync(fs);
                    await fs.FlushAsync();
                }

                return fileName;
            }
            catch (System.Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Upload image or video file converted from base64 string to wwwroot folder. Return file name with extension, default return null.
        /// </summary>
        /// <param name="file">base64 string.</param>
        /// <param name="fileNameWithoutExtension">File name without extension.</param>
        /// <returns>File name with extension.</returns>
        public async Task<string> UploadAsync(string file, string fileNameWithoutExtension)
        {
            if (string.IsNullOrEmpty(file))
                return null;

            var extension = $".{file.Split(';')[0].Split('/')[1]}";
            if (string.IsNullOrEmpty(extension))
                return null;

            extension = extension.ToLower();
            var folderPath = extension == ".mp4" ? Path.Combine(_webHostEnv.WebRootPath, @"uploaded\video")
                                                 : Path.Combine(_webHostEnv.WebRootPath, @"uploaded\images");

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            var fileName = $"{fileNameWithoutExtension}{extension}";
            var filePath = Path.Combine(folderPath, fileName);

            var base64 = file.Contains("video") ? file.Replace("data:video/mp4;base64,", "") : file.Substring(file.IndexOf(',') + 1);
            if (!file.Contains("video"))
                base64 = base64.Trim('\0');

            var fileData = Convert.FromBase64String(base64);

            try
            {
                await System.IO.File.WriteAllBytesAsync(filePath, fileData);
                return fileName;
            }
            catch (System.Exception)
            {
                return null;
            }
        }
    }
}