using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce_API.Dtos
{
    public class CustomerDto
    {
        public int CustomerID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool? Status { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public byte[] PhoneNumber { get; set; }
        public string Address { get; set; }
        public string Avatar { get; set; }
        public bool? Sex { get; set; }
        public string CreateBy { get; set; }
        public DateTime? CreateTime { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdateTime { get; set; }
    }
}