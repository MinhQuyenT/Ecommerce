using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API.Models
{
    public partial class AdminRole
    {
        [Key]
        [StringLength(50)]
        public string RoleUnique { get; set; }
        [Required]
        [StringLength(100)]
        public string RoleName { get; set; }
        [Required]
        [StringLength(50)]
        public string RoleType { get; set; }
        [StringLength(250)]
        public string RoleNote { get; set; }
        public int? RoleSequence { get; set; }
        [StringLength(50)]
        public string UpdateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? UpdateTime { get; set; }
        [StringLength(50)]
        public string Url { get; set; }
        [StringLength(150)]
        public string Routing { get; set; }
        [StringLength(50)]
        public string ParentId { get; set; }
        public bool? IsTitle { get; set; }
    }
}
