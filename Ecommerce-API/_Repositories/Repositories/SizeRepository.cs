using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class SizeRepository : Repository<Size>, ISizeRepository
    {
        public SizeRepository(DBContext context) : base(context)
        {
        }
    }
}