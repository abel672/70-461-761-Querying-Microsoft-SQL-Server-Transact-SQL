-- Multiple arguments
CREATE PROCEDURE NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) as 
BEGIN
    -- logic
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
        FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
    END

    -- if employeeNumber is < than 200
END 

GO

-- RUN procedure
EXECUTE NameEmployees 323, 327;
EXEC NameEmployees 124, 130;
EXEC NameEmployees @EmployeeNumberFrom = 124, @EmployeeNumberTo = 130;
NameEmployees 4, 6;

-- Query our procedures
-- IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'NameEmployees')
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees;
