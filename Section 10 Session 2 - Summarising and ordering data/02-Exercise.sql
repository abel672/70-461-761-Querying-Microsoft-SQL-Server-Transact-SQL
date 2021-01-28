SELECT DATENAME(MONTH, DateOfBirth) as MonthNumber, COUNT(*) as NumberEmployees,
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth), DATEPART(MONTH, DateOfBirth) 
ORDER BY DATEPART(MONTH, DateOfBirth);-- Order by month number



-- Here we will have repeated months, because we order by YEAR
SELECT DATENAME(MONTH, DateOfBirth) as MonthNumber, COUNT(*) as NumberEmployees,
  YEAR(DateOfBirth)
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth), YEAR(DateOfBirth)
ORDER BY YEAR(DateOfBirth);-- O


-- COUNT() and NULL VALUES
SELECT DATENAME(MONTH, DateOfBirth) as MonthNumber, COUNT(*) as NumberEmployees,
COUNT(EmployeeMiddleName) as MiddleNumberm, -- COUNT only counters not null values
COUNT(*) - COUNT(EmployeeMiddleName) as NoMiddleNames -- to know the ones who has null value
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth), DATEPART(MONTH, DateOfBirth) 
ORDER BY DATEPART(MONTH, DateOfBirth);-- Order by month number

-- MIN date of birth (youngest)
-- MAX date of birth (oldest)
SELECT DATENAME(MONTH, DateOfBirth) as MonthNumber, COUNT(*) as NumberEmployees,
FORMAT(MIN(DateOfBirth), 'dd-MM-yy') as EarliestDateOfBirth,
FORMAT(MAX(DateOfBirth), 'D') as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth), DATEPART(MONTH, DateOfBirth) 
ORDER BY DATEPART(MONTH, DateOfBirth);-- Order by month number

