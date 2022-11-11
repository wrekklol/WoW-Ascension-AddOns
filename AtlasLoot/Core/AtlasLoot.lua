--[[
Atlasloot Enhanced
Author Daviesh / Reworked by Deim of PrimalWoW / Reworked again for Ascension
Loot browser associating loot with instance bosses
Can be integrated with Atlas (http://www.atlasmod.com)

Functions:
AtlasLoot_OnEvent(event)
AtlasLoot_ShowMenu()
AtlasLoot_OnVariablesLoaded()
AtlasLoot_SlashCommand(msg)
AtlasLootOptions_Toggle()
AtlasLoot_OnLoad()
AtlasLoot:ShowItemsFrame()
AtlasLoot:NavButton_OnClick()
AtlasLoot:IsLootTableAvailable(dataID)
AtlasLoot:LoadAllModules()
AtlasLoot:ShowQuickLooks(button)
AtlasLoot:RefreshQuickLookButtons()
AtlasLoot:AddTooltip(frameb, tooltiptext)
AtlasLoot:FindId(name, difficulty)
]]

AtlasLoot = LibStub("AceAddon-3.0"):NewAddon("AtlasLoot", "AceEvent-3.0", "AceTimer-3.0")

--Instance required libraries
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

--Establish version number and compatible version of Atlas
local VERSION_MAJOR = "5";
local VERSION_MINOR = "11";
local VERSION_BOSSES = "04";
ATLASLOOT_VERSION = "|cffFF8400AtlasLoot Ascension Edition|r";
--Now allows for multiple compatible Atlas versions.  Always put the newest first
ATLASLOOT_CURRENT_ATLAS = {"1.17.1", "1.17.0"};
ATLASLOOT_PREVIEW_ATLAS = {"1.17.3", "1.17.2"};

ATLASLOOT_POSITION = AL["Position:"];
ATLASLOOT_DEBUGMESSAGES = false;

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "   ";

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropExpansionMenu = AceLibrary("Dewdrop-2.0");
--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false;
ATLASLOOT_FILTER_ENABLE = false;
ATLASLOOT_CURRENTTYPE = "Default";
ATLASLOOT_TYPE = {};
ATLASLOOT_BACKENABLED = false;

-- Colours stored for code readability
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

--Search panel open and close save variables
--dataID, dataSource, pFrame, tablenumber
SearchPrevData = {"", "", ""};

AtlasLootCharDB = {};
AtlasLoot_TokenData = {};


local AtlasLootDBDefaults = {
    profile = {
        SavedTooltips = {},
        SafeLinks = true,
        DefaultTT = true,
        LootlinkTT = false,
        ItemSyncTT = false,
        EquipCompare = false,
        Opaque = false,
        ItemIDs = false,
        ItemSpam = false,
        MinimapButton = false,
        FuBarAttached = true,
        FuBarText = true,
        FuBarIcon = true,
        LastBoss = "EmptyTable",
        AtlasLootVersion = "1",
        AtlasNaggedVersion = "",
        FuBarPosition = 1,
        LoadAllLoDStartup = false,
        PartialMatching = true,
        LootBrowserStyle = 1,
        MinimapButtonAngle = 240,
        MinimapButtonRadius = 75,
        LootBrowserScale = 1.0,
        SearchOn = {
            All = true,
        },
        AtlasType = "Release";
    }
}

-- Popup Box for first time users
StaticPopupDialogs["ATLASLOOT_SETUP"] = {
  text = AL["Welcome to Atlasloot Enhanced.  Please take a moment to set your preferences."],
  button1 = AL["Setup"],
  OnAccept = function()
	  AtlasLootOptions_Toggle();
  end,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = 1
};

--[[
AtlasLoot_ShowMenu:
Legacy function used in Cosmos integration to open the loot browser
]]
function AtlasLoot_ShowMenu()
	AtlasLootDefaultFrame:Show();
end

--[[
AtlasLoot_OnVariablesLoaded:
Invoked by the VARIABLES_LOADED event.  Now that we are sure all the assets
the addon needs are in place, we can properly set up the mod
]]
function AtlasLoot:OnEnable()
    AtlasLoot.db = LibStub("AceDB-3.0"):New("AtlasLootDB");
    AtlasLoot.db:RegisterDefaults(AtlasLootDBDefaults);
	if not AtlasLootCharDB then AtlasLootCharDB = {} end
    if not AtlasLootCharDB["QuickLooks"] then AtlasLootCharDB["QuickLooks"] = {} end
	if not AtlasLootCharDB.SelectedFilter then AtlasLootCharDB.SelectedFilter = 1 end
	if not AtlasLootCharDB["SearchResult"] then AtlasLootCharDB["SearchResult"] = {Name = "Search Result" , Type = "Search", Back = true}; end
	if not AtlasLootFilterDB then AtlasLootFilterDB = {["FilterLists"] = {{Name = "Default" }}} end;
	if AtlasLootFilterDB and not AtlasLootFilterDB["FilterLists"] then AtlasLootFilterDB = {["FilterLists"] = {{Name = "Default" }}} end;
    if AtlasLoot_Data then
        AtlasLoot_Data["EmptyTable"] = {
			Name = AL["Select a Loot Table..."];
			{Name = AL["Select a Loot Table..."]};
		};
    end

	if IsAddOnLoaded("Atlas") then
		AtlasLoot:LoadMapData();
		ATLASLOOT_ATLASLOADED = true;
		AtlasLootDefaultFrame_MapButton:Enable();
		AtlasLootDefaultFrame_MapSelectButton:Enable();
	end

    --Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootDefaultFrame");
	--Set up options frame
	AtlasLootOptions_OnLoad();
    AtlasLoot_CreateOptionsInfoTooltips();
    --Set visual style for the loot browser
    if( AtlasLoot.db.profile.LootBrowserStyle == 1 ) then
        AtlasLoot:SetNewStyle("new");
    else
        AtlasLoot:SetNewStyle("old");
    end
	--Disable options that don't have the supporting mods
	if( not LootLink_SetTooltip and (AtlasLoot.db.profile.LootlinkTT == true)) then
		AtlasLoot.db.profile.LootlinkTT = false;
		AtlasLoot.db.profile.DefaultTT = true;
	end
	if( not ItemSync and (AtlasLoot.db.profile.ItemSyncTT == true)) then
		AtlasLoot.db.profile.ItemSyncTT = false;
		AtlasLoot.db.profile.DefaultTT = true;
	end
	--If using an opaque items frame, change the alpha value of the backing texture
	if (AtlasLoot.db.profile.Opaque) then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1);
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65);
	end

	AtlasLootItemsFrame:Hide();

	if((AtlasLootCharDB.AtlasLootVersion == nil) or (tonumber(AtlasLootCharDB.AtlasLootVersion) < 40301)) then
		AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
		AtlasLootOptions_Init();
	end
	--Adds an AtlasLoot button to the Feature Frame in Cosmos
	if(EarthFeature_AddButton) then
		EarthFeature_AddButton(
			{
				id = string.sub(ATLASLOOT_VERSION, 11, 28);
				name = string.sub(ATLASLOOT_VERSION, 11, 28);
				subtext = string.sub(ATLASLOOT_VERSION, 30, 39);
				tooltip = "";
				icon = "Interface\\Icons\\INV_Box_01";
				callback = AtlasLoot_ShowMenu;
				test = nil;
			}
	);
	--Adds AtlasLoot to old style Cosmos installations
	elseif(Cosmos_RegisterButton) then
		Cosmos_RegisterButton(
			string.sub(ATLASLOOT_VERSION, 11, 28),
			string.sub(ATLASLOOT_VERSION, 11, 28),
			"",
			"Interface\\Icons\\INV_Box_01",
			AtlasLoot_ShowMenu
		);
	end
	--Set up the menu in the loot browser
	AtlasLoot:DewdropRegister();
	AtlasLoot:DewdropExpansionMenuRegister();
	--If EquipCompare is available, use it
	if((EquipCompare_RegisterTooltip) and (AtlasLoot.db.profile.EquipCompare == true)) then
		EquipCompare_RegisterTooltip(AtlasLootTooltip);
	end

	if (AtlasLoot.db.profile.LoadAllLoDStartup == true) then
		AtlasLoot:LoadAllModules();
	else
		collectgarbage("collect");
	end
    panel = _G["AtlasLootOptionsFrame"];
    panel.name=AL["AtlasLoot"];
    InterfaceOptions_AddCategory(panel);
    --Filter and wishlist options menus creates as part of the next 2 commands
	AtlasLoot_CreateWishlistOptions();
    panel = _G["AtlasLootHelpFrame"];
    panel.name=AL["Help"];
    panel.parent=AL["AtlasLoot"];
    InterfaceOptions_AddCategory(panel);
    if LibStub:GetLibrary("LibAboutPanel", true) then
        LibStub("LibAboutPanel").new(AL["AtlasLoot"], "AtlasLoot");
    end
    AtlasLoot_UpdateLootBrowserScale();
	local playerName = UnitName("player");
	-- Is wishlist item disabled on load or not
	if AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] then
		AtlasLootItemsFrame_Wishlist_UnLock:Disable();
	else
		AtlasLootItemsFrame_Wishlist_UnLock:Enable();
	end
	AtlasLoot:LoadItemIDsDatabase();
