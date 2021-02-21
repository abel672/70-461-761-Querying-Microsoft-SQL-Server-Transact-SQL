USE [70-461]

-- First and Last row value of a specific PARTITION set
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
FIRST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as FirstMonth,
LAST_VALUE(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as LastMonth

FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber