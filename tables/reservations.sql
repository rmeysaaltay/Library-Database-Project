CREATE SCHEMA reservations

CREATE TABLE reservations.Reservations
(
	ReservationID INT PRIMARY KEY IDENTITY(1,1),
	BookID INT FOREIGN KEY(BookID) REFERENCES inventories.Books(BookID),
	MemberID INT FOREIGN KEY(MemberID) REFERENCES members.Members(MemberID),
	ReservationDate DATETIME NOT NULL,
	Status VARCHAR(50) CHECK(Status IN ('Pending','Available','Expired','Cancelled')),
	NotificationSent BIT NOT NULL DEFAULT(0)
)

CREATE TABLE reservations.Fines
(
	FineID INT PRIMARY KEY IDENTITY(1,1),
	TransactionID INT FOREIGN KEY(TransactionID) REFERENCES oparations.BorrowingTransactions(TransactionID) NOT NULL,
	MemberID INT FOREIGN KEY(MemberID) REFERENCES members.Members(MemberID) NOT NULL,
	IssueDate DATE NOT NULL,
	FineAmount DECIMAL NOT NULL,
	FineStatus VARCHAR(50) NOT NULL CHECK(FineStatus IN ('Pending','Paind','Cancelled'))
)