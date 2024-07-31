lib.locale()
local blipsCrochettage = {}
local vehiculocerrado = nil

vehiculocerrado = SetInterval(function()
    local ped = cache.ped
    if DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) then
        local veh = GetVehiclePedIsTryingToEnter(ped)
        local lock = GetVehicleDoorLockStatus(veh)
        if lock == 4 then
            ClearPedTasks(ped)
        end
    else
        SetInterval(vehiculocerrado, 500)
    end
end, 10)

RegisterNetEvent('ox_carkeys:carkeys', function(data)
    if not data.metadata.plate then
        return
    end
end)

lib.addKeybind({
    name = 'car_key',
    description = locale('keybindDesc'),
    defaultKey = Keys.Key,
    onPressed = function()
        AbrirCerrarPuertas()
    end
})

function AbrirCerrarPuertas()
    local ped = cache.ped
    local playerCoords = GetEntityCoords(ped)
    local closet = lib.getClosestVehicle(playerCoords, Keys.Distance, true)
    if closet then
        local prop = GetHashKey('p_car_keys_01')

        RequestModel(prop)
        while not HasModelLoaded(prop) do
            Wait(10)
        end
        local prop = CreateObject(prop, 1.0, 1.0, 1.0, 1, 1, 0)


        local plate = string.gsub(GetVehicleNumberPlateText(closet), " ", "")

        local dict = "anim@mp_player_intmenu@key_fob@"
        lib.requestAnimDict(dict, 0)

        local key = nil
        local keys = exports.ox_inventory:Search('slots', Keys.ItemName)
        for i, v in ipairs(keys) do
            if string.gsub(v.metadata.plate, " ", "") == plate then
                key = v
                break
            end
        end

        if not key then
            TriggerEvent('ox_carkeys:Notification', locale('title'), locale('key_not_owned_car'), 'error')
            return
        end
        if not IsPedInAnyVehicle(ped, true) then
            AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 57005), 0.08, 0.039, 0.0, 0.0, 0.0, 0.0, true,
                true, false, true, 1, true)
        elseif not key then

        end
        if not IsPedInAnyVehicle(ped, true) then
            TaskPlayAnim(ped, "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
        elseif not key then

        end
        local EstadoPuertas = GetVehicleDoorLockStatus(closet)

        if EstadoPuertas == 4 then
            SetVehicleDoorsLocked(closet, 1)
            PlayVehicleDoorOpenSound(closet, 0)
            TriggerEvent('ox_carkeys:Notification', locale('title'), locale('unlock_veh'), 'success')
            LucesLocas(closet,prop)
        elseif EstadoPuertas == 1 then
            SetVehicleDoorsLocked(closet, 4)
            PlayVehicleDoorCloseSound(closet, 1)
            TriggerEvent('ox_carkeys:Notification', locale('title'), locale('lock_veh'), 'alert')
            LucesLocas(closet,prop)
        end
    else
        TriggerEvent('ox_carkeys:Notification', locale('title'), locale('no_veh_nearby'), 'error')
        return
    end
end

function LucesLocas(closet,prop)
    SetVehicleLights(closet, 2)
    Wait(250)
    SetVehicleLights(closet, 0)
    Wait(250)
    SetVehicleLights(closet, 2)
    Wait(250)
    SetVehicleLights(closet, 0)
    Wait(600)
    DetachEntity(prop, false, false)
    DeleteEntity(prop)
end

AddEventHandler('ox_carkeys:AddKeysCars', function()
    local ped = cache.ped
    local playerVehicle = GetVehiclePedIsIn(ped, false)
    if playerVehicle ~= 0 then
        local vehicleProps = lib.getVehicleProperties(playerVehicle)
        local model = GetEntityModel(playerVehicle)
        local name = GetDisplayNameFromVehicleModel(model)
        TriggerServerEvent('ox_carkeys:CreateKey', vehicleProps.plate, name)
    else
        TriggerEvent('ox_carkeys:Notification', locale('title'), locale('dentrocar'), 'error')
    end
end)

function CarKey()
    local ped = cache.ped
    local pedcords = GetEntityCoords(ped)
    local car = lib.getClosestVehicle(pedcords, Keys.DistanceCreate, true)
    local model = GetEntityModel(car)
    local name = GetDisplayNameFromVehicleModel(model)
    local plate = GetVehicleNumberPlateText(car)
    if car == nil then
        TriggerEvent('ox_carkeys:Notification', locale('title'), locale('nocarcerca'), 'error')
    else
        if lib.progressBar({
                duration = Keys.CreateKeyTime,
                label = locale('forjar'),
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
            })
        then
            TriggerServerEvent('ox_carkeys:KeyOnBuy', plate, name)
        else
            TriggerEvent('ox_carkeys:Notification', locale('title'), locale('calcelado'), 'alert')
        end
    end
end

exports('CarKey', CarKey)

function CarKeyBuy()
    local ped = cache.ped
    local pedcords = GetEntityCoords(ped)
    local car = lib.getClosestVehicle(pedcords, Keys.DistanceCreate, true)
    local model = GetEntityModel(car)
    local name = GetDisplayNameFromVehicleModel(model)
    local plate = GetVehicleNumberPlateText(car)
    if car == nil then
        TriggerEvent('ox_carkeys:Notification', locale('title'), locale('nocarcerca'), 'error')
    else
        TriggerServerEvent('ox_carkeys:KeyOnBuy', plate, name)
    end
end

exports('CarKeyBuy', CarKeyBuy)

function LockPick()
    for k, v in pairs(Keys.LockPick) do
        local ped = cache.ped
        local pedcords = GetEntityCoords(ped)
        local closet = lib.getClosestVehicle(pedcords, 3, true)
        local EstadoPuertas = GetVehicleDoorLockStatus(closet)
        lib.requestAnimDict(v.animDict)
        if closet then
            if v.SkillCheck then
                if EstadoPuertas == 1 then
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('NoLocPick'),
                        'error')
                    return
                end
                TaskPlayAnim(ped, v.animDict, v.anim, 8.0, 8.0, -1, 48, 1, false, false, false)
                local success = lib.skillCheck(table.unpack(v.Skills))
                if success then
                    ClearPedTasks(ped)
                    SendDistressSignal2()
                    SetVehicleDoorsLocked(closet, 1)
                    TriggerServerEvent('ox_carkeys:remove')
                    if math.random() < v.alarmProbability then
                        SetVehicleAlarmTimeLeft(closet, v.alarmTime)
                    end
                    if v.Disptach then
                        v.DispatchFunction()
                    end
                else
                    ClearPedTasks(ped)
                    TriggerServerEvent('ox_carkeys:remove')
                    SendDistressSignal2()
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('LockPickFail'), 'error')
                end
            else
                if EstadoPuertas == 1 then
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('NoLocPick'),
                        'error')
                    return
                end
                if lib.progressBar({
                        duration = v.TimeProgress,
                        label = locale('LocPickProgress'),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                        },
                        anim = {
                            dict = v.animDict,
                            clip = v.anim
                        },
                    }) then
                    SendDistressSignal2()
                    SetVehicleDoorsLocked(closet, 1)
                    TriggerServerEvent('ox_carkeys:remove')
                    if math.random() < v.alarmProbability then
                        SetVehicleAlarmTimeLeft(closet, v.alarmTime)
                    end
                    if v.Disptach then
                        v.DispatchFunction()
                        TriggerEvent('ox_carkeys:Dispatch')
                    end
                else
                    if math.random() < v.alarmProbability then
                        SetVehicleAlarmTimeLeft(closet, v.alarmTime)
                    end
                    TriggerServerEvent('ox_carkeys:remove')
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('LockPickFail'), 'error')
                end
            end
        else
            TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('nocarcerca'), 'error')
        end
    end
