Config = {}

Config.Drugs = {

   -- To add new drug 
   --['drug_name'] = {
   --    prop = 'prop_plant_01a',
   --    item = 'cocaine',
   --    zone = 'cocaine_zone',
   --    spawnCount = 10
   --},
    ['coke'] = {
        prop = 'prop_plant_01a',
        item = 'cocaine',
        zone = 'cocaine_zone',
        spawnCount = 20
    },
    ['weed'] = {
        prop = 'prop_weed_01',
        item = 'weed',
        zone = 'weed_zone',
        spawnCount = 20
    },
    ['mushrooms'] = {
        prop = 'prop_stoneshroom1',
        item = 'mushrooms',
        zone = 'shroom_zone',
        spawnCount = 20
    },
    ['poppies'] = {
        prop = 'prop_plant_cane_02b',
        item = 'poppies',
        zone = 'opium_zone',
        spawnCount = 20
    }
}

Config.Zones = {

    --If you need new zone just add 

   --['drug_name'] = {
   --    coords = vector3(3699.9280, 3098.7876, 11.8924),
   --    radius = 50.0
   --},

    ['cocaine_zone'] = {
        coords = vector3(3699.9280, 3098.7876, 11.8924),
        radius = 50.0
    },
    ['weed_zone'] = {
        coords = vector3(2066.3787, 5072.1016, 42.4015),
        radius = 50.0
    },
    ['shroom_zone'] = {
        coords = vector3(-1854.1512, 4514.6064, 21.1818),
        radius = 50.0
    },
    ['opium_zone'] = {
        coords = vector3(-1176.5367, 1405.1926, 179.5002),
        radius = 50.0
    }
}

Config.SpawnRadius = 20.0
Config.RespawnTime = 3000          -- 3 seconds (milliseconds)
Config.AnimDict = 'amb@world_human_gardener_plant@male@enter'
Config.AnimName = 'enter'
Config.AnimDuration = 3000         -- 3 seconds (milliseconds)
Config.CooldownTime = 3000         -- 3 seconds (milliseconds)
