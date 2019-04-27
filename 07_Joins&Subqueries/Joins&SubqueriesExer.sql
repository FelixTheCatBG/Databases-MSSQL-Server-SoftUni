USE SoftUni

SELECT TOP 5 
e.EmployeeID,e.JobTitle,a.AddressID,a.AddressText 
FROM Employees AS e
INNER JOIN Addresses AS a
ON a.AddressID = e.AddressID
ORDER BY a.AddressID
JOIN Towns AS t
ON t.TownID = a.TownID

SELECT TOP 50
e.FirstName,e.LastName,t.Name,a.AddressText
FROM Employees AS e
INNER JOIN Addresses AS a
ON a.AddressID = e.AddressID
JOIN Towns AS t
ON t.TownID = a.TownID
ORDER BY e.FirstName,e.LastName

SELECT 
e.EmployeeID,e.FirstName,e.LastName,d.Name
FROM Employees AS e
INNER JOIN Departments AS d
ON (d.DepartmentID = e.DepartmentID AND d.Name = 'Sales')
ORDER BY e.EmployeeID

SELECT TOP 5
e.EmployeeID,e.FirstName,e.Salary,d.Name
FROM Employees AS e
INNER JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.Salary > 15000
ORDER BY d.DepartmentID

SELECT TOP 3
e.EmployeeID,e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS p
ON p.EmployeeID = e.EmployeeID
WHERE p.ProjectID IS NULL
ORDER BY e.EmployeeID

SELECT e.FirstName,e.LastName,e.HireDate,d.Name AS [DeptName]
FROM Employees AS e
INNER JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID 
WHERE e.HireDate > '1/1/1999' AND d.Name IN ('Sales','Finance')
ORDER BY e.HireDate ASC

SELECT TOP 5
e.EmployeeID,e.FirstName,p.Name
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p
ON p.ProjectID = ep.ProjectID
WHERE p.StartDate > '2002/08/13'
AND p.EndDate IS NULL
ORDER BY e.EmployeeID

SELECT e.EmployeeID,e.FirstName, IIF(p.StartDate > '2005/1/1',NULL,p.Name)
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p
ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24 

SELECT e.EmployeeID,e.FirstName,e.ManagerID,e2.FirstName
FROM Employees AS e
JOIN Employees AS e2
ON e.ManagerID = e2.EmployeeID
WHERE e.ManagerID IN (3,7)
ORDER BY EmployeeID

SELECT TOP 50
e.EmployeeID,
e.FirstName + ' ' + e.LastName,
e2.FirstName+ ' ' + e2.LastName,d.Name
FROM Employees AS e
JOIN Employees AS e2
ON e.ManagerID = e2.EmployeeID
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
ORDER BY EmployeeID

SELECT min(AverageSalary) FROM
(SELECT DepartmentID,AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID) AS AVERAGE

USE Geography

SELECT c.CountryCode,m.MountainRange,p.PeakName,p.Elevation 
FROM Countries AS c
JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
JOIN Mountains as m
ON m.Id = mc.MountainId
JOIN Peaks as p 
ON p.MountainId = m.Id
WHERE c.CountryCode = 'BG'
AND p.Elevation > 2835
ORDER BY p.Elevation DESC

