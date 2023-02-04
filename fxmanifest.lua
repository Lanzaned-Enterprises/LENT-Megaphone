-- [[ Metadata ]] --
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'AnnaLou <https://discordapp.com/users/585839151564193812>'
description 'AnnaLou | Police Megaphone'
github 'https://github.com/Annalouu'

-- [[ Modified By ]] --
author 'Lanzaned <https://discordapp.com/users/871877975346405388>'
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/'
docs 'https://docs.lanzaned.com/'

-- [[ Version ]] --
version '0.0.0'

-- [[ Dependencies ]] --
dependencies {
    'qb-core',
}

-- [[ Files ]] --
shared_scripts {
    -- Config Files
    'shared/*.lua',
}

server_scripts {
    -- Server Events
    'server/*.lua',
}

client_scripts {
    -- Client Events
    'client/*.lua',
}


-- [[ Tebex ]] --
lua54 'yes'