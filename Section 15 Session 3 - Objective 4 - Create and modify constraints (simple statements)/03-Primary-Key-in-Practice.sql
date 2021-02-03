-- Adding PRIMARY KEY
-- Clustered means that is ordered
ALTER TABLE tblEmployee
	ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber);

-- This can not be inserted twice now.
INSERT INTO tblEmployee(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName,
EmployeeGovermentID, DateOfBirth, Department)
VALUES (2004, 'FirstName', 'MiddleName', 'LastName', 'AB12345FH', '2014-01-01', 'Accounts');

DELETE FROM tblEmployee
WHERE EmployeeNumber = 2004;

ALTER TABLE tblEmployee
	DROP CONSTRAINT PK_tblEmployee;

-- Add Primary and set AUTO INCREMENT -> KEY IDENTITY(startNumber, IncreaseAmountPerInsertion)
-- This only works when you create a new column or a new table
CREATE TABLE tblEmployee2
(
	EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1), -- Auto increment +1
	EmployeeName nvarchar(20)
);

INSERT INTO tblEmployee2
VALUES ('MyName'),
('MyName');

SELECT * FROM tblEmployee2;

-- if you delete the columns, the counter is still going up
DELETE FROM tblEmployee2;

-- if you truncate the columns, the counter starts from the beggining
TRUNCATE TABLE tblEmployee2;


-- ADD PRIMARY KEY MANUALLY FOR A MOMENT
SET IDENTITY_INSERT tblEmployee2 ON;

	INSERT INTO tblEmployee2 (EmployeeNumber, EmployeeName)
	VALUES (38, 'MyName'),
	(39, 'MyName');

DROP TABLE tblEmployee2;

SET IDENTITY_INSERT tblEmployee2 OFF;

-- get the last PRIMARY KEY value in the last created table
SELECT @@IDENTITY; -- Global variable
SELECT SCOPE_IDENTITY(); -- function

-- get the last PRIMARY KEY value from a selected table
SELECT IDENT_CURRENT('dbo.tblEmployee2');
