USE [70-461]

SELECT * FROM tblEmployee WHERE EmployeeNumber = 129;

GO 

DECLARE @command as varchar(255);
SET @command = 'SELECT * FROM tblEmployee WHERE EmployeeNumber = 129;'
EXECUTE (@command)

GO 

-- NEVER USE IT (VERY DANGEROUS)
DECLARE @command as varchar(255), @param as varchar(50);
SET @command = 'SELECT * FROM tblEmployee WHERE EmployeeNumber = '
SET @param = '129 or 1=1'
EXECUTE(@command + @param) -- SQL INJECTION

GO

-- USE THIS INSTEAD
DECLARE @command as nvarchar(255), @param as nvarchar(50);
SET @command = N'SELECT * FROM tblEmployee WHERE EmployeeNumber = @ProductID'
SET @param = N'129'
EXECUTE SYS.SP_EXECUTESQL @statement = @command, @params = N'@ProductID int', @ProductID = @param