-- HASH JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM tblEmployee as E
LEFT JOIN tblDepartment as D 
ON E.Department = D.Department