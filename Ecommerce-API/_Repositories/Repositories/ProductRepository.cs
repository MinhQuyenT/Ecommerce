using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {
        public ProductRepository(DBContext context) : base(context)
        {
        }
    }
}