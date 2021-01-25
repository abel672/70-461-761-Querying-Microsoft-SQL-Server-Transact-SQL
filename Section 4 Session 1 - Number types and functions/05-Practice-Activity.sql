select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), CONVERT(numeric(5,2), system_type_id) / CONVERT(numeric(5,2), column_id) as Calculation
from sys.all_columns;

-- Teacher
select system_type_id, column_id, system_type_id * 1.0000 / column_id as Calculation
from sys.all_columns

 


select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), 
 FLOOR(CONVERT(numeric(5,2), system_type_id) / CONVERT(numeric(5,2), column_id)) as Calculation
from sys.all_columns;


--Teacher
select system_type_id, column_id, system_type_id / column_id as Calculation
from sys.all_columns


-- OK
select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), 
 CEILING(CONVERT(numeric(5,2), system_type_id) / CONVERT(numeric(5,2), column_id)) as Calculation
from sys.all_columns;


-- OK
select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), 
 ROUND(CONVERT(numeric(5,2), system_type_id) / CONVERT(numeric(5,2), column_id), 1) as Calculation
from sys.all_columns;


-- OK
select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), 
 ROUND(CONVERT(numeric(5,2), TRY_CAST(system_type_id * 2 AS tinyint)) / CONVERT(numeric(5,2), column_id), 1) as Calculation
from sys.all_columns;


-- Teacher (ALSO OK)
select CONVERT(decimal(5,2), system_type_id), CONVERT(decimal(5,2), column_id), 
 ROUND(CONVERT(numeric(5,2), TRY_CONVERT(tinyint, system_type_id * 2)) / CONVERT(numeric(5,2), column_id), 1) as Calculation
from sys.all_columns;


















/**
1. The problem is that they are all whole numbers - is that what is meant to happen?

(More hints are below.)

2. Use the FLOOR function.

3. Use the CEILING function.

4. Use the ROUND function. However it requires two arguments - the field, and something else...

5. The problem is that, when you convert a number above 255 into a tinyint, it won't work - it's too big. To do a conversion with error checking, try putting a TRY_ before it...
*/


