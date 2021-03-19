CREATE FUNCTION AmountPlusOne (@Amount smallmoney) RETURNS smallmoney 
AS
BEGIN
    RETURN @Amount + 1
END
GO

-- Functions can be used in select statements, Store procedures can't
SELECT DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) AS AmountAndOne
FROM tblTransactions

-- Functions can be also executed as Store procedures
DECLARE @myValue smallmoney 
EXEC @myValue = dbo.AmountPlusOne @Amount = 324.54
SELECT @myValue