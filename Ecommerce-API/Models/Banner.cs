using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Ecommerce_API.Models
{
    public partial class Banner
    {
        [Key]
        public int Id { get; set; }
        [StringLength(250)]
        public string Title { get; set; }
        [StringLength(250)]
        public string Description { get; set; }
        public string ImageList { get; set; }
        [StringLength(250)]
        public string DestLink { get; set; }
        [StringLength(50)]
        public string Type { get; set; }
        public bool? Status { get; set; }
        [Required]
        [StringLength(50)]
        public string CreateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateTime { get; set; }
        [StringLength(50)]
        public string UpdateBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? UpdateTime { get; set; }
    }
}
