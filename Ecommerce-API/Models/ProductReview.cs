
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class ProductReview
    {
        [Key]
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int CustomerId { get; set; }
        public double? Rating { get; set; }
        [StringLength(250)]
        public string Title { get; set; }
        [StringLength(250)]
        public string Content { get; set; }
    }
}
