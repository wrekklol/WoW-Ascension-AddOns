--[[
Atlasloot Enhanced
Author Daviesh
Loot browser associating loot with instance bosses
Can be integrated with Atlas (http://www.atlasmod.com)

Functions:
AtlasLoot:HideFilteredItems()
AtlasLoot_FilterEnableButton()
<local> CreateCheckButton(parrent, text, num)
AtlasLoote_CreateFilterOptions()

]]
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

AtlasLoot_FilterMenu = AceLibrary("Dewdrop-2.0");
AtlasLoot_SetFiltersMenu = AceLibrary("Dewdrop-2.0");

local FilterTable = {
	{
		Name = AL["Armor Type"],
		Type = "ArmorType",
        {"Cloth", "Cloth"},
        {"Leather", "Leather"},
        {"Mail", "Mail"},
        {"Plate", "Plate"},
    },
    {
		Name = AL["Weapons"],
		Type = "InvType",
		{"One-Hand", "INVTYPE_WEAPON"},
		{"Two-Hand", "INVTYPE_2HWEAPON"},
        {"Main Hand", "INVTYPE_WEAPONMAINHAND"},
		{"Off Hand", "INVTYPE_WEAPONOFFHAND"},
		{"Caster Off Hand", "INVTYPE_HOLDABLE"},
        {"Ranged", "INVTYPE_RANGED"},
		{"Thrown", "INVTYPE_THROWN"},
		{"Relic", "INVTYPE_RELIC"},
		{"Shield", "INVTYPE_SHIELD"}
	},
	{
		Name = AL["Accessories"],
		Type = "InvType",
		{"Necklace", "INVTYPE_NECK"},
		{"Back", "INVTYPE_CLOAK"},
		{"Ring", "INVTYPE_FINGER"},
        {"Trinket", "INVTYPE_TRINKET"}
	},
	{
		Name = AL["Secondary Stats"],
		Type = "Stat",
		{"Crit", "ITEM_MOD_CRIT_RATING_SHORT"},
		{"Hit", "ITEM_MOD_HIT_RATING_SHORT"},
		{"Haste", "ITEM_MOD_HASTE_RATING_SHORT"},
		{"Expertise", "ITEM_MOD_EXPERTISE_RATING_SHORT"},
		{"Armor Pen", "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"},
		{"Spell Pen", "ITEM_MOD_SPELL_PENETRATION_SHORT"}
	},
	{
		Name = AL["Primary Stats"],
		Type = "PrimaryStat",
		{"Strength", "ITEM_MOD_STRENGTH_SHORT"},
		{"Agility", "ITEM_MOD_AGILITY_SHORT"},
		{"Intellect", "ITEM_MOD_INTELLECT_SHORT"},
		{"Spirit", "ITEM_MOD_SPIRIT_SHORT"},
		{"Attack Power", "ITEM_MOD_ATTACK_POWER_SHORT"},
		{"Spell Power", "ITEM_MOD_SPELL_POWER_SHORT"}
	},
	{
		Name = AL["Defensive Stats"],
		Type = "Stat",
		{"Defense", "ITEM_MOD_DEFENSE_SKILL_RATING_SHORT"},
		{"Dodge", "ITEM_MOD_DODGE_RATING_SHORT"},
		{"Parry", "ITEM_MOD_PARRY_RATING_SHORT"},
		{"Block", "ITEM_MOD_BLOCK_RATING_SHORT"},
		{"Block Value", "ITEM_MOD_BLOCK_VALUE_SHORT"},
		{"Resilience", "ITEM_MOD_RESILIENCE_RATING"}
	},
}

-- **********************************************************************
-- ItemFilter:
--	AtlasLoot:HideFilteredItems()
--	AtlasLoot_FilterEnableButton()
-- **********************************************************************
AtlasLootFilter = {};
AtlasLootFilter["FilterList"] = {};

function AtlasLoot:HideFilteredItems()
	local dataID, dataSource, tablenum = AtlasLootItemsFrame.refreshFilter[1], _G[AtlasLootItemsFrame.refreshFilter[2]], AtlasLootItemsFrame.refreshFilter[3];
 	local tablebase = dataSource[dataID][tablenum]
	if not tablebase or dataID == "WishList" or dataID == "SearchResult" or AtlasLootCharDB.SelectedFilter == nil then return end
	AtlasLootFilter["FilterList"] = {};
	AtlasLootFilter["FilterList"].Type = dataSource[dataID].Type;
	AtlasLootFilter["FilterList"].Name = dataSource[dataID].Name;
	AtlasLootFilter["FilterList"].Back = dataSource[dataID].Back;
	AtlasLootFilter["FilterList"].Map = dataSource[dataID].Map;
	AtlasLootFilter["FilterList"][1] = {Name = dataSource[dataID][tablenum].Name};

	local function getStats(itemID,sType)
		for i,v in pairs(AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter]) do
			if type(v) == "table" then
				if v[1] and v[3] == sType then
					local ItemStats = {};
					GetItemStats(select(2,GetItemInfo(itemID)), ItemStats);
					if ItemStats[v[2]] then
						return true;
					end
				end
			end
		end
	end

	local function checkNofilter(itemID, filter)
		if getStats(itemID,filter) then return true end;
		for i,v in pairs(AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter]) do
			for n,t in ipairs(FilterTable) do
				if t.Type == filter and v[1] then
					return true;
				end
			end
		end
	end

	local count = 0
	local function getFilterType(itemID)
		local filterSelect3, filterSelect2,_ , filterSelect1 = select(6,GetItemInfo(itemID));
		local filter1 = AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][filterSelect1];
		local filter2 = AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][filterSelect2];

		if 	(filter1 and filter1[1] and filter1[3] == "InvType" and getStats(itemID,"PrimaryStat") and checkNofilter(itemID, "Stat")) or
			(filter2 and filter2[1] and filter2[3] == "ArmorType" and getStats(itemID,"PrimaryStat") and checkNofilter(itemID, "Stat"))
		then
			return true;
		else
			for _,v in pairs(FilterTable) do
				for _,t in ipairs(v) do
					if t[2] == filterSelect1 or t[2] == filterSelect2 or t[2] == filterSelect3 then
						return false;
					end
				end
			end
			return true;
		end
	end
	for i,v in ipairs(tablebase) do
		if getFilterType(v[2]) or v[2] == 0 then
			if v[1] == 16 then
				count = 0;
			end
			table.insert(AtlasLootFilter["FilterList"][1],{v[1] - count,v[2],v[3],v[4],v[5],v[6],v[7],v[8]});
		elseif v[1] == 16 then
			count = 1
		else
			count = count + 1;
		end
	end

	AtlasLoot:ShowItemsFrame("FilterList", "AtlasLootFilter", 1)
