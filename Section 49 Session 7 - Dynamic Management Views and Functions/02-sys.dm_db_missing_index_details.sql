SELECT T.*
INTO tblTransactionBigger
FROM tblTransaction as T 
CROSS JOIN tblTransaction as T2

SELECT * FROM tblTransactionBigger
WHERE EmployeeNumber = 127

SELECT * FROM sys.dm_db_missing_index_details


SELECT mig.*, STATEMENT as table_name, column_id, column_name, column_usage 
FROM sys.dm_db_missing_index_details as mid 
CROSS APPLY sys.dm_db_missing_index_columns(mid.index_handle)
INNER JOIN sys.dm_db_missing_index_groups as mig on mig.index_handle = mid.index_handle
WHERE database_id = db_id()
ORDER BY column_id