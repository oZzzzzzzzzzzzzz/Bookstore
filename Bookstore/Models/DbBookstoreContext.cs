using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Bookstore.Models;

public partial class DbBookstoreContext : DbContext
{
    public DbBookstoreContext()
    {
    }

    public DbBookstoreContext(DbContextOptions<DbBookstoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Author> Authors { get; set; }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<BookAuthor> BookAuthors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {

    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Author>(entity =>
        {
            entity.ToTable("Author");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dbo.Book");

            entity.ToTable("Book");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .HasColumnName("ISBN");
            entity.Property(e => e.Rating).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Title).HasMaxLength(100);
        });

        modelBuilder.Entity<BookAuthor>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("BookAuthor");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