end
function LockPick2()
    for k, v in pairs(Keys.LockPick) do
        local ped = cache.ped
        local pedcords = GetEntityCoords(ped)
        local closet = lib.getClosestVehicle(pedcords, 3, true)
        local EstadoPuertas = GetVehicleDoorLockStatus(closet)
        lib.requestAnimDict(v.animDict)
        if closet then
            if v.SkillCheck then
                if EstadoPuertas == 1 then
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('NoLocPick'),
                        'error')
                    return
                end
                TaskPlayAnim(ped, v.animDict, v.anim, 8.0, 8.0, -1, 48, 1, false, false, false)
                Citizen.Wait(5000)
                ClearPedTasks(ped)
                SetVehicleDoorsLocked(closet, 1)
            	TriggerEvent('ox_carkeys:Notification', locale('title'), locale('unlock_veh'), 'success')
            else
                if EstadoPuertas == 1 then
                    TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('NoLocPick'),
                        'error')
                    return
                end
                if lib.progressBar({
                        duration = v.TimeProgress,
                        label = locale('LocPickProgress'),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                        },
                        anim = {
                            dict = v.animDict,
                            clip = v.anim
                        },
                    }) then
                    SetVehicleDoorsLocked(closet, 1)
                else
                end
            end
        else
            TriggerEvent('ox_carkeys:Notification', locale('LockPickTitle'), locale('nocarcerca'), 'error')
        end
    end
