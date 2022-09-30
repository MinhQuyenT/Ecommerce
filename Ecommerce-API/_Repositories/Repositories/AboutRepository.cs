using Ecommerce_API._Repositories.Interfaces;
using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Repositories
{
    public class AboutRepository : Repository<About>, IAboutRepository
    {
        public AboutRepository(DBContext context) : base(context)
        {
        }
    }
}