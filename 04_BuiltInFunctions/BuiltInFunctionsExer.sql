USE SoftUni

SELECT FirstName,LastName FROM Employees
WHERE FirstName LIKE 'SA%'

SELECT FirstName,LastName FROM Employees
WHERE LastName LIKE '%ei%'

SELECT FirstName FROM Employees
WHERE DepartmentID IN (3,10) AND YEAR(HireDate) BETWEEN 1995 AND 2005

SELECT FirstName,LastName
 FROM Employees
WHERE CHARINDEX('engineer',JobTitle) = 0

SELECT Name
 FROM Towns
WHERE LEN(Name) IN (5,6)
ORDER BY Name



SELECT TownId,Name
 FROM Towns
WHERE Name LIKE '[MKBE]%'
ORDER BY Name

SELECT TownID, Name
FROM Towns
WHERE LEFT(Name, 1) NOT IN ('R', 'B', 'D')
ORDER BY Name
GO
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName,LastName 
FROM Employees
WHERE YEAR(HireDate) >= 2000

GO
SELECT FirstName,LastName
FROM Employees
WHERE LEN(LastName) = 5

USE Geography
SELECT CountryName,ISOCode 
FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY ISOCode

SELECT PeakName,RiverName,
LOWER(Substring(PeakName,1,LEN(PeakName)-1) +RiverName) AS Mix
FROM Peaks JOIN Rivers
ON RIGHT(Peaks.PeakName,1) = LEFT(Rivers.RiverName,1)
ORDER BY Mix

USE Diablo
SELECT TOP(50) Name,LEFT(CONVERT(varchar,Start,120),10)
FROM Games
WHERE YEAR(Start) IN (2011,2012)
ORDER BY Start,Name

SELECT Username,RIGHT(Email,LEN(Email) - CHARINDEX('@',Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider],UserName