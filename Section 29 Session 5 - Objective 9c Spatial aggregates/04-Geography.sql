USE [70-461]

BEGIN TRAN
    CREATE TABLE tblGeog
        (
            GXY GEOGRAPHY,
            Description varchar(30),
            IDtblGeog int CONSTRAINT PK_tblGeog PRIMARY KEY IDENTITY(1,1)
        )

    INSERT INTO tblGeog
    VALUES  (GEOGRAPHY::STGeomFromText('POINT (-73.99330995566511 40.750691416828346)', 4326), 'Madison Square Gardens, NY'),
            (GEOGRAPHY::STGeomFromText('POINT (-0.17720506889064744 51.501028996512765)', 4326), 'Royal Albert Hall, London'),
            (GEOGRAPHY::STGeomFromText('LINESTRING (-73.99330995566511 40.750691416828346, -0.17720506889064744 51.501028996512765)', 4326), 'Connection')

    SELECT * FROM tblGeog

    DECLARE @g as GEOGRAPHY 
    SELECT @g = GXY from tblGeog WHERE IDtblGeog = 1

    SELECT IDtblGeog, GXY.STGeometryType() as MyType,
    GXY.STStartPoint().ToString() as StartingPoint,
    GXY.STEndPoint().ToString() as EndingPoint,
    GXY.STPointN(1).ToString() as FirstPoint,
    GXY.STPointN(2).ToString() as SecondPoint,
    GXY.STLength() as MyLength,
    GXY.STIntersection(@g) as DistanceFirstLine
    FROM tblGeog

    DECLARE @h as GEOGRAPHY

    SELECT @g = GXY FROM tblGeog WHERE IDtblGeog = 1
    SELECT @H = GXY FROM tblGeog WHERE IDtblGeog = 2
    SELECT @g.STDistance(@h) as MyDistance

    SELECT GXY.STUnion(@g)
    FROM tblGeog
    WHERE IDtblGeog = 2

ROLLBACK TRAN 


SELECT * FROM sys.spatial_reference_systems