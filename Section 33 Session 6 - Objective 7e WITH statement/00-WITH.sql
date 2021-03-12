USE [70-461];

-- WITH (VERY RECOMMENDED)
WITH tblWithRanking as
    (SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
        RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) as TheRank
    FROM tblDepartment as D
    JOIN tblEmployee as E on D.Department = E.Department),
Transaction2014 as
    (SELECT * FROM tblTransactions WHERE DateOfTransaction < '2015-01-01')

SELECT * FROM tblWithRanking
LEFT JOIN Transaction2014 ON tblWithRanking.EmployeeNumber = Transaction2014.EmployeeNumber
WHERE TheRank <= 5
ORDER BY Department, tblWithRanking.EmployeeNumber