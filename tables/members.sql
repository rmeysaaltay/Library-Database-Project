CREATE SCHEMA members

CREATE TABLE members.MemberTypes
(
	MemberTypeID INT PRIMARY KEY,
	TypeName VARCHAR(50) NOT NULL CHECK(TypeName IN ('Student','Academic','Standart')),
	BookLimit INT NOT NULL CHECK(BookLimit > 0),
	BorrowingPeriodDays INT NOT NULL,
	FineRatePerDay DECIMAL NOT NULL CHECK(FineRatePerDay >= 0)
)

CREATE TABLE members.Members
(
	MemberID INT PRIMARY KEY IDENTITY(1,1),
	MemberTypeID INT FOREIGN KEY(MemberTypeID) REFERENCES members.MemberTypes NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(50) UNIQUE NOT NULL,
	PhoneNumber VARCHAR(11),
	RegistrationDate DATE NOT NULL,
)

CREATE TABLE members.StudentDetails
(
	MemberID INT PRIMARY KEY FOREIGN KEY(MemberID) REFERENCES members.Members NOT NULL,
	School VARCHAR(50) NOT NULL,
	Department VARCHAR(50) NOT NULL
)

CREATE TABLE members.AcademicDetails
(
	MemberID INT PRIMARY KEY FOREIGN KEY(MemberID) REFERENCES members.Members NOT NULL,
	Universtiy VARCHAR(50) NOT NULL,
	Title VARCHAR(50) NOT NULL
)

CREATE TABLE members.StandartMembersDetails
(
	MemberID INT PRIMARY KEY FOREIGN KEY(MemberID) REFERENCES members.Members NOT NULL,
	Adress VARCHAR(100) NOT NULL,
)
