DECLARE @json nvarchar(4000)
SET @json = '
    {
        "name": "Phillip",
        "Shopping": {
            "ShoppingTrip": 1,
            "Items": [
                {"Item": "Banannas", "Cost": 5},
                {"Item": "Apples", "Cost": 4}
            ]
        }
    }
'

SELECT 'Bananas' as Item, 5 as Cost
UNION
SELECT 'Apples', 4
UNION
SELECT 'Cherries', 3
FOR JSON PATH, ROOT('Items') -- Convert table to JSON