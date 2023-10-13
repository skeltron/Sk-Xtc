function Notify(template, tekst, src)

    if SK.Notify == 'esx' then
        TriggerClientEvent('esx:showNotification', source, tekst, template)
    
    elseif SK.Notify == 'okok' then
        exports['okokNotify']:Alert("Drugs", tekst, 3000, template)
        TriggerClientEvent('okokNotify:Alert', source, 'Drugs', tekst, 3000, template)
    
    elseif SK.Notify == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = template, text = tekst})

    end
end

