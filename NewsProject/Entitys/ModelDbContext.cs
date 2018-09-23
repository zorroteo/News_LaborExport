namespace NewsProject.Entitys
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelDbContext : DbContext
    {
        public ModelDbContext()
            : base("name=ModelContext")
        {
        }

        public virtual DbSet<tblComment> tblComments { get; set; }
        public virtual DbSet<tblGroup> tblGroups { get; set; }
        public virtual DbSet<tblImage> tblImages { get; set; }
        public virtual DbSet<tblNew> tblNews { get; set; }
        public virtual DbSet<tblSupport> tblSupports { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tblComment>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tblComment>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<tblComment>()
                .HasMany(e => e.tblComment1)
                .WithOptional(e => e.tblComment2)
                .HasForeignKey(e => e.ParentId);

            modelBuilder.Entity<tblGroup>()
                .Property(e => e.Icon)
                .IsUnicode(false);

            modelBuilder.Entity<tblGroup>()
                .HasMany(e => e.Childrens)
                .WithOptional(e => e.Parent)
                .HasForeignKey(e => e.ParentId);

            modelBuilder.Entity<tblGroup>()
                .HasMany(e => e.News)
                .WithRequired(e => e.tblGroup)
                .HasForeignKey(e => e.Group)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tblImage>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<tblImage>()
                .Property(e => e.ImgResizer)
                .IsUnicode(false);

            modelBuilder.Entity<tblNew>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<tblNew>()
                .Property(e => e.ImgResizer)
                .IsUnicode(false);

            modelBuilder.Entity<tblNew>()
                .HasMany(e => e.tblComments)
                .WithRequired(e => e.tblNew)
                .HasForeignKey(e => e.News)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tblSupport>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<tblSupport>()
                .Property(e => e.Country)
                .IsUnicode(false);

            modelBuilder.Entity<tblSupport>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<tblSupport>()
                .Property(e => e.GradeLevel)
                .IsUnicode(false);

            modelBuilder.Entity<tblSupport>()
                .Property(e => e.Major)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<tblUser>()
                .Property(e => e.ImgResizer)
                .IsUnicode(false);
        }
    }
}
