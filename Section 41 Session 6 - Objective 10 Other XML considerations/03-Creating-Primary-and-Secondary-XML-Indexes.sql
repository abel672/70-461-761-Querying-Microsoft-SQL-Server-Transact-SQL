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

-- DROP TABLE #tblXML
CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)


-- Create primary index in XML
CREATE PRIMARY XML INDEX pk_tblXML on #tblXML(xmlCol)

-- Useful when you make queries that make use of a path (for example an EXISTS method)
CREATE XML INDEX secpk_tblXML_Path on #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR PATH

-- Useful when you want to find the value but you dont know the path to it
CREATE XML INDEX secpk_tblXML_Value on #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR VALUE

-- Useful when multiple values are being retrieved
CREATE XML INDEX secpk_tblXML_Property on #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR PROPERTY
