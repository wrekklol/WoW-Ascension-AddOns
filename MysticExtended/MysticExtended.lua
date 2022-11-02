MysticExtended = LibStub("AceAddon-3.0"):NewAddon("MysticExtended", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")

MysticExtended_DewdropMenu = AceLibrary("Dewdrop-2.0");

--Set Savedvariables defaults
local RollExtracts = false;
local DefaultMysticExtendedDB  = {
["EnchantSaveLists"] = {["Enchant List 1"] = {["menuID"] = 1,["Name"] = "Enchant List 1"}},
["ReRollItems"] = {18863, 18853,992720},
["ListFrameLastState"] = false,
["currentSelectedList"] = "Enchant List 1",
["RollByQuality"] = true,
["ButtonEnable"] = true,
["QualityList"] = {
    [1] = {"Uncommon",true,2},
    [2] = {"Rare",true,3},
    [3] = {"Epic",true,4},
    [4] = {"Legendary",true,5}
},
["REFORGE_RETRY_DELAY"] = 5,
};

local function MysticExtended_DoSaveList(bagID, slotID)
    local enchantID = GetREInSlot(bagID, slotID)
        for i , v in pairs(MysticExtendedDB["EnchantSaveLists"]) do
            if v.enableRoll then
                for a , b in ipairs(v) do
                    if b[1] == enchantID then
                        return v.Name,a,v.enableDisenchant,v.enableRoll,v.ignoreList
                    end
                end
            end
        end
end

local function checkRaritys(quality)
    for i , v in pairs(MysticExtendedDB["QualityList"]) do
        if v[3] == quality and v[2] then
            return true;
        end
    end
end

local function MysticExtended_DoRarity(bagID, slotID)
    local enchantID = GetREInSlot(bagID, slotID)
        if MysticExtendedDB.RollByQuality then
            for i , v in pairs(MYSTIC_ENCHANTS) do
                if v.enchantID == enchantID and checkRaritys(v.quality) then
                    return true;
                end
            end
        end
end

local AutoOn = false;

function MysticExtended:Repeat()
    MysticExtended_RollEnchant();
end

local function EventHandler(event, unitID, spell)
    if unitID == "player" and spell == "Enchanting" then
        if event == "UNIT_SPELLCAST_INTERRUPTED" then
            AutoOn = false;
            MysticExtendedFrame_Menu:SetText("Start Reforge");
            MysticExtended_ListFrameReforgeButton:SetText("Start Reforge");
        elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
            MysticExtended:CancelTimer(MysticExtended.rollTimer);
            MysticExtended:ScheduleTimer(MysticExtended_RollEnchant, tonumber(MysticExtendedDB["REFORGE_RETRY_DELAY"] / 10));
        end
        MysticExtended:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED");
        MysticExtended:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
    end
end

local function MysticExtended_GetItemID(bagID, slotID)
    if bagID and slotID then
        local item = GetContainerItemID(bagID, slotID);
            for i , v in pairs(MysticExtendedDB["ReRollItems"]) do
                if v == item then
                    return true;
                end
            end
    end
end

local function MysticExtended_RemoveFound(bagID, slotID)
    local listName,enchNum = MysticExtended_DoSaveList(bagID,slotID)
    table.remove(MysticExtendedDB["EnchantSaveLists"][listName],enchNum)
end

local function DisenchantItem(bagID,slotID)
    if GetItemCount(98463) and (GetItemCount(98463) > 0) then
        if IsReforgeEnchantmentKnown(GetREInSlot(bagID,slotID)) then
            print("You already know this enchant removed from list");
            MysticExtended_RemoveFound(bagID,slotID);
        else
            local hideMframe = true;
            if MysticEnchantingFrame:IsVisible() then
                hideMframe = false;
            end
            MysticExtended_RemoveFound(bagID,slotID);
            RequestSlotReforgeExtraction(bagID, slotID);
            local itemLink = MysticExtended_CreateItemLink(GetREInSlot(bagID,slotID));
            print(itemLink.." Has been added to your collection and removed from the list");
            if hideMframe then
                MysticEnchantingFrame:Hide()
            end
        end
    else
        print("You don't have enough Mystic Extract to disenchant that item")
    end
end

local function MysticExtended_FindNextItem()
    local bagID, slotID = 0, 0;
    for b = bagID, 4 do
        for s = slotID + 1, GetContainerNumSlots(b) do
            if MysticExtended_GetItemID(b,s) then
                local listName,enchNum,enableDisenchant,enableRoll,ignoreList = MysticExtended_DoSaveList(b,s)
                    if RollExtracts then
                        return b, s;
                    elseif enableRoll and ignoreList ~= true then
                        if enableDisenchant then
                            DisenchantItem(b,s);
                            MysticExtended_ScrollFrameUpdate();
                        end
                    elseif  enableRoll and ignoreList then
                        return b, s;
                    elseif MysticExtended_DoRarity(b,s) then
                    else
                        return b, s;
                    end
            end
        slotID = s;
        end
    slotID = 0;
    end
end

local function MysticExtended_StopAutoRoll()
    MysticExtended:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED");
    MysticExtended:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
    MysticExtended:CancelTimer(MysticExtended.rollTimer);
    MysticExtendedFrame_Menu:SetText("Start Reforge");
    MysticExtended_ListFrameReforgeButton:SetText("Start Reforge");
    AutoOn = false;
end

function MysticExtended_RollEnchant()
    local bagID, slotID = MysticExtended_FindNextItem();
    if AutoOn and GetItemCount(98462) > 0 and MysticExtended_GetItemID(bagID, slotID) and GetUnitSpeed("player") == 0 then
        MysticExtended:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", EventHandler);
        MysticExtended:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", EventHandler);
        MysticExtended.rollTimer = MysticExtended:ScheduleTimer("Repeat", 3);
        local listName,enchNum,enableDisenchant,enableRoll,ignoreList = MysticExtended_DoSaveList(bagID,slotID)
        if RollExtracts then
            RequestSlotReforgeEnchantment(bagID, slotID);
        elseif enableRoll and ignoreList ~= true then
        elseif enableRoll and ignoreList then
            RequestSlotReforgeEnchantment(bagID, slotID);
        elseif MysticExtended_DoRarity(bagID,slotID) then else
            RequestSlotReforgeEnchantment(bagID, slotID);
        end
    else
        if GetItemCount(98462) <= 0 then
            print("Out Runes")
        elseif GetUnitSpeed("player") == 0 then
            print("Out of Items to Reforge")
        end
        MysticExtended_StopAutoRoll();
    end
end

local function MysticExtended_StartAutoRoll()
    if AutoOn then
        MysticExtended_StopAutoRoll();
    else
        if IsMounted() then Dismount() end
        AutoOn = true;
        MysticExtendedFrame_Menu:SetText("Auto Reforging");
        MysticExtended_ListFrameReforgeButton:SetText("Auto Reforging");
        MysticExtended_RollEnchant();
    end
end

local function QualityEnable()
    if MysticExtendedDB["RollByQuality"] then
        MysticExtendedDB["RollByQuality"] = false;
    else
        MysticExtendedDB["RollByQuality"] = true;
    end
end

local function QualitySet(tablenum,state)
    if state then
        MysticExtendedDB["QualityList"][tablenum][2] = false;
    else
        MysticExtendedDB["QualityList"][tablenum][2] = true;
    end
end

local function EnableClick(list,cat,cat2)
    if MysticExtendedDB["EnchantSaveLists"][list][cat] then
        MysticExtendedDB["EnchantSaveLists"][list][cat] = false;
    else
        MysticExtendedDB["EnchantSaveLists"][list][cat] = true;
        MysticExtendedDB["EnchantSaveLists"][list][cat2] = false;
    end
end

function MysticExtended:ButtonEnable()
    if MysticExtendedDB["ButtonEnable"] then
        MysticExtendedFrame:Hide();
        MysticExtendedDB["ButtonEnable"] = false
    else
        MysticExtendedFrame:Show();
        MysticExtendedDB["ButtonEnable"] = true
    end
end

local function RollExtractsEnable()
    if RollExtracts then
        RollExtracts = false;
    else
        RollExtracts = true;
    end
end

function MysticExtended_DewdropMenuRegister(self)
	MysticExtended_DewdropMenu:Register(self,
        'point', function(parent)
            return "TOP", "BOTTOM"
        end,
        'children', function(level, value)
            if level == 1 then
                MysticExtended_DewdropMenu:AddLine(
                    'text', "Select Lists to Roll",
                    'hasArrow', true,
                    'value', MysticExtendedDB["EnchantSaveLists"],
                    'notCheckable', true
                )
                MysticExtended_DewdropMenu:AddLine(
                    'text', "Roll Quality",
                    'hasArrow', true,
                    'value', MysticExtendedDB["QualityList"],
                    'notCheckable', true
                )
                MysticExtended_DewdropMenu:AddLine(
                    'text', "Roll For Extracts",
                    'value', "RollExtracts",
                    'hasArrow', true,
                    'notCheckable', true
                )
                MysticExtended_DewdropMenu:AddLine(
					'text', "Close Menu",
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
					'func', function() MysticExtended_DewdropMenu:Close() end,
					'notCheckable', true
				)
            elseif level == 2 then
				if value == MysticExtendedDB["QualityList"] then
                    MysticExtended_DewdropMenu:AddLine(
                            'text', "Enable",
                            'func', QualityEnable,
                            'checked', MysticExtendedDB["RollByQuality"]
                        )
                    for k,v in ipairs(value) do
                        local _, _, _, qualityColor = GetItemQualityColor(v[3])
                        MysticExtended_DewdropMenu:AddLine(
                            'text', qualityColor..v[1],
                            'arg1', k,
                            'arg2', v[2],
                            'func', QualitySet,
                            'checked', v[2]
                        )
                    end
                elseif value == MysticExtendedDB["EnchantSaveLists"] then
                    for k,v in pairs(value) do
                        MysticExtended_DewdropMenu:AddLine(
                            'text', v.Name,
                            'hasArrow', true,
                            'value', v,
                            'notCheckable', true
                        )
                    end
                elseif value == "RollExtracts" then
                    MysticExtended_DewdropMenu:AddLine(
                            'text', "Enable",
                            'checked', RollExtracts,
                            'func', RollExtractsEnable
                        )
                    MysticExtended_DewdropMenu:AddLine(
                        'text', "When this option is enabled it will ignore all",
                        'notCheckable', true
                    )
                    MysticExtended_DewdropMenu:AddLine(
                        'text', "other rolling options and just roll on the",
                        'notCheckable', true
                    )
                    MysticExtended_DewdropMenu:AddLine(
                        'text', "first item it finds till you run out of runes",
                        'notCheckable', true
                    )
                end
                MysticExtended_DewdropMenu:AddLine(
					'text', "Close Menu",
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
					'func', function() MysticExtended_DewdropMenu:Close() end,
					'notCheckable', true
				)
            elseif level == 3 then
                MysticExtended_DewdropMenu:AddLine(
                    'text', "Enable List",
                    'arg1', value.Name,
                    'arg2', "enableRoll",
                    'func', EnableClick,
                    'checked', value.enableRoll
                )
                MysticExtended_DewdropMenu:AddLine(
                    'text', "Disenchant to Collection and remove from list",
                    'arg1', value.Name,
                    'arg2', "enableDisenchant",
                    'arg3', "ignoreList",
                    'func', EnableClick,
                    'checked', value.enableDisenchant
                )
                MysticExtended_DewdropMenu:AddLine(
                    'text', "ReRoll items on this list when found",
                    'arg1', value.Name,
                    'arg2', "ignoreList",
                    'arg3', "enableDisenchant",
                    'func', EnableClick,
                    'checked', value.ignoreList
                )
                MysticExtended_DewdropMenu:AddLine(
				    'text', "Close Menu",
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
				    'func', function() MysticExtended_DewdropMenu:Close() end,
				    'notCheckable', true
				)
            end
		end,
		'dontHook', true
	)
end

function MysticExtended_OnClick(self,arg1)
    if MysticExtended_DewdropMenu:IsOpen() then
        MysticExtended_DewdropMenu:Close();
    else
        if (arg1=="LeftButton") then
            MysticExtended_StartAutoRoll();
        elseif (arg1=="RightButton") then
            if IsAltKeyDown() then
                MysticEnchantingFrame:Display();
            else
            MysticExtended_DewdropMenuRegister(self);
            MysticExtended_DewdropMenu:Open(this);
            end
        end
    end
end

--Creates the main floating button
local mainframe = CreateFrame("FRAME", "MysticExtendedFrame", UIParent, nil);
   mainframe:SetPoint("CENTER",0,0);
   mainframe:SetSize(120,50);
   mainframe:EnableMouse(true);
   mainframe:SetMovable(true);
   mainframe:SetBackdrop({
       bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
       edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
       tile = "true",
       insets = {left = "11", right = "12", top = "12", bottom = "11"},
       edgeSize = 32,
       titleSize = 32,
   });
   mainframe:RegisterForDrag("LeftButton");
   mainframe:SetScript("OnDragStart", function(self) mainframe:StartMoving() end)
   mainframe:SetScript("OnDragStop", function(self) mainframe:StopMovingOrSizing() end)

local reforgebutton = CreateFrame("Button", "MysticExtendedFrame_Menu", MysticExtendedFrame, "OptionsButtonTemplate");
   reforgebutton:SetSize(100,30);
   reforgebutton:SetPoint("TOP", MysticExtendedFrame, "TOP", 0, -10);
   reforgebutton:SetText("Start Reforge");
   reforgebutton:RegisterForClicks("LeftButtonDown", "RightButtonDown");
   reforgebutton:SetScript("OnClick", function(self, btnclick, down) MysticExtended_OnClick(self,btnclick) end);

local function CloneTable(t)				-- return a copy of the table t
	local new = {};					-- create a new table
	local i, v = next(t, nil);		-- i is an index of t, v = t[i]
	while i do
		if type(v)=="table" then 
			v=CloneTable(v);
		end 
		new[i] = v;
		i, v = next(t, i);			-- get next index
	end
	return new;
end

function MysticExtended:OnInitialize()
    if ( MysticExtendedDB == nil ) then
        MysticExtendedDB = CloneTable(DefaultMysticExtendedDB);
    end
end

function MysticExtended:OnEnable()
    MysticExtended_ListEnable();
    MysticExtended_DropDownInitialize();
    if MysticExtendedDB["ButtonEnable"] then
        MysticExtendedFrame:Show();
        MysticExtendedOptions_FloatSetting:SetChecked(true);
    else
        MysticExtendedFrame:Hide();
        MysticExtendedOptions_FloatSetting:SetChecked(false);
    end

    if MysticExtendedDB["REFORGE_RETRY_DELAY"] == nil then
        MysticExtendedDB["REFORGE_RETRY_DELAY"] = 5;
    end

    if MYSTIC_ENCHANTS then
        for k,v in pairs(MYSTIC_ENCHANTS) do
            if v.enchantID ~= 0 then
               v.spellName = GetSpellInfo(v.spellID)
            end
         end
    end
    MysticExtended_DelaySlider:SetValue(MysticExtendedDB["REFORGE_RETRY_DELAY"]);
end