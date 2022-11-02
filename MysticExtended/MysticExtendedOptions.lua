
function MysticExtendedOptions_Toggle()
    if InterfaceOptionsFrame:IsVisible() then
		InterfaceOptionsFrame:Hide();
	else
		InterfaceOptionsFrame_OpenToCategory("MysticExtended");
	end
end

local function MysticExtendedOptions_Menu_OnClick()
    local thisID = this:GetID();
	UIDropDownMenu_SetSelectedID(MysticExtendedOptions_Menu, thisID);

end

local function MysticExtendedOptions_Menu_Initialize()
    local info;
	for k,v in pairs(MysticExtendedDB["ReRollItems"]) do
				info = {
					text = GetItemInfo(MysticExtendedDB["ReRollItems"][k]);
					func = MysticExtendedOptions_Menu_OnClick;
				};
					UIDropDownMenu_AddButton(info);
	end
end

function MysticExtended_DropDownInitialize()
	--Setup for Dropdown menus in the settings
	UIDropDownMenu_Initialize(MysticExtendedOptions_Menu, MysticExtendedOptions_Menu_Initialize);
	UIDropDownMenu_SetSelectedID(MysticExtendedOptions_Menu,1);
	UIDropDownMenu_SetWidth(MysticExtendedOptions_Menu, 150);
end

local function AddIdButton()
	local function checkID(text)
		for i,v in pairs(MysticExtendedDB["ReRollItems"]) do
			if v == text then
				return true;
			end
		end
	end
	local text = tonumber(MysticExtendedOptions_AddIDeditbox:GetText());
	if not checkID(text) and GetItemInfo(text) then
		table.insert(MysticExtendedDB["ReRollItems"],text)
	end
end

local function DeleteIdButton()
	local id = UIDropDownMenu_GetSelectedID(MysticExtendedOptions_Menu);
	table.remove(MysticExtendedDB["ReRollItems"],id)
	MysticExtendedOptions_Menu_Initialize();
	UIDropDownMenu_SetSelectedID(MysticExtendedOptions_Menu,1);
	UIDropDownMenu_SetText(MysticExtendedOptions_Menu,GetItemInfo(MysticExtendedDB["ReRollItems"][1]));
end

--Creates the options frame and all its assets
InterfaceOptionsFrame:SetWidth(850)
local mainframe = {};
		mainframe = CreateFrame("FRAME", "MysticExtendedOptionsFrame", InterfaceOptionsFrame, nil);
    	local fstring = mainframe:CreateFontString(mainframe, "OVERLAY", "GameFontNormal");
		fstring:SetText("MysticExtended Settings");
		fstring:SetPoint("TOPLEFT", 15, -15)
		mainframe.name = "MysticExtended";
		InterfaceOptions_AddCategory(mainframe);

local menuDrop = CreateFrame("Button", "MysticExtendedOptions_Menu", MysticExtendedOptionsFrame, "UIDropDownMenuTemplate");
	menuDrop:SetPoint("TOPLEFT", 0, -60);
	menuDrop.Lable = menuDrop:CreateFontString(nil , "BORDER", "GameFontNormal")
	menuDrop.Lable:SetJustifyH("LEFT")
	menuDrop.Lable:SetPoint("TOPLEFT", menuDrop, "TOPLEFT", 20, 20)
	menuDrop.Lable:SetText("List of item's to roll on")
	menuDrop:SetScript("OnClick", MysticExtendedOptions_Menu_OnClick);

	local addTextBox = CreateFrame("EditBox", "MysticExtendedOptions_AddIDeditbox", MysticExtendedOptionsFrame, "InputBoxTemplate");
	addTextBox:SetPoint("TOPLEFT", 23, -90);
	addTextBox:SetSize(162,30);
	addTextBox:SetText("Shift Click to add items");
	addTextBox:SetAutoFocus(false);

	local addBtn = CreateFrame("Button", "MysticExtendedOptions_AddID", MysticExtendedOptionsFrame, "OptionsButtonTemplate");
	addBtn:SetPoint("TOPLEFT", 190, -95);
	addBtn:SetSize(110,20);
	addBtn:SetText("Add item")
	addBtn:SetScript("OnClick", function() AddIdButton() end);

	local removeBtn = CreateFrame("Button", "MysticExtendedOptions_RemoveID", MysticExtendedOptionsFrame, "OptionsButtonTemplate");
	removeBtn:SetPoint("TOPLEFT", 190, -60);
	removeBtn:SetSize(110,20);
	removeBtn:SetText("Delete item")
	removeBtn:SetScript("OnClick", function() DeleteIdButton() end);

	local delaySlider = CreateFrame("Slider", "MysticExtended_DelaySlider", MysticExtendedOptionsFrame, "OptionsSliderTemplate")
	delaySlider:SetPoint("TOPLEFT", 20, -135);
	delaySlider:SetSize(160,20);
	delaySlider:SetOrientation("HORIZONTAL");
	delaySlider:SetMinMaxValues(1, 10);
	delaySlider:SetValueStep(1);
	delaySlider.Lable = delaySlider:CreateFontString(nil , "BORDER", "GameFontNormal");
	delaySlider.Lable:SetJustifyH("LEFT");
	delaySlider.Lable:SetPoint("BOTTOM", delaySlider, "BOTTOM", 0, -10);
	delaySlider.Lable:SetText("ReRoll Delay");
	delaySlider.tooltipText = "Change Delay if you keep getting Ability not ready yet" --Creates a tooltip on mouseover.
	getglobal(delaySlider:GetName() .. 'Low'):SetText('.1'); --Sets the left-side slider text (default is "Low").
	getglobal(delaySlider:GetName() .. 'High'):SetText('.10'); --Sets the right-side slider text (default is "High").
	delaySlider:SetScript("OnValueChanged", function()
		MysticExtendedDB["REFORGE_RETRY_DELAY"] = delaySlider:GetValue();
		getglobal(delaySlider:GetName() .. 'Text'):SetText(tonumber("."..delaySlider:GetValue()));
	end);

	local hideFloat = CreateFrame("CheckButton", "MysticExtendedOptions_FloatSetting", MysticExtendedOptionsFrame, "UICheckButtonTemplate");
	hideFloat:SetPoint("TOPLEFT", 15, -170);
	hideFloat.Lable = hideFloat:CreateFontString(nil , "BORDER", "GameFontNormal");
	hideFloat.Lable:SetJustifyH("LEFT");
	hideFloat.Lable:SetPoint("LEFT", 30, 0);
	hideFloat.Lable:SetText("Show/Hide Floating Button");
	hideFloat:SetScript("OnClick", function() MysticExtended:ButtonEnable() end);