end

function AtlasLoot_FilterEnableButton(self, btnclick)
	if btnclick == "RightButton" then
		if AtlasLoot_FilterMenu:IsOpen() then
			AtlasLoot_FilterMenu:Close();
		else
			AtlasLoot_FilterMenu:Unregister(AtlasLootFilterCheck);
			AtlasLoot:FilterMenuRegister();
			AtlasLoot_FilterMenu:Open(self);
		end
		if AtlasLootFilterCheck:GetChecked() then
			AtlasLootFilterCheck:SetChecked(false);
		else
			AtlasLootFilterCheck:SetChecked(true);
		end
	else
		if ATLASLOOT_FILTER_ENABLE then
			ATLASLOOT_FILTER_ENABLE = false;
			AtlasLoot:ShowItemsFrame(AtlasLootItemsFrame.refreshFilter[1], AtlasLootItemsFrame.refreshFilter[2], AtlasLootItemsFrame.refreshFilter[3]);
		else
			ATLASLOOT_FILTER_ENABLE = true
			AtlasLoot:HideFilteredItems();
		end
	end
end

--[[
AtlasLoot:FilterMenuRegister:
Constructs the Filter menu.
]]
function AtlasLoot:FilterMenuRegister()
	AtlasLoot_FilterMenu:Register(AtlasLootFilterCheck,
		'point', function(parent)
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
				for i,v in ipairs(AtlasLootFilterDB["FilterLists"]) do
					local setFilter = false;
					if AtlasLootCharDB.SelectedFilter == i then setFilter = true end
					AtlasLoot_FilterMenu:AddLine(
						"text", v.Name,
						"func", function()
							AtlasLootCharDB.SelectedFilter = i;
							AtlasLoot_FilterMenu:Close();
						end,
						"checked", setFilter
					);
				end
				AtlasLoot_FilterMenu:AddLine(
					"text", AL["Add Filter Set"],
					"func", function() AtlasLoot:OpenFilterCreate() end,
					"notCheckable", true
				);
				--Close button
				AtlasLoot_FilterMenu:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_FilterMenu:Close() end,
					'notCheckable', true
				);
			end,
			'dontHook', true
		)
