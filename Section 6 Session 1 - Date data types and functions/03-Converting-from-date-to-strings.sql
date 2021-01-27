DECLARE @myDate as datetime = '2015-01-02 03:04:05.456'; -- implycit conversion (string to date)
SELECT 'The date and time is: ' + @myDate; -- it won't work, because of the order of precedence (string is lower than date, in terms of complexity)
GO

-- Here it works. Convert Date to String
DECLARE @myDate as datetime = '2015-01-02 03:04:05.456';
SELECT CONVERT(nvarchar(20), @myDate) as MyConvertedDate;
GO

-- Same way, different method
DECLARE @myDate as datetime = '2015-01-02 03:04:05.456';
SELECT CAST(@myDate as nvarchar(20)) as MyCastDate;

-- CONVERT string to date does not work. needs specific format for conversion
SELECT CONVERT(DATE, 'Thursday, 25 June 2015') as MyConvertedDate; -- won't work. 

-- PARSE works intelligently, its table to do it because it detects the data in the string
SELECT PARSE('Thursday, 25 June 2015' as DATE) as MyParsedDate; -- it works
SELECT PARSE('Friday, 25 June 2015' as DATE) as MyParsedDate; -- but the date as to be a real one, otherwise it won't do it.
SELECT PARSE('Jueves, 25 de Junio de 2015' as DATE using 'es-ES') as MySpanishParsedDate; -- for other languages, you need to specify

-- Formating dates
SELECT FORMAT(CAST('2015-01-02 03:04:05.456' as datetime), 'D') as MyFormattedLongDate; -- long format
SELECT FORMAT(CAST('2015-01-02 03:04:05.456' as datetime), 'd') as MyFormattedShortDate; -- short format
SELECT FORMAT(CAST('2015-01-02 03:04:05.456' as datetime), 'dd-MM-yyyy') as MyFormattedBritishDate; -- british positions
SELECT FORMAT(CAST('2015-01-02 03:04:05.456' as datetime), 'yyyy-MM-dd') as MyFormattedJapanesse; -- japannese positions
SELECT FORMAT(CAST('2015-01-02 03:04:05.456' as datetime), 'D', 'es-ES') as MyFormattedInternationalLongDate; -- also with culture

GO

-- you can also choose the culture format by a numeric code param: https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15
-- this only works with CONVERT, not with CAST
DECLARE @myDate as datetime = '2015-01-02 03:04:05.456';
SELECT CONVERT(nvarchar(20), @myDate, 101) as MyConvertedDate;
SELECT CONVERT(nvarchar(20), @myDate, 102) as MyConvertedDate;


-- To convert from string to date, use the PARSE()

-- To convert from date to string, use the FORMAT()