-- add new column into a table
ALTER TABLE tblTransactions
	ADD DateOfEntry datetime;

-- adding DEFAULT CONSTRAING
ALTER TABLE tblTransactions
	ADD CONSTRAINT defDateOfEntry DEFAULT GETDATE() for DateOfEntry;


-- by default here, will add the current date if its not added by us (First insert) 
INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2014-01-01', 1);

INSERT INTO tblTransactions(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
VALUES (2, '2014-01-02', 1, '2013-01-01');

SELECT * FROM tblTransactions WHERE EmployeeNumber < 3;

-- CREATING CONSTRAINT DURING TABLE CREATION
CREATE TABLE tblTransaction2
(
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NOT NULL,
	EmployeeNumber int NOT NULL,
	-- You declare it in the column itself 
	-- YOU CAN NOT HAVE THE SAME CONSTRAINT NAME IN DIFFERENT TABLES
	-- ALWAYS HAVE THE TABLE NAME IN THE CONSTRAINT
	DateOfEntry datetime NULL CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE()            
);

INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2014-01-01', 1);

INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
VALUES (2, '2014-01-02', 1, '2013-01-01');

SELECT * FROM tblTransaction2 WHERE EmployeeNumber < 3;

-- you can not delete a column that relies in a CONSTRAINT
/**
The object 'tblTransaction2_defDateOfEntry' is dependent on column 'DateOfEntry'.
Msg 4922, Level 16, State 9, Line 40
ALTER TABLE DROP COLUMN DateOfEntry failed because one or more objects access this column.
*/
ALTER TABLE tblTransaction2
	DROP COLUMN DateOfEntry;

-- you need to delete the constraing first
ALTER TABLE tblTransaction2
	DROP CONSTRAINT tblTransaction2_defDateOfEntry;