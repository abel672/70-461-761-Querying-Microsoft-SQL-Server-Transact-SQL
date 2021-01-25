DECLARE @chrASCII AS VARCHAR(10) = 'hello<';

DECLARE @chrUNICODE AS VARCHAR(10) = N'hello<';

-- String functions: https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15

-- get strings parts
SELECT LEFT(@chrASCII, 2) AS myASCII, RIGHT(@chrUNICODE, 2) AS myUNICODE;

SELECT SUBSTRING(@chrASCII, 3, 2) as middleLetters;

-- TRIM Strings
DECLARE @myTrim AS VARCHAR(10) = '   hello   ';

SELECT LTRIM(@myTrim) AS myLTRIM;

SELECT RTRIM(@myTrim) AS myRTRIM;

SELECT RTRIM(LTRIM(@myTrim)) AS totalTrim;

-- Replace strings
SELECT REPLACE(@chrASCII, 'l', 'L') as myModified;

-- Uppercase and Lowercase
SELECT UPPER(@chrASCII);

SELECT LOWER(@chrASCII);