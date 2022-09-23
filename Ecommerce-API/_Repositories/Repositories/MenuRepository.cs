using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class MenuRepository : Repository<Menu>, IMenuRepository
    {
        public MenuRepository(DBContext context) : base(context)
        {
        }
    }
}