end

function AtlasLoot_Reset(data)
    AtlasLootDefaultFrame:Hide();
    if data == "frames" then
		AtlasLootDefaultFrame:ClearAllPoints();
		AtlasLootDefaultFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
        if AtlasLootFu then
            AtlasLootFu.db.profile.minimapPosition = 200;
            AtlasLootFu:Hide();
            AtlasLootFu:Show();
        end
        AtlasLoot.db.profile.LootBrowserScale = 1.0;
        AtlasLoot_UpdateLootBrowserScale();
    elseif data == "quicklooks" then
        AtlasLootCharDB["QuickLooks"] = {};
        AtlasLoot:RefreshQuickLookButtons();
    elseif data == "wishlist" then
		AtlasLootWishList = {};
		AtlasLoot:WishlistSetup();
        AtlasLootCharDB["SearchResult"] = {};
        AtlasLootCharDB.LastSearchedText = "";
    elseif data == "all" then
		AtlasLootDefaultFrame:ClearAllPoints();
		AtlasLootDefaultFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
        if AtlasLootFu then
            AtlasLootFu.db.profile.minimapPosition = 200;
            AtlasLootFu:Hide();
            AtlasLootFu:Show();
        end
        AtlasLoot.db.profile.LootBrowserScale = 1.0;
        AtlasLoot_UpdateLootBrowserScale();
        AtlasLootCharDB["QuickLooks"] = {};
        AtlasLoot:RefreshQuickLookButtons();
        AtlasLootCharDB["SearchResult"] = {};
        AtlasLootCharDB.LastSearchedText = "";
		AtlasLootWishList = {};
		AtlasLoot:WishlistSetup();
    end
    DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["Reset complete!"]);
end


--[[
AtlasLoot_SlashCommand(msg):
msg - takes the argument for the /atlasloot command so that the appropriate action can be performed
If someone types /atlasloot, bring up the options box
]]
function AtlasLoot_SlashCommand(msg)
	if msg == AL["reset"] then
		AtlasLoot_Reset("frames");
	elseif msg == AL["options"] then
		AtlasLootOptions_Toggle();
	else
		AtlasLootDefaultFrame:Show();
	end
end

