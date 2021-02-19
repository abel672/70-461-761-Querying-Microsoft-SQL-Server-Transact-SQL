USE [70-461]

SELECT A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,

ROW_NUMBER() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber, A.AttendanceMonth) as TheRowNumber, -- Row number
RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber, A.AttendanceMonth) as TheRank, -- Rank number of row position
DENSE_RANK() OVER(PARTITION BY A.EmployeeNumber ORDER BY A.EmployeeNumber, A.AttendanceMonth) as TheDenseRank -- Rank number of row position following an order

FROM tblEmployee as E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) as A 
ON E.EmployeeNumber = A.EmployeeNumber;

-- How to use order witout ORDER BY with an adding funtion
SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT null)) FROM tblAttendance