RegisterNetEvent("void_adminpedswitch:setadminped")
AddEventHandler("void_adminpedswitch:setadminped", function(cb)
	if IsPedMale( PlayerPedId() ) then
    	model = GetHashKey(Config.maleadminped)
	else
		model = GetHashKey(Config.femaleadminped)
	end	
	if not IsModelValid(model) then return end
	RequestModel(model, 0)
	while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, model) do
        Citizen.InvokeNative(0xFA28FE3A6246FC30, model, 0)
        Citizen.Wait(0)
	end
	
	if HasModelLoaded(model) then
		Citizen.InvokeNative(0xED40380076A31506, PlayerId(), model, false)
		Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
		SetModelAsNoLongerNeeded(model)
	end
end)

RegisterNetEvent("void_adminpedswitch:setrpped")
AddEventHandler("void_adminpedswitch:setrpped", function(cb)
	ExecuteCommand('rc')
end)