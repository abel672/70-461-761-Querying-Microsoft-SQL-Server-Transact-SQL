USE [70-461]

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
-- SUM(A.NumberAttendance) OVER() as TotalAttendance, -- Attendance of all the table
SUM(A.NumberAttendance) 
-- Default behaviour of rows
OVER(PARTITION BY E.EmployeeNumber, YEAR(A.AttendanceMonth)
    ORDER BY A.AttendanceMonth) as TotalAttendance
FROM tblEmployee as E 
JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) as A 
ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY A.EmployeeNumber, A.AttendanceMonth


-- Default behaviour is always RANGE:
    -- range between unbounded preceding and unbounded following - DEFAULT where there is not ORDER BY
    -- range between unbounded preceding and current row         - DEFAULT where there IS an ORDER BY

-- This decrease performance, that's why you should always specify the query that you want, and put row on it. 