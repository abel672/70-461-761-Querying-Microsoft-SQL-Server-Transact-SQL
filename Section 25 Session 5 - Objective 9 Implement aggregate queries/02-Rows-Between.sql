-- ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING: Will SUM() the previous row and next row if there are available, to create the current row value.
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
    ORDER BY A.AttendanceMonth
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as TotalAttendance -- Attendance of all the table, by EmployeeNumber
FROM tblEmployee as E 
JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- WHERE A.AttendanceMonth < '20150101'
ORDER BY A.EmployeeNumber, A.AttendanceMonth 