SK = {
	Farmlogs = '', -- Discord webhook adden voor farmlogs
	Verwerklogs = '', -- Discord webhook adden voor verwerklogs
	Triggerlogs = '', -- Discord webhook adden voor triggerhitting

	Notify = 'mythic', -- mythic of esx of okok

	Objectname = 'prop_horo_box_02', -- Prop die inlaad
	Maxspawn = 20, -- Heveelheid er max spawnt 
	Distancespawn = 30, -- Hoever je in de buurt moet zijn totdat er xtc props worden ingeladen

	Item = 'xtc', --Item dat je krijgt als je plukt
	Itemcount = math.random(1, 5), -- Hoeveelheid je ontvangt is random tussen de 1 a 3

	Verwerkitem = 'xtc_verpak', -- Item dat je krijgt na het verwerken
	Verwerkcount = 1, -- Hoeveel je krijgt na 1 keer verwerken
	Removextc = 3, -- Aantal xtc dat er verwijderd word voor 1 Xtc Zakje temaken
	
	Pluktext = '~b~E ~s~• Xtc Oppakken', -- Text dat er staat om te plukken
	Verwerktext = '~b~E ~s~• Xtc Verwerken', -- Text dat er staat om te verwerken

	Zones = {
		Xtc = {coords = vector3(-1050.7428, -3507.2839, 14.1390)}, -- Coords van het Xtc plein
		Verwerk = {coords = vector3(-1031.7694, -3453.9634, 13.9443)} -- Coords van het Xtc verwerken
	},
}

