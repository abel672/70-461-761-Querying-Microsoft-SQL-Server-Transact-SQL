SELECT D.Department, D.DepartmentHead, E.EmployeeNumber,
E.EmployeeFirstName, E.EmployeeLastName
FROM tblDepartment as D 
LEFT JOIN tblEmployee as E with (nolock) -- to dont stop if there is a transaction using this table (dirty read)
ON D.Department = E.Department
WHERE D.Department = 'HR'


-- MERGE JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber,
E.EmployeeFirstName, E.EmployeeLastName
FROM tblDepartment as D 
LEFT MERGE JOIN tblEmployee as E
ON D.Department = E.Department
WHERE D.Department = 'HR'

-- LOOP JOIN
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber,
E.EmployeeFirstName, E.EmployeeLastName
FROM tblDepartment as D 
LEFT LOOP JOIN tblEmployee as E
ON D.Department = E.Department
WHERE D.Department = 'HR'