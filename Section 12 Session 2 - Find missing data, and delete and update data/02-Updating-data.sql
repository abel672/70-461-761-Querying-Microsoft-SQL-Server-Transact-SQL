SELECT * FROM tblEmployee WHERE EmployeeNumber = 194;
SELECT * FROM tblTransactions WHERE EmployeeNumber = 3;
SELECT * FROM tblTransactions WHERE EmployeeNumber = 194;

BEGIN TRAN;

	--SELECT * FROM tblTransactions WHERE EmployeeNumber = 194;

	UPDATE tblTransactions
	SET EmployeeNumber = 194
	OUTPUT inserted.*, deleted.* -- output the inserted and deleted changes
	FROM tblTransactions
	WHERE EmployeeNumber IN (3, 5, 7, 9);

	--SELECT * FROM tblTransactions WHERE EmployeeNumber = 194;

ROLLBACK TRAN;