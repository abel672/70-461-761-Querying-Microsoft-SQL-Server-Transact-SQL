USE [70-461];
-- UNBOUNDED = Take all the PRECEDING or FOLLOWING rows that are available (not limit)
-- CURRENT ROW = 0
    -- CURRENT ROW = 0 FOLLOWING or 0 PRECEDING
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
    ORDER BY A.AttendanceMonth
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as TotalAttendance -- Attendance of all the table, by EmployeeNumber
    -- ROWS BETWEEN UNBOUNDED PRECEDING AND 0 FOLLOWING) as TotalAttendance -- Attendance of all the table, by EmployeeNumber
FROM tblEmployee as E 
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- WHERE A.AttendanceMonth < '20150101'
ORDER BY A.EmployeeNumber, A.AttendanceMonth  