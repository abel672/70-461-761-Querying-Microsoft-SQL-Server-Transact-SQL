--Until this transaction is not finished, any other transaction can be made.
-- The transaction locks the table its using if it finds a result on it for the query is executing

BEGIN TRAN

SELECT * 
FROM tblEmployee

UPDATE tblEmployee
SET EmployeeNumber = 122
WHERE EmployeeNumber =123

-- ROLLBACK TRAN