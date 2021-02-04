--Alter view
ALTER VIEW [dbo].[ViewByDepartment] as
	SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
	FROM tblDepartment as D
	LEFT JOIN tblEmployee as E
	on D.Department = E.Department
	LEFT JOIN tblTransactions as T
	on E.EmployeeNumber = T.EmployeeNumber
	WHERE T.EmployeeNumber BETWEEN 120 AND 139;
GO



-- See our current created views
SELECT * FROM sys.views;

-- Check if view exists
IF EXISTS (SELECT * FROM sys.views WHERE name = 'ViewByDepartment')
	-- Drop view
	DROP VIEW dbo.ViewByDepartment;

GO;

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
	WHERE T.EmployeeNumber BETWEEN 120 AND 139
  WITH CHECK OPTION;
GO

-- The best way to alter a view is drop it and recreate it again.

/**
From SQL Server 2016 Service Pack 1, there is an alternative.

You can use the phrase "CREATE OR ALTER VIEW".

If the view doesn't exist, it is CREATEd.

If the view does exist, it is ALTERed.*/