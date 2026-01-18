fx_version 'cerulean'
game 'gta5'

name 'BM Hints'
author 'BM Scripts'
description 'QB/QBox Information Broker System'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua'
}

client_scripts {
    'client/peds.lua',
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    'server/main.lua',
}
