using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class About
    {
        [Key]
        public int Id { get; set; }
        [StringLength(250)]
        public string Title { get; set; }
        [StringLength(250)]
        public string MetaTitle { get; set; }
        [StringLength(500)]
        public string Description { get; set; }
        [StringLength(250)]
        public string Image { get; set; }
        [Column(TypeName = "ntext")]
        public string Detail { get; set; }
        [StringLength(250)]
        public string MetaKeywork { get; set; }
        [StringLength(250)]
        public string Address { get; set; }
        [StringLength(20)]
        public string Phone { get; set; }
        [StringLength(250)]
        public string Email { get; set; }
        public string MapUrl { get; set; }
        [StringLength(250)]
        public string OpeningHours { get; set; }
        public bool? Status { get; set; }
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