end

--Sets all the filter check boxs for current filter
local function setFilterChecks()
	local filterList = AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter];
	local count = 1;
	for i,v in ipairs(FilterTable) do
		count = count + 1;
		for n,t in ipairs(v) do
			if filterList[t[2]] and filterList[t[2]][1] then
				_G["AtlasLootFilterButton_"..count]:SetChecked(true);
			else
				_G["AtlasLootFilterButton_"..count]:SetChecked(false);
			end
			count = count + 1;
		end
	end
end

local function setFilter(arg1,type)
	if AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][arg1] and AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][arg1][1] then
		AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][arg1] = {false,arg1,type};
	else
		AtlasLootFilterDB["FilterLists"][AtlasLootCharDB.SelectedFilter][arg1] = {true,arg1,type};
	end
end

function AtlasLoot:HideFilterCreateButtons()
	if not ATLASLOOT_BUILD_FILTER_LIST then return end
	for i=1, 41 do
		_G["AtlasLootFilterButton_"..i]:Hide();
	end
	AtlasLootFilterSelect:Hide();
	AtlasLootFilterCreate:Hide();
	AtlasLootFilterDelete:Hide();
end

-- **********************************************************************
-- Options:
--	AtlasLoot:HideFilteredItems()
-- **********************************************************************
ATLASLOOT_BUILD_FILTER_LIST = false;
-- Place to add new or edit existing filter lists
function AtlasLoot:OpenFilterCreate()
	if not ATLASLOOT_BUILD_FILTER_LIST then
		ATLASLOOT_BUILD_FILTER_LIST = true;
		local count = 1;
		for i,v in ipairs(FilterTable) do
			local filterCatLable = AtlasLootItemsFrame:CreateFontString("AtlasLootFilterButton_"..count,"OVERLAY","GameFontNormal");
			filterCatLable:SetText(v.Name);
			filterCatLable:Show();
			if count == 1 then
				filterCatLable:SetPoint("TOP", "AtlasLootItemsFrame", "TOP",-150,-90);
			elseif count == 16 then
				filterCatLable:SetPoint("TOP", "AtlasLootItemsFrame", "TOP",0,-90);
			elseif count == 28 then
				filterCatLable:SetPoint("TOP", "AtlasLootItemsFrame", "TOP",150,-90);
			else
				filterCatLable:SetPoint("LEFT", "AtlasLootFilterButton_"..(count - 1), "LEFT",0,-25);
			end
			count = count + 1;
			for n,t in ipairs(v) do
				local button = CreateFrame("CheckButton", "AtlasLootFilterButton_"..count, AtlasLootItemsFrame, "OptionsCheckButtonTemplate");
					_G["AtlasLootFilterButton_"..count.."Text"]:SetText(t[1]);
					button:SetScript("OnClick", function() setFilter(t[2],v.Type) end)
					if n == 1 then
						button:SetPoint("LEFT", "AtlasLootFilterButton_"..(count - 1), "LEFT",0,-25);
					else
						button:SetPoint("LEFT", "AtlasLootFilterButton_"..(count - 1), "LEFT",0,-20);
					end
					count = count + 1;
				end
		end

		local filterSelectButton = CreateFrame("Button", "AtlasLootFilterSelect", AtlasLootItemsFrame, "UIDropDownMenuTemplate");
			filterSelectButton:SetSize(190,24);
			filterSelectButton:SetPoint("Top", "AtlasLootItemsFrame", "TOP",-110,-35);

		local createFilterButton = CreateFrame("Button", "AtlasLootFilterCreate", AtlasLootItemsFrame, "OptionsButtonTemplate");
			createFilterButton:SetSize(130,20);
			createFilterButton:SetPoint("LEFT", "AtlasLootItemsFrame_BACK", "LEFT",-150,0);
			createFilterButton:SetText(AL["Add/Edit Filter"]);
			createFilterButton:SetScript("OnClick", function(self) StaticPopup_Show("ATLASLOOT_ADD_FILTER_LIST") end);

		local deleteFilterButton = CreateFrame("Button", "AtlasLootFilterDelete", AtlasLootItemsFrame, "OptionsButtonTemplate");
			deleteFilterButton:SetSize(130,20);
			deleteFilterButton:SetPoint("RIGHT", "AtlasLootItemsFrame_BACK", "RIGHT",150,0);
			deleteFilterButton:SetText(AL["Delete Filter"]);
			deleteFilterButton:SetScript("OnClick", function(self) StaticPopup_Show("ATLASLOOT_DELETE_FILTERLIST") end);
	end
	UIDropDownMenu_Initialize(AtlasLootFilterSelect, AtlasLoot.FilterSelectorMenuInitialize);
	UIDropDownMenu_SetSelectedID(AtlasLootFilterSelect, AtlasLootCharDB.SelectedFilter);

	setFilterChecks();

	for i=1,41 do
		_G["AtlasLootFilterButton_"..i]:Show();
	end
	AtlasLootFilterSelect:Show();
	AtlasLootFilterCreate:Show();
	AtlasLootFilterDelete:Show();

	--Ditch the Quicklook selector
	AtlasLootQuickLooksButton:Hide();
	-- Hide the Filter Check-Box
	AtlasLootFilterCheck:Hide();
	--Hide navigation buttons by default, only show what we need
	_G["AtlasLootItemsFrame_BACK"]:Show();
	_G["AtlasLootItemsFrame_NEXT"]:Hide();
	_G["AtlasLootItemsFrame_PREV"]:Hide();
	--Hide UI objects so that only needed ones are shown
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i.."_Unsafe"]:Hide();
		_G["AtlasLootItem_"..i]:Hide();
		_G["AtlasLootItem_"..i].itemID = 0;
		_G["AtlasLootItem_"..i].spellitemID = 0;
	end
	--Set Page Title
	AtlasLoot_BossName:SetText("Create Filter Set");
	AtlasLoot_FilterMenu:Close();
