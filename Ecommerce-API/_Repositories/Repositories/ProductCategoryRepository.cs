using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class ProductCategoryRepository : Repository<ProductCategory>, IProductCategoryRepository
    {
        public ProductCategoryRepository(DBContext context) : base(context)
        {
        }
    }
}