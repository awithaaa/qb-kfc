local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("KfcDuty", vector3(341.95, -886.4, 29.34), 0.6, 0.6,{
        name = "KfcDuty",
		heading = 0,
		debugPoly = false,
        minZ=26.34,
        maxZ=30.34
    }, {
        options = {
            {
                event = "qb-kfc:dutymenu",
                icon = "far fa-clipboard",
                label = "Duty Option",
                job = "kfc",
            },
        },
        distance = 1.5
    })
        exports['qb-target']:AddBoxZone("kfc_tray_1", vector3(344.05, -884.16, 29.34), 0.7, 0.6,{
            name = "kfc_tray_1",
            heading = 270,
            debugPoly = false,
            minZ=25.54,
            maxZ=29.54
        },{
            options = {
                {
                    event = "qb-kfc:Tray1",
                    icon = "far fa-clipboard",
                    label = "Tray 1",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("kfc_tray_2", vector3(345.46, -884.17, 29.34), 0.7, 0.6,{
            name = "kfc_tray_2",
            heading = 270,
            debugPoly = false,
            minZ=25.54,
            maxZ=29.54
        },{
            options = {
                {
                    event = "qb-kfc:Tray2",
                    icon = "far fa-clipboard",
                    label = "Tray 2",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("kfc_tray_3", vector3(346.87, -884.2, 29.34), 0.7, 0.6,{
            name = "kfc_tray_3",
            heading = 270,
            debugPoly = false,
            minZ=25.54,
            maxZ=29.54
        },{
            options = {
                {
                    event = "qb-kfc:Tray3",
                    icon = "far fa-clipboard",
                    label = "Tray 3",
                },
            },
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("kfccooker ", vector3(347.5, -898.91, 29.34), 2.4, 1, {
            name="kfccooker",
            heading=270,
            debugPoly=false,
            minZ=25.74,
            maxZ=29.74,
        }, {
            options = {
                {
                    event = "qb-kfc:PattyFry",
                    icon = "fas fa-hamburger",
                    label = "Burger Cook Station",
                    job = "kfc",
                },
            },
            distance = 1.5
        })
    
            exports['qb-target']:AddBoxZone("kfcfryer", vector3(340.37, -896.83, 29.34), 6, 1, {
            name="kfcfryer",
            heading=0,
            debugPoly=false,
            minZ=25.74,
            maxZ=29.74,
            }, {
                options = {
                {
                    event = "qb-kfc:Fries",
                    icon = "fas fa-box",
                    label = "Make Fries",
                    job = "kfc",
                },
                },
                distance = 1.5
            })
    
    
        exports['qb-target']:AddBoxZone("kfcdrinks", vector3(344.6, -890.73, 29.34), 3.0, 1.0,{
            name="kfcdrinks",
            heading=270,
            debugPoly=false,
            minZ=26.14,
            maxZ=30.14,
            }, {
            options = {
                {
                event = "qb-kfc:DrinksMenu",
                icon = "fas fa-filter",
                label = "Make Some Drinks",
                job = "kfc",
                },
            },
            distance = 1.5
            })
    
    
             exports['qb-target']:AddBoxZone("burgerfridge",vector3(347.92, -893.98, 29.34), 6, 0.5, {
                name="burgerfridge",
                heading=0,
                debugPoly=false,
                minZ=26.94,
                maxZ=30.94,
            }, {
                    options = {
                        {
                            event = "qb-kfc:OrderMenu",
                            icon = "fas fa-laptop",
                            label = "Order Ingredients!",
                            job = "kfc",
                        },
                    },
                    distance = 1.5
                })
    
            exports['qb-target']:AddBoxZone("kfcdisplay",vector3(344.8, -889.61, 29.34), 4.6, 1.2,  {
                name="kfcdisplay",
                heading=270,
                debugPoly=false,
                minZ=26.34,
                maxZ=30.34,
            }, {
                    options = {
                        {
                            event = "qb-kfc:Storage",
                            icon = "fas fa-box",
                            label = "Storage",
                            job = "kfc",
                        },
                    },
                    distance = 1.5
                })
    
    
            exports['qb-target']:AddBoxZone("craftburger",vector3(344.98, -893.77, 29.34), 1.8, 0.7, {
                name="craftburger",
                heading=0,
                debugPoly=false,
                minZ=25.34,
                maxZ=29.34,
            }, {
                    options = {
                        {
                            event = "qb-kfc:BurgerMenu",
                            icon = "fas fa-clipboard",
                            label = "Burger Work Station",
                            job = "kfc",
                        },
                    },
                    distance = 1.5
                })

                exports['qb-target']:AddBoxZone("craftburger2",vector3(344.94, -895.62, 29.34), 1.8, 0.7, {
                    name="craftburger2",
                    heading=0,
                    debugPoly=false,
                    minZ=25.34,
                    maxZ=29.34,
                }, {
                        options = {
                            {
                                event = "qb-kfc:BurgerMenu",
                                icon = "fas fa-cheeseburger",
                                label = "Burger Work Station",
                                job = "kfc",
                            },
                        },
                        distance = 1.5
                    })
    
            exports['qb-target']:AddBoxZone("kfc_register_1", vector3(344.67, -884.21, 29.34), 0.5, 0.4, {
                name="kfc_register_1",
                debugPoly=false,
                heading=270,
                minZ=25.94,
                maxZ=29.94,
            }, {
                    options = {
                        {
                            event = "qb-kfc:bill",
                            parms = "1",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "kfc",
                        },
                    },
                    distance = 1.5
                })
    
            exports['qb-target']:AddBoxZone("kfc_register_2", vector3(346.14, -884.18, 29.34), 0.6, 0.5, {
                name="kfc_register_2",
                debugPoly=false,
                heading=0,
                minZ=25.94,
                maxZ=29.94,
                }, {
                        options = {
                            {
                                event = "qb-kfc:bill",
                                parms = "2",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "kfc",
                            },
                        },
                        distance = 1.5
                    })  
    
    
            exports['qb-target']:AddBoxZone("kfc_register_3", vector3(347.67, -884.15, 29.34), 0.6, 0.5, {
                name="kfc_register_3",
                debugPoly=false,
                heading=0,
                minZ=25.94,
                maxZ=29.94,
                        }, {
                                options = {
                                    {
                                        event = "qb-kfc:bill",
                                        parms = "3",
                                        icon = "fas fa-credit-card",
                                        label = "Charge Customer",
                                        job = "kfc",
                                    },
                                },
                                distance = 1.5
                            })  
    
end)

-- MENU - CONTCT ---

RegisterNetEvent('qb-kfc:dutymenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Duty Option",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },

       {
           header = "Clock On or Off",
           txt = "Duty On/Off",
           params = {
               event = "qb-kfc:DutyB", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 1,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-kfc:BurgerMenu', function (data)
    exports['qb-menu']:openMenu({
        {
            header = "Burger Menu",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },

        {
            header = "ZingerBurger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-kfc:ZingerBurger", 
                args = {
                    number = 1,
                }
            }
        },
        {
            header = "Veggie Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-kfc:veggieburger",
                args = {
                    number = 2,
                }
            }
        },

        {
            header = "Snacker Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-kfc:SnackerBurger",
                args = {
                    number = 3,
                }
            }
        },
        {
            header = "Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-kfc:HeartStopper",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "Submarine Roll",
            txt = "Bun & Cooked Meat",
            params = {
                event = "qb-kfc:Submarine",
                args = {
                    number = 5,
                }
            }
        },
        {
            header = "Box Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-kfc:CreateBoxMeal",
                args = {
                    number = 6,
                }
            }
        },
    })
end)

RegisterNetEvent('qb-kfc:OrderMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Fridge",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },

       {
           header = "Purchase Ingredients",
           txt = "Order Items",
           params = {
               event = "qb-kfc:shop", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 1,
               }
           }
       },
   })
   end)

   RegisterNetEvent('qb-kfc:DrinksMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Drinks Menu",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },

       {
           header = "Soft Drink",
           txt = "Soda Syrup",
           params = {
               event = "qb-kfc:SoftDrink", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "Milkshake",
           txt = "Milkshake Formula",
           params = {
               event = "qb-kfc:mShake",
               args = {
                   number = 1,
               }
           }
       },

       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 2,
               }
           }
       },
   })
   end)



