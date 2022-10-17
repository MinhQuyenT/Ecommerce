
using Ecommerce_API._Repositories;
using Ecommerce_API._Services.Interfaces.Admin;
using Ecommerce_API._Services.Services.Admin;
using Ecommerce_API.Helper.Utilities;
using Ecommerce_API.Helpers.Utilities;

namespace Ecommerce_API.Configurations
{
    public static class DependencyInjectionConfig
    {
        public static void AddDependencyInjectionConfiguration(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            // Add RepositoryAccessor
            services.AddScoped<IRepositoryAccessor, RepositoryAccessor>();

            // Add Service
            services.AddScoped<ICategoryService, CategoryService>();
            services.AddScoped<IPropertyColorService, PropertyColorService>();
            services.AddScoped<IPropertySizeService, PropertySizeService>();
            services.AddScoped<IPropertyMaterialService, PropertyMaterialService>();
            services.AddScoped<IFunctionUtility, FunctionUtility>();
            services.AddScoped<IAdminUserService, AdminService>();
            services.AddScoped<IAdminAuthService, AdminAuthService>();
            services.AddScoped<IAddressService, AddressService>();
            services.AddScoped<IContactService, ContactService>();
            services.AddScoped<IJwtUtility, JwtUtility>();
        }
    }
}