function HUD:UpdatePlayerCount()
    GlobalState['OnlinePlayers'] = HUD.Data.OnlinePlayers
end

RegisterNetEvent('esx_hud:ErrorHandle', function(msg)
    HUD:ErrorHandle(msg)
end)

AddEventHandler('playerJoining', function(playerId, reason)
    HUD.Data.OnlinePlayers += 1
    HUD:UpdatePlayerCount()
end)

AddEventHandler('playerDropped', function()
    HUD.Data.OnlinePlayers += -1
    if HUD.Data.OnlinePlayers < 0 then
        HUD.Data.OnlinePlayers = 0
    end
    HUD:UpdatePlayerCount()
end)

AddEventHandler('onResourceStart', function(resourceName)
    local currentName = GetCurrentResourceName()
    if resourceName ~= currentName then return end
    local built = LoadResourceFile(currentName, './web/dist/index.html')

    Wait(100)
    HUD.Data.OnlinePlayers = #GetPlayers()
    HUD:UpdatePlayerCount()

    if not built then
        CreateThread(function ()
            while true do
                HUD:ErrorHandle(Translate('resource_not_built'))
                Wait(10000)
            end
        end)
    end
end)
