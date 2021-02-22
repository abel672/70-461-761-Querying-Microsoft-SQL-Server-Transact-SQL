USE [70-461]

-- Creating new table, adding a column to order the values by null

-- Group 3 columns
SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth, SUM(A.NumberAttendance), 0 as IsNullValue
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber

UNION

-- Group by 2 columns
SELECT E.Department, E.EmployeeNumber, null, SUM(NumberAttendance) as TotalAttendance, 1
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber

UNION

-- Group by 1 column
SELECT E.Department, null, null, SUM(NumberAttendance) as TotalAttendance, 1
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department

ORDER BY Department, EmployeeNumber, IsNullValue, AttendanceMonth