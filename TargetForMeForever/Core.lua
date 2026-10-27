local addonName = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    print(addonName .. " v0.1.0 loaded")
end)

SLASH_TARGETFORMEFOREVER1 = "/tfm"

SlashCmdList.TARGETFORMEFOREVER = function()
    print(addonName .. " v0.1.0")
end
