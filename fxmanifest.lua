fx_version 'cerulean'
game 'gta5'

author 'BM Scripts'
description 'Give out hints to secret locations using emails'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',   -- MUST load first
    'config.lua',         -- Config must load before client/server
}

client_scripts {
    'client/ped_streamer.lua',  -- Streaming system (must load before main)
    'client/main.lua',
    'client/menu.lua',
}

server_scripts {
    'server/main.lua',
}
