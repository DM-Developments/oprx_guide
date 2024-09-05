ESX = exports["es_extended"]:getSharedObject()

local carspawned = false
local guidstarted = false

Citizen.CreateThread(function()
  local waitTime = 1000
  while true do
    waitTime = 1000
      local playerPed = GetEntityCoords(GetPlayerPed(-1))
      local coordsb = Config.bliploc
      if GetDistanceBetweenCoords(playerPed, coordsb.x, coordsb.y, coordsb.z, true) < 2 then
        waitTime = 0
          ESX.Game.Utils.DrawText3D(vector3(coordsb.x, coordsb.y, coordsb.z), "Press E", 1.0, 4)
          if IsControlJustPressed(0, 38) then
            local name = Config.server
            local alert = lib.alertDialog({
              header = name,
              content = Config.ConfirmationLabel,
              centered = true,
              cancel = true
          })
            if alert == 'confirm' then
              TriggerServerEvent('oprx_guide:claimCar')
            end
          end
      end
      Citizen.Wait(waitTime)
  end
end)

RegisterNetEvent('oprx_guide:startguide')
AddEventHandler('oprx_guide:startguide', function(src)
  -- CreateVehicle(car, coords.x, coords.y, coords.z, true, true)
  if not IsPositionOccupied(Config.spawnVehiclecoords.x, Config.spawnVehiclecoords.y, Config.spawnVehiclecoords.z, 1.5, false, true, false, false, false, 0, false) then
  showguide()
  ESX.ShowNotification(Config.SkipGuideMessage)
  blipshow = true
  drawmarker()
  else 
    TriggerEvent('esx:showNotification', string.format("Spawn point blocked"))
  end
end)

function drawmarker()
  local first = true
  local second = false
  local third = false
  local fourth = false
  local fifth = false
  local final = false
  while blipshow do
      Wait(0)
      if first and guidstarted then
          local coord = Config.locations.a
          DrawMarker(2, coord.x, coord.y, coord.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 50, true, true, 2, false, nil, nil, false)
          local playerPed = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(playerPed, coord.x, coord.y, coord.z, true) < Config.radius then
          TriggerEvent('oprx_guide:showtext', '3')
          TriggerEvent('oprx_guide:setwaypoint', Config.locations.b)
          Wait(5000)
          first = false
          second = true
          SendNUIMessage({
            action = "hideMessage"
          })
        end
      elseif second then
          local coord = Config.locations.b
          DrawMarker(2, coord.x, coord.y, coord.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 50, true, true, 2, false, nil, nil, false)
          local playerPed = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(playerPed, coord.x, coord.y, coord.z, true) < Config.radius then
          TriggerEvent('oprx_guide:showtext', '4')
          TriggerEvent('oprx_guide:setwaypoint', Config.locations.c)
          Wait(5000)
          second = false
          third = true
          SendNUIMessage({
            action = "hideMessage"
          })
        end
      elseif third then
          local coord = Config.locations.c
          DrawMarker(2, coord.x, coord.y, coord.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 50, true, true, 2, false, nil, nil, false)
          local playerPed = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(playerPed, coord.x, coord.y, coord.z, true) < Config.radius then
          TriggerEvent('oprx_guide:showtext', '5')
          TriggerEvent('oprx_guide:setwaypoint', Config.locations.d)
          Wait(5000)
          third = false
          fourth = true
          SendNUIMessage({
            action = "hideMessage"
          })
        end
      elseif fourth then
          local coord = Config.locations.d
          DrawMarker(2, coord.x, coord.y, coord.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 50, true, true, 2, false, nil, nil, false)
          local playerPed = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(playerPed, coord.x, coord.y, coord.z, true) < Config.radius then
          TriggerEvent('oprx_guide:showtext', '6')
          TriggerEvent('oprx_guide:setwaypoint', Config.locations.e)
          Wait(5000)
          fourth = false
          fifth = true
          SendNUIMessage({
            action = "hideMessage"
          })
        end
      elseif fifth then
          local coord = Config.locations.e
          DrawMarker(2, coord.x, coord.y, coord.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 94, 50, true, true, 2, false, nil, nil, false)
          local playerPed = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(playerPed, coord.x, coord.y, coord.z, true) < Config.radius then
          TriggerEvent('oprx_guide:showtext', '7')
          --TriggerEvent('oprx_guide:setwaypoint', coord)
          Wait(5000)
          fifth = false
          final = true
          SendNUIMessage({
            action = "hideMessage"
          })
        end
        elseif final and not fifth then
        finalmessage()
        blipshow = false

      end

  end

end

