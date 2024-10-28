fx_version 'adamant'
lua54 'yes'
game 'gta5'
version '1.9.4'

author 'Skeltron'
description 'Sk-Xtc made by skeltron'

shared_script '@es_extended/imports.lua'

client_scripts {
    "client/*",
	"config.lua"
}

server_scripts {
	"server/*",
	"config.lua"
}