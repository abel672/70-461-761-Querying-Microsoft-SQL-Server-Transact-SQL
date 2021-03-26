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

-- "strict" gives you an error message
SELECT JSON_VALUE(@json, 'strict $.name') -- Returns 1 value
SELECT JSON_VALUE(@json, 'strict $.Shopping.ShoppingTrip')
SELECT JSON_VALUE(@json, 'strict $.Shopping.Items[0].Item')


SELECT JSON_QUERY(@json, '$.Shopping') -- Returns an object or an array
SELECT JSON_QUERY(@json, '$.Shopping.Items')