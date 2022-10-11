namespace Ecommerce_API.Dtos
{
    public class BannerDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageList { get; set; }
        public string DestLink { get; set; }
        public string Type { get; set; }
        public bool? Status { get; set; }
        public string CreateBy { get; set; }
        public DateTime CreateTime { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateTime { get; set; }
    }
}