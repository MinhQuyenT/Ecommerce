using Ecommerce_API.Models;

namespace Ecommerce_API.Dtos.Admins
{
    public class UserAuthorizeDto : AdminRole
    {
        public string UserAccount { get; set; }
        public bool Status { get; set; }
        public List<UserAuthorizeDto> Children { get; set; }
    }
}