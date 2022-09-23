using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class ProductReviewRepository : Repository<ProductReview>, IProductReviewRepository
    {
        public ProductReviewRepository(DBContext context) : base(context)
        {
        }
    }
}