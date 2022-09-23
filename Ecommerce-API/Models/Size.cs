
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class Size
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(250)]
        public string Name { get; set; }
        [StringLength(50)]
        public string Bust { get; set; }
         [StringLength(50)]
        public string Waist { get; set; }
         [StringLength(50)]
        public string Hip { get; set; }
         [StringLength(50)]
        public string Height { get; set; }
         [StringLength(50)]
        public string Weight { get; set; }
        [StringLength(250)]
        public string Description { get; set; }
    }
}
