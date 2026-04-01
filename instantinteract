-- Made originally by 987402090680827914 (@Lost)
print("yes")
local ok, res = pcall(function()
    return game:HttpGet("https://offsets.ntgetwritewatch.workers.dev/offsets.json")
end)

local offset
if ok then
    local HttpService = game:GetService("HttpService")
    local data = HttpService:JSONDecode(res)
    offset = data and data.ProximityPromptHoldDuraction and tonumber(data.ProximityPromptHoldDuraction, 16)
end

if offset then    
    task.spawn(function()
        while true do
            for _, prompt in ipairs(game:GetDescendants()) do
                if prompt.ClassName == "ProximityPrompt" then
                    pcall(function()
                        local promptAddress = prompt.Address
                        local targetAddress = promptAddress + offset
                        memory_write("float", targetAddress, 0)
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
    print("InstantInteract Loaded")
else
    print("InstantInteract Error")
end
