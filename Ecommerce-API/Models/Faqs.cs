
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class Faqs
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(250)]
        public string Question { get; set; }
        [Required]
        public string Answer { get; set; }
        public bool? Status { get; set; }
        [Required]
        [StringLength(50)]
        public string CreateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateTime { get; set; }
        public int PolicyId { get; set; }
    }
}
