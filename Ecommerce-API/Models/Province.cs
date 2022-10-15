﻿using System.ComponentModel.DataAnnotations;

namespace Ecommerce_API.Models
{
    public partial class Province
    {
        [Key]
        [StringLength(5)]
        public string Code { get; set; }
        [Required]
        [StringLength(250)]
        public string Name { get; set; }
        [StringLength(50)]
        public string Level { get; set; }
    }
}
