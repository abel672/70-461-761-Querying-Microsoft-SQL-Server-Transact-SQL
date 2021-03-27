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

-- "strict" gives you an error message                   -- to turn the string into a json
SELECT JSON_MODIFY(@json, 'strict $.Shopping.Items[0]', JSON_QUERY('{"Item": "Big Banannas", "Cost": 1}'))


-- strict also does not allow you to add new content
SELECT JSON_MODIFY(@json, '$.Date', '2022-01-01')
