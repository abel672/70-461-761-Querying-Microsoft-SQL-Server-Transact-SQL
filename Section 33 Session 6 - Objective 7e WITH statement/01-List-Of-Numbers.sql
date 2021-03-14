USE [70-461];

SELECT E.EmployeeNumber from tblEmployee as E
LEFT JOIN tblTransactions as T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY E.EmployeeNumber


WITH tblEmployeesWithNotTransaction AS
    (SELECT * FROM tblEmployee
    WHERE EmployeeNumber NOT IN (SELECT EmployeeNumber FROM tblTransactions))

SELECT * FROM tblEmployeesWithNotTransaction;


-- Getting the correct row number
WITH Numbers as (
    SELECT top(SELECT MAX(EmployeeNumber) FROM tblTransactions) ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransactions as U
)

SELECT U.RowNumber
FROM Numbers as U
LEFT JOIN tblTransactions as T 
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber

SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) FROM SYS.OBJECTS O CROSS JOIN SYS.OBJECTS P