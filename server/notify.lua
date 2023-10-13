function Notify(template, tekst, src)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = template, text = tekst})
end

