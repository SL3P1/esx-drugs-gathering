local allSpawns = {}

function CreateInitialSpawns()
    for drug, data in pairs(Config.Drugs) do
        local zone = Config.Zones[data.zone]
        if not zone then
        else
            for i = 1, data.spawnCount do
                local offsetX = math.random(-Config.SpawnRadius, Config.SpawnRadius)
                local offsetY = math.random(-Config.SpawnRadius, Config.SpawnRadius)
                local coords = zone.coords + vector3(offsetX, offsetY, 0)
                table.insert(allSpawns, {type = drug, coords = coords})
            end
        end
    end
end

RegisterNetEvent('drug_picker:requestSpawns', function()
    local src = source
    TriggerClientEvent('drug_picker:spawnAll', src, allSpawns)
end)

local recentCollections = {}

RegisterNetEvent('drug_picker:giveItem', function(type)
    local src = source
    local now = os.time()

    if recentCollections[src] and now - recentCollections[src] < Config.CooldownTime / 1000 then
        return
    end

    recentCollections[src] = now

    if not Config.Drugs[type] then
        return
    end

    exports.ox_inventory:AddItem(src, Config.Drugs[type].item, 1)
end)

CreateInitialSpawns()
