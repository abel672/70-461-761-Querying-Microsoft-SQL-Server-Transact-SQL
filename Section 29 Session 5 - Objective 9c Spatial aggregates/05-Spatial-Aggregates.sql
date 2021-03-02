USE [70-461]

BEGIN TRAN 

    CREATE TABLE tblGeom
    (GXY geometry,
    Description varchar(20),
    IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1))

    -- Adding lines
    INSERT INTO tblGeom
    VALUES (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First Line'),
            (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second Line'),
            (geometry::STGeomFromText('MULTILINESTRING ((5 1, 2 6), (1 4, 2 5))', 0), 'Third Line'),
            (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'), -- Polygons have to be closed
            (geometry::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'), -- Polygons have to be closed
            (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1,-1 0, 0 -1, 1 0)', 0), 'Circle') -- circle
			-- (geometry::STGeomFromText('LINESTRING (1 0, 0 1,-1 0, 0 -1, 1 0)', 0), 'Circle as Line String')


    SELECT *, GXY.Filter(GEOMETRY::Parse('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))')) FROM tblGeom
    UNION ALL 
    SELECT GEOMETRY::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0), 'Filter', 0, 0


	-- Union Aggreate
    DECLARE @i as GEOMETRY
    SELECT @i = GEOMETRY::UnionAggregate(GXY)
    FROM tblGeom

    SELECT @i as CombinedShapes 

    -- Collection Aggregate: Keeps them in the same number of shapes
	DECLARE @j as GEOMETRY
    SELECT @j = GEOMETRY::CollectionAggregate(GXY)
    FROM tblGeom

    SELECT @j as CombinedShapes


	-- Envelope and ConvexHull aggreates
	SELECT @i as CombinedShapes
	UNION ALL
	SELECT GEOMETRY::EnvelopeAggregate(GXY).ToString() as Envelope FROM tblGeom
	UNION ALL
	SELECT GEOMETRY::ConvexHullAggregate(GXY).ToString() as Envelope FROM tblGeom
ROLLBACK TRAN 