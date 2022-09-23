using Ecommerce_API.Data;
using Ecommerce_API.Models;

namespace Ecommerce_API._Repositories.Interfaces
{
    public class FaqsRepository : Repository<Faqs>, IFaqsRepository
    {
        public FaqsRepository(DBContext context) : base(context)
        {
        }
    }
}