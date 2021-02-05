SELECT * FROM ViewByDepartment;

-- We can not delete vieww because it could affect other tables too. 
DELETE FROM ViewByDepartment
WHERE TotalAmount = 999.99 AND EmployeeNumber = 132;

GO;

-- You can do it for a view with just one table
CREATE VIEW SimpleView AS
	SELECT * FROM tblTransactions;

GO;

BEGIN TRAN;
	DELETE FROM SimpleView
	WHERE EmployeeNumber = 132;
ROLLBACK TRAN;