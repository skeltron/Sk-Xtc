SK = {}

SK.Objectspawn = 'prop_horo_box_02' -- Prop die inlaad
SK.Maxspawn = 25 -- Heveelheid er max spawnt 
SK.Distancespawn = 30 -- Hoever je in de buurt moet zijn totdat er xtc props worden ingeladen

SK.Item = 'xtc' --Item dat je krijgt als je plukt
SK.Itemcount = math.random(3, 5) -- Hoeveelheid je ontvangt is random tussen de 3 a 5

SK.SpawnZones = {
	Xtc = {coords = vector3(-1050.7428, -3507.2839, 14.1390)}, -- Coords van het Xtc plein
}
