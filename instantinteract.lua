-- Made by 938036904912379924 @ Matcha
-- https://discord.com/channels/1420041567481364703/1489127011988541521
local HOLD_OFFSET = 0x140
local DIST_OFFSET = 0x148
local PATCH_DISTANCE = 25
local patchedAddresses = {}
local function patchPrompt(obj)
    local addr = obj.Address
    if addr and addr ~= 0 and not patchedAddresses[addr] then
        pcall(function()
            memory_write("float", addr + HOLD_OFFSET, 0.0)
            memory_write("float", addr + DIST_OFFSET, PATCH_DISTANCE)
            patchedAddresses[addr] = true
        end)
    end
end
task.spawn(function()
    while true do
        pcall(function()
            local descendants = workspace:GetDescendants()
            for i = 1, #descendants do
                local v = descendants[i]
                if v.ClassName == "ProximityPrompt" then
                    patchPrompt(v)
                end
            end
        end)
        task.wait(2)
    end
end)
