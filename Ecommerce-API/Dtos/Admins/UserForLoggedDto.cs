using System.Text.Json.Serialization;

namespace Ecommerce_API.Dtos.Admins
{
    public class UserForLoggedDto
    {
        public string UserAccount { get; set; }
        public string Username { get; set; }
        public List<AdminCoreRoleDto> Roles { get; set; }
        [JsonIgnore]
        public string Token { get; set; }
        [JsonIgnore]
        public string RefreshToken { get; set; }
    }

    public partial class AdminCoreRoleDto
    {
        public string RoleUnique { get; set; }
        public string RoleName { get; set; }
        public string RoleType { get; set; }
        public string RoleNote { get; set; }
        public int? RoleSequence { get; set; }
        public string Url { get; set; }
        public string Routing { get; set; }
        public string ParentId { get; set; }
    }
}