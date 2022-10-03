using System.Reflection.Metadata;
using AgileObjects.AgileMapper;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;

namespace Ecommerce_API._Services.Services.Admin
{
    public class ContactService : IContactService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        public ContactService(IRepositoryAccessor repositoryAccessor)
        {
            _repositoryAccessor = repositoryAccessor;
        }

        public async Task<OperationResult> Add(ContactDto _contactDto)
        {
            var result = Mapper.Map(_contactDto).ToANew<Contact>();
            _repositoryAccessor.Contact.Add(result);
            await _repositoryAccessor.Save();

            return new OperationResult(true, result);
        }

        public async Task<bool> Delete(int id)
        {
            var data = await _repositoryAccessor.Contact.FindSingle(x => x.Id == id);
            if (data == null)
            {
                return false;
            }
            _repositoryAccessor.Contact.Remove(data);
            await _repositoryAccessor.Save();

            return true;
        }

        public async Task<PaginationUtility<Contact>> GetAll(PaginationParam pagination, string searchParam)
        {
            var pred = PredicateBuilder.New<Contact>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                pred = pred.And(x => x.Name.Contains(searchParam) || x.Phone.Contains(searchParam) || x.Content.Contains(searchParam) || x.Email.Contains(searchParam));
            }
            var data = _repositoryAccessor.Contact.FindAll(pred);

            return await PaginationUtility<Contact>.CreateAsync(data, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<OperationResult> Update(ContactDto _contactDto)
        {
            var contact = await _repositoryAccessor.Contact.FindSingle(x => x.Id == _contactDto.Id);

            if (contact == null)
            {
                return new OperationResult(false);
            }

            var result = Mapper.Map(_contactDto).Over(contact);

            _repositoryAccessor.Contact.Update(result);
            await _repositoryAccessor.Save();

            return new OperationResult(true, contact);
        }
    }
}