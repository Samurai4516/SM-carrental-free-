fx_version 'cerulean'
game 'gta5'
lua54 'yes'


files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/imgs/*.png'
}

ui_page 'html/index.html'

client_scripts {
	'client.lua',
	'config.lua'
}

server_scripts {
	'server.lua',
	'config.lua'
}


shared_scripts {
    '@ox_lib/init.lua',
	'config.lua'
}