Config = {
    Groups = {
       {'police', 'ambulance'}
    },
}

lib.locale()
Keys = {}
Keys.Distance = 5 -- Distance to open or close
Keys.DistanceCreate = 2 -- Distance to create key
Keys.CreateKeyTime = 5000 -- progressBar time
Keys.ItemName = 'carkeys' -- Name item DB
Keys.CopyPrice = 500  -- Price to buy copy keys
Keys.Key = 'U'  -- KeyBind
Keys.NpcReclameKey = {
    {
        hash = 'a_m_y_beachvesp_02',
        pos = vector3(170.02, -1799.39, 28.32),
        heading = 321.06,
        icon = 'fas fa-key',
        label = locale('cerrajero'),
        blip = true 

    },
}

Keys.CloseDoorsNPC = true      -- Close All NPC Cars Doors on create Entity.

Keys.DoorProbability = false    -- Probability of finding an open door. (Netx Update)

Keys.OpenDoorProbability = 1.0 --  Min 0.0 , Max 1.0.

-- LockPick and HotWire
Keys.LockPick = {
    {
        enable = true,           -- Enable o disable LockPick
        alarmProbability = 1.0,  -- Min 0.0 max 1.0
        alarmTime = 10000,        
        SkillCheck = true,       -- If it's false, a progress bar will be used.
        TimeProgress = 2000,
        Skills = { 
            { {areaSize = 60, speedMultiplier = 1},{areaSize = 60, speedMultiplier = 0.5},{areaSize = 60, speedMultiplier = 1},{areaSize = 60, speedMultiplier = 0.5},{areaSize = 60, speedMultiplier = 1}, }, { '1', '2','3','4','5'}
        },
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",      
        anim = "machinic_loop_mechandplayer",
        Disptach = false,                   
        DispatchFunction = function()  -- You can put here Dispatch Event.
        end
    }
}

RegisterNetEvent('ox_carkeys:Notification')
AddEventHandler('ox_carkeys:Notification', function(title, msg, type)
    lib.notify({
        title = title,
        description = msg,
        type = type
    })
end)




