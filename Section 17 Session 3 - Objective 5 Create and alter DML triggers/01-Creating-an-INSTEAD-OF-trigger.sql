-- INSTEAD OF trigger
CREATE TRIGGER tr_ViewByDepartment on dbo.ViewByDepartment
	INSTEAD OF DELETE --INSTEAD OF only performs in one operation at time
	AS
	BEGIN
		SET NOCOUNT ON
		-- WITH CHECK OPTION will not allow this in the trigger, because we are using the View that has that option here.
		SELECT *, 'ViewByDepartment' as TriggerInfoViewByDepartment FROM deleted;
	END;

-- Test
BEGIN TRAN;
	--SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;

	DELETE FROM ViewByDepartment
	WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;

	--SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132;
ROLLBACK TRAN;

-- ALTER TABLE
ALTER TRIGGER tr_ViewByDepartment ON dbo.ViewByDepartment
	INSTEAD OF DELETE
	AS
	BEGIN
		DECLARE @EmployeeNumber as int;
		DECLARE @DateOfTransaction as smalldatetime;
		DECLARE @Amount as smallmoney;
		
		-- get the removed data from the view
		SELECT @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount
		FROM deleted;

		-- WITH CHECK OPTION will work here, because we are not performing operations in the view, just in the underlined tables
		-- remove that data from tblTransactions too
		DELETE tblTransactions
			FROM tblTransactions as T
			WHERE T.EmployeeNumber = @EmployeeNumber
			AND T.DateOfTransaction = @DateOfTransaction
			AND T.Amount = @Amount;
	END
