using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;

namespace Ecommerce_API._Services.Interfaces.Admin
{
    public interface ICustomerService
    {
        Task<PaginationUtility<Customer>> GetAll(PaginationParam pagination, string searchParam);
        Task<OperationResult> Add(CustomerDto _customerDto,string userAccount);
        Task<OperationResult> Update(CustomerDto _customerDto, string userAccount);
        Task<OperationResult> ChangePassWord (int id);
        Task<OperationResult> ToggleActive(int id,bool status);
        Task<OperationResult> DeleteAll(List<int> id);
        Task<bool> Delete(int id);
    }
}