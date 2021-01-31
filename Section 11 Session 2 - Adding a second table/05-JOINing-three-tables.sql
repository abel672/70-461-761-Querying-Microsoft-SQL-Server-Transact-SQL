-- complex JOIN query with three tables
SELECT DepartmentHead, SUM(Amount) as SumOfAmount
FROM tblDepartment
LEFT JOIN tblEmployee
ON tblDepartment.Department = tblEmployee.Department
LEFT JOIN tblTransactions
ON tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
GROUP BY DepartmentHead
ORDER BY DepartmentHead;

-- run to insert a new department to test LEFT JOIN
--INSERT INTO tblDepartment(Department, DepartmentHead)
--VALUES('Acccounts', 'James');

-- same than previous, by renaming tables (using Alias)
SELECT D.DepartmentHead, SUM(T.Amount) as SumOfAmount
FROM tblDepartment as D
LEFT JOIN tblEmployee as E
ON D.Department = E.Department
LEFT JOIN tblTransactions T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.DepartmentHead
ORDER BY D.DepartmentHead;