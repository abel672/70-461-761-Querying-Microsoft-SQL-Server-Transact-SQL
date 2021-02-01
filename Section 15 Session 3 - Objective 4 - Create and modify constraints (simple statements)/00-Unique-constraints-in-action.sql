-- Creating a unique constraint, and adding it into a column
-- The constraints are stored in the table's Keys folder and Indexes folder
ALTER TABLE tblEmployee
	ADD CONSTRAINT unqGovermentID UNIQUE (EmployeeGovermentID);


-- find duplicate data to clean it
SELECT EmployeeGovermentID, COUNT(EmployeeGovermentID) as MyCount
FROM tblEmployee
GROUP BY EmployeeGovermentID
HAVING COUNT(EmployeeFirstName) > 1;

-- find rows where there are duplicates
SELECT * FROM tblEmployee WHERE EmployeeGovermentID IN ('HN513777D', 'TX593671R');

-- Fixing data (Test)
BEGIN TRAN;
	DELETE FROM tblEmployee
	WHERE EmployeeNumber < 3;

	-- delete first top 2 occurencies for those IDs (because we have 3 and we want 1)
	DELETE TOP(2) FROM tblEmployee
	WHERE EmployeeNumber IN (131, 132);

	SELECT * FROM tblEmployee WHERE EmployeeGovermentID IN ('HN513777D', 'TX593671R');
ROLLBACK TRAN;

-- Commit tested data
BEGIN TRAN;
	DELETE FROM tblEmployee
	WHERE EmployeeNumber < 3;

	-- delete first top 2 occurencies for those IDs (because we have 3 and we want 1)
	DELETE TOP(1) FROM tblEmployee
	WHERE EmployeeNumber IN (131, 132);

	SELECT * FROM tblEmployee WHERE EmployeeGovermentID IN ('HN513777D', 'TX593671R');
COMMIT TRAN;

-- Add constraint in transactions table
ALTER TABLE tblTransactions
	ADD CONSTRAINT uniqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber);


DELETE FROM tblTransactions
WHERE EmployeeNumber = 131;

-- Testing the constraint (You won't be able to insert a repeated valued twice
INSERT INTO tblTransactions
VALUES (1, '2015-01-01', 131);
/**
	Violation of UNIQUE KEY constraint 'uniTransaction'. Cannot insert duplicate key in object 'dbo.tblTransactions'. The duplicate key value is (1.00, Jan  1 2015 12:00AM, 131).
The statement has been terminat
*/
INSERT INTO tblTransactions
VALUES (1, '2015-01-01', 131);

-- Remove constraint / Also to modify constraint is the same way
ALTER TABLE tblTransactions
	DROP CONSTRAINT uniqTransaction;

-- Creating a table with constraints
CREATE TABLE tblTransaction2
(
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NOT NULL,
	EmployeeNumber int NOT NULL,
	CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber)
);

-- Test again
INSERT INTO tblTransaction2
VALUES (1, '2015-01-01', 131);

INSERT INTO tblTransaction2
VALUES (1, '2015-01-01', 131);

DROP TABLE tblTransaction2;