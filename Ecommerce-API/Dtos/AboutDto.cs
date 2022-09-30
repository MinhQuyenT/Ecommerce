namespace Ecommerce_API.Dtos
{
    public class AboutDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string MetaTitle { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string Detail { get; set; }
        public string MetaKeywork { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string MapUrl { get; set; }
        public string OpeningHours { get; set; }
        public bool? Status { get; set; }
        public string CreateBy { get; set; }
        public DateTime CreateTime { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateTime { get; set; }
    }
}