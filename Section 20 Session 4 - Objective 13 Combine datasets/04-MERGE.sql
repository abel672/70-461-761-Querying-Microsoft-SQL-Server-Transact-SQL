USE [70-461];
BEGIN TRAN
    --  MERGE QUERY
    MERGE INTO tblTransactions as T -- Target table
    USING (SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) as Amount
        FROM tblTransactionView
        GROUP BY EmployeeNumber, DateOfTransaction) as S  -- Source table
    ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
    WHEN MATCHED THEN -- Match case
          UPDATE SET Amount = T.Amount + S.Amount
    WHEN NOT MATCHED BY TARGET THEN -- Not Matched case
        INSERT (Amount, DateOfTransaction, EmployeeNumber)
        VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
    OUTPUT inserted.*, deleted.*; -- show results;
ROLLBACK TRAN

-- tblTransaction (no) - tblTransactionView (yes)
-- 1 tblTransaction  - 1 tblTransactionView
-- 1 tblTransaction  - multiple rows tblTransactionView

-- Cheking which rows are repeated
SELECT EmployeeNumber, DateOfTransaction, COUNT(*) as NumberOfRows
FROM tblTransactionView
GROUP BY EmployeeNumber, DateOfTransaction
HAVING COUNT(*) > 1;

-- Unifying the amount in all of them (we use this as the source table)
SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) as Amount
FROM tblTransactionView
GROUP BY EmployeeNumber, DateOfTransaction
HAVING COUNT(*) > 1;

-- disable trigger temporarely for this operation
DISABLE TRIGGER tr_tblTransaction ON tblTransactions;