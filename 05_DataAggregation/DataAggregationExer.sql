SELECT COUNT(WizzardDeposits.FirstName) AS Count
 FROM WizzardDeposits

 SELECT MAX(MagicWandSize) AS LongestMagicWand
 FROM WizzardDeposits

 SELECT DepositGroup, MAX(MagicWandSize) AS LongestMagicWand
 FROM WizzardDeposits
 GROUP BY DepositGroup

  SELECT TOP 2  DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)

 SELECT  DepositGroup,SUM(DepositAmount)
FROM WizzardDeposits
GROUP BY DepositGroup

 SELECT  DepositGroup,SUM(DepositAmount)
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup

 SELECT  DepositGroup,SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY SUM(DepositAmount) DESC

SELECT  DepositGroup,MagicWandCreator,MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup,MagicWandCreator
ORDER BY MagicWandCreator,DepositGroup

SELECT
CASE
WHEN Age BETWEEN 0 AND 10 THEN ('[0-10]')
WHEN Age BETWEEN 11 AND 20 THEN ('[11-20]')
WHEN Age BETWEEN 21 AND 30 THEN ('[21-30]')
WHEN Age BETWEEN 31 AND 40 THEN ('[31-40]')
WHEN Age BETWEEN 41 AND 50 THEN ('[41-50]')
WHEN Age BETWEEN 51 AND 60 THEN ('[51-60]')
WHEN Age > 60 THEN ('[61+]')
END AS SizeGroup,
COUNT(*) as WizardCount
FROM WizzardDeposits
GROUP BY
 CASE 
 WHEN Age BETWEEN 0 AND 10 THEN ('[0-10]')
WHEN Age BETWEEN 11 AND 20 THEN ('[11-20]')
WHEN Age BETWEEN 21 AND 30 THEN ('[21-30]')
WHEN Age BETWEEN 31 AND 40 THEN ('[31-40]')
WHEN Age BETWEEN 41 AND 50 THEN ('[41-50]')
WHEN Age BETWEEN 51 AND 60 THEN ('[51-60]')
WHEN Age > 60 THEN ('[61+]')
END

SELECT  LEFT(FirstName,1) AS MinDepositCharge
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest' 
GROUP BY LEFT(FirstName,1)
ORDER BY LEFT(FirstName,1)

SELECT  DepositGroup,IsDepositExpired,AVG(DepositInterest) AS AverageInterest
FROM WizzardDeposits
WHERE DepositStartDate > '01/01/1985' 
GROUP BY DepositGroup,IsDepositExpired
ORDER BY DepositGroup DESC,IsDepositExpired

USE SoftUni	

SELECT  DepartmentID,SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID


SELECT  DepartmentID,MIN(Salary) AS MinSalary
FROM Employees
WHERE DepartmentID IN (2,5,7) AND HireDate > '01/01/2000'
GROUP BY DepartmentID
ORDER BY DepartmentID

SELECT * FROM Employees
WHERE Salary > 30000
INTO TABLE EmployeesOver30000


)