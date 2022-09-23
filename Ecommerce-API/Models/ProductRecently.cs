
using System.ComponentModel.DataAnnotations;
namespace Ecommerce_API.Models
{
    public partial class ProductRecently
    {
        [Key]
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int ProductCategoryId { get; set; }
        public int ProductId { get; set; }
    }
}
