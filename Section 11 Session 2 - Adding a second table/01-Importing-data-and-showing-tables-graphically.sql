SELECT MAX(EmployeeNumber) as MaxEmployeeNumber
FROM tblEmployee;

GO

USE [70-461];

GO

INSERT INTO tblTransactions VALUES
(-964.05, '20150526', 658), 
(-105.23, '20150914', 987), 
(-506.8, '20150505', 695);

SELECT * FROM tblTransactions;

-- DELETE DATA FROM A TABLE
TRUNCATE TABLE tblTransactions;