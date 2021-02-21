USE [70-461]

SELECT A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,

LAG(NumberAttendance) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) as MyLag, -- value of the previous row
LEAD(NumberAttendance) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) as MyLead, -- value of the next row

NumberAttendance - LAG(NumberAttendance, 1) OVER(PARTITION BY E.EmployeeNumber
                                                  ORDER BY A.AttendanceMonth) as MyDiff

FROM tblEmployee as E JOIN tblAttendance as A
ON E.EmployeeNumber = A.EmployeeNumber