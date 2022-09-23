using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class ProductRecentlyRepository : Repository<ProductRecently>, IProductRecentlyRepository
    {
        public ProductRecentlyRepository(DBContext context) : base(context)
        {
        }
    }
}