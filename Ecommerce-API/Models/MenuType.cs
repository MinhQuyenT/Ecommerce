
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class MenuType
    {
        [Key]
        public int MenuTypeID { get; set; }
        [StringLength(50)]
        public string MenuName { get; set; }
    }
}
