-- See all views + other stuff
SELECT * FROM sys.syscomments;
SELECT * FROM sys.views;

-- Retrieve view way 1
SELECT S.id, S.text as SText
FROM sys.syscomments as S
JOIN sys.views as V
on S.id = V.object_id;
 
-- Retrieve view way 2
SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.ViewByDepartment'));

-- Retrieve view way 3
SELECT * FROM sys.sql_modules;


-- HOW TO ENCRYPT A VIEW
-- Check more specifially
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')

	DROP VIEW dbo.ViewByDepartment;
GO;

-- Encripted view, be sure to save the code on a word document before creating it.
-- Ohterwise, you will never see it anymore
CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION as
	SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
	FROM tblDepartment as D
	LEFT JOIN tblEmployee as E
	on D.Department = E.Department
	LEFT JOIN tblTransactions as T
	on E.EmployeeNumber = T.EmployeeNumber
	WHERE T.EmployeeNumber BETWEEN 120 AND 139;
GO

-- NOW THIS CODE WON'T RETRIEVE THE VIEWS

-- See all views + other stuff
SELECT * FROM sys.syscomments;
SELECT * FROM sys.views;

-- Retrieve view way 1
SELECT S.id, S.text as SText
FROM sys.syscomments as S
JOIN sys.views as V
on S.id = V.object_id;
 
-- Retrieve view way 2
SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.ViewByDepartment'));

-- Retrieve view way 3
SELECT * FROM sys.sql_modules;