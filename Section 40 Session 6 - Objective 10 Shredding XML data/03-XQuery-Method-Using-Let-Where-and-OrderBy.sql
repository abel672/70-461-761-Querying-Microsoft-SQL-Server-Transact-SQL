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

-- looping and returning items from xml
SELECT @x.query('for $ValueRetireved in /Shopping/ShoppingTrip[1]/Item
                let $CostVariable := $ValueRetireved/@Cost
                where $CostVariable >= 4
                order by $CostVariable
                return concat(string($ValueRetireved), ";")')