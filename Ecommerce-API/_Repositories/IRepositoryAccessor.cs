using Ecommerce_API._Repositories.Interfaces;

namespace Ecommerce_API._Repositories
{
    public interface IRepositoryAccessor
    {
        IAboutRepository About { get; }
        IBlogRepository Blog { get; }
        IBannerRepository Banner { get; }
        IBlogCategoryRepository BlogCategory { get; }
        IBlogTagRepository BlogTag { get; }
        IContactRepository Contact { get; }
        IColorRepository Color { get; }
        ICustomerRepository Customer { get; }
        IFaqsRepository Faqs { get; }
        IMenuRepository Menu { get; }
        IMenuTypeRepository MenuType { get; }
        IPolicyRepository Policy { get; }
        IProductRepository Product { get; }
        IProductCategoryRepository ProductCategory { get; }
        IProductRecentlyRepository ProductRecently { get; }
        IProductReviewRepository ProductReview { get; }
        ISizeRepository Size { get; }
        ISocialRepository Social { get; }
        IStockRepository Stock { get; }
        ISubscribeRepository Subscribe { get; }
        IWishListRepository WishList { get; }
        IMaterialRepository Material { get; }
        IAdminUserRepository AdminUser { get; }
        IAdminRoleRepository AdminRole { get; }
        IAdminUserRoleRepository AdminUserRole { get; }
        IRefreshTokenRepository RefreshToken { get; }
        IWardRepository Ward {get;}
        IProvinceRepository Province {get;}
        IDistrictRepository District{get;}
        Task<bool> Save();
    }
}