-- Till Stuff --
RegisterNetEvent("qb-kfc:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                name = 'id',
                text = 'Citizen Id',
                isRequired = true

            },
            {
                type = 'number',
                name = 'amount',
                text = '$0.00',
                isRequired = true

            }
        }
    })
    if bill then
        if not bill.id or not bill.amount then return end
        TriggerServerEvent("qb-kfc:bill:player", bill.id, bill.amount)
    end
end)

-- Drawtext -
function DrawText3D(x, y, z, text)
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


Citizen.CreateThread(function()
    if Config.Eye == "false" then
    local PlayerData = QBCore.Functions.GetPlayerData()
    while true do
        local sleep = 100
        if isLoggedIn then
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == 'kfc' then
                for k, v in pairs(Config.Locations["duty"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            if onDuty then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Get off duty")
                            else
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Get on duty")
                            end
                            if IsControlJustReleased(0, 38) then
                                onDuty = not onDuty
                                TriggerServerEvent("QBCore:ToggleDuty")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "on/off duty")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["pattycooker"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Cook Patties")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:PattyFry")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Cook Patties")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fryer"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Fry Sum Fries")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:Fries")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Fry Sum Fries")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["drinks"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Make Drinks")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:DrinksMenu")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Make Drinks")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fridge"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Fridge")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:shop")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Open Fridge")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["storage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Storage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:Storage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Open Storage")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["craftburger"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Make a Meal")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:BurgerMenu")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Make a Meal")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["cashregister"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Cash Register")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-kfc:bill")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Cash Register")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["garage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Garage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("garage:kfcGarage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                DrawText3D(v.x, v.y, v.z, "Garage")
                            end  
                        end
                    end
                end
            else
                Citizen.Wait(2000)
            end
            
            for k, v in pairs(Config.Locations["tray1"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-kfc:Tray1")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end

            for k, v in pairs(Config.Locations["tray2"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-kfc:Tray2")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end

            for k, v in pairs(Config.Locations["tray3"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("qb-kfc:Tray3")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            sleep = 5
                            DrawText3D(v.x, v.y, v.z, "Tray")
                        end  
                end
            end
        end
        Citizen.Wait(sleep)
    end
end
end)