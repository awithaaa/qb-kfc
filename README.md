## Preview

[watch preview here]()

## Requirements
QBCore Framework - [QBCORE GITHUB](https://github.com/qbcore-framework/qb-core)

PolyZone - [PolyZone GITHUB](https://github.com/mkafrin/PolyZone)

qb-target - [QB Target github](https://github.com/BerkieBb/qb-target)

Map - [KFC MLO](https://github.com/lilphantom25/burgershot-map)

## Add the [images] in to your inventory

## Insert into @qb-smallresources --> server --> consumables.lua

```

--KFC

--Drinks
QBCore.Functions.CreateUseableItem("kfc-softdrink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-mshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

--Food
QBCore.Functions.CreateUseableItem("kfc-snacker", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-zingerburger", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-submarine", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-heartstopper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-veggieburger", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-fries", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

```

## Insert into @qb-smallresources --> config.lua
```
Consumeables = {

-- kfc
    ["kfc-snacker"] = math.random(35, 54),
    ["kfc-zingerburger"] = math.random(35, 54),
    ["kfc-submarine"] = math.random(35, 54),
    ["kfc-veggieburger"] = math.random(35, 54),
    ["kfc-heartstopper"] = math.random(35, 54),
    ["kfc-fries"] = math.random(35, 54),
} 

ConsumeablesDrink = {
     -- kfc
    ["kfc-softdrink"] = math.random(40, 50),
    ["kfc-mshake"] = math.random(40, 50),

}
```

## Insert into @qb-core - Shared.lua

```

-- KFC
-- Food
	["kfc-snacker"] 				 = {["name"] = "kfc-snacker", 			 		["label"] = "Snacker", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "kfc-snacker.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["kfc-zingerburger"] 			 = {["name"] = "kfc-zingerburger", 			 	["label"] = "ZingerBurger", 			["weight"] = 300, 		["type"] = "item", 		["image"] = "kfc-zingerburger.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["kfc-submarine"] 				 = {["name"] = "kfc-submarine", 			 	["label"] = "Chicken Submarine", 		["weight"] = 310, 		["type"] = "item", 		["image"] = "kfc-submarine.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["kfc-heartstopper"] 		 	 = {["name"] = "kfc-heartstopper", 				["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "kfc-heartstopper.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["kfc-veggieburger"] 		 	 = {["name"] = "kfc-veggieburger", 				["label"] = "Veggie Burger", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-veggieburger.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["kfc-fries"] 				 	 = {["name"] = "kfc-fries", 			 	  	["label"] = "Fries", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-fries.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		-- Drinks

	["kfc-softdrink"] 			 	 = {["name"] = "kfc-softdrink", 				["label"] = "Soft Drink", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-softdrink.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
	["kfc-mshake"] 			     	 = {["name"] = "kfc-mshake", 					["label"] = "Milkshake", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-mshake.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},

	--KFC Ingredients
	["kfc-bun"] 				 	 = {["name"] = "kfc-bun", 			 	  		["label"] = "Bun", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-bun.png", 						["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-meat"] 				 	 = {["name"] = "kfc-meat", 			 	  		["label"] = "Cooked Patty", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-meat.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-lettuce"] 				 = {["name"] = "kfc-lettuce", 			 		["label"] = "Lettuce", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-lettuce.png", 	    			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-tomato"] 				 	 = {["name"] = "kfc-tomato", 			 		["label"] = "Tomato", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-tomato.png", 	    			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-raw"] 				 	 = {["name"] = "kfc-raw", 			 			["label"] = "Raw Patty", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-patty_raw.png", 	        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-potato"] 				 	 = {["name"] = "kfc-potato", 			 		["label"] = "Bag of Potatoes", 			["weight"] = 1500, 		["type"] = "item", 		["image"] = "kfc_potato.png", 	    			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-mshakeformula"] 		 	 = {["name"] = "kfc-mshakeformula", 			["label"] = "Milkshake Formula", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-mshakeformula.png",  			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-sodasyrup"] 		 	 	 = {["name"] = "kfc-sodasyrup", 				["label"] = "Soda Syrup", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-sodasyrup.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["kfc-toy1"] 		 		 	 = {["name"] = "kfc-toy1", 						["label"] = "Action Figure", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "burger-toy1.png", 					["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "An Action Figure From the late 90's"},
	["kfc-toy2"] 		 		 	 = {["name"] = "kfc-toy2", 						["label"] = "Pink Teddy", 				["weight"] = 50, 		["type"] = "item", 		["image"] = "burger-toy2.png", 					["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "A Fluffy Pink Teddy from the Atic"},
	["kfc-boxmeal"] 		 	 	 = {["name"] = "kfc-boxmeal", 					["label"] = "Box Meal", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "kfc-box.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Amazing Box Meal with a chance of a toy."},
```

## Add in to shared jobs
```
   ["kfc"] = {
		label = "KFC Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 500
            },
			['1'] = {
                name = "Employee",
                payment = 750
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 1000
            },
			['3'] = {
                name = "Manager",
                payment = 1250
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 1500
            },
        },
	},
```
