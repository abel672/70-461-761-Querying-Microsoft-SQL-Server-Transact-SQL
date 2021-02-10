BEGIN TRAN
	--  MERGE QUERY
	MERGE INTO tblTransactions as T -- Target table
	USING tblTransactionView as S  -- Source table
	ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
	WHEN MATCHED THEN -- Match case
		UPDATE SET Amount = T.Amount + S.Amount
	WHEN NOT MATCHED BY TARGET THEN -- Not Matched case
		INSERT (Amount, DateOfTransaction, EmployeeNumber)
		VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- Mandatory ;
ROLLBACK TRAN