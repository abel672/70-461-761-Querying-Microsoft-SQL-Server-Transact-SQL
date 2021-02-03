-- creating a view
CREATE VIEW ViewByDepartment as
	SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
	FROM tblDepartment as D
	LEFT JOIN tblEmployee as E
	on D.Department = E.Department
	LEFT JOIN tblTransactions as T
	on E.EmployeeNumber = T.EmployeeNumber
	WHERE T.EmployeeNumber BETWEEN 120 AND 139;
	--ORDER BY D.Department, T.EmployeeNumber;
GO;

-- creating view
CREATE VIEW ViewSummary as
	SELECT D.Department, T.EmployeeNumber as EmpNum, SUM(T.Amount) as TotalAmount
	FROM tblDepartment as D
	LEFT JOIN tblEmployee as E
	on D.Department = E.Department
	LEFT JOIN tblTransactions as T
	on E.EmployeeNumber = T.EmployeeNumber
	GROUP BY D.Department, T.EmployeeNumber
	--ORDER BY D.Department, T.EmployeeNumber;
GO;

-- Using view
SELECT * FROM ViewByDepartment;

SELECT * FROM ViewSummary;