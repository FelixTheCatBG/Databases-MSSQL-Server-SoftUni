USE SoftUni

CREATE TABLE Passports(
PassportID INT NOT NULL,
PassportNumber VARCHAR(50) NOT NULL UNIQUE
)
CREATE TABLE Persons (
PersonID INT NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
Salary money NOT NULL,
PassportID INT NOT NULL
--CONSTRAINT PK_PersonID PRIMARY KEY (PersonId),
--CONSTRAINT FK_PasspordId FOREIGN KEY (PassportId) REFERENCES Passports(Id)
)


INSERT INTO Passports VALUES
(101,'N34FG21B'),
(102,'K65LO4R7'),
(103,'ZE657QP2')

INSERT INTO Persons VALUES 
(1,'Roberto',43300.00,102),
(2,'Tom',56100.00,103),
(3,'Yana',60200.00,101)

GO
ALTER TABLE  Persons
ADD CONSTRAINT PK_Persons PRIMARY KEY (PersonID)
GO
ALTER TABLE  Passports
ADD CONSTRAINT PK_Passports PRIMARY KEY (PassportID)
GO
ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)

CREATE TABLE Manufacturers (
ManufacturerID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
EstablishedOn date NOT NULL
CONSTRAINT PK_ManufacturerID PRIMARY KEY (ManufacturerID)
)
CREATE TABLE Models (
ModelID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
ManufacturerID INT NOT NULL,
CONSTRAINT PK_ModelID PRIMARY KEY (ModelID),
CONSTRAINT FK_ManufacturerID FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID) 
)



INSERT INTO Manufacturers VALUES
  (1, 'BMW', '1916/03/07'),
  (2, 'Tesla', '2003/01/01'),
  (3, 'Lada', '1966/05/01')

INSERT INTO Models VALUES
  (101, 'X1', 1),
  (102, 'i6', 1),
  (103, 'Model S', 2),
  (104, 'Model X', 2),
  (105, 'Model 3', 2),
  (106, 'Nova', 3)


  CREATE TABLE Students (
  StudentID INT  NOT NULL,
  Name nvarchar(50)NOT NULL,
  CONSTRAINT PK_StudentID PRIMARY KEY (StudentID)
  )
  
  CREATE TABLE Exams (
  ExamID INT NOT NULL,
  Name nvarchar(50) NOT NULL,
  CONSTRAINT PK_ExamID PRIMARY KEY (ExamID)
  )

  CREATE TABLE StudentsExams(
  StudentID INT  NOT NULL,
  ExamID INT NOT NULL,
  CONSTRAINT PK_StIDExamID PRIMARY KEY (StudentID,ExamID),
  CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  CONSTRAINT FK_ExamID FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
  )

  INSERT INTO Students VALUES 
  (1,'Mila'),
  (2,'Toni'),
  (3,'Ron')

  INSERT INTO Exams VALUES
  (101,'SpringMVC'),
  (102,'Neo4j'),
  (103,'Oracle 11g')

  INSERT INTO StudentsExams VALUES
	(1,101),
	(1,102),
    (2,101),
	(3,101),
	(2,103),
	(2,102)
	  
	  CREATE TABLE Teachers (
	  TeacherID INT NOT NULL,
	  Name nvarchar(50) NOT NULL,
	  ManagerID INT
	  )

	  INSERT INTO Teachers VALUES 
	  (101,'John',NULL),
	  (102,'Maya',105),
	  (103,'Silvia',106),
	  (104,'Ted',105),
	  (105,'Mark',101),
	  (106,'Greta',101)

	  ALTER TABLE Teachers
	  ADD CONSTRAINT PK_Teachers PRIMARY KEY (TeacherID)

	  ALTER TABLE Teachers
      ADD CONSTRAINT FK_Teachers_Managers FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)

	  CREATE TABLE Cities(
	  CityID INT NOT NULL,
	  Name varchar(50) NOT NULL,
	  CONSTRAINT PK_Cities PRIMARY KEY (CityID)
	  )

	  CREATE TABLE Customers (
	  CustomerID INT NOT NULL,
	  Name varchar(50) NOT NULL,
	  Birthday date NOT NULL,
	  CityID INT NOT NULL,
	  CONSTRAINT PK_Customers PRIMARY KEY (CustomerID),
	  CONSTRAINT FK_Customers_Cities FOREIGN KEY (CityID) REFERENCES Cities(CityID)
	  )

	  CREATE TABLE Orders(
	  OrderID INT NOT NULL,
	  CustomerID INT NOT NULL,
	  CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
	  CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	  )

	
	  CREATE TABLE ItemTypes(
	  ItemTypeID INT NOT NULL,
	  Name varchar(50) NOT NULL,
	  CONSTRAINT PK_ItemTypes PRIMARY KEY (ItemTypeID)
	  )  
	  
	  CREATE TABLE Items(
	  ItemID INT NOT NULL,
	  Name varchar(50) NOT NULL,
	  ItemTypeID INT NOT NULL,
		CONSTRAINT PK_Items PRIMARY KEY (ItemID),
		CONSTRAINT FK_Items_ItemTypes FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes(ItemTypeID)
	  )


	  CREATE TABLE OrderItems (
	  OrderID INT NOT NULL,
	  ItemID INT NOT NULL,
	  CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID,ItemID),
	  CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	  CONSTRAINT FK_OrderItems_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
	  )
