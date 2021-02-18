USE [70-461];
-- ROW: Does not take in mind the ties (links) between rows (same row twice are SUM())
-- RANGE: Takes in mind the ties (links) between rows (same row twice are NOT sum())
    -- Range only works in this scenearios
        -- unbounded preceding and current row
        -- current row and unbounded following
        -- unbounded preceding and unbounded following
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,

SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
    ORDER BY A.AttendanceMonth
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as RowsTotal, -- Attendance of all the table, by EmployeeNumber

SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
    ORDER BY A.AttendanceMonth
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as RangeTotal
FROM tblEmployee as E 
JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) as A -- Create derived table with tblAttendance twice
ON E.EmployeeNumber = A.EmployeeNumber
-- WHERE A.AttendanceMonth < '20150101'
ORDER BY A.EmployeeNumber, A.AttendanceMonth

-- RANGE is slower due to the ties checking.
-- Use always ROW by default, ONLY use RANGE if you have to take care of ties