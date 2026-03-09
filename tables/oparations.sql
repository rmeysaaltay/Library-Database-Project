CREATE SCHEMA oparations

CREATE TABLE oparations.StaffRoles
(
	RoleID INT PRIMARY KEY,
	RoleName VARCHAR(50) NOT NULL CHECK(RoleName IN ('Admin','Librarian','Assistant'))
)
CREATE TABLE oparations.LibraryStaff
(
	StaffID INT PRIMARY KEY IDENTITY(1,1),
	RoleID INT FOREIGN KEY(RoleID) REFERENCES oparations.StaffRoles NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	UserName VARCHAR(50) NOT NULL UNIQUE,
	PasswordHash VARCHAR(50) NOT NULL
)
CREATE TABLE oparations.BorrowingTransactions
(
	TransactionID INT PRIMARY KEY IDENTITY(1,1),
	CopyCode VARCHAR(50) FOREIGN KEY(CopyCode) REFERENCES inventories.BookCopies NOT NULL,
	MemberID INT FOREIGN KEY(MemberID) REFERENCES members.Members NOT NULL,
	BorrowingStaffID INT FOREIGN KEY(BorrowingStaffID) REFERENCES oparations.LibraryStaff NOT NULL,
	ReturnStaffID INT FOREIGN KEY(ReturnStaffID) REFERENCES oparations.LibraryStaff,
	BorrowDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ReturnDate DATE,
)

CREATE TABLE oparations.Reviews
(
	ReviewID INT PRIMARY KEY IDENTITY(1,1),
	BookID INT FOREIGN KEY(BookID) REFERENCES inventories.Books NOT NULL,
	MemberID INT FOREIGN KEY(MemberID) REFERENCES members.Members NOT NULL,
	ReviewText VARCHAR(100),
	Rating INT CHECK(Rating >= 1 AND Rating <= 5),
	ReviewDate DATE NOT NULL
)
