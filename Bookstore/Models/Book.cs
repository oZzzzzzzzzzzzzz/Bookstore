using System;
using System.Collections.Generic;

namespace Bookstore.Models;

public partial class Book
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Rating { get; set; }

    public string Isbn { get; set; } = null!;

    public DateTime PublicationDate { get; set; }
}
