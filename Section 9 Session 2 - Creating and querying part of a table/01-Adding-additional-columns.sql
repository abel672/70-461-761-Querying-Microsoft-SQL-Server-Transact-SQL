-- add a new column in the table
ALTER TABLE tblEmployee
	ADD Department VARCHAR(10);

SELECT * FROM tblEmployee;

-- inset row in the table
INSERT INTO tblEmployee
	VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations');


-- alter column into a table 

--Option 1 (DROP and ADD)
ALTER TABLE tblEmployee
	DROP COLUMN Department;

ALTER TABLE tblEmployee
	ADD Department VARCHAR(30);

-- Option 2 (ALTER)
ALTER TABLE tblEmployee
	ALTER COLUMN Department VARCHAR(30);

-- insert specifying column positions (the order must be keep it to make the insertion succesfully)
INSERT INTO tblEmployee([EmployeeNumber],[EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName],
[EmployeeGovermentID],[DateOfBirth])
	VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations');