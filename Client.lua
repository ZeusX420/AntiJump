-- Create by ZeusX#6953 :my Discord

local timeout = 7 -- time to next jump you can change :)
local lastPress = 0 
local button = 22 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, button) then 
            local currentTime = GetGameTimer()
            if currentTime - lastPress < timeout * 1000 then 
                
                
                print("Button cooldown enabled try before cooldown", timeout)
            else
                
                lastPress = currentTime
                
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if lastPress + timeout * 1000 > GetGameTimer() then
            DisableControlAction(0, button, true) 
        else
            EnableControlAction(0, button, true) 
        end
    end
end)
