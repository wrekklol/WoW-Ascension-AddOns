local mainframe = CreateFrame("FRAME", "MysticExtendedListFrame", MysticEnchantingFrame,"UIPanelDialogTemplate")
    mainframe:SetSize(305,508);
    mainframe:SetPoint("RIGHT", MysticEnchantingFrame, "RIGHT", 295, 0);
    mainframe.TitleText = mainframe:CreateFontString();
    mainframe.TitleText:SetFont("Fonts\\FRIZQT__.TTF", 12)
    mainframe.TitleText:SetFontObject(GameFontNormal)
    mainframe.TitleText:SetText("Mystic Extended");
    mainframe.TitleText:SetPoint("TOP", 0, -9);
    mainframe.TitleText:SetShadowOffset(1,-1);
    mainframe:Hide();
    mainframe:SetScript("OnHide",
    function()
        if MysticEnchantingFrame:IsVisible() then
            MysticExtendedDB.ListFrameLastState = false;
            MysticExtended_ShowButton:SetText("Show MysticExtended");
        end
    end)



local function setCurrentSelectedList(name)
    local thisID = this:GetID();
    MysticExtendedDB["currentSelectedList"] = name;
    UIDropDownMenu_SetSelectedID(MysticExtended_ListDropDown,thisID);
    MysticExtended_ScrollFrameUpdate();
end

local function MysticExtended_Menu_Initialize()
        local info;
        local menuID = 1
        for k,v in pairs(MysticExtendedDB["EnchantSaveLists"]) do
                    info = {
                        text = v.Name;
                        func = function() setCurrentSelectedList(v.Name) end;
                    };
                    MysticExtendedDB["EnchantSaveLists"][v.Name].menuID = menuID
                    menuID = menuID + 1
                    UIDropDownMenu_AddButton(info);
        end
end

function MysticExtended_ListEnable()
    MysticExtendedDB["currentSelectedList"] = MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]].Name;
    UIDropDownMenu_Initialize(MysticExtended_ListDropDown, MysticExtended_Menu_Initialize);
	UIDropDownMenu_SetSelectedID(MysticExtended_ListDropDown,MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]].menuID);
    MysticExtended_ScrollFrameUpdate();
end

StaticPopupDialogs["MYSTICEXTENDED_ADDLIST"] = {
    text = "Add New List?",
    button1 = "Confirm",
    button2 = "Cancel",
    hasEditBox = true,
    OnAccept = function (self, data, data2)
        local text = self.editBox:GetText()
        MysticExtendedDB["EnchantSaveLists"][text] = {["Name"] = text}
        UIDropDownMenu_Initialize(MysticExtended_ListDropDown, MysticExtended_Menu_Initialize);
        UIDropDownMenu_SetSelectedID(MysticExtended_ListDropDown,MysticExtendedDB["EnchantSaveLists"][text].menuID);
        MysticExtendedDB["currentSelectedList"] = text;
        MysticExtended_ScrollFrameUpdate();
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    enterClicksFirstButton = true,
}

StaticPopupDialogs["MYSTICEXTENDED_EDITLISTNAME"] = {
    text = "Edit Current List Name?",
    button1 = "Confirm",
    button2 = "Cancel",
    hasEditBox = true,
    OnAccept = function (self, data, data2)
        local text = self.editBox:GetText()
        if text ~= "" then
            MysticExtendedDB["EnchantSaveLists"][text] = MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]]
            MysticExtendedDB["EnchantSaveLists"][text].Name = text;
            MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]] = nil
            UIDropDownMenu_Initialize(MysticExtended_ListDropDown, MysticExtended_Menu_Initialize);
            UIDropDownMenu_SetSelectedID(MysticExtended_ListDropDown,MysticExtendedDB["EnchantSaveLists"][text].menuID);
            MysticExtendedDB["currentSelectedList"] = text;
            MysticExtended_ScrollFrameUpdate();
        end
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    enterClicksFirstButton = true,
}

StaticPopupDialogs["MYSTICEXTENDED_DELETELIST"] = {
    text = "Delete List?",
    button1 = "Confirm",
    button2 = "Cancel",
    OnAccept = function (self, data, data2)
        MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]] = nil;
        UIDropDownMenu_Initialize(MysticExtended_ListDropDown, MysticExtended_Menu_Initialize);
        UIDropDownMenu_SetSelectedID(MysticExtended_ListDropDown,1);
        MysticExtendedDB["currentSelectedList"] = UIDropDownMenu_GetText(MysticExtended_ListDropDown);
        MysticExtended_ScrollFrameUpdate();
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    enterClicksFirstButton = true,
}


local function MysticExtended_ListOnClick()

end

local listDropdown = CreateFrame("Button", "MysticExtended_ListDropDown", MysticExtendedListFrame, "UIDropDownMenuTemplate");
    listDropdown:SetPoint("TOPLEFT", 4, -40);
    listDropdown:SetScript("OnClick", MysticExtended_ListOnClick);
    UIDropDownMenu_SetWidth(MysticExtended_ListDropDown,155)

