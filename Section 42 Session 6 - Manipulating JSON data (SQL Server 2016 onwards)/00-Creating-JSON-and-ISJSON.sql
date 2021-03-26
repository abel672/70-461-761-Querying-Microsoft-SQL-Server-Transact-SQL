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

-- To check if the received data is JSON (1=true, 0=false)
SELECT ISJSON(@json)