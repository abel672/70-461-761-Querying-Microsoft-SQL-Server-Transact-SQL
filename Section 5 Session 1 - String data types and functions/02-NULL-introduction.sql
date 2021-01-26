-- NULL means "I don't know"

DECLARE @myvar as int;

SELECT 1+1+1+@myvar+1+1 as myCol;

DECLARE @mystring as nvarchar(20);
SELECT DATALENGTH(@mystring) as myString;

DECLARE @mydecimal decimal(5,2);
SELECT TRY_CONVERT(decimal(5,2), 1000) as convertDecimal;
SELECT TRY_CAST(1000 as decimal(5,2)) as castDecimal;