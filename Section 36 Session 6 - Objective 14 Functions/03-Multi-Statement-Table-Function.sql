CREATE FUNCTION TransList(@EmployeeNumber int)
RETURNS @TransList TABLE
(Amount smallmoney,
DateOfTransaction smalldatetime,
EmployeeNumber int)
AS
BEGIN
    INSERT INTO @TransList(Amount, DateOfTransaction, EmployeeNumber)
    SELECT Amount, DateOfTransaction, EmployeeNumber FROM tblTransactions
    WHERE EmployeeNumber = @EmployeeNumber
    RETURN
END

GO

SELECT * FROM dbo.TransList(123)