--[[
AtlasLootOptions_Toggle:
Toggle on/off the options window
]]
function AtlasLootOptions_Toggle()
    if InterfaceOptionsFrame_OpenToCategory then
	    InterfaceOptionsFrame_OpenToCategory(AL["AtlasLoot"]);
    else
        InterfaceOptionsFrame_OpenToFrame(AL["AtlasLoot"]);
    end
    InterfaceOptionsFrame:SetFrameStrata("DIALOG");
    if(AtlasLoot.db.profile.DefaultTT == true) then
		AtlasLootOptions_DefaultTTToggle();
	elseif(AtlasLoot.db.profile.LootlinkTT == true) then
		AtlasLootOptions_LootlinkTTToggle();
	elseif(AtlasLoot.db.profile.ItemSyncTT == true) then
		AtlasLootOptions_ItemSyncTTToggle();
    end
end

--[[
AtlasLoot_OnLoad:
Performs inital setup of the mod and registers it for further setup when
the required resources are in place
]]
function AtlasLoot:OnInitialize()
	--Enable the use of /al or /atlasloot to open the loot browser
	SLASH_ATLASLOOT1 = "/atlasloot";
	SLASH_ATLASLOOT2 = "/al";
	SlashCmdList["ATLASLOOT"] = function(msg)
		AtlasLoot_SlashCommand(msg);
	end

	--Sets the default loot tables for the current expansion enabled on the server.
	local xpaclist = {"CLASSIC", "TBC", "WRATH"};
	AtlasLoot_Expac = xpaclist[GetAccountExpansionLevel()+1];

end

function AtlasLoot:CleandataID(newID, listnum)
	local cleanlist = {	[1] = {"CLASSIC", "TBC", "WRATH"} };
	for i = 1, #cleanlist[listnum] do
		newID = gsub(newID, cleanlist[listnum][i], "");
	end
	return newID;
end

--Creates tables for raid tokens from the collections tables
function AtlasLoot:CreateToken(dataID)
	local itemType, slotType, itemName, itemType2
	--orginal dataID
	local orgID = dataID;
	--list of item types to find
	local names = { {"HEAD", "INVTYPE_HEAD", "Head"}, {"SHOULDER", "INVTYPE_SHOULDER", "Shoulders"}, {"CHEST", "INVTYPE_CHEST", "Chest", "INVTYPE_ROBE"}, {"WRIST", "INVTYPE_WRIST", "Wrists"}, {"HAND", "INVTYPE_HAND", "Hands"}, {"WAIST", "INVTYPE_WAIST", "Waist"}, {"LEGS", "INVTYPE_LEGS", "Legs"}, {"FEET", "INVTYPE_FEET", "Feet"}, {"FINGER", "INVTYPE_FINGER", "Rings"}};
	--finds the item type to create a list of
	for a, b in pairs(names) do
		dataID = gsub(dataID, b[1], "");
		slotType = gsub(orgID, dataID, "");
		if slotType == b[1] then
			itemType = b[2];
			itemType2 = b[4];
			itemName = b[3];
			break;
		end
	end
	--Creates data set of the item type
	if (AtlasLoot_TokenData[orgID] == nil) then
		AtlasLoot_TokenData[orgID] = {
			Name = itemName;
			Type = AtlasLoot_Data[dataID].Type;
			Back = true;
			NoSubt = true;
			[1] = { Name = itemName };
		};
	end
	--Fills table with items
	local count = #AtlasLoot_Data[dataID][1] * #AtlasLoot_Data[dataID];
	for n, t in ipairs(AtlasLoot_Data[dataID]) do
		for c, v in ipairs(t) do
			if type(v) == "table" then
				local item = Item:CreateFromID(v[2]);
				item:ContinueOnLoad(function(itemID)
					if itemType == select(9, GetItemInfo(itemID)) or itemType2 == select(9, GetItemInfo(itemID)) then
						table.insert(AtlasLoot_TokenData[orgID][1], {#AtlasLoot_TokenData[orgID][1] + 1, v[2], v[3], v[4], t.Name});
					end
					if count == 1 then
						AtlasLoot:ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3]);
					end
					count = count - 1;
				end)
			end
		end
	end
end

