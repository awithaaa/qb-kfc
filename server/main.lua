local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-kfc:bill:player")
AddEventHandler("qb-kfc:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'kfc' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('qb-kfc:server:get:ingredientBurger', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local lettuce = Player.Functions.GetItemByName("kfc-lettuce")
    local meat = Player.Functions.GetItemByName("kfc-lettuce")
    local bun = Player.Functions.GetItemByName("kfc-lettuce")
    local tomato = Player.Functions.GetItemByName("kfc-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-kfc:server:get:ingredientSubmarine', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local meat = Ply.Functions.GetItemByName("kfc-lettuce")
    local bun = Ply.Functions.GetItemByName("kfc-lettuce")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-kfc:server:get:ingredientveggieburger', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bun = Ply.Functions.GetItemByName("kfc-lettuce")
    local tomato = Ply.Functions.GetItemByName("kfc-tomato")
    local lettuce = Ply.Functions.GetItemByName("kfc-lettuce")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-kfc:server:get:ingredientBoxMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("kfc-fries")
    local heartstopper = Ply.Functions.GetItemByName("kfc-heartstopper")
    local software = Ply.Functions.GetItemByName("kfc-softdrink")
    if fries ~= nil and heartstopper ~= nil and software ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateUseableItem("kfc-boxmeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-kfc:BoxMeal", source, item.name)
end)



RegisterNetEvent('qb-kfc:server:makeSoftDrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-sodasyrup',1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-sodasyrup"], "remove")
    Player.Functions.AddItem('kfc-softdrink',1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-softdrink"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeMilkShake', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-mshakeformula',1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-mshakeformula"], "remove")
    Player.Functions.AddItem('kfc-mshake',1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-mshake"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makePatty', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-raw' ,1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-raw"], "remove")
    Player.Functions.AddItem('kfc-meat', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-meat"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeFries', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-potato', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-potato"], "remove")
    Player.Functions.AddItem('kfc-fries', 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-fries"], "add", 4)
end)

RegisterNetEvent('qb-kfc:server:makeVeggieBurger', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-tomato', 1)
    Player.Functions.RemoveItem('kfc-lettuce', 1)
    Player.Functions.RemoveItem('kfc-bun', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-tomato"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-lettuce"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-bun"], "remove")
    Player.Functions.AddItem('kfc-veggieburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-veggieburger"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeHeartStopper', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-meat', 1)
    Player.Functions.RemoveItem('kfc-lettuce', 1)
    Player.Functions.RemoveItem('kfc-tomato', 1)
    Player.Functions.RemoveItem('kfc-bun', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-meat"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-lettuce"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-tomato"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-bun"], "remove")
    Player.Functions.AddItem('kfc-heartstopper', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-heartstopper"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeZingerBurger', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-meat', 1)
    Player.Functions.RemoveItem('kfc-lettuce', 1)
    Player.Functions.RemoveItem('kfc-tomato', 1)
    Player.Functions.RemoveItem('kfc-bun', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-meat"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-lettuce"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-tomato"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-bun"], "remove")
    Player.Functions.AddItem('kfc-zingerburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-zingerburger"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeSnacker', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-meat', 1)
    Player.Functions.RemoveItem('kfc-lettuce', 1)
    Player.Functions.RemoveItem('kfc-tomato', 1)
    Player.Functions.RemoveItem('kfc-bun', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-meat"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-lettuce"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-tomato"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-bun"], "remove")
    Player.Functions.AddItem('kfc-snacker', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-snacker"], "add", 1)
end)

RegisterNetEvent('qb-kfc:server:makeSubmarine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('kfc-meat', 1)
    Player.Functions.RemoveItem('kfc-bun', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-meat"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-bun"], "remove")
    Player.Functions.AddItem('kfc-submarine', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-submarine"], "add", 1)
end)


RegisterNetEvent('qb-kfc:server:makeBoxMeal', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local randomToy = math.random(1,10)

    Player.Functions.RemoveItem('kfc-fries', 1)
    Player.Functions.RemoveItem('kfc-heartstopper', 1)
    Player.Functions.RemoveItem('kfc-softdrink', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-fries"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-heartstopper"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-softdrink"], "remove")

    Player.Functions.AddItem('kfc-boxmeal', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-boxmeal"], "add", 1)

    if randomToy < 4 then
        QBCore.Functions.Notify("No Free Item in Box Looool", "error")
    elseif randomToy == 4 then
        Player.Functions.AddItem('kfc-snacker', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-snacker"], "add", 1)
    elseif randomToy < 10 and randomToy > 4 then
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    elseif randomToy == 10 then
        Player.Functions.AddItem('kfc-submarine', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-submarine"], "add", 1)
    else
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    end

end)

RegisterNetEvent('qb-kfc:server:boxMeal', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local randomToy = math.random(1,10)

    Player.Functions.RemoveItem('kfc-boxmeal', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-boxmeal"], "remove")

    Player.Functions.AddItem('kfc-heartstopper', 1)
    Player.Functions.AddItem('kfc-softdrink', 1)
    Player.Functions.AddItem('kfc-fries', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-heartstopper"], "add", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-softdrink"], "add", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-fries"], "add", 1)

    if randomToy < 4 then
        QBCore.Functions.Notify("No Free Item in Box Looool", "error")
    elseif randomToy == 4 then
        Player.Functions.AddItem('kfc-snacker', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-snacker"], "add", 1)
    elseif randomToy < 10 and randomToy > 4 then
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    elseif randomToy == 10 then
        Player.Functions.AddItem('kfc-submarine', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["kfc-submarine"], "add", 1)
    else
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    end

end)