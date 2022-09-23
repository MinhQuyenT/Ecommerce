using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class BlogRepository : Repository<Blog>, IBlogRepository
    {
        public BlogRepository(DBContext context) : base(context)
        {
        }
    }
}