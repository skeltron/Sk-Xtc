RegisterServerEvent('Sk-Xtc:getitem')
AddEventHandler('Sk-Xtc:getitem', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    xPlayer.addInventoryItem(''..SK.Item..'', SK.Itemcount)
    TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'success', text = 'Je pakte '..SK.Item..' x'..SK.Itemcount..''})
end)