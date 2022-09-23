using Ecommerce_API._Repositories.Interfaces;
using Ecommerce_API._Repositories.Repositories;
using Ecommerce_API.Data;

namespace Ecommerce_API._Repositories
{
    public class RepositoryAccessor : IRepositoryAccessor
    {
        private DBContext _dbContext;
        public RepositoryAccessor(DBContext dbContext)
        {
            _dbContext = dbContext;
            Blog = new BlogRepository(_dbContext);
            BlogCategory = new BlogCategoryRepository(_dbContext);
            BlogTag = new BlogTagRepository(_dbContext);
            Color = new ColorRepository(_dbContext);
            Faqs = new FaqsRepository(_dbContext);
            Menu = new MenuRepository(_dbContext);
            MenuType = new MenuTypeRepository(_dbContext);
            Policy = new PolicyRepository(_dbContext);
            Product = new ProductRepository(_dbContext);
            ProductCategory = new ProductCategoryRepository(_dbContext);
            ProductRecently = new ProductRecentlyRepository(_dbContext);
            ProductReview = new ProductReviewRepository(_dbContext);
            Size = new SizeRepository(_dbContext);
            Social = new SocialRepository(_dbContext);
            Stock = new StockRepository(_dbContext);
            Subscribe = new SubscribeRepository(_dbContext);
            WishList = new WishListRepository(_dbContext);
            Material = new MaterialRepository(_dbContext);
            AdminUser = new AdminUserRepository(_dbContext);
            AdminRole = new AdminRoleRepository(_dbContext);
            AdminUserRole = new AdminUserRoleRepository(_dbContext);
            RefreshToken = new RefreshTokenRepository(_dbContext);
        }
        public IBlogRepository Blog { get; private set; }
        public IBlogCategoryRepository BlogCategory { get; private set; }
        public IBlogTagRepository BlogTag { get; private set; }
        public IColorRepository Color { get; private set; }
        public IFaqsRepository Faqs { get; private set; }
        public IMenuRepository Menu { get; private set; }
        public IMenuTypeRepository MenuType { get; private set; }
        public IPolicyRepository Policy { get; private set; }
        public IProductRepository Product { get; private set; }
        public IProductCategoryRepository ProductCategory { get; private set; }
        public IProductRecentlyRepository ProductRecently { get; private set; }
        public IProductReviewRepository ProductReview { get; private set; }
        public ISizeRepository Size { get; private set; }
        public ISocialRepository Social { get; private set; }
        public IStockRepository Stock { get; private set; }
        public ISubscribeRepository Subscribe { get; private set; }
        public IWishListRepository WishList { get; private set; }
        public IMaterialRepository Material { get; private set; }

        public IAdminUserRepository AdminUser { get; private set; }
        public IAdminRoleRepository AdminRole { get; private set; }
        public IAdminUserRoleRepository AdminUserRole { get; private set; }
        public IRefreshTokenRepository RefreshToken { get; private set; }

        public async Task<bool> Save()
        {
            return await _dbContext.SaveChangesAsync() > 0;
        }
    }
}