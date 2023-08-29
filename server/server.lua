local function distancecheckfarm(src)
    local ECoords = SK.Zones.Xtc.coords
	local PCoords = GetEntityCoords(GetPlayerPed(src))
	local Dist = #(PCoords-ECoords)
	if Dist <= 90 then return true end
end

local function distancecheckverwerk(src)
    local ECoords = SK.Zones.Verwerk.coords
	local PCoords = GetEntityCoords(GetPlayerPed(src))
	local Dist = #(PCoords-ECoords)
	if Dist <= 90 then return true end
end

RegisterServerEvent('Sk-Xtc:getitem')
AddEventHandler('Sk-Xtc:getitem', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if distancecheckfarm(src) then

        xPlayer.addInventoryItem(''..SK.Item..'', SK.Itemcount)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = SK.Notify.Farm})
        sendToDiscord(SK.Farmlogs, "SK-logs", "**Naam**: " .. GetPlayerName(src) .. "\n **ID**: " ..src .. "\n **License**: " .. GetPlayerIdentifier(src) .. "\n**Drugs:** " .. SK.Item .."\n**Aantal:** " .. SK.Itemcount .."\n**Type:** Plukken", 246504)
    else
        DropPlayer(src,"Event triggeren")
    end
end)

RegisterServerEvent('Sk-Xtc:verwerkitem')
AddEventHandler('Sk-Xtc:verwerkitem', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem(SK.Item).count

    if distancecheckverwerk(src) then


        xPlayer.removeInventoryItem(SK.Item, SK.Removextc)
        xPlayer.addInventoryItem(''..SK.Verwerkitem..'', SK.Verwerkcount)
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = SK.Notify.Verwerk})
        sendToDiscord(SK.Verwerklogs, "SK-logs", "**Naam**: " .. GetPlayerName(src) .. "\n **ID**: " ..src .. "\n **License**: " .. GetPlayerIdentifier(src) .. "\n**Drugs:** " .. SK.Item .."\n**Verwijder-Aantal:** " .. SK.Removextc .."\n**Drugs-Verwerk:** " .. SK.Verwerkitem .."\n**Verwerk-Aantal:** " .. SK.Verwerkcount .."\n**Type:** Verwerken", 246504)
    else
        DropPlayer(src,"Event triggeren")
    end
end)

ESX.RegisterServerCallback('Sk-Xtc:checkitem', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.getInventoryItem(SK.Item)
	if item == SK.Removextc then
		cb(0)
	else
		cb(items.count)
	end
end)

function sendToDiscord(webhook, name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "".. name .."",
              ["description"] = message,
              ["footer"] = {
              ["text"] = "SK-logs • " ..os.date("%x %X %p"),
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "SK-logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
  end