-- USE [70-461];
-- OUTPUT (Return value)
-- You can return the result by OUTPUT or by the RETURN statement
CREATE PROCEDURE NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, 
    @NumberOfRows int OUTPUT) as -- OUTPUT to return
BEGIN
    -- logic
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
        BEGIN
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
            SET @NumberOfRows = @@ROWCOUNT

            RETURN 0 -- SUCCESS RETURN to return
        END
    ELSE
        BEGIN
            SET @NumberOfRows = 0

            RETURN 1 -- FAILURE
        END
END  

GO

-- GET return value from procedure
DECLARE @NumberRows int, @ReturnStatus int
-- @ReturnStatus gets the RETURN form the procedure, also as OUTPUT
EXECUTE @ReturnStatus = NameEmployees 323, 327, @NumberRows OUTPUT;
SELECT @NumberRows as MyRowCount, @ReturnStatus as Return_Status

GO
DECLARE @NumberRows int, @ReturnStatus int
EXEC @ReturnStatus = NameEmployees @EmployeeNumberFrom = 124, @EmployeeNumberTo = 130, @NumberOfRows = @NumberRows OUTPUT;
SELECT @NumberRows as MyRowCount, @ReturnStatus as Return_Status

GO
DECLARE @NumberRows int, @ReturnStatus int
EXEC @ReturnStatus = NameEmployees 4, 6, @NumberRows OUTPUT;
SELECT @NumberRows as MyRowCount, @ReturnStatus as Return_Status

-- Query our procedures
-- IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'NameEmployees')
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees;
