local QBCore = exports['qb-core']:GetCoreObject()
local InACopCar = false

function IsAllowedJob(job)
	for k, v in pairs(Config.Jobs) do
        if job == k then
            return true
        end
    end
    
    return false
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            if not InACopCar then
                PlayerData = QBCore.Functions.GetPlayerData()
                local vehicle = GetVehiclePedIsIn(ped)
                local vehicleClass = GetVehicleClass(vehicle)
                if DoesEntityExist(vehicle) and vehicleClass == 18 and IsAllowedJob(PlayerData.job.name) then
                    MegaPhone()
                    InACopCar = true
                end
            end
        else
            InACopCar = false
            ListenToKey = false
        end
        Wait(1000)
    end
end)


function MegaPhone()
	ListenToKey = true
	CreateThread(function()
		while ListenToKey do
			if IsControlJustPressed(0, 61) then 
				exports["pma-voice"]:overrideProximityRange(30.0, true)
                QBCore.Functions.Notify('Megaphone on', 'success')
            elseif IsControlJustReleased(0, 61) then 
                exports["pma-voice"]:clearProximityOverride()
                QBCore.Functions.Notify('Megaphone off', 'error')
			end
			Wait(1)
		end
	end)
end