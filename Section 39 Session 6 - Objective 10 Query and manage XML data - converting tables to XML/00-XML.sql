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

-- SELECT @x as XMLOutput

-- ALTER TABLE tblEmployee
-- ADD XMLOutput xml null

-- UPDATE tblEmployee
-- SET XMLOutput = @x
-- WHERE EmployeeNumber = 200

-- An XML file could contain all your personal data in one single column
-- That's the power of it
SELECT * FROM tblEmployee
WHERE EmployeeNumber = 200