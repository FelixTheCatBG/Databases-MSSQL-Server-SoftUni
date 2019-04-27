USE Bank
DROP TABLE Accounts
CREATE TABLE Accounts (
Id INT PRIMARY KEY IDENTITY NOT NULL,
ClientId INT FOREIGN KEY REFERENCES Clients(Id),
AccountTypeId INT FOREIGN KEY REFERENCES AccountTypes(ID),
Balance DECIMAL(15,2) DEFAULT 0
)

SELECT * FROM Accounts
SELECT * FROM Clients
SELECT * FROM AccountTypes
INSERT INTO Clients (FirstName,LastName) VALUES
('Doncho','Bate'),
('Melisa','Petkova'),
('Mitko','Floketo')


INSERT INTO Accounts (ClientId,AccountTypeId) VALUES
(1,1),
(2,2),
(3,1),
(4,1),
(5,2),
(6,2)
INSERT INTO Accounts (ClientId,AccountTypeId) VALUES
(4,2)
GO

CREATE VIEW v_ClientAccounts AS
SELECT Accounts.Id , FirstName + ' ' + LastName AS [Client Name] ,AccountTypes.Name AS [Account Type], Balance FROM Accounts
JOIN Clients ON Clients.Id = Accounts.ClientId
JOIN AccountTypes ON AccountTypes.Id = Accounts.AccountTypeId
GO

GO
CREATE FUNCTION f_CalculateTotalBalance(@ClientId INT) 
RETURNS DECIMAL (15,2) AS 
BEGIN
    DECLARE @TotalResult DECIMAL (15,2) = (SELECT SUM(Balance) FROM Accounts
WHERE ClientId = @ClientId)
RETURN @TotalResult
END
GO

SELECT FirstName,dbo.f_CalculateTotalBalance(4) AS TotalBalance FROM Clients
WHERE Id = 4
GO
CREATE PROCEDURE p_AddAccount @ClientId INT, @AccountTypeId INT AS
INSERT INTO Accounts(ClientId,AccountTypeId) VALUES 
(@ClientId,@AccountTypeId)

EXEC p_AddAccount 3,2
GO

CREATE PROCEDURE p_Deposit @AccountId INT, @Amount DECIMAL (15,2) AS
UPDATE Accounts
SET Balance += @Amount
WHERE Id = @AccountId
GO
EXEC p_Deposit 3,50

GO
CREATE PROCEDURE p_Withdraw @AccountId INT,@Amount DECIMAL(15,2) AS
DECLARE @OldBalance DECIMAL (15,2) = (SELECT Balance FROM Accounts WHERE Id= @AccountId)
IF (@OldBalance - @Amount >=0)
BEGIN
UPDATE Accounts
SET Balance -=@Amount
WHERE Id = @AccountId
END
ELSE
BEGIN
RAISERROR('Insufficient Funds',10,1)
END

SELECT * FROM Accounts

EXEC p_Withdraw 4,100

SELECT * FROM Accounts
GO

CREATE TABLE Transactions (
Id INT PRIMARY KEY IDENTITY NOT NULL,
OldBalance DECIMAL(15,2) NOT NULL,
NewBalance DECIMAL(15,2) NOT NULL,
Amount  AS NewBalance - OldBalance,
DateTime DATETIME2 DEFAULT GETDATE()
)
GO
CREATE TRIGGER t_Transaction ON Accounts
AFTER UPDATE
AS
INSERT INTO Transactions (OldBalance,NewBalance) 
SELECT deleted.Balance,inserted.Balance FROM deleted
JOIN inserted ON inserted.Id = deleted.Id



SELECT * FROM  v_ClientAccounts

EXEC p_Withdraw 4,20

SELECT * FROM  Transactions
