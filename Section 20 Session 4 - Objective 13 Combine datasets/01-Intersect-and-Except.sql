SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) % 3 as ShouldIdelete
--INTO tblTransactionView
FROM tblTransactions;


DELETE FROM tblTransactionView 
WHERE ShouldIdelete = 1;


UPDATE tblTransactionView
SET DateOfTransaction = DATEADD(YEAR, 1, DateOfTransaction)
WHERE ShouldIDelete = 2;


ALTER TABLE tblTransactionView
	DROP COLUMN ShouldIDelete;


-- EXCEPT: I want to see all the rows in the 1st table, except the one that happens to be also in the second table
-- See the rows from the 1st table that are not in the 2nd table
-- It retrieves all rows from the 1st, then delete those ones that happen to be also in 2nd
SELECT * FROM tblTransactions
EXCEPT
SELECT * FROM tblTransactionView; -- brings new rows

-- INTERCEPT: Take all the rows in the 1st table, then return those who are also in the 2nd table
SELECT * FROM tblTransactions
INTERSECT
SELECT * FROM tblTransactionView; -- brings old rows