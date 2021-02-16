USE [70-461]

-- SELECT * FROM tblAttendance

-- sum NumberAttendance per employee by year
SELECT A.EmployeeNumber, YEAR(A.AttendanceMonth) as AttendanceYear, SUM(A.NumberAttendance) as TotalAttendance
FROM tblEmployee as E
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY A.EmployeeNumber, YEAR(A.AttendanceMonth)
ORDER BY A.EmployeeNumber, YEAR(A.AttendanceMonth)

-- How to use OVER()
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
-- SUM(A.NumberAttendance) OVER() as TotalAttendance, -- Attendance of all the table
CONVERT(money, A.NumberAttendance) / SUM(A.NumberAttendance) OVER() * 100.0000 as PercentageAttendance
FROM tblEmployee as E 
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
