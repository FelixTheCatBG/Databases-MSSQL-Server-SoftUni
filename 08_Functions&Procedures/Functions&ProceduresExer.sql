USE SoftUni
GO
CREATE FUNCTION f_CalculateDateDiff(@StartDate DATETIME,@EndDate DATETIME)
RETURNS INT
AS
BEGIN
	IF(@EndDate IS NULL)
	BEGIN
		SET @EndDate = GETDATE();
	END

	DECLARE @ProjectWeeks INT = DATEDIFF(WEEK,@StartDate,@EndDate);
	RETURN @ProjectWeeks
END        

GO

SELECT Name,
StartDate,
EndDate,
dbo.f_CalculateDateDiff(StartDate,EndDate)
FROM Projects

GO

CREATE FUNCTION f_GetSalaryLevel(@Salary MONEY)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(50);
	IF(@Salary < 30000)
	BEGIN
		SET @SalaryLevel = 'Low'
	END
	ELSE IF (@Salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @SalaryLevel = 'Average'
	END
	ELSE
	BEGIN
		SET @SalaryLevel = 'High'
	END

	RETURN @SalaryLevel
END