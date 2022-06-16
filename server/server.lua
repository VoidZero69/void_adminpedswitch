local switch = false

RegisterCommand('switch', function(source, args, rawCommand)
    local _source = source
    TriggerEvent("vorp:getCharacter", _source, function(user) 
        if user.group == 'admin' and not switch then
		    TriggerClientEvent("void_adminpedswitch:setadminped",_source)
            TriggerClientEvent("vorp:Tip", _source, "Switched to admin skin", 5000)
            switch = not switch
        elseif user.group == 'admin' and switch then
            TriggerClientEvent("void_adminpedswitch:setrpped",_source)
            TriggerClientEvent("vorp:Tip", _source, "Switched to rp skin", 5000)
            switch = not switch
        else
            TriggerClientEvent("vorp:Tip", _source, "Not enough permission", 5000)
        end
    end)
end)
