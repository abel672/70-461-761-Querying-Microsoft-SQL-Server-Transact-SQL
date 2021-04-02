CREATE CLUSTERED INDEX idx_tblEmployee ON tblEmployee(EmployeeNumber)

SELECT * FROM tblEmployee WHERE EmployeeNumber = 127

-- seek = few number of rows based on the index. It looks just in one part of the B-Tree
-- scan = going through the entire table 

DROP INDEX idx_tblEmployee on tblEmployee

-- you can also create a clustered index by creating a primary key
-- clustered index does not need unique values to be created, a primary keys does it
ALTER TABLE tblEmployee
ADD CONSTRAINT pk_tblEmployee PRIMARY KEY(EmployeeNumber)