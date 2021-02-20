USE [70-461];

-- NTILE: Sort rows in groups of two or three
SELECT A.EmployeeNumber, A.AttendanceMonth,
    A.NumberAttendance,
    -- Sometimes it sorts randomly, without following a pattern
    NTILE(10) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) as TheNTile,

    -- custom NTILE without bug or sorting
    CONVERT(INT, (ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth)-1)
    / (COUNT(*) OVER(PARTITION BY E.EmployeeNumber
                    ORDER BY A.AttendanceMonth
                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) / 10.0)) + 1 as MyNTile
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber