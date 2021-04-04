-- SELECT *
-- INTO tblTransactionBig
-- FROM tblTransaction

-- INSERT INTO tblTransactionBig(Amount, DateOfTransaction, EmployeeNumber)
-- SELECT T1.Amount, T2.DateOfTransaction, 1 as EmployeeNumber
-- FROM tblTransaction as T1
-- CROSS JOIN (SELECT * FROM tblTransaction WHERE EmployeeNumber < 200) as T2

-- CREATE NONCLUSTERED INDEX idx_tblTransactionBig ON tblTransactionBig(EmployeeNumber)

CREATE PROC procTransactionBig(@EmployeeNumber as int) WITH RECOMPILE -- It recompiles each time, to see if it can use a cluster index for the query to execute or not, in order to optimize queries
AS
SELECT *
FROM tblTransactionBig as T
LEFT JOIN tblEmployee as E 
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = @EmployeeNumber

EXEC procTransactionBig 1