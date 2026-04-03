-- Made by 938036904912379924 @ Matcha. Optimized for better usage.
-- https://discord.com/channels/1420041567481364703/1489127011988541521
local HOLD_OFFSET = 0x140
local DIST_OFFSET = 0x148
local PATCH_DISTANCE = 25
local patchedAddresses = {}
local function patchPrompt(obj)
    local addr = obj.Address
    if not addr or addr == 0 or patchedAddresses[addr] then
        return
    end
    local s, e = pcall(function()
        memory_write("float", addr + HOLD_OFFSET, 0.0)
        memory_write("float", addr + DIST_OFFSET, PATCH_DISTANCE)
    end)
    if s then
        patchedAddresses[addr] = true
    end
end
local descendants = workspace:GetDescendants()
for i=1, #descendants do
    local prompt = descendants[i]
    if prompt.ClassName == "ProximityPrompt" then
        patchPrompt(prompt)
    end
end
