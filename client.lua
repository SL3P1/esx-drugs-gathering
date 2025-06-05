local spawnedProps = {}
local CurrentZone = nil

function SpawnDrug(type, coords)
    local hash = GetHashKey(Config.Drugs[type].prop)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end

    local x, y = coords.x, coords.y
    local found, z = GetGroundZFor_3dCoord(x, y, coords.z + 50.0)
    local spawnZ = z or coords.z

    local obj = CreateObject(hash, x, y, spawnZ, false, false, false)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)

    table.insert(spawnedProps, {type = type, obj = obj, coords = coords})
end

CreateThread(function()
    for type, data in pairs(Config.Drugs) do
        exports.ox_target:addModel(GetHashKey(data.prop), {
            {
                label = 'Gather ' .. type,
                icon = 'fas fa-hand',
                distance = 2.0,
                canInteract = function(entity)
                    local ped = PlayerPedId()
                    if IsPedInAnyVehicle(ped, false) then return false end
                    return IsPlayerInZone(data.zone)
                end,
                onSelect = function(dataEntity)
                    local coords = GetEntityCoords(dataEntity.entity)
                    CollectDrug(type, dataEntity.entity, coords)
                end
            }
        })
    end
end)

function CollectDrug(type, obj, coords)
    local ped = PlayerPedId()

    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do Wait(10) end

    TaskPlayAnim(ped, Config.AnimDict, Config.AnimName, 8.0, -8.0, Config.AnimDuration, 0, 0, false, false, false)
    lib.progressCircle({
        duration = Config.AnimDuration,
        label = 'Gathering...',
        position = 'bottom',
        useWhileDead = false,
        disable = { move = true, car = true, mouse = false }
    })

    ClearPedTasks(ped)
    DeleteEntity(obj)
    TriggerServerEvent('drug_picker:giveItem', type)

    SetTimeout(Config.RespawnTime, function()
        local newCoords = coords + vector3(math.random(-Config.SpawnRadius, Config.SpawnRadius), math.random(-Config.SpawnRadius, Config.SpawnRadius), 0)
        local found, safeZ = GetGroundZFor_3dCoord(newCoords.x, newCoords.y, newCoords.z + 50.0)
        local spawnZ = safeZ or newCoords.z
        SpawnDrug(type, vector3(newCoords.x, newCoords.y, spawnZ))
    end)
end

RegisterNetEvent('drug_picker:spawnAll', function(allSpawns)
    for _, v in pairs(allSpawns) do
        SpawnDrug(v.type, v.coords)
    end
end)

CreateThread(function()
    for zoneName, zoneData in pairs(Config.Zones) do
        lib.zones.sphere({
            coords = zoneData.coords,
            radius = zoneData.radius,
            debug = false,
            onEnter = function()
                CurrentZone = zoneName
                TriggerServerEvent('drug_picker:requestSpawns')
            end,
            onExit = function()
                CurrentZone = nil
            end
        })
    end
end)

function IsPlayerInZone(zone)
    return CurrentZone == zone
end