--[[
AtlasLoot:ShowItemsFrame(dataID, dataSource, tablenum):
dataID - Name of the loot table
dataSource - Table in the database where the loot table is stored
tablenum - Number of the table with the loot in it
It is the workhorse of the mod and allows the loot tables to be displayed any way anywhere in any mod.
]]
function AtlasLoot:ShowItemsFrame(dataID, dataSource_backup, tablenum)
	--Set up local variables needed for GetItemInfo, etc
	local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture, itemColor;
	local iconFrame, nameFrame, extraFrame, itemButton;
	local text, extra;
	local isValid, isItem, toShow, IDfound;
	local spellName, spellIcon;

	SearchPrevData = {dataID, dataSource_backup, tablenum};

    --If the loot table name has not been passed, throw up a debugging statement
	if dataID == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataID!");
        return;
	end

	--Hide Advanced search if it is up and reshow Querybutton
	AtlasLootDefaultFrame_AdvancedSearchPanel:Hide();

    --Ditch the Quicklook selector
    AtlasLootQuickLooksButton:Hide();

	AtlasLoot:HideFilterCreateButtons();

	--Hide Map and reshow lootbackground
	AtlasLootDefaultFrame_Map:Hide();
    AtlasLootDefaultFrame_LootBackground:Show();
	AtlasLootItemsFrame:Show();

	-- Hide the Filter Check-Box
	AtlasLootFilterCheck:Hide();

	-- Hide the map header lable
	Atlasloot_HeaderLabel:Hide();

	local dataSource = _G[dataSource_backup] or AtlasLoot_Data;

	-- Check to see if Atlas is loaded and the table has a map
	if dataSource_backup ~= "AtlasLoot_TokenData" and dataSource[dataID].Map and ATLASLOOT_ATLASLOADED then
		AtlasLootDefaultFrame_MapButton:Enable();
		AtlasLootDefaultFrame_MapSelectButton:Enable();
		-- Stops map reseting to default while still in the same raid/instance table
		if AtlasLootItemsFrame.refresh == nil or dataID ~= AtlasLootItemsFrame.refresh[1] then
			AtlasLoot_MapMenu:Unregister(AtlasLootDefaultFrame_MapSelectButton);
			ATLASLOOT_CURRENT_MAP = dataSource[dataID].Map
			if AtlasLoot_MultiMapData[ATLASLOOT_CURRENT_MAP] ~= nil then
				AtlasLoot:MapMenuRegister(ATLASLOOT_CURRENT_MAP);
			end
			AtlasLoot:MapSelect(ATLASLOOT_CURRENT_MAP);
		end
	else
		AtlasLootDefaultFrame_MapSelectButton:Disable();
		AtlasLootDefaultFrame_MapButton:Disable();
		AtlasLootDefaultFrame_MapSelectButton:SetText("No Map");
	end

	if dataSource_backup == "AtlasLoot_CurrentWishList" then
		ATLASLOOT_CURRENT_WISHLIST_NUM = AtlasLoot_CurrentWishList["Show"].ListNum;
	else
		ATLASLOOT_ITEM_UNLOCK = false;
	end

	local difType = false;
	-- Checks to see if type is the same
	if ATLASLOOT_CURRENTTYPE ~= dataSource[dataID].Type then
		if dataSource[dataID].Type == "Crafting" then
			ItemindexID = "Pattern";
		elseif ItemindexID == "Pattern" and dataSource[dataID].Type ~= "Crafting" then
			ItemindexID = 2;
		else
			ItemindexID = ATLASLOOT_TYPE[dataSource[dataID].Type] or 2;
		end
		difType = true;
	end

	-- Saves current types ItemindexID
	if dataSource[dataID].Type then
		ATLASLOOT_TYPE[dataSource[dataID].Type] = ItemindexID;
	end
	-- Set current type
	ATLASLOOT_CURRENTTYPE = dataSource[dataID].Type or "Default";

	-- Loads the difficultys into the scrollFrame
	if dataSource[dataID].ListType then
		AtlasLoot:ScrollFrameUpdate(nil,dataSource[dataID].ListType);
	else
		AtlasLoot:ScrollFrameUpdate();
	end

	-- Finds the tablenumber to set where the difficulty slider should be.
	local typeNumber = 1;
	local function findTypeNumber()
		for i,v in ipairs(AtlasLoot_Difficulty[dataSource[dataID].Type]) do
			if v[2] == ItemindexID then
				typeNumber = i;
				return i;
			end
		end
	end

	-- Moves the difficulty scrollslider if the difficulty has changed
	if dataSource[dataID].Type and difType and #AtlasLoot_Difficulty[dataSource[dataID].Type] > 5 and findTypeNumber() > 5 then
		local min, max = AtlasLootDefaultFrameScrollScrollBar:GetMinMaxValues();
		AtlasLootDefaultFrameScrollScrollBar:SetValue(typeNumber * (max / #AtlasLoot_Difficulty[dataSource[dataID].Type]));
	end

	-- Moves the difficulty scrollslider if wishlist
	if dataSource_backup == "AtlasLoot_CurrentWishList" and dataSource[dataID].ListNum > 5 then
		local min, max = AtlasLootDefaultFrameScrollScrollBar:GetMinMaxValues();
		AtlasLootDefaultFrameScrollScrollBar:SetValue(dataSource[dataID].ListNum * (max / #AtlasLootWishList[dataSource[dataID].ListType][dataSource[dataID].ListNum]));
	end

	--For stopping the subtable from changing if its a token table
	if dataSource[dataID].NoSubt == nil and dataID ~= "FilterList" then
		if dataSource[dataID].DisplayName then
			AtlasLootDefaultFrame_SubMenuText:SetText(dataSource[dataID].DisplayName);
		else
			AtlasLootDefaultFrame_SubMenuText:SetText(dataSource[dataID].Name);
		end
		AtlasLoot:SubTableScrollFrameUpdate(dataID, dataSource_backup, tablenum);
	end

	--Hide UI objects so that only needed ones are shown
	for i = 1, 30, 1 do
        _G["AtlasLootItem_"..i.."_Unsafe"]:Hide();
        _G["AtlasLootItem_"..i]:Hide();
        _G["AtlasLootItem_"..i].itemID = 0;
        _G["AtlasLootItem_"..i].spellitemID = 0;
	end

	-- Sets the main page lable
	if dataSource[dataID][tablenum] and dataSource[dataID][tablenum].Name then
		AtlasLoot_BossName:SetText(dataSource[dataID][tablenum].Name);
	else
		AtlasLoot_BossName:SetText("This Is Empty");
		return
	end

	local function getProperItemConditionals(item)
		isValid = false;
		toShow = true;
		isItem = false;
		local itemDif = ItemindexID;

		if(item ~= nil and item ~= "") then
			IDfound = item[2];
			isValid = true;
			if type(ItemindexID) == "string" then
				IDfound = item[2];
				toShow = true;
			else
				if(item[AtlasLoot_Difficulty.MIN_DIF]) then
					if item[AtlasLoot_Difficulty.MIN_DIF] > itemDif then
						toShow = false;
					end
				end
				IDfound = AtlasLoot:FindId(item[2], min(AtlasLoot_Difficulty:getMaxDifficulty(dataSource[dataID].Type), itemDif),dataSource[dataID].Type) or item[2];
			end

			if string.sub(IDfound, 1, 1) == "s" then
				IDfound = AtlasLoot:FindId(item[2], itemDif, dataSource[dataID].Type) or item[2];
			else
				isItem = true;
			end

			if isItem and toShow then
				--Sets ItemindexID to normal(2) if it is nil for min/max difficulties.
				if not tonumber(itemDif) then itemDif = AtlasLoot_Difficulty.Normal end;

				--Checks if an item has a Maximum difficulty, this is to correct some items that have an entry for higher difficulties then they really do
				if item[AtlasLoot_Difficulty.MAX_DIF] then
					if tonumber(item[AtlasLoot_Difficulty.MAX_DIF]) < itemDif then itemDif = item[AtlasLoot_Difficulty.MAX_DIF] end;
				end
				--If something was found in itemID database show that if not show default table item
				IDfound = AtlasLoot:FindId(item[2], itemDif, dataSource[dataID].Type) or item[2];

				if ItemindexID ~= "" and dataID == "SearchResult" then
					IDfound = AtlasLoot:FindId(item[9], itemDif, dataSource[dataID].Type) or item[2];
				end
			end
		end

		return isValid, isItem, toShow, IDfound
	end

	-- Create the loottable
	if (dataID == "SearchResult") or (dataSource_backup == "AtlasLoot_CurrentWishList") or dataSource[dataID][tablenum] then
		--Iterate through each item object and set its properties
		for i = 1, 30, 1 do
			--Check for a valid object (that it exists, and that it has a name
			getProperItemConditionals(dataSource[dataID][tablenum][i]);

			if isValid and toShow then
				if isItem then
					itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(IDfound);
					--If the client has the name of the item in cache, use that instead.
					--This is poor man's localisation, English is replaced be whatever is needed
					if(GetItemInfo(IDfound)) then
						_, _, _, itemColor = GetItemQualityColor(itemQuality);
						text = itemColor..itemName;
					elseif dataSource[dataID][tablenum][i][2] ~= IDfound and itemDefaultColour ~= nil and not dataSource[dataID][tablenum][i][4]:match("=q5=") then
						--If the item is not in cache, use the saved value and process it
						text = (string.sub(dataSource[dataID][tablenum][i][4], 5));
						text = itemDefaultColour .. text;
						text = AtlasLoot_FixText(text);
					else
						--If the item is not in cache, use the saved value and process it
						text = dataSource[dataID][tablenum][i][4];
						text = AtlasLoot_FixText(text);
					end
				else
					spellName, _, spellIcon, _, _, _, _, _, _ = GetSpellInfo(string.sub(IDfound, 2));
					if spellName then
						text = AtlasLoot_FixText(string.sub(dataSource[dataID][tablenum][i][4], 1, 4)..spellName);
					else
						text = dataSource[dataID][tablenum][i][4];
						text = AtlasLoot_FixText(text);
					end
				end

				--Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
				AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, tablenum};

				if dataID ~= "FilterList" then
					AtlasLootItemsFrame.refreshFilter = {dataID, dataSource_backup, tablenum};
				end

				if dataID ~= "FilterList"  and dataSource[dataID].Back ~= true then
					AtlasLootItemsFrame.refreshOri = {dataID, dataSource_backup, tablenum};
				end

				--Insert the item description
				if dataSource[dataID][tablenum][i][6] and dataSource[dataID][tablenum][i][6] ~= "" then
					extra = dataSource[dataID][tablenum][i][6];
				elseif dataSource[dataID][tablenum][i][5] then
					extra = dataSource[dataID][tablenum][i][5];
				else
					extra = "";
				end
				extra = AtlasLoot_FixText(extra);

				--Use shortcuts for easier reference to parts of the item button
				itemButton = _G["AtlasLootItem_"..dataSource[dataID][tablenum][i][1]];
				iconFrame  = _G["AtlasLootItem_"..dataSource[dataID][tablenum][i][1].."_Icon"];
				nameFrame  = _G["AtlasLootItem_"..dataSource[dataID][tablenum][i][1].."_Name"];
				extraFrame = _G["AtlasLootItem_"..dataSource[dataID][tablenum][i][1].."_Extra"];

				--If there is no data on the texture an item should have, show a big red question mark
				if dataSource[dataID][tablenum][i][3] == "Blank" then
					iconFrame:SetTexture(nil);
				elseif dataSource[dataID][tablenum][i][3] == "?" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
				elseif dataSource[dataID][tablenum][i][3] == "" then
					iconFrame:SetTexture(GetItemIcon(IDfound));
				elseif (not isItem) and (spellIcon) then
					if tonumber(dataSource[dataID][tablenum][i][3]) then
						iconFrame:SetTexture(GetItemIcon(tonumber(dataSource[dataID][tablenum][i][3])));
					elseif dataSource[dataID][tablenum][i][3] == "" then
						iconFrame:SetTexture(spellIcon);
					elseif type(dataSource[dataID][tablenum][i][3]) == "string" then
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][tablenum][i][3]);
					else
						iconFrame:SetTexture(spellIcon);
					end
				else
					--else show the texture
					iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][tablenum][i][3]);
				end
				itemButton.itemTexture = dataSource[dataID][tablenum][i][3];
				if iconFrame:GetTexture() == nil and dataSource[dataID][tablenum][i][3] ~= "Blank" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
				end
				itemButton.name = text;
				itemButton.extra = extra;

				--Highlight items in the wishlist
				if IDfound ~= "" and IDfound ~= 0 and dataSource_backup ~= "AtlasLoot_CurrentWishList" and AtlasLootWishList["Options"][UnitName("player")]["Mark"] == true then
					local xitemexistwish, itemwishicons = AtlasLoot_WishListCheck(IDfound, true)
					if xitemexistwish then
						text = itemwishicons.." "..text;
					end
				end
				--Set the name and description of the item
				nameFrame:SetText(text);
				extraFrame:SetText(extra);
				extraFrame:Show();
				--For convenience, we store information about the objects in the objects so that it can be easily accessed later
				if((string.sub(IDfound, 1, 1) == "s") and (ItemindexID ~= "Pattern") and (tonumber(dataSource[dataID][tablenum][i][3]))) then
                    IDfound = AtlasLoot:FindId(tonumber(dataSource[dataID][tablenum][i][3]), ItemindexID, dataSource[dataID].Type) or tonumber(dataSource[dataID][tablenum][i][3]);
					itemButton.itemID = IDfound;
                    itemButton.spellitemID = dataSource[dataID][tablenum][i][3];
				else
					itemButton.itemID = IDfound;

						if tonumber(dataSource[dataID][tablenum][i][3]) then
							itemButton.spellitemID = dataSource[dataID][tablenum][i][3];
						else
							itemButton.spellitemID = 0;
						end

				end
				itemButton.iteminfo = {};
				if isItem then
					itemButton.iteminfo.idcore = IDfound;
					itemButton.iteminfo.icontexture = IDfound;
				    itemButton.storeID = IDfound;
                    itemButton.dressingroomID = IDfound;
                else
				    itemButton.iteminfo.idcore = IDfound;
					itemButton.iteminfo.icontexture = GetItemIcon(IDfound);
                    itemButton.storeID = IDfound;
                    itemButton.dressingroomID = IDfound;
				end

				itemButton.tablenum = tablenum;
				itemButton.dataID = dataID;
				itemButton.dataSource = dataSource_backup;
				itemButton.desc = dataSource[dataID][tablenum][i][5] or nil;
				itemButton.price = dataSource[dataID][tablenum][i][6] or nil;
				itemButton.droprate = dataSource[dataID][tablenum][i][7] or nil;

				if (dataID == "SearchResult" or dataSource_backup == "AtlasLoot_CurrentWishList") and dataSource[dataID][tablenum][i][8] then
					itemButton.sourcePage = dataSource[dataID][tablenum][i][8];
				elseif dataSource[dataID][tablenum][i][8] ~= nil and dataSource[dataID][tablenum][i][8]:match("=TT=") then
					itemButton.sourcePage = string.sub(dataSource[dataID][tablenum][i][8], 5);
				elseif dataSource[dataID][tablenum][i][8] ~= nil and dataSource[dataID][tablenum][i][8]:match("=LT=") then
					itemButton.sourcePage = dataSource[dataID][tablenum][i][8];
				else
					itemButton.sourcePage = nil;
				end

				if dataSource[dataID][tablenum][i][AtlasLoot_Difficulty.DIF_SEARCH] then
					itemButton.difficulty = dataSource[dataID][tablenum][i][AtlasLoot_Difficulty.DIF_SEARCH];
				else
					itemButton.difficulty = ItemindexID;
				end

				itemButton.i = 1;
				itemButton:Show();

				if IDfound == 0 then _G["AtlasLootItem_"..i.."_Unsafe"]:Hide(); end
			end
		end

        AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, tablenum};

		if dataID ~= "FilterList" then
			AtlasLootItemsFrame.refreshFilter = {dataID, dataSource_backup, tablenum};
		end

		if dataID ~= "FilterList"  and dataSource[dataID].Back ~= true and dataID ~= "EmptyTable" then
			AtlasLootItemsFrame.refreshOri = {dataID, dataSource_backup, tablenum};
		end

		if dataSource_backup ~= "AtlasLoot_CurrentWishList" and dataID ~= "FilterList"  and dataSource[dataID].Back ~= true and dataID ~= "EmptyTable" then
			if not AtlasLoot.db.profile.LastBoss then AtlasLoot.db.profile.LastBoss = {} end;
			AtlasLoot.db.profile.LastBoss[AtlasLoot_Expac] = {dataID, dataSource_backup, tablenum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE};
			AtlasLoot.db.profile[ATLASLOOT_CURRENTTABLE] = {dataID, dataSource_backup, tablenum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE};
		end

        --This is a valid QuickLook, so show the UI objects
        AtlasLootQuickLooksButton:Show();

		-- Checks dataID with submenus to stop filter button loading on certain tables
		local function filterCheck(find)
			local mtype = {"Crafting", "Reputations", "WorldEvents", "PVP", "Collections"}
			for m, t in pairs (mtype) do
				for i, v in ipairs (AtlasLoot_SubMenus[t..AtlasLoot_Expac]) do
					if find == v[2] then
						return true;
					end
				end
			end
		end

		-- Show the Filter Check-Box
		if filterCheck(dataID) ~= true then
			AtlasLootFilterCheck:Show();
		end

		--Hide navigation buttons by default, only show what we need
		_G["AtlasLootItemsFrame_BACK"]:Hide();
		_G["AtlasLootItemsFrame_NEXT"]:Hide();
		_G["AtlasLootItemsFrame_PREV"]:Hide();
		_G["AtlasLootItemsFrame_Wishlist_Options"]:Hide();
		_G["AtlasLootItemsFrame_Wishlist_Share"]:Hide();
		_G["AtlasLootItemsFrame_Wishlist_Swap"]:Hide();
		_G["AtlasLootItemsFrame_Wishlist_UnLock"]:Hide();

		-- Show Wishlist buttons when a wishlist in showing
		if dataSource_backup == "AtlasLoot_CurrentWishList" then
			_G["AtlasLootItemsFrame_Wishlist_Options"]:Show();
			_G["AtlasLootItemsFrame_Wishlist_Share"]:Show();
			_G["AtlasLootItemsFrame_Wishlist_Swap"]:Show();
			_G["AtlasLootItemsFrame_Wishlist_UnLock"]:Show();
			if dataSource[dataID].ListType == "Shared" then
				AtlasLootItemsFrame_Wishlist_Swap:SetText("Own");
			elseif dataSource[dataID].ListType == "Own" then
				AtlasLootItemsFrame_Wishlist_Swap:SetText("Shared");
			end
		end

		local tablebase = {dataID, dataSource_backup};
		if dataID == "FilterList" then
			tablebase = {AtlasLootItemsFrame.refreshOri[1],AtlasLootItemsFrame.refreshOri[2]};
			tablenum = AtlasLootItemsFrame.refreshOri[3];
		end

		if AtlasLootItemsFrame.refresh and tablenum ~= #_G[AtlasLootItemsFrame.refreshOri[2]][AtlasLootItemsFrame.refreshOri[1]] and dataSource_backup ~= "AtlasLoot_TokenData" and dataID ~= "SearchResult" or tablenum ~= #_G[AtlasLootItemsFrame.refresh[2]][AtlasLootItemsFrame.refresh[1]] and dataID == "SearchResult" then
			_G["AtlasLootItemsFrame_NEXT"]:Show();
			_G["AtlasLootItemsFrame_NEXT"].tablenum = tablenum + 1;
			_G["AtlasLootItemsFrame_NEXT"].tablebase = tablebase;
		end

		if tablenum ~= 1 and dataSource_backup ~= "AtlasLoot_TokenData" then
			_G["AtlasLootItemsFrame_PREV"]:Show();
			_G["AtlasLootItemsFrame_PREV"].tablenum = tablenum - 1;
			_G["AtlasLootItemsFrame_PREV"].tablebase = tablebase;
		end

		if dataSource[dataID].Back or ATLASLOOT_BACKENABLED then
			_G["AtlasLootItemsFrame_BACK"]:Show();
		elseif dataID ~= "FilterList" then
			AtlasLootItemsFrame.refreshBack = {dataID, dataSource_backup, tablenum};
		end
	end

	--Anchor the item frame where it is supposed to be
	if ATLASLOOT_FILTER_ENABLE and dataID ~= "FilterList" then
		AtlasLoot:HideFilteredItems();
	end

	if dataID ~= "SearchResult" then
		AtlasLoot:QueryLootPage();
	end
