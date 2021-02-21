USE [70-461]

SELECT A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,

CUME_DIST() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) as MyCume_Dist, -- row_number x 20 sec per row, divided by the number that is in the partition
PERCENT_RANK() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) as MyPercent_Rank, -- same, but starts from 0, instead from 1. Goes always to the previous row of the current row to count.

-- Implementations
CAST(ROW_NUMBER() OVER(PARTITION BY  E.EmployeeNumber ORDER BY A.AttendanceMonth) as decimal(9,5))
/ COUNT(*) OVER(PARTITION BY E.EmployeeNumber) as CalcCume_Dist,

CAST(ROW_NUMBER() OVER(PARTITION BY  E.EmployeeNumber ORDER BY A.AttendanceMonth) - 1 as decimal(9,5))
/ (COUNT(*) OVER(PARTITION BY E.EmployeeNumber) - 1) as CalcPercent_Rank

FROM tblEmployee as E JOIN tblAttendance as A
ON E.EmployeeNumber = A.EmployeeNumber

-- another example to show it clearer

SELECT A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,

CUME_DIST() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance) * 19 as MyCume_Dist, -- multiplying by number_rows per partition
PERCENT_RANK() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance) * 18 as MyPercent_Rank -- multiplying by number_rows per partition - 1

FROM tblEmployee as E JOIN tblAttendance as A
ON E.EmployeeNumber = A.EmployeeNumber