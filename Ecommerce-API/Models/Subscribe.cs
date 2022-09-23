
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class Subscribe
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(250)]
        public string Email { get; set; }
        public bool? Status { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateTime { get; set; }
    }
}