local editlistnamebtn = CreateFrame("Button", "MysticExtended_RemoveListBtn", MysticExtendedListFrame, "OptionsButtonTemplate");
    editlistnamebtn:SetPoint("TOPLEFT", 195, -41);
    editlistnamebtn:SetText("E")
    editlistnamebtn:SetSize(27, 27);
    editlistnamebtn:SetScript("OnClick", function() StaticPopup_Show("MYSTICEXTENDED_EDITLISTNAME") end);
    editlistnamebtn:SetScript("OnEnter", function()
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetText("Edit List Name")
		GameTooltip:Show()
	end)
	editlistnamebtn:SetScript("OnLeave", function() GameTooltip:Hide() end)


local addlistbtn = CreateFrame("Button", "MysticExtended_AddListBtn", MysticExtendedListFrame, "OptionsButtonTemplate");
    addlistbtn:SetPoint("TOPLEFT", 225, -41);
    addlistbtn:SetText("+")
    addlistbtn:SetSize(27, 27);
    addlistbtn:SetScript("OnClick", function() StaticPopup_Show("MYSTICEXTENDED_ADDLIST") end);
    addlistbtn:SetScript("OnEnter", function()
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetText("Create New List")
		GameTooltip:Show()
	end)
	addlistbtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

local removelistbtn = CreateFrame("Button", "MysticExtended_RemoveListBtn", MysticExtendedListFrame, "OptionsButtonTemplate");
    removelistbtn:SetPoint("TOPLEFT", 255, -41);
    removelistbtn:SetText("-")
    removelistbtn:SetSize(27, 27);
    removelistbtn:SetScript("OnClick", function() StaticPopup_Show("MYSTICEXTENDED_DELETELIST") end);
    removelistbtn:SetScript("OnEnter", function()
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetText("Remove List")
		GameTooltip:Show()
	end)
	removelistbtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

------------------ScrollFrameTooltips---------------------------
local function ItemTemplate_OnEnter(self)
    if self.link == nil then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -13, -50)
    GameTooltip:SetHyperlink(self.link)
    GameTooltip:Show()
end

local function ItemTemplate_OnLeave()
    GameTooltip:Hide()
end
---------------------ScrollFrame----------------------------------
--Check to see if the enchant is allreay on the list
local function GetSavedEnchant(id)
    for n in ipairs(MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]]) do
        if MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][n][1] == id then
            return n
        end
    end
end

local ROW_HEIGHT = 16;   -- How tall is each row?
local MAX_ROWS = 23;      -- How many rows can be shown at once?

local scrollFrame = CreateFrame("Frame", "MysticExtended_ScrollFrame", MysticExtendedListFrame);
    scrollFrame:EnableMouse(true);
    scrollFrame:SetSize(265, ROW_HEIGHT * MAX_ROWS + 16);
    scrollFrame:SetPoint("LEFT",20,-8);
    scrollFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16,
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    });

local function GetNumOfRows()
    local num = 1
    if MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]] ~= nil then
        for n in ipairs(MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]]) do
                num = num + 1
        end
    else
        num = 0
    end
    return num
end

function MysticExtended_ScrollFrameUpdate()
    local maxValue = GetNumOfRows()
	FauxScrollFrame_Update(scrollFrame.scrollBar, maxValue, MAX_ROWS, ROW_HEIGHT);
	local offset = FauxScrollFrame_GetOffset(scrollFrame.scrollBar);
	for i = 1, MAX_ROWS do
		local value = i + offset
        scrollFrame.rows[i]:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD");
		if value <= maxValue and MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][value] ~= nil then
			local row = scrollFrame.rows[i]
            local _, _, _, qualityColor = GetItemQualityColor(MYSTIC_ENCHANTS[MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][value][1]].quality)
            row:SetText(qualityColor..MYSTIC_ENCHANTS[MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][value][1]].spellName)
            row.enchantID = MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][value][1]
            row.link = MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][value][2]
			row:Show()
		else
			scrollFrame.rows[i]:Hide()
		end
	end
end

local scrollSlider = CreateFrame("ScrollFrame","MysticExtendedListFrameScroll",MysticExtended_ScrollFrame,"FauxScrollFrameTemplate");
scrollSlider:SetPoint("TOPLEFT", 0, -8)
scrollSlider:SetPoint("BOTTOMRIGHT", -30, 8)
scrollSlider:SetScript("OnVerticalScroll", function(self, offset)
    self.offset = math.floor(offset / ROW_HEIGHT + 0.5)
        MysticExtended_ScrollFrameUpdate()
end)

scrollSlider:SetScript("OnShow", function()
    MysticExtended_ScrollFrameUpdate()
end)

scrollFrame.scrollBar = scrollSlider

