local lastMacroButtonMousedOver
local filteredTextures
local numMacroIcons
local availableMacroIcons = {}

--Duplicate and heavily edit Blizzard's PopupMacroUI update cycle
function Iconic_MacroPopupFrame_Update()
	local macroPopupIcon, macroPopupButton
	local macroPopupOffset = FauxScrollFrame_GetOffset(MacroPopupScrollFrame)
	local numMacroIconsFound, filteredMacroIconID, macroIconID, texturePath, stringFound
	local userInput = IconicFrame:GetText():lower()
	userInput = gsub(userInput, "%%", "")
	filteredMacroIconIDs = {}
	
	for macroIconID = 1, numMacroIcons do
		texturePath = GetMacroIconInfo(macroIconID)
		textureName = strmatch(texturePath, ".*%\\(.*)"):lower()
		stringFound = strfind(textureName, userInput)
		if stringFound then
			tinsert(filteredMacroIconIDs, macroIconID)
		end
	end
	numMacroIconsFound  = #filteredMacroIconIDs
	
	for buttonID = 1, NUM_MACRO_ICONS_SHOWN do
		macroPopupIcon = _G["MacroPopupButton"..buttonID.."Icon"]
		macroPopupButton = _G["MacroPopupButton"..buttonID]
		filteredMacroIconID = (macroPopupOffset * NUM_ICONS_PER_ROW) + buttonID
		
		if (filteredMacroIconID <= numMacroIconsFound) then
			macroIconID = filteredMacroIconIDs[filteredMacroIconID]
			texturePath = GetMacroIconInfo(macroIconID)
			macroPopupIcon:SetTexture(texturePath)
			macroPopupButton:Show()
		else
			macroPopupIcon:SetTexture("")
			macroPopupButton:Hide()
		end
		
		if (MacroPopupFrame.selectedIcon and (macroIconID == MacroPopupFrame.selectedIcon)) then
			macroPopupButton:SetChecked(1)
		elseif (MacroPopupFrame.selectedIconTexture ==  texturePath) then
			macroPopupButton:SetChecked(1)
		else
			macroPopupButton:SetChecked(nil)
		end
	end

	FauxScrollFrame_Update(MacroPopupScrollFrame, ceil(numMacroIconsFound / NUM_ICONS_PER_ROW), NUM_ICON_ROWS, MACRO_ICON_ROW_HEIGHT)
end

function Iconic_MacroPopupButton_OnEnter(frame)
	local iconName = frame:GetName() .. "Icon"
	local texturePath = _G[iconName]:GetTexture()
	local textureName = strmatch(texturePath, ".*%\\(.*)")
	local textureNameKeywords = gsub(textureName, "_", ", ")

	GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
	GameTooltip:AddLine(textureNameKeywords)
	lastMacroButtonMousedOver = frame
	GameTooltip:Show()
end

function Iconic_MacroPopupButton_OnLeave(frame)
	GameTooltip:Hide()
	lastMacroButtonMousedOver = nil
end

function Iconic_MacroPopupButton_OnClick(frame)
	local iconName = frame:GetName() .. "Icon"
	local texturePath = _G[iconName]:GetTexture()
	MacroPopupButton_SelectTexture(availableMacroIcons[texturePath])
end

function Iconic_TooltipRefresh(frame)
	if lastMacroButtonMousedOver then
		Iconic_MacroPopupButton_OnEnter(lastMacroButtonMousedOver)
	end
end

function Iconic_MacroPopupScroll_ResetPosition()
	if MacroPopupScrollFrame:GetVerticalScroll() > 0 then
		MacroPopupScrollFrame:SetVerticalScroll(0)
	end
end

--If somehow this addon is loaded by other means, force Blizzard_MacroUI to load first
LoadAddOn("Blizzard_MacroUI")

--Execute as soon as addon is loaded (make sure Blizzard_MacroUI is already loaded)
if IsAddOnLoaded("Blizzard_MacroUI") then
--Generate reverse lookup table of macro icons to their IDs
	numMacroIcons = GetNumMacroIcons()
	for i = 1, numMacroIcons do
		availableMacroIcons[GetMacroIconInfo(i)] = i
	end
--Hook scripts up to existing Blizzard buttons
	for i = 1, NUM_MACRO_ICONS_SHOWN do
		local MacroPopupButton = _G["MacroPopupButton" .. i]
		MacroPopupButton:HookScript("OnEnter", Iconic_MacroPopupButton_OnEnter)
		MacroPopupButton:HookScript("OnLeave", Iconic_MacroPopupButton_OnLeave)
		MacroPopupButton:HookScript("OnClick", Iconic_MacroPopupButton_OnClick)
	end
	--Hook scripts to scroll bar for tooltip updates (via mouse wheel)
	MacroPopupScrollFrame:HookScript("OnVerticalScroll", Iconic_TooltipRefresh)

--Hook MacroPopupFrame_Update to my version
	hooksecurefunc("MacroPopupFrame_Update", Iconic_MacroPopupFrame_Update)	
end