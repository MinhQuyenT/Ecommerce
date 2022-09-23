namespace Ecommerce_API.Dtos.Common
{
    public class ProductCategoryDto
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name_vi { get; set; }
        public string Name_en { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Avartar { get; set; }
        public bool? Status { get; set; }
        public string Thumb { get; set; }
        public string Url { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateTime { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateTime { get; set; }
    }
}