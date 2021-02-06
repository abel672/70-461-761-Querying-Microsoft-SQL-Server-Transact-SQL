-- DML: Data Manipulation Language
-- DDL: Data Definition Language
CREATE TRIGGER tr_tblTransaction
	ON dbo.tblTransactions
	AFTER DELETE, INSERT, UPDATE --DML
	AS
	BEGIN
		SET NOCOUNT ON -- to disable message of how many rows were affected after running the operations
		-- our code here

		-- Check what has been changed
		SELECT * FROM Inserted;
		SELECT * FROM Deleted;
	END;
GO

--Test
BEGIN TRAN;
	INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber)
	VALUES (123, '2015-07-10', 123);
ROLLBACK TRAN;
GO