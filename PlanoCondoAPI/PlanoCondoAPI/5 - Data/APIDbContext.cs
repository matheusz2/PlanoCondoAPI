using Microsoft.EntityFrameworkCore;
using PlanoCondoAPI._3___Entities;
using System.Reflection.Metadata;

namespace PlanoCondoAPI._4___Data
{
    public class APIDbContext : DbContext
    {
        public virtual DbSet<Plans> Plans { get; set; }
        public virtual DbSet<TypePlans> TypePlans { get; set; }

        public APIDbContext(DbContextOptions<APIDbContext> options) : base(options)
        {

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLazyLoadingProxies();
        }

        public APIDbContext()
        {

        }

    }
}
