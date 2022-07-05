Config = {}

Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

Config.Eye = "true" -- If you are using the QB Target then change this to true.

 Config.Locations = { 
    ["stations"] = {
        [1] = {label = ('KFC'), coords = vector4(341.14, -880.84, 29.34, 0.9)}
    }
}


Config.Items = {
label = "Shop",
    slots = 7,
    items = {
        [1] = {
            name = "kfc-bun",
            price = 10,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "kfc-raw",
            price = 30,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kfc-tomato",
            price = 5,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "kfc-lettuce",
            price = 5,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "kfc-potato",
            price = 10,
            amount = 2,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "kfc-mshakeformula",
            price = 10,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "kfc-sodasyrup",
            price = 20,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}
