-- @@NESTLEVEL: Allows you to see the trigger deepness in a trigger 

ALTER TRIGGER tr_tblTransaction
	on tblTransactions
	AFTER DELETE, INSERT, UPDATE
	as
	BEGIN
		--SELECT @@NESTLEVEL AS Nest_Level
		-- Run this code only if we are in a first trigger level
		IF @@NESTLEVEL = 1
		BEGIN
			SELECT *, 'TABLEINSERT' from Inserted;	-- It will print this when there is only an insertion.
			SELECT *, 'TABLEDELETE' from Deleted;	-- It will print this when there is only an deletion.
		END
	END
GO

-- This will trigger 1 trigger. @@NESTLEVEL = 1
BEGIN TRAN
	INSERT INTO tblTransactions (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (123, '2015-07-10', 123)
ROLLBACK TRAN

-- This will trigger 2 triggers. @@NESTLEVEL = 2
BEGIN TRAN
	SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;

	DELETE FROM ViewByDepartment
	WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;

	SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;

ROLLBACK TRAN


EXEC sp_configure 'nested triggers'; -- to see the current trigger limit loop config (@@NESTVARIABLE)

EXEC sp_configure 'nested triggers', 0; -- To change the value (AFTER TRIGGER will be recursive, INSTEAD OF TRIGGER wont be.)
RECONFIGURE
GO