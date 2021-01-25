-- IMPLICIT: It does it automatically

DECLARE @myvar AS decimal(5,2) = 3;

SELECT @myvar;

-- EXPLICIT: We ask it to do it.

SELECT CONVERT(decimal(5,2), 3);
SELECT CAST(3 AS decimal(5,2));

SELECT CONVERT(decimal(5,2), 1000); -- won't work
SELECT CONVERT(decimal(6,2), 1000); -- will work

SELECT 3/2;
SELECT 3/2.0;

SELECT CONVERT(int, 12.1234);