print("Flåklypa desperados lust loaded!")

local lustNames = {"Heroism", "Bloodlust", "Fury of the Aspects", "Time Warp", "Primal Rage", "Feral Hide Drums", "Thunderous Drums"}
local lastTrigger;
local function OnEvent(self, event, unit, info)
	if unit ~= "player" then
        return
    end
	if info.addedAuras then
		for _, v in pairs(info.addedAuras) do
			for _, value in ipairs(lustNames) do
				if value == v.name and v.duration ~= nil then
					if lastTrigger == nil or (GetTime() - lastTrigger) > 45 then
						lastTrigger = GetTime();
						PlaySoundFile("Interface\\AddOns\\Desperados-Lust\\flaklypa.mp3", "Master");
					end
				end
			end
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("UNIT_AURA")
f:SetScript("OnEvent", OnEvent)