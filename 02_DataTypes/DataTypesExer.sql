CREATE DATABASE Employees
COLLATE  Cyrillic_General_100_CI_AI


USE Employees

DROP TABLE  Employees

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE NOT NULL,
Salary DECIMAL(15,2) CHECK (Salary > 0) NOT NULL,
IsEmployed bit DEFAULT 1,
HireDate DATE DEFAULT GETDATE(),
Description NVARCHAR(MAX) 

)

SELECT * FROM Employees

USE Bank
SELECT * FROM Clients

CREATE DATABASE Minions

USE Minions

CREATE TABLE Minions(
Id INT PRIMARY KEY IDENTITY NOT NULL,
Name NVARCHAR(50) NOT NULL,
Age INT NOT NULL
)

CREATE TABLE Towns (
Id INT PRIMARY KEY IDENTITY NOT NULL,
Name NVARCHAR(50) NOT NULL
)

ALTER TABLE Minions
Add TownId INT FOREIGN KEY REFERENCES Towns

INSERT INTO Towns (Name) VALUES
 ('Sofia'),
('Plovdiv'),
('Varna')

INSERT INTO Minions (Name,Age,TownId) VALUES
('Kevin',22,1),
('Bob',15,3),
('Steward',NULL,2)

DROP TABLE Minions

