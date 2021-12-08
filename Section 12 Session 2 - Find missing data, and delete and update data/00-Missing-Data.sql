-- derived table: Use a query to create a new query, without modifying the existing one.

-- Using LEFT/RIGHT JOIN with WHERE IS NULL, is really useful to find missing data

-- LEFT JOIN
-- WHERE NOT NULL helps to find no matching rows in the second table (tblTransactions)
SELECT ENumber, EmployeeFirstName, EmployeeLastName
-- we have a query that works, we surrounded to create a new query, without modyfing it
FROM (
SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName, E.EmployeeLastName, T.EmployeeNumber as TNumber,
	SUM(T.Amount) as TotalAmount
FROM tblEmployee as E
LEFT JOIN tblTransactions as T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
) as newTable
WHERE TNumber IS NULL -- filtering NULL values
ORDER BY ENumber, TNumber, EmployeeFirstName, EmployeeLastName;


-- RIGHT JOIN
-- WHERE NOT NULL helps to find no matching rows in the first table (tblEmployee)
SELECT *
-- we have a query that works, we surrounded to create a new query, without modyfing it
FROM (
SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName, E.EmployeeLastName, T.EmployeeNumber as TNumber,
	SUM(T.Amount) as TotalAmount
FROM tblEmployee as E
RIGHT JOIN tblTransactions as T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
) as newTable
WHERE ENumber IS NULL -- filtering NULL values
ORDER BY ENumber, TNumber, EmployeeFirstName, EmployeeLastName;