end

local function FilterSelectOnClick()
	AtlasLootCharDB.SelectedFilter = this:GetID();
	UIDropDownMenu_SetSelectedID(AtlasLootFilterSelect, AtlasLootCharDB.SelectedFilter);
	setFilterChecks();
end

function AtlasLoot:FilterSelectorMenuInitialize()
	for i,v in ipairs(AtlasLootFilterDB["FilterLists"]) do
		local info = {
			text = v.Name;
			func = FilterSelectOnClick;
		};
		UIDropDownMenu_AddButton(info);
	end
end

--[[
StaticPopupDialogs["ATLASLOOT_ADD_FILTER_LIST"]
This is shown, if you want too add a add/edit a filter list
]]
StaticPopupDialogs["ATLASLOOT_ADD_FILTER_LIST"] = {
	text = "Filter Name",
	button1 = "Add Filter",
	button3 = "Edit Filter",
	button2 = AL["Cancel"],
	OnShow = function(self)
		self.editBox:SetText(UIDropDownMenu_GetText(AtlasLootFilterSelect))
		self:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function(self)
		local text = self.editBox:GetText();
		table.insert(AtlasLootFilterDB["FilterLists"],AtlasLoot:CloneTable(AtlasLootFilterDB["FilterLists"][UIDropDownMenu_GetSelectedID(AtlasLootFilterSelect)]));
		AtlasLootFilterDB["FilterLists"][#AtlasLootFilterDB["FilterLists"]].Name = text;
		UIDropDownMenu_SetSelectedID(AtlasLootFilterSelect,#AtlasLootFilterDB["FilterLists"]);
		UIDropDownMenu_SetText(AtlasLootFilterSelect,text);
	end,
	OnButton3 = function(self)
		local text = self.editBox:GetText();
		AtlasLootFilterDB["FilterLists"][UIDropDownMenu_GetSelectedID(AtlasLootFilterSelect)].Name = self.editBox:GetText();
		UIDropDownMenu_SetText(AtlasLootFilterSelect,text);
	end,
	hasEditBox = 1,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

--[[
StaticPopupDialogs["ATLASLOOT_DELETE_FILTERLIST"]
This is shown, if you want too delete a filter list
]]
StaticPopupDialogs["ATLASLOOT_DELETE_FILTERLIST"] = {
	text = AL["Delete Filter"],
	button1 = AL["Delete"],
	button2 = AL["Cancel"],
	OnShow = function()
		this:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function()
		table.remove(AtlasLootFilterDB["FilterLists"],UIDropDownMenu_GetSelectedID(AtlasLootFilterSelect));
		UIDropDownMenu_SetSelectedID(AtlasLootFilterSelect,1);
		UIDropDownMenu_SetText(AtlasLootFilterSelect,UIDropDownMenu_GetText(AtlasLootFilterSelect));
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};