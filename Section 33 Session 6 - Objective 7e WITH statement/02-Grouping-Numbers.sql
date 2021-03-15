-- USE [70-461]

WITH Numbers as (
    SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransactions) ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransactions as U),
Transaction2014 AS (
    SELECT * FROM tblTransactions WHERE DateOfTransaction >= '2014-01-1' AND DateOfTransaction < '2015-01-01'),
tblGap as (
    SELECT U.RowNumber, 
        RowNumber - LAG(RowNumber) OVER(ORDER BY RowNumber) as PreviousRowNumber, 
        LEAD(RowNumber) OVER(ORDER BY RowNumber) - RowNumber as NextRowNumber,
        CASE WHEN RowNumber - LAG(RowNumber) OVER(ORDER BY RowNumber) = 1 THEN 0 ELSE 1 END AS GroupGap
    FROM Numbers as U 
    LEFT JOIN Transaction2014 as T 
    ON U.RowNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber IS NULL),
tblGroup as (
    SELECT *, SUM(GroupGap) OVER (ORDER BY RowNumber) as TheGroup
    FROM tblGap)

SELECT MIN(RowNumber) as StartingEmployeeNumber, MAX(RowNumber) as EndingEmployeeNumber,
        MAX(RowNumber) - MIN(RowNumber) + 1 as NumberEmployees
FROM tblGroup
GROUP BY TheGroup
ORDER BY TheGroup