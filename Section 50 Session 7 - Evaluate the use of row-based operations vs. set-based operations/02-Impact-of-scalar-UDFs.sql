CREATE FUNCTION fnc_TransactionTotal (@intEmployee as int)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmount as money

    SELECT @TotalAmount = sum(Amount)
    FROM tblTransaction WHERE EmployeeNumber = @intEmployee
    RETURN @TotalAmount
END

GO

--

SELECT EmployeeNumber, dbo.fnc_TransactionTotal(EmployeeNumber)
FROM tblEmployee

SELECT E.EmployeeNumber, SUM(T.Amount) as TotalAmount
FROM tblEmployee as E 
LEFT JOIN tblTransaction as T 
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber

GO

CREATE FUNCTION fnc_TransactionAll (@intEmployee as int)
RETURNS @returntable TABLE
(Amount smallmoney)
AS
BEGIN
    INSERT @returntable
    SELECT Amount
    FROM tblTransaction
    WHERE EmployeeNumber = @intEmployee
    RETURN
END

GO

SELECT * FROM fnc_TransactionAll (128)

-- alternative to use to scalar functions
SELECT EmployeeNumber, SUM(T.Amount) as TotalAmount
FROM tblEmployee as E 
OUTER APPLY fnc_TransactionAll(EmployeeNumber) as T 
GROUP BY EmployeeNumber