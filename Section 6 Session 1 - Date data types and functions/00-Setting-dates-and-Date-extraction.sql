DECLARE @mydate as DATETIME = '2015-06-24 12:34:56.124';
SELECT @mydate as MyDate;

DECLARE @mydate2 as DATETIME = '20150624 12:34:56.124';
SELECT @mydate2 as MyDate2;

-- date with accuracy (7 is the default)
-- when more accuracy, more bytes it takes (from 6 to 8 bytes)
DECLARE @mydate3 as DATETIME2 = '20150624 12:34:56.124';
--DECLARE @mydate3 as DATETIME2(3) = '20150624 12:34:56.124'; -- accuracy to 3
SELECT @mydate3 as MyDate3;

SELECT DATEFROMPARTS(2015, 06, 24) AS ThisDate;

-- last param is for the time format (3 digit or 4 digits, including 124)
SELECT DATETIME2FROMPARTS(2015, 06, 24, 12, 34, 56, 124, 3) AS TheDate;

SELECT YEAR(@mydate) as myYear, MONTH(@mydate) as myMonth, DAY(@mydate) as myDay;