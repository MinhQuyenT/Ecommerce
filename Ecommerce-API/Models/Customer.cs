using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class Customer
    {
        [Key]
        public int CustomerID { get; set; }
        [Required]
        [StringLength(50)]
        public string UserName { get; set; }
        [Required]
        [StringLength(20)]
        public string Password { get; set; }
        public bool? Status { get; set; }
        [StringLength(70)]
        public string FullName { get; set; }
        [StringLength(60)]
        public string Email { get; set; }
        [MaxLength(13)]
        public byte[] PhoneNumber { get; set; }
        [StringLength(250)]
        public string Address { get; set; }
        public string Avatar { get; set; }
        public bool? Sex { get; set; }
        [StringLength(50)]
        public string CreateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreateTime { get; set; }
        [StringLength(50)]
        public string UpdateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? UpdateTime { get; set; }
    }
}
