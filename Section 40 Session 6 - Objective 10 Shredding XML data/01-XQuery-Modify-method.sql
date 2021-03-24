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

SELECT @x.value('(/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]', 'varchar(50)') as OriginalValue

-- replace value
SET @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1] with "6.0"')

SELECT @x.value('(/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]', 'varchar(50)') as UpdatedValue

-- insert value
SET @x.modify('insert <Item Cost="5">New Food</Item> into (/Shopping/ShoppingTrip)[1]')

SELECT @x
