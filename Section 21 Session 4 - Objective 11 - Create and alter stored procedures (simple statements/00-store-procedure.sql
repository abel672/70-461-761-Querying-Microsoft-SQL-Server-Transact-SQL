-- USE [70-461];

-- DAL: Data Access Layer
/**
    Application (C#, Java...) -----> PROCEDURE ------> TABLE DATA

    -EXEC NameEmployees              NameEmployees     Data
                                          SELECT...

Difference between procedure and view:

    In the procedure you can put logic.

    The view is just a select statement.
        You can get columns from the view
            SELECT EmployeeNumber from ViewEmployees;
*/
                              -- params
CREATE PROCEDURE NameEmployees(@EmployeeNumber int) as 
BEGIN
    -- logic
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
    BEGIN
        IF (@EmployeeNumber < 300)
            BEGIN
                SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
                FROM tblEmployee
                WHERE EmployeeNumber = @EmployeeNumber
            END
        ELSE
            BEGIN
                SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
                FROM tblEmployee
                WHERE EmployeeNumber = @EmployeeNumber
                SELECT * FROM tblTransactions WHERE EmployeeNumber = @EmployeeNumber
            END
    END

    -- if employeeNumber is < than 200
END 

GO

-- RUN procedure
EXECUTE NameEmployees 323;
EXEC NameEmployees 124;
NameEmployees 4;

-- Query our procedures
-- IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'NameEmployees')
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees;
