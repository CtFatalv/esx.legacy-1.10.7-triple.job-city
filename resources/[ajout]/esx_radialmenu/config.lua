Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
		title = 'Activitées',
        icon = 'user',
        items = {
            {
                title = 'plongee',
                icon = 'child',
                type = 'client',
                event = 'esxoceansalvage:startplongee',
                shouldClose = true
            },
        }
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = 'list-alt',
        items = {
            {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'tshirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Hair',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Ear Piece',
                        icon = 'deaf',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Neck',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Top',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Shirt',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Pants',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Shoes',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Hat',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Glasses',
                                icon = 'glasses',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Visor',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'Mask',
                                icon = 'theater-masks',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Vest',
                                icon = 'vest',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Bag',
                                icon = 'shopping-bag',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Bracelet',
                                icon = 'user',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Watch',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Gloves',
                                icon = 'mitten',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            },
			{
                id = 'rockstareditor',
                title = 'Rockstar Editor',
                icon = 'star',
                items = {
                    {
                        id = 'editor1',
                        title = 'Enregistrer une vidéo',
                        icon = 'play',
                        type = 'client',
                        event = 'recordstart',
                        shouldClose = true
                    },
                    {
                        id = 'editor2',
                        title = 'Stopper la vidéo',
                        icon = 'stop',
                        type = 'client',
                        event = 'recordstop',
                        shouldClose = false
                    },
                    {
                        id = 'editor3',
                        title = 'Annuler la vidéo',
                        icon = 'dumpster',
                        type = 'client',
                        event = 'recorddiscard',
                        shouldClose = false
                    },
                    {
                        id = 'editor4',
                        title = 'Editeur Vidéo',
                        icon = 'folder-open',
                        type = 'client',
                        event = 'rockstareditor',
                        shouldClose = true
                    }
                }
            },
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {
            {
                id = 'vehicledoors',
                title = 'Porte véhicule',
                icon = 'car-side',
                items = {
                    {
                        id = 'door0',
                        title = 'Porte Chauffeur',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door4',
                        title = 'Capot',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door1',
                        title = 'Porte Passager',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door3',
                        title = 'Porte arrière droite',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door5',
                        title = 'Coffre',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door2',
                        title = 'Porte arrière gauche',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }
                }
            },
            {
                id = 'vehicleseats',
                title = 'Vehicle Seats',
                icon = 'chair',
                items = {
                    {
                        id = 'door0',
                        title = 'Driver',
                        icon = 'chair',
                        type = 'client',
                        event = 'qb-radialmenu:client:ChangeSeat',
                        shouldClose = false
                    }
                }
            },
            {
                id = 'vehicle',
                title = 'Gestion des clés',
                icon = 'car',
                type = 'client',
                event = 'Alf-Carkeys:OpenKeysMenu',
                shouldClose = true
            },
            {
                id = 'vehiclesend',
                title = 'Donner véhicule',
                icon = 'car',
                type = 'client',
                event = 'esx_givecarkeys:keys',
                shouldClose = true
            },
            {
                id = 'vehicleancre',
                title = 'Ancré le Bateau',
                icon = 'anchor',
                type = 'client',
                event = 'Alf:ancre',
                shouldClose = true
            }
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
}

Config.JobInteractions = {
    ["police"] = {
        {
            id = 'policeinteraction',
            title = 'Appel de Renfort',
            icon = 'bullhorn',
            items = {
                {
                    code = 'code2',
                    title = 'Code 2',
                    icon = 'child',
                    type = 'client',
                    event = 'esx_police:appelrenfort',
                    shouldClose = true
                },
                {
                    code = 'code3',
                    title = 'Code 3',
                    icon = 'child',
                    type = 'client',
                    event = 'esx_police:appelrenfort',
                    shouldClose = true
                },
                {
                    code = 'code4',
                    title = 'Code 4',
                    icon = 'child',
                    type = 'client',
                    event = 'esx_police:appelrenfort',
                    shouldClose = true
                },
            }
        },
        {
            id = 'policeinteraction',
            title = 'Vérifier une plaque',
            icon = 'tasks',
            type = 'client',
            event = 'esx_policejob:vehicleinfoplate',
            shouldClose = true
        },
    },
    ["mechanic"] = {
        {
            id = 'mechanicvehiculeinteraction',
            title = 'Custom',
            icon = 'car',
            type = 'client',
            event = 'esx_mechanicjob:vehicleinteraction',
            shouldClose = true
		},
        {
			id = 'mechanicjobinteraction',
            title = 'Job dépannage',
            icon = 'exclamation-triangle',
            type = 'client',
            event = 'esx_mechanicjob:Jobinteraction',
            shouldClose = true
		},
	},
    ["taxi"] = {
        {
            id = 'taxiinteraction',
            title = 'Job Moldu',
            icon = 'car',
            type = 'client',
            event = 'esx_taxijob:jobmoldutaxi',
            shouldClose = true
        },
	},
    ["ambulance"] = {
        {
            id = 'emsrecherchecorp',
            title = 'Chercher le patient',
            icon = 'child',
            type = 'client',
            event = 'ambulance:cherche',
            shouldClose = true
		},
	},
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local Bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["resetclothes"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nothing To Reset', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Revert everything back to normal",
        Name = "resetclothes",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if Bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if Bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Take your bag off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}