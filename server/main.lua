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


