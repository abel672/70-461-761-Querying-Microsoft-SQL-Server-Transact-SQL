-- IF EXISTS (SELECT * FROM sys.objects WHERE name = 'NumberOfTransactions')
IF OBJECT_ID(N'NumberOfTransactions', N'FN') IS NOT NULL
    DROP FUNCTION NumberOfTransaction
GO

CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS INT 
AS 
BEGIN
    DECLARE @NumberOfTransactions INT 
    SELECT @NumberOfTransactions = COUNT(*) FROM tblTransactions
    WHERE EmployeeNumber = @EmployeeNumber
    RETURN @NumberOfTransactions
END 

GO 

-- Using function into query as a JOIN (this is three times faster than doing a JOIN to get the same result)
SELECT *, dbo.NumberOfTransactions(EmployeeNumber) as TransNum
FROM tblEmployee

-- Traditional way (slower, not recommended)
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, COUNT(T.EmployeeNumber) as TransNum
FROM tblEmployee as E
LEFT JOIN tblTransactions as T 
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName