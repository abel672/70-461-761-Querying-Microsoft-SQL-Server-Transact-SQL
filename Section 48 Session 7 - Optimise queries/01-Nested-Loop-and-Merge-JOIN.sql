-- NESTED LOOP JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee as E 
LEFT JOIN tblDepartment as D 
ON E.Department = D.Department
WHERE D.Department = 'HR'

-- this will turn the JOIN above into a MERGE JOIN, because is using now an index scan in each table, and both of those can not be merged
-- This improves the performance
CREATE UNIQUE CLUSTERED INDEX idx_tblTransaction 
on tblEmployee (EmployeeNumber, DateOfTransaction, Amount)