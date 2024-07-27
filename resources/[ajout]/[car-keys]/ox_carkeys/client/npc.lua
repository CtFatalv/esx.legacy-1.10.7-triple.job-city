lib.locale()


CreateThread(function()
    for k, v in pairs(Keys.NpcReclameKey) do
        RequestModel(v.hash)
        while not HasModelLoaded(v.hash) do
            Wait(1)
        end
        NPC = CreatePed(2, v.hash, v.pos.x, v.pos.y, v.pos.z, v.heading, false, false)
        SetPedFleeAttributes(NPC, 0, 0)
        SetPedDiesWhenInjured(NPC, false)
        TaskStartScenarioInPlace(NPC, "missheistdockssetup1clipboard@base", 0, true)
        SetPedKeepTask(NPC, true)
        SetBlockingOfNonTemporaryEvents(NPC, true)
        SetEntityInvincible(NPC, true)
        FreezeEntityPosition(NPC, true)
        if v.blip then
            blip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)
            SetBlipSprite(blip, 186)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.7)
            SetBlipColour(blip, 3)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(locale('cerrajero'))
            EndTextCommandSetBlipName(blip)
        end
        local models = { v.hash }
        local options = {
            {
                icon = v.icon,
                label = v.label,
                distance = 2,
                event = 'ox_carkeys:obtenerLlaves',
            }
        }
        exports.ox_target:addModel(models, options)
    end
end)

function ObtenerKeys()

end

AddEventHandler('ox_carkeys:obtenerLlaves', function()
    local KeyMenu = {}
    local vehicles = lib.callback.await('ox_carkeys:getVehicles')

    if vehicles == nil then
        TriggerEvent('ox_carkeys:Notification', locale('title'), locale('nopropio'), 'alert')
        return
    end
   -- local count = exports.ox_inventory:Search('count', Keys.ItemName)
    for i = 1, #vehicles do
        local data = vehicles[i]
        local name = GetDisplayNameFromVehicleModel(data.vehicle.model)
        local marca = GetMakeNameFromVehicleModel(data.vehicle.model)
        local plate = data.vehicle.plate
        local price = Keys.CopyPrice
        table.insert(KeyMenu, {
            title = marca .. ' - ' .. name,
            iconColor = 'green',
            icon = 'car',
            arrow = true,
            description = locale('matricula', plate),
            onSelect = function()
                local alert = lib.alertDialog({
                    header = locale('buy_key_confirm1'),
                    content = locale('buy_key_confirm2', plate, marca, name, price),
                    centered = true,
                    cancel = true
                })
                if alert == 'cancel' then
                    TriggerEvent('ox_carkeys:Notification', locale('title'), locale('vuelve'), 'alert')
                    return
                else
                    if lib.progressBar({
                            duration = 1000,
                            label = locale('forjar'),
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                car = true,
                            },
                        })
                    then
                        TriggerServerEvent('ox_carkeys:BuyKeys', plate, name)
                    end
                end
            end,
            metadata = {
                { label = locale('precio'), value = price .. locale('dollar') },
            }
        })
    end

    lib.registerContext({
        id = 'recuperarllave',
        title = locale('cerrajero'),
        options = KeyMenu
    })

    lib.showContext('recuperarllave')
end)
