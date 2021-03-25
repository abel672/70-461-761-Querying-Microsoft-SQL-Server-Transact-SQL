/**
    for
    let
    where
    order by
    return
*/

DECLARE @x XML
SET @x = '<Shopping ShopperName="Phillip Burton" Weather="Nice">
            <ShoppingTrip ShoppingTripID="L1">
                <Item Cost="5">Bananas</Item>
                <Item Cost="4">Apples</Item>
                <Item Cost="3">Cherries</Item>
            </ShoppingTrip>
            <ShoppingTrip ShoppingTripID="L2">
                <Item>Emeralds</Item>
                <Item>Diamonds</Item>
                <Item>Furniture</Item>
            </ShoppingTrip>
        </Shopping>'

-- returing each item as a table column
SELECT tbl.col.query('.') as Items
FROM @x.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)


-- getting values
SELECT tbl.col.value('.', 'varchar(50)') as Item,
        -- getting an attribute
        tbl.col.value('@Cost', 'varchar(50)') as Cost
FROM @x.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)
-- into tblTemp -- (to put it into a table in the DB)