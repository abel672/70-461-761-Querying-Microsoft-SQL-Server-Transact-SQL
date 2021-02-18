USE [70-461];

-- PARTITION BY gives you the OVER() value per unique row in a table: OVER(PARTITION BY A.EmployeeNumber)
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth) as TotalAttendance -- Attendance of all the table, by EmployeeNumber
-- CONVERT(money, A.NumberAttendance) / SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) * 100.0000 as PercentageAttendancePerEmployee
FROM tblEmployee as E 
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
WHERE A.AttendanceMonth < '20150101'


--  OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)) -- will restart by employee number and year change
-- TWO ORDER BY (AttendanceMonth and EmployeeNumber)
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) ORDER BY A.AttendanceMonth) as TotalAttendance -- Attendance of all the table, by EmployeeNumber
-- CONVERT(money, A.NumberAttendance) / SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) * 100.0000 as PercentageAttendancePerEmployee
FROM tblEmployee as E 
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- WHERE A.AttendanceMonth < '20150101'
ORDER BY A.EmployeeNumber, A.AttendanceMonth