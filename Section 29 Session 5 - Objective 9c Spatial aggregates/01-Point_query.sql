USE [70-461]

-- https://docs.microsoft.com/en-us/sql/t-sql/spatial-geometry/ogc-methods-on-geometry-instances?view=sql-server-ver15
BEGIN TRAN 

    CREATE TABLE tblGeom
        (GXY GEOMETRY,
        Description VARCHAR(30),
        IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1))

INSERT INTO tblGeom
VALUES (geometry::STGeomFromText('POINT (3 4)', 0), 'First point'),
		(geometry::STGeomFromText('POINT (3 5)', 0), 'Second point'),
		(geometry::Point(4, 6, 0), 'Third point'),
		(geometry::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three points')

SELECT IDtblGeom, GXY.STGeometryType() as MyType,
GXY.STStartPoint().ToString() as StartingPoint, -- get hex in point format with ToString() function
GXY.STEndPoint().ToString() as EndPoint,
GXY.STPointN(1).ToString() as FirstPoint,
GXY.STPointN(2).ToString() as SecondPoint,
GXY.STPointN(1).STX as FirstPointX,
GXY.STPointN(1).STY as FirstPointY,
GXY.STPointN(2).STX as SecondPointX,
GXY.STPointN(2).STY as SecondPointY,
GXY.STNumPoints() as NumberPoints
FROM tblGeom

DECLARE @g as geometry
DECLARE @h as geometry

SELECT @g = GXY from tblGeom WHERE IDtblGeom = 1
SELECT @h = GXY FROM tblGeom WHERE IDtblGeom = 3
SELECT @g.STDistance(@h) as MyDistance

SELECT @g, 'Point 1'
UNION ALL
SELECT @h, 'Point 2'

ROLLBACK TRAN 