-- there are Scan and Seek, Seek are faster: https://docs.microsoft.com/en-us/sql/relational-databases/views/create-indexed-views?view=sql-server-ver15
SELECT * FROM dbo.ViewByDepartment;

-- Check more specifially
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')

	DROP VIEW dbo.ViewByDepartment;
GO;

-- WITH SCHEMABINGING to allow create index from it
CREATE VIEW [dbo].[ViewByDepartment] WITH SCHEMABINDING as
	SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
	FROM dbo.tblDepartment as D
	INNER JOIN dbo.tblEmployee as E
	on D.Department = E.Department
	INNER JOIN dbo.tblTransactions as T
	on E.EmployeeNumber = T.EmployeeNumber
	WHERE T.EmployeeNumber BETWEEN 120 AND 139
  WITH CHECK OPTION;
GO


-- We list what columns do we want to include in that index
-- with WHERE clause, it checks the index and then goes to the table
-- without out it, jumps to the table directly and search in there for it.

-- INDEX CREATION: The column must be primary key (unique) value
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment on dbo.ViewByDepartment(EmployeeNumber, Department);

-- now you can not drop any table who is referenced in this cluster view index (SCHEMA BINDING= Binds all objects together as far as it needs)
BEGIN TRAN;
	DROP TABLE tblEmployee; -- Cannot DROP TABLE 'tblEmployee' because it is being referenced by object 'ViewByDepartment'.
ROLLBACK TRAN;