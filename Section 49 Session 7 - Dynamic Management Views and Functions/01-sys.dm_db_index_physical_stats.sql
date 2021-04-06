-- Detail mode
SELECT * 
FROM  SYS.dm_db_index_physical_stats(db_id('70-461S7'), object_id('dbo.tblEmployee'), null, null, 'DETAILED')

SELECT * 
FROM SYS.dm_db_index_physical_stats(NULL, NULL, NULL, NULL, 'DETAILED')