-- USE [70-461];

-- DAL: Data Access Layer
/**
    Application (C#, Java...) -----> PROCEDURE ------> TABLE DATA

    -EXEC NameEmployees              NameEmployees     Data
                                          SELECT...
*/

CREATE PROCEDURE NameEmployees as
BEGIN
    SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
    FROM tblEmployee
END 

GO

-- RUN procedure
EXECUTE NameEmployees;
EXEC NameEmployees;
NameEmployees;
