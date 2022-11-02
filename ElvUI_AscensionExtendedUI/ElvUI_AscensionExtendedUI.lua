RAUI = select(2, ...)
RAUI.AddonName = "|cff1784d1" .. "RAUI" .. "|r"
local E, L, V, P, G = unpack(ElvUI)
local EnhancedCharFrame

local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function(self, sinceLastUpdate) f:onUpdate(sinceLastUpdate) end)
f.sinceLastUpdate = -5

function f:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = self.sinceLastUpdate + sinceLastUpdate
	if ( self.sinceLastUpdate >= 0.03 ) then
		if not EnhancedCharFrame then
			EnhancedCharFrame = E:GetModule("Enhanced_CharacterFrame", true)
		end
		RAUI:AscensionUIExtended()
		self.sinceLastUpdate = 0
	end
end

function RAUI:AscensionUIExtended()
	if EnhancedCharFrame and EnhancedCharFrame.skinEnabled then
		CharacterFrameExtensionScrollFrameStatPanelPower:SetPoint("TOP", CharacterFrameExtensionScrollFrameStatPanelPrimaryStat, "BOTTOM", 0, 5)
		CharacterFrameExtensionScrollFrameStatPanelItemLevel:Hide()
		CharacterFrameExtensionScrollFrameStatPanelItemLevelContent:Hide()
		CharacterFrameExtensionEnchantPanel:SetFrameLevel(200)
		CharacterFrameExtensionEnchantPanel:SetHeight(420)
		CharacterFrameExtensionEnchantPanel:SetPoint("RIGHT",-12,3)
		CharacterNameFrame:SetPoint("TOP", 0,-18)
		CharacterFrameCloseButton:SetPoint("TOPRIGHT",351,-12)
		CharacterFrame.backdrop:Width(341 + 192 + 192)
		GearManagerToggleButton:Hide() -- Removes Default Equip Manager button
		PlayerTitleFrameButton:Hide() -- Removes Defualt Title frame
		PlayerTitleFrame:Hide() -- Removes Defualt Title frame
	else
		CharacterFrame.backdrop:ClearAllPoints()
		CharacterFrame.backdrop:Point("TOPLEFT", 11, -12)
		CharacterFrame.backdrop:Size(550, 424)
	end
end