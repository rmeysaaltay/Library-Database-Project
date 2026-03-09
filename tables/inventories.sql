CREATE SCHEMA inventories

CREATE TABLE inventories.Categories
(
	CategoryID INT PRIMARY KEY IDENTITY(1,1),
	CategoryName VARCHAR(50) UNIQUE NOT NULL,
	ParentCategoryName INT FOREIGN KEY(CategoryID) REFERENCES inventories.Categories
)

CREATE TABLE inventories.Publishers
(
	PublisherID INT PRIMARY KEY IDENTITY(1,1),
	PublisherName VARCHAR(50) UNIQUE NOT NULL,
	ContactEmail VARCHAR(50)
)

CREATE TABLE inventories.Authors
(
	AuthorID INT PRIMARY KEY IDENTITY (1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL
)

CREATE TABLE inventories.Books
(
	BookID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	ISBN VARCHAR(50) UNIQUE NOT NULL,
	PublicationYear DATE,
	PageCount INT,
	AvgReadingHours DECIMAL,
	Format VARCHAR(50) NOT NULL CHECK(Format IN ('Physical','Digital')),
	CategoryID INT FOREIGN KEY(CategoryID) REFERENCES inventories.Categories NOT NULL,
	PublisherID INT FOREIGN KEY(PublisherID) REFERENCES inventories.Publishers NOT NULL
)

CREATE TABLE inventories.BookCopies
(
	CopyCode VARCHAR(50) PRIMARY KEY,
	BookID INT FOREIGN KEY(BookID) REFERENCES inventories.Books NOT NULL,
	LocationCode VARCHAR(50),
	Status VARCHAR(50) NOT NULL CHECK(Status IN ('On Shelf','Borrowed','In Maintenance','Reserved'))
)

CREATE TABLE inventories.BookAuthors
(
	BookID INT FOREIGN KEY(BookID) REFERENCES inventories.Books NOT NULL,
	AuthorID INT FOREIGN KEY(AuthorID) REFERENCES inventories.Authors NOT NULL
)