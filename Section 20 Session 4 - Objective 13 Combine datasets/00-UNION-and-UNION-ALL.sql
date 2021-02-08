/**
	UNION and UNION ALL
		1-Tables must have the same number of columns
		2-Must have same compatible data types

		The computer will store all comun columns in the best data type to fit all of them. (smallint + int > int)
*/

SELECT * FROM inserted;
SELECT * FROM deleted;

-- the biggest wins. Result will be CHAR(11)
SELECT CONVERT(CHAR(5), 'HI')  as Gretting
UNION
SELECT CONVERT(CHAR(11), 'HELLO THERE')
UNION
SELECT CONVERT(CHAR(11), 'BONJOUR') -- orders alphabetically
UNION
SELECT CONVERT(CHAR(11), 'HELLO THERE'); -- Get rids of duplicates

-- UNION ALL gets everything, even duplicates
SELECT CONVERT(CHAR(5), 'HI')  as Gretting
UNION ALL
SELECT CONVERT(CHAR(11), 'HELLO THERE')
UNION ALL
SELECT CONVERT(CHAR(11), 'BONJOUR')
UNION ALL
SELECT CONVERT(CHAR(11), 'HELLO THERE'); 

-- will turn into biggest type (BIGINT)
SELECT CONVERT(TINYINT, 45) as MyColumn
UNION
SELECT CONVERT(BIGINT, 456);

-- won't work
SELECT 'HI THERE'
UNION
SELECT 4;