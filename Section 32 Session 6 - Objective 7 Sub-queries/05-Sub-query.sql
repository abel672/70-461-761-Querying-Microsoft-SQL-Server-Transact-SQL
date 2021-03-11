USE [70-461]

SELECT *, (SELECT COUNT(EmployeeNumber)
            FROM tblTransactions AS T
            WHERE T.EmployeeNumber = E.EmployeeNumber) AS NumTransactions,
            (SELECT SUM(Amount)
            FROM tblTransactions AS T
            WHERE T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
FROM tblEmployee AS E 
WHERE E.EmployeeLastName LIKE 'y%'

-- do the same, just a different way to show for the exams.
SELECT *
FROM tblTransactions as T 
WHERE EXISTS
    (SELECT EmployeeNumber FROM tblEmployee as E WHERE EmployeeLastName LIKE 'y%' AND T.EmployeeNumber = E.EmployeeNumber)
ORDER BY EmployeeNumber