function Notify(template, tekst)

    if SK.Notify == 'esx' then
        exports["esx_notify"]:Notify(template, 3000, tekst)

    elseif SK.Notify == 'okok' then
        exports['okokNotify']:Alert("Drugs", tekst, 3000, template)

    elseif SK.Notify == 'mythic' then
        exports['mythic_notify']:DoHudText(template, tekst)
        
    end
end


