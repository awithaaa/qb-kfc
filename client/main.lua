local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = true

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function ()
    QBCore.Functions.GetPlayerData(function (PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then if PlayerData.job.name == "kfc" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore.Client:OnJobUpdate', function (JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

CreateThread(function()
	QBCore.Functions.Notify("You are now on duty at KFC", "success")
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 674)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent("qb-kfc:DutyB")
AddEventHandler("qb-kfc:DutyB", function ()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-kfc:Tray1")
AddEventHandler("qb-kfc:Tray1", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "kfctray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "kfctray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-kfc:Tray2")
AddEventHandler("qb-kfc:Tray2", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "kfctray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "kfctray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-kfc:Tray3")
AddEventHandler("qb-kfc:Tray3", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "kfctray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "kfctray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-kfc:Tray4")
AddEventHandler("qb-kfc:Tray4", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "kfctray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "kfctray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-kfc:Storage")
AddEventHandler("qb-kfc:Storage", function ()
    TriggerEvent("inventory:client:SetCurrentStash", "kfcstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "kfcstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)


--Meal Creations
RegisterNetEvent("qb-kfc:BoxMeal")
AddEventHandler("qb-kfc:BoxMeal", function()
	TriggerServerEvent('qb-kfc:server:boxMeal')
end)

RegisterNetEvent("qb-kfc:CreateBoxMeal")
AddEventHandler("qb-kfc:CreateBoxMeal", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientBoxMeal', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Box Meal..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeBoxMeal')
					QBCore.Functions.Notify("You made a A Box Meal", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-kfc:SnackerBurger")
AddEventHandler("qb-kfc:SnackerBurger", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeSnacker')
					QBCore.Functions.Notify("You made a Snacker Burger", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-kfc:ZingerBurger")
AddEventHandler("qb-kfc:ZingerBurger", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeZingerBurger')
					QBCore.Functions.Notify("You made a Zinger Burger", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-kfc:HeartStopper")
AddEventHandler("qb-kfc:HeartStopper", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeHeartStopper')
					QBCore.Functions.Notify("You made a Heart Stopper", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)


RegisterNetEvent("qb-kfc:Submarine")
AddEventHandler("qb-kfc:Submarine", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientSubmarine', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Submarine..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeSubmarine')
					QBCore.Functions.Notify("You made a Submarine Roll", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-kfc:veggieburger")
AddEventHandler("qb-kfc:veggieburger", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-kfc:server:get:ingredientveggieburger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Meat Free Burger..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-kfc:server:makeVeggieBurger')
                   	QBCore.Functions.Notify("You made a Meat Free Burger", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)



RegisterNetEvent("qb-kfc:SoftDrink")
AddEventHandler("qb-kfc:SoftDrink", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSoftDrink()
        else
            QBCore.Functions.Notify("You don't have any soda syrup..", "error")
        end
      end, 'kfc-sodasyrup')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-kfc:mShake")
AddEventHandler("qb-kfc:mShake", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMShake()
        else
            QBCore.Functions.Notify("You don't have any Milkshake Formula..", "error")
        end
      end, 'kfc-mshakeformula')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-kfc:Fries")
AddEventHandler("qb-kfc:Fries", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeFries()
        else
            QBCore.Functions.Notify("You don't have any potatoes..", "error")
        end
      end, 'kfc-potato')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("qb-kfc:PattyFry")
AddEventHandler("qb-kfc:PattyFry", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePatty()
        else
            QBCore.Functions.Notify("You don't have any raw patties..", "error", 5000)
        end
      end, 'kfc-raw')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error", 5000)
    end
end)

-- Functions --
function MakeFries()
	QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
	},{
	    animDict = "amb@prop_human_bbq@male@base",
	    anim = "base",
	    flags = 8,
	    }, {
		model = "prop_cs_fork",
		bone = 28422,
		coords = vector3(-0.005, 0.00, 0.00),
		rotation = vector3(175.0, 160.0, 0.0),
	    }
	)
	Citizen.Wait(4000)
	TriggerServerEvent('qb-kfc:server:makeFries')
	QBCore.Functions.Notify("You made 4 fries", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


function MakePatty()
    QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = vector3(-0.005, 0.00, 0.00),
        rotation = vector3(175.0, 160.0, 0.0),
    }    
)
    Citizen.Wait(4000)
	TriggerServerEvent('qb-kfc:server:makePatty')
    QBCore.Functions.Notify("You cooked the meat", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeSoftDrink()
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
	TriggerServerEvent('qb-kfc:server:makeSoftDrink')
    QBCore.Functions.Notify("You made a Soda", "success")
end  


function MakeMShake()
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
	TriggerServerEvent('qb-kfc:server:makeMilkShake')
    QBCore.Functions.Notify("You made a Milkshake", "success")
end  
   
RegisterNetEvent("qb-kfc:shop")
AddEventHandler("qb-kfc:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "kfc", Config.Items)
end)