USE [70-461]

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, SUM(A.NumberAttendance) as NumberAttendance,
-- to know if its comes from a group by or by value
-- to know if the value null is from a value or from a total
GROUPING(E.EmployeeNumber) as EmployeeNumberGroupedBy,
-- same but using binary and allowing multiple parameters
GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmployeeNumberGroupedID
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- UNION of the three fields by:
    -- all of them being null
    -- last two ones being null
    -- last one being null
GROUP BY ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)
ORDER BY Department, EmployeeNumber, AttendanceMonth