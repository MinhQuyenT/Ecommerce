using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API.Models
{
    public partial class AdminUserRole
    {
        [Key]
        [StringLength(50)]
        public string UserAccount { get; set; }
        [Key]
        [StringLength(50)]
        public string RoleUnique { get; set; }
        [Required]
        [StringLength(50)]
        public string CreateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreateTime { get; set; }
    }
}
