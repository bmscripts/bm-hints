fx_version 'cerulean'
game 'gta5'
author 'BM Scripts'
description 'Give out hints to secret locations using emails'
version '1.0.0'


shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    'server/main.lua',
}

dependencies {
    'qb-core',
}


lua54 'yes'