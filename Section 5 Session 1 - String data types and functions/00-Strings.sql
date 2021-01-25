/**
	String types

		(English)
		char - ASCII
		varchar - ASCII

		(All languages)
		nchar - UNICODE
		mvarchar - UNICODE
*/

-- use char for fixed string sizes
DECLARE @chrMyCharacters AS CHAR(10);

SET @chrMyCharacters = '';

SELECT @chrMyCharacters AS myString,
	len(@chrMyCharacters) AS myLength, -- string length
	DATALENGTH(@chrMyCharacters) AS myDataLength; -- char length param char(10)

GO

-- user varchar for unknown string length
DECLARE @chrMyCharacters AS VARCHAR(10);

SET @chrMyCharacters = '';

SELECT @chrMyCharacters AS myString,
	len(@chrMyCharacters) AS myLength, -- string length
	DATALENGTH(@chrMyCharacters) AS myDataLength; -- char length of the string

GO


-- use nchar for fixed string sizes with symbols
DECLARE @chrMyCharacters AS NCHAR(10);

SET @chrMyCharacters = '';

SELECT @chrMyCharacters AS myString,
	len(@chrMyCharacters) AS myLength, -- string length
	DATALENGTH(@chrMyCharacters) AS myDataLength; -- char length param char(10)

GO

-- usern varchar for unknown string length with symbols. (length*2) + 2
DECLARE @chrMyCharacters AS NVARCHAR(10);

SET @chrMyCharacters = '';

SELECT @chrMyCharacters AS myString,
	len(@chrMyCharacters) AS myLength, -- string length
	DATALENGTH(@chrMyCharacters) AS myDataLength; -- char length of the string

