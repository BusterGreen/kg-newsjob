local KGCore = exports['kg-core']:GetCoreObject()

RegisterNetEvent('kg-newsjob:server:addVehicleItems', function(plate)
    local src = source
    local Player = KGCore.Functions.GetPlayer(src)
    if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
    if not exports['kg-vehiclekeys']:HasKeys(src, plate) then return end

    for slot, item in pairs(Config.VehicleItems) do
        exports['kg-inventory']:AddItem('trunk-' .. plate, item.name, item.amount, slot, item.info, 'kg-newsjob:vehicleItems')
    end
end)

if Config.UseableItems then
    KGCore.Functions.CreateUseableItem('newscam', function(source)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
            
        TriggerClientEvent('Cam:ToggleCam', source)
    end)

    KGCore.Functions.CreateUseableItem('newsmic', function(source)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
            
        TriggerClientEvent('Mic:ToggleMic', source)
    end)

    KGCore.Functions.CreateUseableItem('newsbmic', function(source)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
            
        TriggerClientEvent('Mic:ToggleBMic', source)
    end)

else
    KGCore.Commands.Add('newscam', 'Grab a news camera', {}, false, function(source, _)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end

        TriggerClientEvent('Cam:ToggleCam', source)
    end)

    KGCore.Commands.Add('newsmic', 'Grab a news microphone', {}, false, function(source, _)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
                
        TriggerClientEvent('Mic:ToggleMic', source)
    end)

    KGCore.Commands.Add('newsbmic', 'Grab a Boom microphone', {}, false, function(source, _)
        local Player = KGCore.Functions.GetPlayer(source)
        if not Player or Player.PlayerData.job.name ~= 'reporter' then return end
                
        TriggerClientEvent('Mic:ToggleBMic', source)
    end)
end
