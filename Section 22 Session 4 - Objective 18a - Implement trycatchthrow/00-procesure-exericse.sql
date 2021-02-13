-- USE [70-461];

IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL
    DROP PROC AverageBalance
GO

CREATE PROC AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as 
BEGIN
    DECLARE @TotalAmount money
    DECLARE @NumberOfEmployee int

    SELECT @TotalAmount = SUM(Amount) FROM tblTransactions
    WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

    SELECT @NumberOfEmployee = COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
    WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

    -- Average
    SET @AverageBalance = @TotalAmount / @NumberOfEmployee

    RETURN 0
END

GO

DECLARE @AvgBalance int, @ReturnStatus int 
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance as MyRowCount, @ReturnStatus as Return_Status
GO

DECLARE @AvgBalance int, @ReturnStatus int 
EXEC @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
SELECT @AvgBalance as MyRowCount, @ReturnStatus as Return_Status

GO

DECLARE @AvgBalance int, @ReturnStatus int 
EXEC @ReturnStatus = AverageBalance @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @AverageBalance = @AvgBalance OUTPUT