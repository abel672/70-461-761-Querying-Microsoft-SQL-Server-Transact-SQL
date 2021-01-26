-- declare datetimeoffset (timezone)
DECLARE @myDateOffset as datetimeoffset = '2015-01-02 03:04:05.456 +05:30'; -- 8-10 bytes by default
--DECLARE @myDateOffset as datetimeoffset(2) = '2015-01-02 03:04:05.456 +05:30'; -- 2 bytes
SELECT @myDateOffset as MyDateOffset;

GO

-- another way to declare it
DECLARE @myDate as datetime2 = '2015-01-02 03:04:05.456';
SELECT TODATETIMEOFFSET(@myDate, '+05:30') as MyDateOffset;

SELECT DATETIME2FROMPARTS(2015, 06, 25, 1, 2, 3, 456,          3) as MyDate;
-- previous one with offset included in the params
SELECT DATETIMEOFFSETFROMPARTS(2015, 06, 25, 1, 2, 3, 456,       5, 30,         3) as MyDateOffset;


-- datetime2 with offset function
SELECT SYSDATETIMEOFFSET() as TimeNowWithOffset;
-- GMT format
SELECT SYSUTCDATETIME() as TimeNotUTC;

-- using another offset in an datetimeoffset value
DECLARE @myDateOffset as datetimeoffset = '2015-01-02 03:04:05.456 +05:30';
SELECT SWITCHOFFSET(@myDateOffset, '-05:00') as MyDateOffsetTexas; 
