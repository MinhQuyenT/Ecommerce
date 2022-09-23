using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public class RefreshToken
    {
        [Key]
        public int ID { get; set; }
        public string Token { get; set; }
        public DateTime Expires { get; set; }
        public DateTime CreatedTime { get; set; }
        public DateTime? RevokedTime { get; set; }
        public string ReplacedByToken { get; set; }
        public string ReasonRevoked { get; set; }
        [Required]
        [StringLength(20)]
        public string UserAccount { get; set; }
        [NotMapped]
        public bool IsExpired => DateTime.Now >= Expires;
        [NotMapped]
        public bool IsRevoked => RevokedTime != null;
        [NotMapped]
        public bool IsActive => !IsRevoked && !IsExpired;
    }
}