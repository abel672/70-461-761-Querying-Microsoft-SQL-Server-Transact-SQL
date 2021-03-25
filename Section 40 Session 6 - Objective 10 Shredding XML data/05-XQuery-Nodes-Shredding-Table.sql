/**
    for
    let
    where
    order by
    return
*/

DECLARE @x1 XML, @x2 XML
SET @x1 = '
    <Shopping ShopperName="Phillip Burton" Weather="Nice">
        <ShoppingTrip ShoppingTripID="L1">
            <Item Cost="5">Bananas</Item>
            <Item Cost="4">Apples</Item>
            <Item Cost="3">Cherries</Item>
        </ShoppingTrip>
    </Shopping>'

SET @x2 = '
    <Shopping ShopperName="Phillip Burton" Weather="Nice">
        <ShoppingTrip ShoppingTripID="L2">
            <Item>Emeralds</Item>
            <Item>Diamonds</Item>
            <Item>Furniture</Item>
        </ShoppingTrip>
    </Shopping>'

-- CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)

SELECT * FROM #tblXML


SELECT tbl.col.value('@Cost', 'varchar(50)')
FROM #tblXML CROSS APPLY 
xmlCol.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)