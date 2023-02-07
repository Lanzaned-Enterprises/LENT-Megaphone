-- [[ QBCore Related Variables ]] --
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

-- [[ Net Events ]] --
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

-- [[ Functions ]] --
function IsAllowedJob(job)
	for k, v in pairs(Config.Jobs) do
        if job == k then
            return true
        end
    end
    
    return false
end

local function CheckPlayer()
    local Player = PlayerPedId()
    local getVehiclePedIsIn = GetVehiclePedIsIn(Player, false) > 0 and GetVehiclePedIsIn(Player, false) or 0 -- Get the vehicle the ped is in, if is > than 0 means the player is in a vehicle
    if getVehiclePedIsIn == 0 then return end

    local vehicleClass = GetVehicleClass(getVehiclePedIsIn) == 18 and true or false --get the class of it
    if not vehicleClass then
        -- QBCore.Functions.Notify("Ped not in a Police Vehicle", "error", 3000)
        -- [ Really don't need this notification ]
        return
    end

    return vehicleClass
end

-- [[ Commands + Keymapping ]] --
RegisterCommand('+Megaphone', function()
    if IsAllowedJob(PlayerData.job.name) and CheckPlayer() then
        exports["pma-voice"]:overrideProximityRange(30.0, true)
        QBCore.Functions.Notify('Megaphone on', 'success')
    end
end, false)
  
RegisterCommand('-Megaphone', function()
    if IsAllowedJob(PlayerData.job.name) and CheckPlayer() then
        exports["pma-voice"]:clearProximityOverride()
        QBCore.Functions.Notify('Megaphone off', 'error')
    end
end, false)
  
RegisterKeyMapping('+Megaphone', 'Talk on the Megaphone', 'keyboard', 'LSHIFT')