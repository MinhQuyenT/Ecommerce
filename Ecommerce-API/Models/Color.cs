
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class Color
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(250)]
        public string Name_en { get; set; }
         [StringLength(250)]
        public string Name_vi { get; set; }
        [StringLength(50)]
        public string Code { get; set; }
        [StringLength(250)]
        public string Description { get; set; }
    }
}
