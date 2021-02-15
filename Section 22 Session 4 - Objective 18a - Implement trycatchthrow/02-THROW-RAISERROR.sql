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
        PRINT 'The employee numbers are from ' + CONVERT(varchar(10), @EmployeeNumberFrom) + 
            ' to ' + CONVERT(varchar(10), @EmployeeNumberTo)

        SELECT @TotalAmount = SUM(Amount) FROM tblTransactions
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        SELECT @NumberOfEmployee = COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Average
        SET @AverageBalance = @TotalAmount / @NumberOfEmployee

        RETURN 0
    END TRY

    BEGIN CATCH

        IF ERROR_NUMBER() = 1834 -- @@ERROR
            BEGIN  
                SET @AverageBalance = 0
                PRINT 'There are not valid employees in this range.'
                RETURN 1834
            END
        ELSE
            DECLARE @ErrorMessage as varchar(255)
            SELECT @ErrorMessage = ERROR_MESSAGE()
            RAISERROR (@ErrorMessage, 16, 1) -- severity 10 (information)
            -- THROW 56789, 'Unknonw error throw by my custom procedure', 1

        -- error messages to print
        -- SELECT ERROR_MESSAGE() as ErrorMessage, ERROR_LINE() as ErrorLine,
        --         ERROR_NUMBER() as ErrorNumber,  ERROR_PROCEDURE() as ErrorProcedure,
        --         ERROR_SEVERITY() as ErrorSeverity, -- 0-10 for information
        --         -- 16 default SQL SERVER log / Windows Application log

        --         -- 20-25
        --         ERROR_STATE() as ErrorState
        -- RETURN 1
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