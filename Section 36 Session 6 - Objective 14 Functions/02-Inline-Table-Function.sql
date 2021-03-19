-- Inline Table Function
CREATE FUNCTION TransactionList(@EmployeeNumber int)
RETURNS TABLE AS RETURN 
(
    SELECT * FROM tblTransactions
    WHERE EmployeeNumber = @EmployeeNumber
)

GO

SELECT * 
FROM dbo.TransactionList(123)

-- Using Function
SELECT *
FROM tblEmployee
WHERE EXISTS(SELECT * FROM dbo.TransactionList(EmployeeNumber))

-- Same
SELECT *
FROM tblEmployee as E
WHERE EXISTS(SELECT * FROM tblTransactions as T WHERE E.EmployeeNumber = T.EmployeeNumber)