local ragdoll = false

RegisterKeyMapping('ragdoll', 'Ragdoll', 'keyboard', 'y')

RegisterCommand('ragdoll', function()
	if ragdoll then
		ragdoll = false
		Wait(500)
	elseif not ragdoll then
		ragdoll = true
		Wait(500)
	end
	ragdoll2()
end, false)

function ragdoll2()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if ragdoll then
                SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
            end
        end
    end)
end