using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class MenuTypeRepository : Repository<MenuType>, IMenuTypeRepository
    {
        public MenuTypeRepository(DBContext context) : base(context)
        {
        }
    }
}