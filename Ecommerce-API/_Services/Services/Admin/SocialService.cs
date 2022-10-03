using System;
using AgileObjects.AgileMapper;
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API.Dtos;
using Ecommerce_API.Helpers.Utilities;
using Ecommerce_API.Models;
using LinqKit;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API._Services.Services.Admin
{
    public class SocialService : ISocialService
    {
        private readonly IRepositoryAccessor _repositoryAccessor;
        public SocialService(IRepositoryAccessor repositoryAccessor)
        {
            _repositoryAccessor = repositoryAccessor;
        }

        public Task<PaginationUtility<Social>> GetAll(PaginationParam pagination, string searchParam)
        {
            var pred = PredicateBuilder.New<Social>(true);
            if (!string.IsNullOrEmpty(searchParam))
            {
                pred = pred.And(x => x.Icon.Contains(searchParam) || x.Name.Contains(searchParam) || x.Url.Contains(searchParam));
            }

            var data = _repositoryAccessor.Social.FindAll(pred);

            return PaginationUtility<Social>.CreateAsync(data, pagination.PageNumber, pagination.PageSize);
        }

        public async Task<OperationResult> Post(List<SocialDto> socialDto)
        {
            var social = Mapper.Map(socialDto).ToANew<List<Social>>();
            var oldSocial = await _repositoryAccessor.Social.FindAll(x => x.Id == social[0].Id).ToListAsync();
            _repositoryAccessor.Social.RemoveMultiple(oldSocial);
            _repositoryAccessor.Social.AddMultiple(social);
            await _repositoryAccessor.Save();

            return new OperationResult(true, social);
        }
    }
}