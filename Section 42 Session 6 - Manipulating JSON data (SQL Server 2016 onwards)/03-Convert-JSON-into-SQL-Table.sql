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

SELECT * FROM OPENJSON(@json, '$.Shopping.Items')
                WITH(Item varchar(10), Cost int) -- specify how do you want it in the table