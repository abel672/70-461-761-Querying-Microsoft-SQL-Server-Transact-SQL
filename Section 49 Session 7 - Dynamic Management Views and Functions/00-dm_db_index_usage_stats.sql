SELECT DB_NAME(DATABASE_ID) as DataBaseName,
        OBJECT_NAME(ddius.object_id) as TableName,
        i.name as [Index Name]
FROM SYS.DM_DB_INDEX_USAGE_STATS AS ddius
JOIN SYS.INDEXES AS i ON DDIUS.OBJECT_ID = i.object_id and ddius.index_id = i.index_id
WHERE database_id = db_id()