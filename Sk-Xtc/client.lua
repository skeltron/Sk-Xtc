local Xtc = {}
local spawnXtc = 0
local NuBezig = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
        sheesh = true
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, SK.SpawnZones.Xtc.coords, true) < SK.Distancespawn then
            sheesh = false
			SpawnXtc()
		end
	end
    if sheesh then
        Wait(500)
    end
end)

--Xtc plantage
Citizen.CreateThread(function()
    while true do 
        sheesh = true
        Citizen.Wait(6)
        local coords = GetEntityCoords(PlayerPedId())
        local nearbyObject, nearbyID
        for i=1, #Xtc, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(Xtc[i]), false) < 1 and not IsPedSittingInAnyVehicle(PlayerPedId()) then
                sheesh = false
                DrawScriptText(GetEntityCoords(Xtc[i]) + vector3(0.0, 0.0, 0.75), SK.Pluktext)
                nearbyObject, nearbyID = Xtc[i], i
                if IsControlJustReleased(0, 38) and not NuBezig then
                    NuBezig = true
                    Farmen(nearbyObject)
                end
            end
        end
        if sheesh then
            Wait(500)
        end
    end
end)

--Xtc verwerk
Citizen.CreateThread(function()
    while true do 
        sheesh = true
        Citizen.Wait(6)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, SK.SpawnZones.Verwerk.coords, false) < 2.5 and not IsPedSittingInAnyVehicle(PlayerPedId()) then
            sheesh = false
            DrawScriptText(vector3(SK.SpawnZones.Verwerk.coords), SK.Verwerktext)
            if IsControlJustReleased(0, 38) and not NuBezig then
                ESX.TriggerServerCallback('Sk-Xtc:checkitem', function(aantal) 
                    if aantal >= SK.Removextc then
                        NuBezig = true
                        Verwerken()
                    else
                        exports['mythic_notify']:DoHudText('error', 'Je hebt te weinig xtc opzak')
                    end
                end)
            end
        end
        if sheesh then
            Wait(500)
        end
    end
end)

function Farmen(nearbyObject)
    Progressbar("Sk_Xtc", "Xtc pakken..", 1500, false, true, {
        disableMovement = true,
        disableControls = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "random@domestic",
        anim = "pickup_low",
        flags = 16,
    }, {}, {}, function() 
        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('Sk-Xtc:getitem')
        NuBezig = false
        ESX.Game.DeleteObject(nearbyObject)

        spawnXtc = spawnXtc - 1
    end, function() 
    end)
end

function Verwerken()
    Progressbar("Sk-Xtc", "Xtc Verwerken..", 7000, false, true, {
        disableMovement = true,
        disableControls = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@business@weed@weed_sorting_seated@",
        anim = "sorter_right_sort_v3_sorter02",
        flags = 16,
    }, {}, {}, function() 
        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('Sk-Xtc:verwerkitem')
        NuBezig = false
    end, function() 
    end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Xtc) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnXtc()
	while spawnXtc < SK.Maxspawn do
		Citizen.Wait(0)
		local spawnCoords = GeneratespawnCoords()

		ESX.Game.SpawnLocalObject(SK.Objectspawn, spawnCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Xtc, obj)
			spawnXtc = spawnXtc + 1
		end)
	end
end

function ValidatespawnCoord(plantCoord)
	if spawnXtc > 0 then
		local validate = true

		for k, v in pairs(Xtc) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, SK.SpawnZones.Xtc.coords, false) > 40 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratespawnCoords()
	while true do
		Citizen.Wait(1)

		local spawnCoordX, spawnCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		spawnCoordX = SK.SpawnZones.Xtc.coords.x + modX
		spawnCoordY = SK.SpawnZones.Xtc.coords.y + modY

		local coordZ = GetCoordZ(spawnCoordX, spawnCoordY)
		local coord = vector3(spawnCoordX, spawnCoordY, coordZ)

		if ValidatespawnCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end

function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end

Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish ~= nil then
                onFinish()
            end
        else
            if onCancel ~= nil then
                onCancel()
            end
        end
    end)
end