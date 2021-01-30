SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) as SumOfAmount
FROM tblEmployee
JOIN tblTransactions 
ON tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber;


SELECT * FROM tblEmployee WHERE EmployeeNumber = 1046;

SELECT * FROM tblTransactions WHERE EmployeeNumber = 1046;

-- INNER: Default join
	-- If a value is not present in both tables, it won't be retrieved

-- LEFT JOIN: All rows in the left table 
	-- It will retrieve values if its atleast in the left table (check row 926, ID 1046)
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) as SumOfAmount
FROM tblEmployee
LEFT JOIN tblTransactions 
ON tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber;
	

-- RIGHT JOIN: All rows in the right table