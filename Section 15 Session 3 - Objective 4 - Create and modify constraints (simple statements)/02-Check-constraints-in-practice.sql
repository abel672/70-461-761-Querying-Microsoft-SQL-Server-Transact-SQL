-- Adding CHECK constraint
-- CHECK constrains will only be created if there are not values already that may conflict with it.
-- To disable that we must use WITH NOCHECK
ALTER TABLE tblTransactions WITH NOCHECK -- Don't check the existing rows
	ADD CONSTRAINT checkAmount CHECK (Amount > -1000 AND Amount < 1000);

-- this won't be allowed: Column name or number of supplied values does not match table definition.
INSERT INTO tblTransactions
	VALUES(-1010, '2014-01-01', 1);


-- Add another CONSTRAING in another table
ALTER TABLE tblEmployee WITH NOCHECK
	ADD CONSTRAINT checkMiddleName CHECK
	-- have a look at the name, if it has '.', replace it with ''
	-- then compare the result with the original name, if its the same or is null, allow it
	-- is checking if the name as '.', if it has we don't allow it
	(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName OR EmployeeMiddleName IS NULL);


ALTER TABLE tblEmployee
	DROP CONSTRAINT checkMiddleName;

BEGIN TRAN;
	-- This won't be allowed
	INSERT INTO tblEmployee
	VALUES (2003, 'A', 'B..', 'C', 'D', '2014-01-01', 'Accounts');

	SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003;
ROLLBACK TRAN;

-- CHECK CONSTRAINT: Date limit
ALTER TABLE tblEmployee WITH NOCHECK
	ADD CONSTRAINT chkDateOfBirth CHECK (DateOfBirth BETWEEN '1900-01-01' AND DATEADD(YEAR, -15, GETDATE()));


BEGIN TRAN;
	INSERT INTO tblEmployee
	VALUES (2003, 'A', 'B..', 'C', 'D', '2014-01-01', 'Accounts');
	SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003;
ROLLBACK TRAN;

-- Add constraint while creating a table
CREATE TABLE tblEmployee2
(
	EmployeeMiddleName varchar(50) NULL CONSTRAINT CK_EmployeeMiddleName CHECK
	(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName OR EmployeeMiddleName IS NULL)
);