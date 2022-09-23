
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class Menu
    {
        [Key]
        public int MenuID { get; set; }
        [StringLength(50)]
        public string Text { get; set; }
        [StringLength(250)]
        public string Link { get; set; }
        public int? DisplayOrder { get; set; }
        [StringLength(250)]
        public string Target { get; set; }
        public bool? Status { get; set; }
        public int MenuTypeID { get; set; }
        public int MenuParentID { get; set; }
    }
}