-- RegisterNetEvent('oprx_guide:begin')
-- AddEventHandler('oprx_guide:begin', function(guideno)
--   local guidelevel = guideno
--   if guidelevel == 1 then
--     TriggerEvent('oprx_guide:showtext', '3')
--     TriggerEvent('oprx_guide:setwaypoint', Config.locations.b)
--     Wait(5000)
--     first = false
--     second = true
--     SendNUIMessage({
--       action = "hideMessage"
--     })
--   elseif guidelevel == 2 then
--     TriggerEvent('oprx_guide:showtext', '4')
--     TriggerEvent('oprx_guide:setwaypoint', Config.locations.c)
--     Wait(5000)
--     second = false
--     third = true
--     SendNUIMessage({
--       action = "hideMessage"
--     })
--   elseif guidelevel == 3 then
--     TriggerEvent('oprx_guide:showtext', '5')
--     TriggerEvent('oprx_guide:setwaypoint', Config.locations.d)
--     Wait(5000)
--     third = false
--     fourth = true
--     SendNUIMessage({
--       action = "hideMessage"
--     })
--     elseif guidelevel == 4 then
--       TriggerEvent('oprx_guide:showtext', '6')
--       TriggerEvent('oprx_guide:setwaypoint', Config.locations.e)
--       Wait(5000)
--       fourth = false
--       fifth = true
--       SendNUIMessage({
--         action = "hideMessage"
--       })
--     elseif guidelevel == 5 then
--       TriggerEvent('oprx_guide:showtext', '7')
--       --TriggerEvent('oprx_guide:setwaypoint', coord)
--       Wait(5000)
--       fifth = false
--       final = true
--       SendNUIMessage({
--         action = "hideMessage"
--       })
--       elseif guidelevel == 6 then
--         finalmessage()
--         blipshow = false
--   end
-- end)

-- RegisterCommand('finalw', function()
--   SendNUIMessage({
--     action = "finalMessage"
--   })
-- end)

RegisterCommand('skipguide', function()
  SendNUIMessage({
    action = "hideMessage"
  })
  blipshow = false
  finalmessage()
end)

AddEventHandler('oprx_guide:setwaypoint', function(position)
  local coordsw = position
  SetNewWaypoint(coordsw.x, coordsw.y)
  Wait(4000)
  ESX.ShowNotification('New waypoint marked')
end)


function showguide()
  SendNUIMessage({
    action = "showMessage"
  })
  Wait(1000)
  TriggerEvent('oprx_guide:showtext', '1')
  Wait(4000)
  TriggerEvent('oprx_guide:showtext', '2')
  Wait(4000)
  TriggerEvent('oprx_guide:setwaypoint', Config.locations.a)
  SendNUIMessage({
    action = "hideMessage"
  })
end

function finalmessage()
  SendNUIMessage({
    action = "finalMessage"
  })
  Wait(2000)
  PlaySoundFrontend(-1, "FLIGHT_SCHOOL_LESSON_PASSED", "HUD_AWARDS", 1) 
  Wait(3000)
  SendNUIMessage({
    action = "stopfinalmessage"
  })
end

-- RegisterCommand('tests', function()
--   SendNUIMessage({
--     action = "showMessage"
--   }) 
-- end)

AddEventHandler('oprx_guide:showtext', function(number)
  SendNUIMessage({
    action = "showMessage"
  })
  local steps = number
  if steps == '1' then
  PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.a,
    action = "textsend"
  })
elseif steps == '2' then
  PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)
  SendNUIMessage({
    hello = Config.text.b,
    action = "textsend"
  })
  Wait(4000)
  guidstarted = true
elseif steps == '3' then
  PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.c,
    action = "textsend"
  })
elseif steps == '4' then
  PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.d,
    action = "textsend"
  })
elseif steps == '5' then
  PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.e,
    action = "textsend"
  })
elseif steps == '6' then
  PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.f,
    action = "textsend"
  })
elseif steps == '7' then
  PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1) 
  SendNUIMessage({
    hello = Config.text.g,
    action = "textsend"
  })
end
end)

RegisterCommand('black', function()
  SendNUIMessage({
    action = "hideMessage"
  })
  
end)


RegisterNetEvent('oprx_guide:spawncar')
AddEventHandler('oprx_guide:spawncar', function(playerID, model)
  local coords = Config.spawnVehiclecoords
  local playerPed = GetPlayerPed(-1)
  local xplayer = PlayerPedId()
  local carExist  = false

  ESX.Game.SpawnVehicle(model, vector3(coords.x, coords.y, coords.z), coords.h, function(vehicle) --get vehicle info
    if DoesEntityExist(vehicle) then
      carExist = true
      SetPedIntoVehicle(xplayer, vehicle, -1)
      --TriggerEvent('esx:showNotification', "Please wait your number plate is generating"
      if Config.GeneratePlateExport then
        Wait(3000)
        local newPlate = Config.GeneratePlateExport -- Config.GeneratePlateExport
        SetVehicleNumberPlateText(vehicle, newPlate)
      end
      local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
      if Config.SavetoDB then
        TriggerServerEvent('oprx_guide:setVehicle', vehicleProps)
      end
      Notify(Config.ReciveMessage)
    end		
  end)
end)