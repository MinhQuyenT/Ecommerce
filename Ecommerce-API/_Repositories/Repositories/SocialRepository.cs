using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class SocialRepository : Repository<Social>, ISocialRepository
    {
        public SocialRepository(DBContext context) : base(context)
        {
        }
    }
}