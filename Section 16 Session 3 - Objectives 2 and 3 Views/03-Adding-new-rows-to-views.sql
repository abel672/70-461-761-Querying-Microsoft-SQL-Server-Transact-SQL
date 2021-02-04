-- CASE 1: Adding new row into a view, it works if only affects one table
BEGIN TRAN;
	INSERT INTO ViewByDepartment(EmployeeNumber, DateOfTransaction, TotalAmount)
	VALUES (132, '2015-07-07', 999.99)

	SELECT * FROM ViewByDepartment ORDER BY Department, EmployeeNumber;

	SELECT * FROM tblTransactions WHERE EmployeeNumber = 132;

ROLLBACK TRAN;



-- CASE 2: Update
BEGIN TRAN;
	SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction;
	SELECT * FROM tblTransactions WHERE EmployeeNumber IN (132, 142);

	-- after this, the old rows (132) are not longer in the view, this is a security problem
	-- To evade this for happening we must add WITH CHECK OPTION at the end of the CREATE VIEW statement.
	UPDATE ViewByDepartment
	SET EmployeeNumber = 142
	WHERE EmployeeNumber = 132;

	SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction;
	SELECT * FROM tblTransactions WHERE EmployeeNumber IN (132, 142);

ROLLBACK TRAN;

GO

/**
BEGIN TRAN;
	GO;
	CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION as
		SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
		FROM tblDepartment as D
		LEFT JOIN tblEmployee as E
		on D.Department = E.Department
		LEFT JOIN tblTransactions as T
		on E.EmployeeNumber = T.EmployeeNumber
		WHERE T.EmployeeNumber BETWEEN 120 AND 139

		WITH CHECK OPTION; -- <<<<< To evate the previous case issue
		-- When a row is modified, it makes sure that the data remains visible through the view
	GO;
ROLLBACK TRAN;
*/


/**
 Conclusion: 
	1-You can insert data if just affects one table.

	2- Update or insert may remove rows from the view, to evate this use WITH CHECK OPTION in the CREATE VIEW statement.

*/