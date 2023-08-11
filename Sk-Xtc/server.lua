RegisterServerEvent('Sk-Xtc:getitem')
AddEventHandler('Sk-Xtc:getitem', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    xPlayer.addInventoryItem(''..SK.Item..'', SK.Itemcount)
    TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = 'Je pakte '..SK.Item..' x'..SK.Itemcount..''})
    sendToDiscord(SK.Logs, "SK-logs", "**Naam**: " .. GetPlayerName(src) .. "\n **ID**: " ..src .. "\n **License**: " .. GetPlayerIdentifier(src) .. "\n**Drugs:** " .. SK.Item .."\n**Aantal:** " .. SK.Itemcount .."\n**Type:** Plukken", 246504)
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
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "hl-logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
  end