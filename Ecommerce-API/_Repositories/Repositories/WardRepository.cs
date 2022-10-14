using Ecommerce_API._Repositories.Interfaces;
using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Repositories
{
    public class WardRepository : Repository<Ward>, IWardRepository
    {
        public WardRepository(DBContext context) : base(context)
        {
        }
    }
}