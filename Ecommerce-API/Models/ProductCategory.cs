
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class ProductCategory
    {
        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Code { get; set; }
        [StringLength(250)]
        public string Name_vi { get; set; }
        [StringLength(250)]
        public string Name_en { get; set; }
        [StringLength(250)]
        public string Title { get; set; }
        public string Description { get; set; }
        [StringLength(250)]
        public string Avartar { get; set; }
        public bool? Status { get; set; }
        [StringLength(250)]
        public string Thumb { get; set; }
        public string Url { get; set; }
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
