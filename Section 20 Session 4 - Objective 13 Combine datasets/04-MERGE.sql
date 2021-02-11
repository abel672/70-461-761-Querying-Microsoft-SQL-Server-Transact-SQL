USE [70-461];
BEGIN TRAN
    ALTER TABLE tblTransactions
        ADD Comments varchar(50) NULL;
    go -- DDL: Data Definition Language

    --  MERGE QUERY: Taking just 5% of the data
    MERGE TOP(5) PERCENT INTO tblTransactions as T -- Target table -- DML: Data Manipulation Language
    USING (SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) as Amount
        FROM tblTransactionView
        GROUP BY EmployeeNumber, DateOfTransaction) as S  -- Source table
    ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
    WHEN MATCHED AND T.Amount + S.Amount > 0 THEN -- Match case with new amount
        UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
    WHEN MATCHED THEN -- Match with same amount
        DELETE
    WHEN NOT MATCHED BY TARGET THEN -- Not Matched case in target
        INSERT (Amount, DateOfTransaction, EmployeeNumber, Comments)
        VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
    WHEN NOT MATCHED BY SOURCE THEN -- Not Matched case in source
        UPDATE SET Comments = 'Unchanged'
    OUTPUT inserted.*, deleted.*, $action; -- show results, + action made in each row;

    SELECT * FROM tblTransactions; -- To see inserted comments in the table
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