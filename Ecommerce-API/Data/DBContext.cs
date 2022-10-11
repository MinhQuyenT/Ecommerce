using Ecommerce_API.Models;
using Microsoft.EntityFrameworkCore;

namespace Ecommerce_API.Data
{
    public partial class DBContext : DbContext
    {
        public DBContext(DbContextOptions<DBContext> options) : base(options)
        {
        }

        public virtual DbSet<Banner> Banner {get;set;}
        public virtual DbSet<Blog> Blog { get; set; }
        public virtual DbSet<BlogCategory> BlogCategory { get; set; }
        public virtual DbSet<BlogTag> BlogTag { get; set; }
        public virtual DbSet<Color> Color { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<Faqs> Faqs { get; set; }
        public virtual DbSet<Menu> Menu { get; set; }
        public virtual DbSet<MenuType> MenuType { get; set; }
        public virtual DbSet<Policy> Policy { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }
        public virtual DbSet<ProductRecently> ProductRecently { get; set; }
        public virtual DbSet<ProductReview> ProductReview { get; set; }
        public virtual DbSet<Size> Size { get; set; }
        public virtual DbSet<Social> Social { get; set; }
        public virtual DbSet<Stock> Stock { get; set; }
        public virtual DbSet<Subscribe> Subscribe { get; set; }
        public virtual DbSet<WishList> WishList { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<AdminRole> AdminRole { get; set; }
        public virtual DbSet<About> About { get; set; }
        public virtual DbSet<AdminUser> AdminUser { get; set; }
        public virtual DbSet<AdminUserRole> AdminUserRole { get; set; }
        public virtual DbSet<RefreshToken> RefreshToken { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdminRole>(entity =>
            {
                entity.HasKey(e => e.RoleUnique)
                    .HasName("PK_EmployeeRole");
            });

            modelBuilder.Entity<AdminUser>(entity =>
            {
                entity.HasKey(e => e.UserAccount)
                    .HasName("PK_Employee");

                entity.Property(e => e.UserAccount).IsUnicode(false);

                entity.Property(e => e.Email).IsUnicode(false);

                entity.Property(e => e.Password).IsUnicode(false);

                entity.Property(e => e.UpdateBy).IsUnicode(false);
            });

            modelBuilder.Entity<AdminUserRole>(entity =>
            {
                entity.HasKey(e => new { e.UserAccount, e.RoleUnique })
                    .HasName("PK_EmployeeRoleMapping");
            });

            modelBuilder.Entity<RefreshToken>(entity =>
            {
                entity.Property(e => e.UserAccount).IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}