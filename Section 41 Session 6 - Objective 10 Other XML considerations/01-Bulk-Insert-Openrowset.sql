DROP TABLE #tblXML
GO

CREATE TABLE #tblXML(XmlCol xml)
GO

-- Option 1 to insert data: Bulk insert
BULK INSERT #tblXML FROM 'C:\XML\SampleDataBulkInsert.txt'
SELECT * FROM #tblXML


DROP TABLE #tblXML
GO

CREATE TABLE #tblXML(IntCol int, XmlCol xml)
GO

-- Option 2 to insert data: Openrow set
INSERT INTO #tblXML(XmlCol)
SELECT * FROM
                                                    -- BLOB: Binary Large Object
openrowset(BULK 'C:\XML\SampleDataOpenRowset.txt', SINGLE_BLOB) AS x

SELECT * FROM #tblXML