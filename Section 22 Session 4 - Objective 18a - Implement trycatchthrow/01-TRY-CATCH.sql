USE [70-461];

IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL
    DROP PROC AverageBalance
GO

CREATE PROC AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as 
BEGIN
    SET NOCOUNT ON

    DECLARE @TotalAmount money
    DECLARE @NumberOfEmployee int

    -- TRY CATCH
    BEGIN TRY

        SELECT @TotalAmount = SUM(Amount) FROM tblTransactions
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        SELECT @NumberOfEmployee = COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Average
        SET @AverageBalance = @TotalAmount / @NumberOfEmployee

        RETURN 0
    END TRY

    BEGIN CATCH
        SET @AverageBalance = 0
        -- error messages to print
        SELECT ERROR_MESSAGE() as ErrorMessage, ERROR_LINE() as ErrorLine,
                ERROR_NUMBER() as ErrorNumber,  ERROR_PROCEDURE() as ErrorProcedure,
                ERROR_SEVERITY() as ErrorSeverity, ERROR_STATE() as ErrorState
        RETURN 1
    END CATCH
END

GO

-- This will trhow divided by 0 exception
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