-- similar (datetime)
SELECT CURRENT_TIMESTAMP AS RightNow;
SELECT GETDATE() AS RightNow;

-- more specific (datetime2)
SELECT SYSDATETIME() AS RightNow; 

-- take unit of time from a date
SELECT DATEADD(YEAR, 1, '2015-01-02 03:04:05') AS myYear;

-- extract the hour or another part of the date
SELECT DATEPART(HOUR, '2015-01-02 03:04:05') AS myHour;

-- week number of the month
SELECT DATENAME(WEEK, GETDATE()) AS myAnswer;
-- day
SELECT DATENAME(WEEKDAY, GETDATE()) AS myDay; 

SELECT DATEDIFF(SECOND, '2015-01-02 03:04:05', GETDATE()) AS SecondsElapsed;