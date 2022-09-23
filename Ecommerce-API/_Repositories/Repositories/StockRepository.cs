using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class StockRepository : Repository<Stock>, IStockRepository
    {
        public StockRepository(DBContext context) : base(context)
        {
        }
    }
}