CREATE TABLE People (
Id INT UNIQUE IDENTITY NOT NULL,
Name NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height FLOAT(2),
Weight FLOAT(2),
Gender char(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX),
CONSTRAINT PK_People PRIMARY KEY(Id),
CONSTRAINT CK_People_Gender CHECK (Gender='m' OR Gender='f')
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
	('Maria', 011010101, 1.64, 65.77, 'f', '1985/01/17', 'Marias Bio'),
	('Peter', 01111101, 1.88, 87.00, 'm', '1980/06/11', 'Peters Bio'),
	('Ida', 100000001, 1.64, 65.77, 'f', '1985/05/03', 'Idas Bio'),
	('Nia', 000011010, 1.70, 60.52, 'f', '1975/06/06', 'Nias Bio'),
	('Tom', 101010101, 1.90, 85.7, 'm', '1995/08/08', 'Toms Bio')

	CREATE TABLE Users (
	Id BIGINT UNIQUE IDENTITY NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT NOT NULL
	CONSTRAINT PK_Users PRIMARY KEY (Id)
	)
	INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES
	('Maria', 011010101, 1111,  '1985/01/17',1),
	('Peter', 01111101, 1111,  '1980/06/11', 0),
	('Ida', 100000001, 1111, '1985/05/03', 1),
	('Nia', 000011010, 11111,  '1975/06/06', 0),
	('Tom', 101010101, 12312,  '1995/08/08', 0)

	ALTER TABLE Users
	DROP CONSTRAINT PK_Users

	ALTER TABLE Users
	ADD CONSTRAINT PK_Users PRIMARY KEY (Id, Username)

	ALTER TABLE Users
	ADD CONSTRAINT CHK_ProfilePictureSize CHECK (DATALENGTH(ProfilePicture) <= 900 * 1024)

	ALTER TABLE Users
	ADD CONSTRAINT CHK_PasswordSize CHECK (DATALENGTH(Password) >=5)
		ALTER TABLE Users
	ADD DEFAULT (GETDATE()) FOR LastLoginTime

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT CK_Users_Username CHECK (len(Username) >= 3)

CREATE DATABASE Movies

CREATE TABLE Directors (
Id INT PRIMARY KEY IDENTITY NOT NULL,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
CREATE TABLE Genres (
Id INT PRIMARY KEY IDENTITY NOT NULL,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
CREATE TABLE Categories (
Id INT PRIMARY KEY IDENTITY NOT NULL,
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Movies(
Id INT IDENTITY NOT NULL,
Title NVARCHAR(50) NOT NULL,
DirectorId INT  NOT NULL,
CopyrightYear INT NOT NULL,
Length INT NOT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating NUMERIC (2,1),
Notes NVARCHAR(MAX),
CONSTRAINT PK_Movies PRIMARY KEY (Id),
CONSTRAINT FK_Movies_Directors FOREIGN KEY(DirectorId) REFERENCES Directors(Id),
CONSTRAINT FK_Movies_Genres FOREIGN KEY(GenreId) REFERENCES Genres(Id),
CONSTRAINT FK_Movies_Categories FOREIGN KEY(CategoryId) REFERENCES Categories(Id),
CONSTRAINT CK_Movies_CopyrightYear CHECK (CopyrightYear >= 1900),
CONSTRAINT CK_Movies_Rating CHECK (Rating > 0 AND Rating <= 10),
CONSTRAINT CK_Movies_Length CHECK (Length > 0)
)

INSERT INTO Directors (DirectorName,Notes) VALUES
('Gosho','Toshev'),
('Todor','Goshev'),
('Gosho','Toshev'),
('Todor','Goshev'),
('Todor','Goshev')
USE SoftUni
USE CarRental
CREATE DATABASE CarRental
DROP DATABASE CarRental

CREATE TABLE Categories (
Id INT IDENTITY NOT NULL UNIQUE,
CategoryName nvarchar(200),
DailyRate INT ,
WeeklyRate INT ,
MonthlyRate INT,
WeekendRate INT ,
CONSTRAINT PK_PrimaryKey PRIMARY KEY (Id)
)

CREATE TABLE Cars (
Id INT IDENTITY NOT NULL UNIQUE,
PlateNumber varchar(50) NOT NULL UNIQUE,
Manufacturer NVARCHAR(100) NOT NULL,
Model NVARCHAR(50) NOT NULL,
CarYear INT not null,
CategoryId INT not null,
Doors INT not null CHECK (Doors > 0 AND Doors <= 5),
Picture varbinary(max),
Condition nvarchar(400),
Available bit,
PRIMARY KEY (Id),
FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

ALTER TABLE Cars
Add CONSTRAINT CK_Users CHECK (CarYear >= 1990)

CREATE TABLE Employees (
Id INT NOT NULL IDENTITY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Title NVARCHAR(30),
Notes NVARCHAR(MAX),
PRIMARY KEY (Id)

)

CREATE TABLE Customers (
Id INT NOT NULL IDENTITY ,
DriverLicenceNumber VARCHAR(50) UNIQUE NOT NULL,
FullName NVARCHAR(200),
Address VARCHAR(MAX),
City NVARCHAR(50),
ZIPCode VARCHAR(50),
Notes NVARCHAR(MAX),
PRIMARY KEY (Id)
)

CREATE TABLE RentalOrders (
Id INT NOT NULL IDENTITY,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel float NOT NULL,
KilometrageStart float NOT NULL,
KilometrageEnd float NOT NULL,
TotalKilometrage float NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplied decimal(15,2) NOT NULL ,
TaxRate decimal(15,2) NOT NULL ,
OrderStatus NVARCHAR(200) NOT NULL,
Notes NVARCHAR(MAX),
PRIMARY KEY (Id),
FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
FOREIGN KEY  (CustomerId) REFERENCES  Customers(Id),
FOREIGN KEY (CarId) REFERENCES Cars(Id)
)


INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
	('Economy', 15, 50, 1000, 40),
	('Standard', 80, 500, 2000, 200),
	('Premium', 100, NULL, NULL, NULL)

INSERT INTO Cars (PlateNumber, Model,Manufacturer, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
	('CA12345XB', 'Sedan', 'Renault', 2016, 1, 4, 0101010, 'Excellent', 1),
	('TT4444TT', 'SUV', 'VW', 2016, 1, 4, 111000, 'Outstanding', 1),
	('VV5555HH', 'Sedan', 'Mercedes', 2016, 3, 4, 01111, 'Excellent', 0)
	
INSERT INTO Employees (FirstName, LastName, Title)
VALUES
	('Tom', 'Barnes', 'Sales Representative'),
	('David', 'Jones', 'CEO'),
	('Eva', 'Michado', 'Software developer')

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
	('A111111', 'Angela MErkel', 'Willy-Brandt-Strasse 1', 'Berlin', '10557', 'New leader of the free world'),
	('B222222', 'Barack Obama', '1600 Pennsylvania Ave NW', 'Washington', 'DC 20500', 'Previous leader of the free world'),
	('C333333', 'Bill Clinton', '555 Bloomberg Avenue', 'New York', 'NY 1000', NULL)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
	(1, 1, 1, 100, 30100, 30200.5, 100.5, '2017-01-22', '2017-01-22', 1, 15, 0.20, 'Rented', NULL),
	(2, 2, 2,  100, 30100, 30250.5, 150.5, '2017-01-20', '2017-01-22', 3, 80, 0.20, 'Pending', 'TBD'),
	(3, 3, 3,100, 30000, 30200.5, 200.5, '2017-01-21', '2017-01-22', 2, 110, 0.20, 'Closed', NULL)

	TRUNCATE TABLE Categories
		TRUNCATE TABLE Cars
			TRUNCATE TABLE Customers
				TRUNCATE TABLE RentalOrders
					TRUNCATE TABLE Employees