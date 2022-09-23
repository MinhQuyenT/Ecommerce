
using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class Stock
    {
        [Key]
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int ColorId { get; set; }
        public int SizeId { get; set; }
        public int MaterialId { get; set; }
        public int Quantity { get; set; }
    }
}