local rows = setmetatable({}, { __index = function(t, i)
	local row = CreateFrame("Button", "$parentRow"..i, scrollFrame)
	row:SetSize(150, ROW_HEIGHT)
	row:SetNormalFontObject(GameFontHighlightLeft)
    row:SetScript("OnClick", function()
        local item = tonumber(row.enchantID)
        local itemNum = GetSavedEnchant(item)
        if MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]][itemNum] then
            table.remove(MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]],itemNum)
        end
        MysticExtended_ScrollFrameUpdate()
    end)
    row:SetScript("OnEnter", function(self)
        ItemTemplate_OnEnter(self)
    end)
    row:SetScript("OnLeave", ItemTemplate_OnLeave)
	if i == 1 then
		row:SetPoint("TOPLEFT", scrollFrame, 8, -8)
	else
		row:SetPoint("TOPLEFT", scrollFrame.rows[i-1], "BOTTOMLEFT")
	end

	rawset(t, i, row)
	return row
end })

scrollFrame.rows = rows

function MysticExtended_CreateItemLink(id)
    local _, _, _, qualityColor = GetItemQualityColor(MYSTIC_ENCHANTS[id].quality)
    local link = qualityColor.."|Hspell:"..MYSTIC_ENCHANTS[id].spellID.."|h["..MYSTIC_ENCHANTS[id].spellName.."]|h|r"
    return link
end

hooksecurefunc("ChatEdit_InsertLink", function(link)
	local id
    if MysticExtendedOptionsFrame:IsVisible() then
        id = tonumber(link:match("item:(%d+)"))
        MysticExtendedOptions_AddIDeditbox:SetText(id);
    else
    if MysticExtendedListFrame:IsVisible() then
		
        if link:match("item:") then
            id = GetREInSlot(GetMouseFocus():GetParent():GetID(), GetMouseFocus():GetID())
            link = MysticExtended_CreateItemLink(id)
        else
            id = tonumber(link:match("spell:(%d+)"))
            id = MYSTIC_ENCHANT_SPELLS[id]
        end
            if not GetSavedEnchant(id) then
                table.insert(MysticExtendedDB["EnchantSaveLists"][MysticExtendedDB["currentSelectedList"]],{id,link})
                MysticExtended_ScrollFrameUpdate()
            end
    return true
	end
    end
end)

------------------------------------------------------------------
--Reforge button in list interface
local reforgebuttonlist = CreateFrame("Button", "MysticExtended_ListFrameReforgeButton", MysticExtendedListFrame, "OptionsButtonTemplate");
    reforgebuttonlist:SetSize(133,30);
    reforgebuttonlist:SetPoint("BOTTOMLEFT", MysticExtendedListFrame, "BOTTOMLEFT", 20, 20);
    reforgebuttonlist:SetText("Start Reforge");
    reforgebuttonlist:RegisterForClicks("LeftButtonDown", "RightButtonDown");
    reforgebuttonlist:SetScript("OnClick", function(self, btnclick, down) MysticExtended_OnClick(self,btnclick) end);
--Options button in the list interface
local optionsbuttonlist = CreateFrame("Button", "MysticExtended_ListFrameOptionsButton", MysticExtendedListFrame, "OptionsButtonTemplate");
    optionsbuttonlist:SetSize(133,30);
    optionsbuttonlist:SetPoint("BOTTOMRIGHT", MysticExtendedListFrame, "BOTTOMRIGHT", -20, 20);
    optionsbuttonlist:SetText("Options");
    optionsbuttonlist:RegisterForClicks("LeftButtonDown");
    optionsbuttonlist:SetScript("OnClick", function() MysticExtendedOptions_Toggle() end);
--Show/Hide button in main list view
local showFrameBttn = CreateFrame("Button", "MysticExtended_ShowButton", MysticEnchantingFrame, "OptionsButtonTemplate");
    showFrameBttn:SetSize(165,26);
    showFrameBttn:SetPoint("TOP", MysticEnchantingFrame, "TOP", 265, -33);
    showFrameBttn:SetScript("OnClick", function()
        if MysticExtendedListFrame:IsVisible() then
            MysticExtendedListFrame:Hide();
            MysticExtendedDB.ListFrameLastState = false;
            showFrameBttn:SetText("Show MysticExtended");
        else
            showFrameBttn:SetText("Hide MysticExtended");
            MysticExtendedListFrame:Show();
            MysticExtendedDB.ListFrameLastState = true;
        end
    end)

--Moves Ascensions xp/search/sortmenu
local meFrame = MysticEnchantingFrame
    meFrame.ProgressBar:SetPoint("TOP", meFrame.TitleText,"BOTTOM", -200, -14)
    meFrame.SearchBox:SetPoint("TOPRIGHT", meFrame, -330, -33)
    meFrame.EnchantTypeList:SetPoint("TOPRIGHT", meFrame, -200, -32)

--Show list view when Mystic Enchanting frame opens
MysticEnchantingFrame:HookScript("OnShow",
        function()
            if MysticExtendedDB.ListFrameLastState then
                MysticExtendedListFrame:Show();
                showFrameBttn:SetText("Hide MysticExtended");
            else
                MysticExtendedListFrame:Hide();
                showFrameBttn:SetText("Show MysticExtended");
            end
        end)
--Hide it when it closes
MysticEnchantingFrame:HookScript("OnHide",
        function()
        MysticExtendedListFrame:Hide();
        end)
