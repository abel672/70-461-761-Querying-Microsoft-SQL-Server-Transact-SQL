SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) as SumOfAmount
FROM tblEmployee
JOIN tblTransactions 
ON tblEmployee.EmployeeNumber = tblTransactions.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName -- because we use SUM, we need to put everything else in GROUP BY clause
ORDER BY EmployeeNumber; -- this goes after the select, so it knows which EmployeeNumber to take already.