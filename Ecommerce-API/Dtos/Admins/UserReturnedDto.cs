namespace Ecommerce_API.Dtos.Admins
{
    public class UserReturnedDto
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public UserForLoggedDto User { get; set; }
    }
}