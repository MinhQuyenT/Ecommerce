using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class ColorRepository : Repository<Color>, IColorRepository
    {
        public ColorRepository(DBContext context) : base(context)
        {
        }
    }
}