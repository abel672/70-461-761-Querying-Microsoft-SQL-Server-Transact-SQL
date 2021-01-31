--Example one
BEGIN TRANSACTION; -- Start transaction

	SELECT COUNT(*) FROM tblTransactions;

	-- DELETE null values with WHERE clause
	DELETE tblTransactions
	FROM tblEmployee as E
	RIGHT JOIN tblTransactions as T
	ON E.EmployeeNumber = T.EmployeeNumber
	WHERE E.EmployeeNumber IS NULL;

	SELECT COUNT(*) FROM tblTransactions;


ROLLBACK TRANSACTION; -- Revert transaction. For testing purposes, transactions are great.

SELECT COUNT(*) FROM tblTransactions;

GO;

-- Example two (better), using IN clause
BEGIN TRANSACTION;

	SELECT COUNT(*) FROM tblTransactions;

	-- Deleting using the IN clause with our previous query (better)
	DELETE tblTransactions
	FROM tblTransactions
	WHERE EmployeeNumber IN -- IN clause with out query
	(
		SELECT TNumber
		FROM (
			-- we have a query that works, we surrounded to create a new query, without modying it
			SELECT E.EmployeeNumber as ENumber, E.EmployeeFirstName, E.EmployeeLastName, T.EmployeeNumber as TNumber,
				SUM(T.Amount) as TotalAmount
			FROM tblEmployee as E
			RIGHT JOIN tblTransactions as T
			ON E.EmployeeNumber = T.EmployeeNumber
			GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
		) as newTable
		WHERE ENumber IS NULL -- filtering NULL values
	);

	SELECT COUNT(*) FROM tblTransactions;

ROLLBACK TRANSACTION;

SELECT COUNT(*) FROM tblTransactions;
