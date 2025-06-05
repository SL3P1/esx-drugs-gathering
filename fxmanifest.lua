fx_version 'cerulean'
lua54 'yes'

game 'gta5'

author 'SL3P1'
description 'Drugs gathering zones'
version '1.0.0'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory'
}
