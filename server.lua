ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('oprx_guide:claimCar')
AddEventHandler('oprx_guide:claimCar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.execute('SELECT identifier FROM oprx_guidecar WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(result)
        if result == 'null' then
            TriggerClientEvent('esx:showNotification', src, Config.AlreadyClaimedMesagge)
        else
            TriggerClientEvent('oprx_guide:startguide', src)
            MySQL.Async.execute('INSERT INTO oprx_guidecar (identifier) VALUES (@identifier)', {
                ['@identifier'] = xPlayer.getIdentifier()
            })   

            TriggerClientEvent('oprx_guide:spawncar', src, src, Config.vehicle)
        end
    end)
end)

RegisterServerEvent('oprx_guide:setVehicle')
AddEventHandler('oprx_guide:setVehicle', function(vehicleProps)
    local xPlayer = ESX.GetPlayerFromId(source)
    local vehicle = json.encode(vehicleProps)

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, job, vehicle, type, stored) VALUES (@owner, @plate, @job, @vehicle, @type, @stored)', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = vehicleProps.plate,
        ['@job'] = 'civ',
        ['@type'] = 'car',
        ['@vehicle'] = vehicle,
        ['@stored'] = 1,
    }, function()
        --TriggerClientEvent('esx:showNotification', source, "You received a vehicle with plate number ~y~" .. string.upper(vehicleProps.plate))
    end)
end)