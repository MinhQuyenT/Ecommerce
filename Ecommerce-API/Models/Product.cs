
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class Product
    {
        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Code { get; set; }
        [StringLength(250)]
        public string Title { get; set; }
        public string Description { get; set; }
        [StringLength(250)]
        public string Avartar { get; set; }
        [StringLength(250)]
        public string Thumb { get; set; }
        public string Content { get; set; }
        public string ImageList { get; set; }
        public double Price { get; set; }
        public double? OldPrice { get; set; }
        public string Promotion { get; set; }
        public bool? IsHot { get; set; }
        public bool? IsSale { get; set; }
        public bool? IsNew { get; set; }
        public int Quantity { get; set; }
        public bool? Status { get; set; }
        public int ProductCategoryId { get; set; }
        [Required]
        [StringLength(50)]
        public string CreateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateTime { get; set; }
        [StringLength(50)]
        public string UpdateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? UpdateTime { get; set; }
    }
}
