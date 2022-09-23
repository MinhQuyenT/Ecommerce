using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class BlogTagRepository : Repository<BlogTag> , IBlogTagRepository
    {
        public BlogTagRepository(DBContext context) : base(context)
        {
        }
    }
}