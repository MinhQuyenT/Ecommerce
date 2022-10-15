using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AgileObjects.AgileMapper.Extensions;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class CustomerService : ICustomerService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        public CustomerService(IRepositoryAccessor repositoryAccessor)
        {
            _repositoryAccessor = repositoryAccessor;
        }

        private async Task<bool> CheckExists(CustomerDto _customerDto)
        {
            var result = await _repositoryAccessor.Customer.FindSingle(x => x.UserName == _customerDto.UserName);
            if (result != null)
                return true;
            return false;
        }

        public async Task<OperationResult> Add(CustomerDto _customerDto, string userAccount)
        {
            if (string.IsNullOrEmpty(_customerDto.UserName?.Trim()))
                return new OperationResult(false);

            if (await CheckExists(_customerDto))
                return new OperationResult(false);

            var customer = _customerDto.Map().ToANew<Customer>(x => x.MapEntityKeys());
            customer.CreateBy = userAccount;
            customer.CreateTime = DateTime.Now;
            customer.UpdateBy = userAccount;
            customer.UpdateTime = DateTime.Now;

            _repositoryAccessor.Customer.Add(customer);
            try
            {
                await _repositoryAccessor.Save();
                return new OperationResult(true, customer);
            }
            catch (System.Exception ex)
            {
                return new OperationResult(false, ex);
            }
        }

        public Task<OperationResult> ChangePassWord(int id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<OperationResult> DeleteAll(List<int> id)
        {
            throw new NotImplementedException();
        }

        public async Task<PaginationUtility<Customer>> GetAll(PaginationParam pagination, string searchParam)
        {
             var pred = PredicateBuilder.New<Customer>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                pred = pred.And(x => x.UserName.Contains(searchParam) || x.Address.Contains(searchParam) || x.Email.Contains(searchParam) || x.Email.Contains(searchParam));
            }
            var data = _repositoryAccessor.Customer.FindAll(pred);

            return await PaginationUtility<Customer>.CreateAsync(data, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<OperationResult> ToggleActive(int id,bool status)
        {
            var data = await _repositoryAccessor.Customer.FindSingle(x=>x.CustomerID == id);
            if(data ==null){
                return new OperationResult(false);
            }
            

            throw new NotImplementedException();
        }

        public async Task<OperationResult> Update(CustomerDto _customerDto, string userAccount)
        {
            if(await CheckExists(_customerDto))
                return new OperationResult(false);

            var customer = _customerDto.Map().ToANew<Customer>(x => x.MapEntityKeys());
            customer.UpdateBy = userAccount;
            customer.UpdateTime = DateTime.Now;

             _repositoryAccessor.Customer.Update(customer);
            try
            {
                await _repositoryAccessor.Save();
                return new OperationResult(true, customer);
            }
            catch (System.Exception ex)
            {
                return new OperationResult(false, ex);
            }
        }
    }
}