end

exports('LockPick', LockPick)

AddEventHandler('ox_carkeys:LockPick', function()
	LockPick()
end)

AddEventHandler('ox_carkeys:LockPick2', function()
	LockPick2()
end)

function SendDistressSignal2()
  local playerPed = PlayerPedId()
  local coords = GetEntityCoords(playerPed)
  TriggerServerEvent('ox_carkeys:sendems', coords)
end

RegisterNetEvent('ox_carkeys:sendems2')
AddEventHandler('ox_carkeys:sendems2', function(coords)
    local player = ESX.GetPlayerData()
	if HasGroups(Groups) then
	--if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
	--if PlayerData.job.name == 'police' then
		street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
		street2 = GetStreetNameFromHashKey(street)
--		ESX.ShowAdvancedNotification(Config.notify.police_notify_title, Config.notify.police_notify_subtitle, street2, "CHAR_CALL911", 1)
		PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0)

		blip = AddBlipForCoord(coords)
		SetBlipSprite(blip, 380)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 1.0)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Crochettage de Véhicule')
		EndTextCommandSetBlipName(blip)
		table.insert(blipsCrochettage, blip)
		Wait(120000)
		for i in pairs(blipsCrochettage) do
			RemoveBlip(blipsCrochettage[i])
			blipsCrochettage[i] = nil
		end
	end
end)

function HasGroups(Groups)
	local Groups = Config.Groups[1]
	if Groups then
	for i = 1, #Groups, 1 do
	local Group = Groups[i]
		if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == Group then
			return true
		end
    end
	else
		return true
	end
end

AddEventHandler('Alf:ancre', function()
    local ped = GetPlayerPed(-1)
    local boat  = GetVehiclePedIsIn(ped, true)   
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local player = PlayerPedId()
    if IsPedInAnyBoat(PlayerPedId()) and getPedSeat(player, vehicle) == -1 then
        if anchor == false then
            SetBoatAnchor(boat, true)
			ESX.ShowNotification("~g~ancré", "info", 3000)
            anchor = true
        elseif anchor == true then
            SetBoatAnchor(boat, false)
			ESX.ShowNotification("~r~n'est plus ancré", "info", 3000)
            anchor = false
        end
    else
		ESX.ShowNotification("Vous ne piloter pas de ~r~Bâteau~s~!", "error", 3000)
    end
end)