end

--[[
AtlasLoot:NavButton_OnClick:
Called when <-, -> are pressed and calls up the appropriate loot page
]]
function AtlasLoot:NavButton_OnClick(self)
	local tablenum, dataID, dataSource = self.tablenum, self.tablebase[1], self.tablebase[2];
	if #_G[dataSource][dataID] > 26 then
		local min, max = AtlasLootDefaultFrameSubTableScrollScrollBar:GetMinMaxValues();
		AtlasLootDefaultFrameSubTableScrollScrollBar:SetValue(tablenum * (max / #_G[dataSource][dataID]));
	end
	AtlasLoot:ShowItemsFrame(dataID, dataSource, tablenum);
end

--[[
AtlasLoot:NavButton_OnClick:
Called when 'Back'Button is pressed and calls up the appropriate loot page
]]
function AtlasLoot:BackButton_OnClick()
	ATLASLOOT_BACKENABLED = false;
	AtlasLoot:ShowItemsFrame(AtlasLootItemsFrame.refreshBack[1], AtlasLootItemsFrame.refreshBack[2], AtlasLootItemsFrame.refreshBack[3]);
end

--[[
AtlasLoot:IsLootTableAvailable(dataID):
Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
dataID: Loot table dataID
]]
function AtlasLoot:IsLootTableAvailable(dataSource)
	local moduleName = nil;
	moduleName = AtlasLoot.ModuleName[dataSource];
	if IsAddOnLoaded(moduleName) then
		return true;
	else
		LoadAddOn(moduleName);
	end
end

-- List of Moduel Names
AtlasLoot.ModuleName = {
	["AtlasLootOriginalWoW"] = "AtlasLoot_OriginalWoW";
	["AtlasLootBurningCrusade"] = "AtlasLoot_BurningCrusade";
	["AtlasLootCrafting"] = "AtlasLoot_Crafting";
	["AtlasLootWorldEvents"] = "AtlasLoot_WorldEvents";
	["AtlasLootWotLK"] = "AtlasLoot_WrathoftheLichKing"
}

--[[
AtlasLoot:LoadAllModules()
Used to load all available LoD modules
]]
function AtlasLoot:LoadAllModules()
	local orig, bc, wotlk, craft, world;
    orig, _ = LoadAddOn("AtlasLoot_OriginalWoW");
    bc, _ = LoadAddOn("AtlasLoot_BurningCrusade");
    craft, _ = LoadAddOn("AtlasLoot_Crafting");
    world, _ = LoadAddOn("AtlasLoot_WorldEvents");
    wotlk, _ = LoadAddOn("AtlasLoot_WrathoftheLichKing");
    local flag=0;
	if not orig then
		LoadAddOn("AtlasLoot_OriginalWoW");
		flag=1;
	end
	if not bc then
		LoadAddOn("AtlasLoot_BurningCrusade");
		flag=1;
	end
    if not craft then
		LoadAddOn("AtlasLoot_Crafting");
		flag=1;
	end
    if not world then
		LoadAddOn("AtlasLoot_WorldEvents");
		flag=1;
	end
    if not wotlk then
		LoadAddOn("AtlasLoot_WrathoftheLichKing");
		flag=1;
	end
	if flag == 1 then
		if ATLASLOOT_DEBUGMESSAGES then
			DEFAULT_CHAT_FRAME:AddMessage(GREEN..AL["AtlasLoot"]..": "..WHITE..AL["All Available Modules Loaded"]);
		end
		collectgarbage("collect");
	end
end

--[[
AtlasLoot:ShowQuickLooks(button)
button: Identity of the button pressed to trigger the function
Shows the GUI for setting Quicklooks
]]
function AtlasLoot:ShowQuickLooks(button)
	local dewdrop = AceLibrary("Dewdrop-2.0");
	if dewdrop:IsOpen(button) then
		dewdrop:Close(1);
	else
		local setOptions = function()
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 1",
				"tooltipTitle", AL["QuickLook"].." 1",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 1",
				"func", function()
                    if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
						AtlasLootCharDB["QuickLooks"][1]={AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G["AtlasLootWishList"][AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name};
					else
						AtlasLootCharDB["QuickLooks"][1]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G[AtlasLootItemsFrame.refreshOri[2]][AtlasLootItemsFrame.refreshOri[1]][AtlasLootItemsFrame.refreshOri[3]].Name};
					end
                    AtlasLoot:RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 2",
				"tooltipTitle", AL["QuickLook"].." 2",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 2",
				"func", function()
					if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
						AtlasLootCharDB["QuickLooks"][2]={AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G["AtlasLootWishList"][AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name};
					else
						AtlasLootCharDB["QuickLooks"][2]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G[AtlasLootItemsFrame.refreshOri[2]][AtlasLootItemsFrame.refreshOri[1]][AtlasLootItemsFrame.refreshOri[3]].Name};
                    end
					AtlasLoot:RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
            dewdrop:AddLine(
				"text", AL["QuickLook"].." 3",
				"tooltipTitle", AL["QuickLook"].." 3",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 3",
				"func", function()
					if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
						AtlasLootCharDB["QuickLooks"][3]={AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G["AtlasLootWishList"][AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name};
					else
						AtlasLootCharDB["QuickLooks"][3]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G[AtlasLootItemsFrame.refreshOri[2]][AtlasLootItemsFrame.refreshOri[1]][AtlasLootItemsFrame.refreshOri[3]].Name};
                    end
					AtlasLoot:RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
            dewdrop:AddLine(
				"text", AL["QuickLook"].." 4",
				"tooltipTitle", AL["QuickLook"].." 4",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 4",
				"func", function()
					if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
						AtlasLootCharDB["QuickLooks"][4]={AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum, ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G["AtlasLootWishList"][AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name};
					else
						AtlasLootCharDB["QuickLooks"][4]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], ATLASLOOT_LASTMODULE, ATLASLOOT_CURRENTTABLE, _G[AtlasLootItemsFrame.refreshOri[2]][AtlasLootItemsFrame.refreshOri[1]][AtlasLootItemsFrame.refreshOri[3]].Name};
                    end
					AtlasLoot:RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
		end;
		dewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT";
			end,
			"children", setOptions
		);
	end
end

--[[
AtlasLoot:RefreshQuickLookButtons()
Enables/disables the quicklook buttons depending on what is assigned
]]
function AtlasLoot:RefreshQuickLookButtons()
    local i=1;
    while i<5 do
        if ((not AtlasLootCharDB["QuickLooks"][i]) or (not AtlasLootCharDB["QuickLooks"][i][1])) or (AtlasLootCharDB["QuickLooks"][i][1]==nil) then
            _G["AtlasLootDefaultFrame_Preset"..i]:Disable();
        else
            _G["AtlasLootDefaultFrame_Preset"..i]:Enable();
        end
        i=i+1;
    end
end


function AtlasLoot:QueryLootPage()
	local START = 1;
	local MAX_BUTTONS = 30;
	local COUNTED = 0;
	local REFRESHED = false;

	local function queryNextItem(pos)
		if pos > MAX_BUTTONS then return end;

		local button = _G["AtlasLootItem_"..pos];
        local queryitem = button.itemID;

        if (queryitem) and (queryitem ~= nil) and (queryitem ~= "") and (queryitem ~= 0) and (string.sub(queryitem, 1, 1) ~= "s") then
			local item = Item:CreateFromID(queryitem);
			if not (item:GetInfo()) then
				item:ContinueOnLoad(function(itemId)
					COUNTED = COUNTED + 1;
					if not REFRESHED and (COUNTED == MAX_BUTTONS) then
						REFRESHED = true;
						AtlasLoot:ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3]);
					end
				end)
			else
				COUNTED = COUNTED + 1;
			end
		else
			COUNTED = COUNTED + 1;
        end

		queryNextItem(pos + 1);
	end
	queryNextItem(START);
