--[[ Version Checker ]] --
local version = 100

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        checkResourceVersion()
    end
end)

function checkUpdateEmbed(color, name, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. name .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.DISCORD_WEBHOOK, function(err, text, headers) end, 
    'POST', json.encode({
        username = Config.DISCORD_NAME, 
        embeds = content, 
        avatar_url = Config.DISCORD_IMAGE
    }), { ['Content-Type'] = 'application/json '})
end

function checkResourceVersion()
    PerformHttpRequest("https://raw.githubusercontent.com/Lanzaned-Enterprises/LENT-Megaphone/main/version.txt", function(err, text, headers)
        if (version > text) then -- Using Dev Branch
            print(" ")
            print("---------- LANZANED MEGAPHONE ----------")
            print("Megaphone is using a development branch! Please update to stable ASAP!")
            print("Your Version: " .. version .. " Current Stable Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Megaphone")
            print("Thanks to: https://github.com/Annalouu For creating the original Script!")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Megaphone Update Checker", "Megaphone is using a development branch! Please update to stable ASAP!\nYour Version: " .. version .. " Current Stable Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Megaphone", "Script created by: https://github.com/Annalouu | Modified By: https://discord.lanzaned.com/")
        elseif (text > version) then -- Not updated
            print(" ")
            print("---------- LANZANED MEGAPHONE ----------")
            print("Megaphone is not up to date! Please update!")
            print("Curent Version: " .. version .. " Latest Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Megaphone")
            print("Thanks to: https://github.com/Annalouu For creating the original Script!")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Megaphone Update Checker", "Megaphone is not up to date! Please update!\nCurent Version: " .. version .. " Latest Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Megaphone", "Script created by: https://github.com/Annalouu | Modified By: https://discord.lanzaned.com/")
        else -- resource is fine
            print(" ")
            print("---------- LANZANED MEGAPHONE ----------")
            print("Megaphone is up to date and ready to go!")
            print("Running on Version: " .. version)
            print("https://github.com/Lanzaned-Enterprises/LENT-Megaphone")
            print("Thanks to: https://github.com/Annalouu For creating the original Script!")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(20480, "Megaphone Update Checker", "Megaphone is up to date and ready to go!\nRunning on Version: " .. version .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Megaphone", "Script created by: https://github.com/Annalouu | Modified By: https://discord.lanzaned.com/")
        end 
    end, "GET", "", {})
end