ALTER TRIGGER tr_tblTransaction
	on tblTransactions
	AFTER DELETE, INSERT, UPDATE
	AS
	BEGIN
		-- run queries only if there were rows affected after calling this trigger
		--IF @@ROWCOUNT > 0 -- This var shows us if there are rows affected by executing this trigger

		-- PRO WAY
		--DECLARE @InsertedDateOfTransaction AS smalldatetime = Inserted.DateOfTransaction;
		--DECLARE @DeletedDateOfTransaction AS smalldatetime = Deleted.DateOfTransaction;
		--IF @InsertedDateOfTransaction <> @DeletedDateOfTransaction

		-- Binary way						Updated gap
			-- Amount = 1					1 (Updated)
			-- DateOfTransaction = 2		2 (Updated)
			-- EmployeeNumber = 3			Blank  (No Updated)
		--IF COLUMNS_UPDATED() & 2 = 2 -- Checking if column 2 was updated in binary way

		IF UPDATE(DateOfTransaction) -- (Recommended) if DateOfTransaction was updated (does not check if the value was change, just if an update was done)
		BEGIN
			SELECT *, 'TABLEINSERTED' FROM Inserted;
			SELECT *, 'TABLEDELETED' FROM Deleted; 
		END
	END
GO

BEGIN TRAN

	INSERT INTO tblTransactions (Amount, DateOfTransaction, EmployeeNumber)
	VALUES(123, '2015-07-11', 123)

	SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRAN

-- Test
UPDATE tblTransactions
SET DateOfTransaction = '2015-07-12'
WHERE DateOfTransaction = '2015-07-11' AND EmployeeNumber = 123;


BEGIN TRAN
	-- there is a trigger in this view that delete from tblTransactions also.
	-- that will trigger our upper trigger here
	DELETE FROM ViewByDepartment
	WHERE TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRAN