using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API.Models
{
    public partial class AdminUser
    {
        [Key]
        [StringLength(20)]
        [Unicode(false)]
        public string UserAccount { get; set; }
        [StringLength(20)]
        [Unicode(false)]
        public string Password { get; set; }
        [StringLength(50)]
        public string UserName { get; set; }
        [StringLength(254)]
        [Unicode(false)]
        public string Email { get; set; }
        [Column(TypeName = "date")]
        public DateTime? ValidFrom { get; set; }
        [Column(TypeName = "date")]
        public DateTime? ValidTo { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? LastLogin { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string UpdateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? UpdateTime { get; set; }
    }
}
