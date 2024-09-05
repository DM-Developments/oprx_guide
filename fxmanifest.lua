fx_version 'cerulean'

games {'gta5'}

author 'OPR X'

description 'Advanced Guide Menu 1.0'

shared_scripts { 
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'config.lua'
}

client_script {
	'client.lua',
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
}

ui_page 'nui/ui.html'

files {
    'nui/ui.html',
    'nui/scripts.js',
	'nui/guidbot.png',
	'nui/bg.png',
    'nui/styles.css'
}

escrow_ignore {
	'config.lua'
}

lua54 'yes'