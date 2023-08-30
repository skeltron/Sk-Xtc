SK = {}

SK.Farmlogs = '' -- Discord webhook adden voor farmlogs
SK.Verwerklogs = '' -- Discord webhook adden voor logs

SK.Objectspawn = 'prop_horo_box_02' -- Prop die inlaad
SK.Maxspawn = 20 -- Heveelheid er max spawnt 
SK.Distancespawn = 30 -- Hoever je in de buurt moet zijn totdat er xtc props worden ingeladen

SK.Item = 'xtc' --Item dat je krijgt als je plukt
SK.Itemcount = math.random(1, 3) -- Hoeveelheid je ontvangt is random tussen de 1 a 3

SK.Verwerkitem = 'xtc_verpak' -- Item dat je krijgt na het verwerken
SK.Verwerkcount = 1 -- Hoeveel je krijgt na 1 keer verwerken
SK.Removextc = 3 -- Aantal xtc dat er verwijderd word voor 1 Xtc Zakje temaken

SK.Pluktext = '~b~E ~s~• Xtc Oppakken' -- Text dat er staat om te plukken
SK.Verwerktext = '~b~E ~s~• Xtc Verwerken' -- Text dat er staat om te verwerken

SK.Zones = {
	Xtc = {coords = vector3(-1050.7428, -3507.2839, 14.1390)}, -- Coords van het Xtc plein
	Verwerk = {coords = vector3(-1031.7694, -3453.9634, 13.9443)} -- Coords van het Xtc verwerken
}

SK.Notify = {
	Itemcheck = 'Je hebt te weinig xtc opzak',
	Verwerk = 'Je kreeg x'..SK.Verwerkcount..' '..SK.Verwerkitem..''
}