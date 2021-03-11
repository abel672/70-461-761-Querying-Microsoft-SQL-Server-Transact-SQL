USE [70-461]

-- TOP 5 from various categories

-- This does not work
SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
    RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) as TheRank
FROM tblDepartment as D
    JOIN tblEmployee as E on D.Department = E.Department
    WHERE RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) <= 5 -- rank not allow here
ORDER BY D.Department, EmployeeNumber

-- But if you turn it into a sub query it does
SELECT * FROM
(SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
        RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) as TheRank
    FROM tblDepartment as D
    JOIN tblEmployee as E on D.Department = E.Department) AS MyTable
WHERE TheRank <= 5 -- We are getting 'TheRank' column from out new table 'MyTable'
ORDER BY Department, EmployeeNumber