end

--[[
AtlasLoot:AddTooltip(frameb, tooltiptext)
Adds explanatory tooltips to UI objects.
]]
function AtlasLoot:AddTooltip(frameb, tooltiptext)
   if not tooltiptext or not frameb then return end
   local frame = _G[frameb]
   frame:SetScript("OnEnter", function()
      GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
      GameTooltip:SetText(tooltiptext)
      GameTooltip:Show()
   end)
   frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

--[[
AtlasLoot:FindId(id, difficulty)
Finds the Ids of other difficulties based on the normal id of the item and the difficulty parameter given.
On the form of {ID, {normal, heroic, mythic, mythic1, mythic2, ... ,mythicN}}
]]
function AtlasLoot:FindId(id, difficulty, type)
	if not ItemIDsDatabase[id] then return nil, false end

	if difficulty == 5 and (type == "BCRaid" or type == "ClassicRaid") then
		return ItemIDsDatabase[id]["MythicRaid"], true
	else
		return ItemIDsDatabase[id][difficulty], true
	end
end
-- Loads the Item Variations into a table from the data content folder
function AtlasLoot:LoadItemIDsDatabase()
	local content = C_ContentLoader:Load("ItemVariationData")
	content:SetParser(function(index, data)
		-- run for each item in the data
	if index ~= 0 and data.Normal ~= 0 and not ItemIDsDatabase[data.Normal] then
			ItemIDsDatabase[data.Normal] = {}
			ItemIDsDatabase[data.Normal]["MythicRaid"] = data.Heroic + 1000000
			table.insert(ItemIDsDatabase[data.Normal],data.Bloodforged);
			table.insert(ItemIDsDatabase[data.Normal],data.Normal);
			if data.Heroic ~= 0 then table.insert(ItemIDsDatabase[data.Normal],data.Heroic) end
				for _,v in ipairs(data["Mythic"]) do
					if v ~= 0 then
						table.insert(ItemIDsDatabase[data.Normal],v)
					end
				end
		end
	end)

	-- This will run over time (usually about 30s for a file this size), but will maintain playable fps while running.
	content:ParseAsync()
	end