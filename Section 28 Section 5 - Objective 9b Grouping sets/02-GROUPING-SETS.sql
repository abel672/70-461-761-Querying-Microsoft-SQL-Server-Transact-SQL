USE [70-461]

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, SUM(A.NumberAttendance) as NumberAttendance,
-- to know if its comes from a group by or by value
-- to know if the value null is from a value or from a total
GROUPING(E.EmployeeNumber) as EmployeeNumberGroupedBy,
-- same but using binary and allowing multiple parameters
GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmployeeNumberGroupedID
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- gives you the total of everything, regardless the other columsn are null or not
-- GROUP BY CUBE (E.Department, E.EmployeeNumber, A.AttendanceMonth)
-- Allows you to make a custom one
GROUP BY GROUPING SETS ((E.Department, E.EmployeeNumber, A.AttendanceMonth), (E.Department), ())
ORDER BY    CASE WHEN Department       IS NULL THEN 1 ELSE 0 END, Department,
            CASE WHEN E.EmployeeNumber  IS NULL THEN 1 ELSE 0 END, E.EmployeeNumber,
            CASE WHEN AttendanceMonth   IS NULL THEN 1 ELSE 0 END, AttendanceMonth



SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, SUM(A.NumberAttendance) as NumberAttendance,
-- to know if its comes from a group by or by value
-- to know if the value null is from a value or from a total
GROUPING(E.EmployeeNumber) as EmployeeNumberGroupedBy,
-- same but using binary and allowing multiple parameters
GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmployeeNumberGroupedID
FROM tblEmployee as E JOIN tblAttendance as A 
ON E.EmployeeNumber = A.EmployeeNumber
-- gives you the total of everything, regardless the other columsn are null or not
-- GROUP BY CUBE (E.Department, E.EmployeeNumber, A.AttendanceMonth)
-- GROUP BY ROLLUP  (E.Department, E.EmployeeNumber, A.AttendanceMonth)
GROUP BY GROUPING SETS ((E.Department, E.EmployeeNumber, A.AttendanceMonth), (E.Department), ())
ORDER BY COALESCE(Department, 'zzzzzzzz'), COALESCE(E.EmployeeNumber, 999999), COALESCE(AttendanceMonth, '2100-01-01')