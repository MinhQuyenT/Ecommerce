using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class WishListRepository : Repository<WishList>, IWishListRepository
    {
        public WishListRepository(DBContext context) : base(context)
        {
        }
    }
}