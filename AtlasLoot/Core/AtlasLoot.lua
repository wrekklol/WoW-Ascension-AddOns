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
AtlasLootBoss_OnClick()
AtlasLoot_ShowItemsFrame()
AtlasLoot_GenerateAtlasMenu(dataID, pFrame)
AtlasLoot_SetupForAtlas()
AtlasLootOptions_ItemAutoQuery()
AtlasLoot_SetItemInfoFrame()
AtlasLootItemsFrame_OnCloseButton()
AtlasLootMenuItem_OnClick()
AtlasLoot_NavButton_OnClick()
AtlasLoot_HeroicModeToggle()
AtlasLoot_IsLootTableAvailable(dataID)
AtlasLoot_GetLODModule(dataSource)
AtlasLoot_LoadAllModules()
AtlasLoot_ShowQuickLooks(button)
AtlasLoot_RefreshQuickLookButtons()
AtlasLoot_AddTooltip(frameb, tooltiptext)
AL_FindId(name, difficulty)
]]

AtlasLoot = LibStub("AceAddon-3.0"):NewAddon("AtlasLoot");

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
ATLASLOOT_FILTER_ENABLE = false;

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "   ";

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu2 = AceLibrary("Dewdrop-2.0");
DewDrop2Enable = false;
currentID = "";
dataIDBackup = nil;
dataSourceBackup = nil;

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false;

-- Colours stored for code readability
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

--Establish number of boss lines in the Atlas frame for scrolling
local ATLAS_LOOT_BOSS_LINES	= 25;

--Flag so that error messages do not spam
local ATLASLOOT_POPUPSHOWN = false;

--Set the default anchor for the loot frame to the Atlas frame
AtlasLoot_AnchorFrame = AtlasFrame;

--Variables to hold hooked Atlas functions
Hooked_Atlas_Refresh = nil;
Hooked_Atlas_OnShow = nil;
Hooked_AtlasScrollBar_Update = nil;

AtlasLootCharDB={};

local AtlasLootDBDefaults = { 
    profile = {
        SavedTooltips = {},
        SafeLinks = true,
        DefaultTT = true,
        LootlinkTT = false,
        ItemSyncTT = false,
        EquipCompare = false,
		ItemAutoQuery = false,
        Opaque = false,
        ItemIDs = false,
        ItemSpam = false,
        MinimapButton = false,
        FuBarAttached = true,
        FuBarText = true,
        FuBarIcon = true,
        HidePanel = false,
        LastBoss = "EmptyTable",
        HeroicMode = false,
		BigraidHeroic = false,
        Bigraid = false, 
        AtlasLootVersion = "1",
        AtlasNaggedVersion = "",
        FuBarPosition = 1,
		AutoQuery = false,
        LoadAllLoDStartup = false,
        PartialMatching = true,
        LootBrowserStyle = 1,
        CraftingLink = 1,
        MinimapButtonAngle = 240,
        MinimapButtonRadius = 75,
        LootBrowserScale = 1.0,
        SearchOn = {
            All = true,
        },
        AtlasType = "Release";
    }
}

AtlasLoot_MenuList = {
	"PVPSET",
	"PVP70RepSET",
	"ARENASET",
	"ARENA2SET",
	"ARENA3SET",
	"ARENA4SET",
};

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

--Popup Box for an old version of Atlas
StaticPopupDialogs["ATLASLOOT_OLD_ATLAS"] = {
  text = AL["It has been detected that your version of Atlas does not match the version that Atlasloot is tuned for ("]..ATLASLOOT_CURRENT_ATLAS[1].."/"..ATLASLOOT_PREVIEW_ATLAS[1]..AL[").  Depending on changes, there may be the occasional error, so please visit http://www.atlasmod.com as soon as possible to update."],
  button1 = AL["OK"],
  OnAccept = function()
	  DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["Incompatible Atlas Detected"]);
  end,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = 1
};

--[[
AtlasLoot_OnEvent(event):
event - Name of the event, passed from the API
Invoked whenever a relevant event is detected by the engine.  The function then
decides what action to take depending on the event.
]]
function AtlasLoot_OnEvent(event)
	--Addons all loaded
	if(event == "VARIABLES_LOADED") then
		AtlasLoot_OnVariablesLoaded();
	--Taint errors
    elseif(event == "PLAYER_ENTERING_WORLD") then
        AtlasLootOptions_MinimapToggle();
        AtlasLootOptions_MinimapToggle();
	elseif(arg1 == "AtlasLoot") then
		--Junk command to suppress taint message
		local i=3;
	end
end

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
function AtlasLoot_OnVariablesLoaded()
    local AtlasCheck = false;
    AtlasLoot.db = LibStub("AceDB-3.0"):New("AtlasLootDB");
    AtlasLoot.db:RegisterDefaults(AtlasLootDBDefaults);
	if not AtlasLootCharDB then AtlasLootCharDB = {} end
	if not AtlasLootCharDB["WishList"] then AtlasLootCharDB["WishList"] = {} end
    if not AtlasLootCharDB["QuickLooks"] then AtlasLootCharDB["QuickLooks"] = {} end
	if not AtlasLootCharDB["SearchResult"] then AtlasLootCharDB["SearchResult"] = {} end
	AtlasLoot.db.profile.LastBoss = "EmptyTable";
    if AtlasLoot_TableNames then
        AtlasLoot_TableNames["EmptyTable"] = { AL["Select a Loot Table..."], "Menu" };
	    AtlasLoot_TableNames["EmptyInstance"] = { "AtlasLoot", "AtlasLootFallback" };
	    AtlasLoot_TableNames["AtlasLootFallback"] = { "AtlasLoot", "AtlasLootFallback" };
    end
    if AtlasLoot_Data then
        AtlasLoot_Data["EmptyTable"] = {};
    end
    --Figure out if it is a compatible Atlas version
    for i=1,#ATLASLOOT_CURRENT_ATLAS do
        if ATLAS_VERSION == ATLASLOOT_CURRENT_ATLAS[i] then
            AtlasCheck = true;
            AtlasLoot.db.profile.AtlasType = "Release";
        end
    end
    for i=1,#ATLASLOOT_PREVIEW_ATLAS do
        if ATLAS_VERSION == ATLASLOOT_PREVIEW_ATLAS[i] then
            AtlasCheck = true;
            AtlasLoot.db.profile.AtlasType = "Preview";
        end
    end
    if AtlasCheck == false then
        AtlasLoot.db.profile.AtlasType = "Unknown";
    end
    --Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootDefaultFrame");
	--Set up options frame
	AtlasLootOptions_OnLoad();
    AtlasLoot_CreateOptionsInfoTooltips();
	--Legacy code for those using the ultimately failed attempt at making Atlas load on demand
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas();
	end
	--Hook the necessary Atlas functions
    Hooked_Atlas_Refresh = Atlas_Refresh;
    Atlas_Refresh = AtlasLoot_Refresh;
	Hooked_Atlas_OnShow = Atlas_OnShow;
	Atlas_OnShow = AtlasLoot_Atlas_OnShow;
	--Instead of hooking, replace the scrollbar driver function
    Hooked_AtlasScrollBar_Update = AtlasScrollBar_Update;
	AtlasScrollBar_Update = AtlasLoot_AtlasScrollBar_Update;
    if( not AtlasLoot.db.profile.LootBrowserStyle ) then
        AtlasLoot.db.profile.LootBrowserStyle = 1;
    end    
    --Set visual style for the loot browser
    if( not AtlasLoot.db.profile.CraftingLink ) then
        AtlasLoot.db.profile.CraftingLink = 1;
    end
    if( AtlasLoot.db.profile.LootBrowserStyle == 1 ) then
        AtlasLoot_SetNewStyle("new");
    else
        AtlasLoot_SetNewStyle("old");
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
	--If Atlas is installed, set up for Atlas
	if ( Hooked_Atlas_Refresh ) then
		AtlasLoot_SetupForAtlas();
		--If a first time user, set up options
		if( (AtlasLoot.db.profile.AtlasLootVersion == nil) or (tonumber(AtlasLoot.db.profile.AtlasLootVersion) < 40500)) then
			AtlasLoot.db.profile.SafeLinks = true;
			AtlasLoot.db.profile.AllLinks = false;
			AtlasLoot.db.profile.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
			StaticPopup_Show ("ATLASLOOT_SETUP");
		end
		--If not the expected Atlas version, nag the user once
		if( AtlasLoot.db.profile.AtlasType == "Unknown" and AtlasLoot.db.profile.AtlasNaggedVersion ~= ATLAS_VERSION ) then
            StaticPopup_Show ("ATLASLOOT_OLD_ATLAS");
            AtlasLoot.db.profile.AtlasNaggedVersion = ATLAS_VERSION;
		end
        if AtlasLoot.db.profile.AtlasType == "Preview" then
            AtlasLootBossButtons = AtlasLootNewBossButtons;
        end
		Hooked_Atlas_Refresh();
	else
		--If we are not using Atlas, keep the items frame out of the way
		AtlasLootItemsFrame:Hide();
	end
	--Check and migrate old WishList entry format to the newer one
	if(((AtlasLootCharDB.AtlasLootVersion == nil) or (tonumber(AtlasLootCharDB.AtlasLootVersion) < 40301)) and AtlasLootCharDB and AtlasLootCharDB["WishList"] and #AtlasLootCharDB["WishList"]~=0) then
		--Check if we really need to do a migration since it will load all modules
		--We also create a helper table here which store IDs that need to search for
		local idsToSearch = {};
		for i = 1, #AtlasLootCharDB["WishList"] do
			if (AtlasLootCharDB["WishList"][i][1] > 0 and not AtlasLootCharDB["WishList"][i][5]) then
				tinsert(idsToSearch, i, AtlasLootCharDB["WishList"][i][1]);
			end
		end
		if #idsToSearch > 0 then
			--Let's do this
			AtlasLoot_LoadAllModules();
			for _, dataSource in ipairs(AtlasLoot_SearchTables) do
				if AtlasLoot_Data[dataSource] then
					for dataID, lootTable in pairs(AtlasLoot_Data[dataSource]) do
						for _, entry in ipairs(lootTable) do
							for k, v in pairs(idsToSearch) do
								if(entry[1] == v)then
									AtlasLootCharDB["WishList"][k][5] = dataID.."|"..dataSource;
									break;
								end
							end
						end
					end
				end
			end
		end
		AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
	end
	if((AtlasLootCharDB.AtlasLootVersion == nil) or (tonumber(AtlasLootCharDB.AtlasLootVersion) < 40301)) then
		AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
		AtlasLootCharDB.AutoQuery = false;
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
	AtlasLoot_DewdropRegister();
	--If EquipCompare is available, use it
	if((EquipCompare_RegisterTooltip) and (AtlasLoot.db.profile.EquipCompare == true)) then
		EquipCompare_RegisterTooltip(AtlasLootTooltip);
	end
	--Position relevant UI objects for loot browser and set up menu
	AtlasLootDefaultFrame_SelectedCategory:SetPoint("TOP", "AtlasLootDefaultFrame_Menu", "BOTTOM", 0, -4);
	AtlasLootDefaultFrame_SelectedTable:SetPoint("TOP", "AtlasLootDefaultFrame_SubMenu", "BOTTOM", 0, -4);
	AtlasLootDefaultFrame_SelectedTable2:SetPoint("TOP", "AtlasLootDefaultFrame_SubMenu2", "BOTTOM", 0, -4);
	AtlasLootDefaultFrame_SelectedCategory:SetText(AL["Choose Table ..."]);
	AtlasLootDefaultFrame_SelectedTable:SetText("");
	AtlasLootDefaultFrame_SelectedTable2:SetText("");
	AtlasLootDefaultFrame_SelectedCategory:Show();
	AtlasLootDefaultFrame_SelectedTable:Show();
	AtlasLootDefaultFrame_SelectedTable2:Show();
	AtlasLootDefaultFrame_SubMenu:Disable();
	AtlasLootDefaultFrame_SubMenu2:Disable();
	if (AtlasLoot.db.profile.LoadAllLoDStartup == true) then
		AtlasLoot_LoadAllModules();
	else
		collectgarbage("collect");
	end
    panel = getglobal("AtlasLootOptionsFrame");
    panel.name=AL["AtlasLoot"];
    InterfaceOptions_AddCategory(panel);
    --Filter and wishlist options menus creates as part of the next 2 commands
    AtlasLoot_CreateFilterOptions();
	AtlasLoot_CreateWishlistOptions();
    panel = getglobal("AtlasLootHelpFrame");
    panel.name=AL["Help"];
    panel.parent=AL["AtlasLoot"];
    InterfaceOptions_AddCategory(panel);
    if LibStub:GetLibrary("LibAboutPanel", true) then
        LibStub("LibAboutPanel").new(AL["AtlasLoot"], "AtlasLoot");
    end    
    AtlasLoot_UpdateLootBrowserScale();
	
	AtlasLoot.db.profile.Bigraid = false
	AtlasLoot.db.profile.BigraidHeroic = false
	AtlasLoot.db.profile.HeroicMode = false
end

function AtlasLoot_Reset(data)
    AtlasLootDefaultFrame:Hide();
    if AtlasFrame then
        AtlasFrame:Hide();
    end
    if data == "frames" then
        AtlasLoot.db.profile.LastBoss = "EmptyTable";
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
        AtlasLoot.db.profile.LastBoss = "EmptyTable";
        AtlasLootCharDB["QuickLooks"] = {};
        AtlasLoot_RefreshQuickLookButtons();
    elseif data == "wishlist" then
        AtlasLoot.db.profile.LastBoss = "EmptyTable";
        AtlasLootCharDB["WishList"] = {};
        AtlasLootCharDB["SearchResult"] = {};
        AtlasLootCharDB.LastSearchedText = "";
    elseif data == "all" then
        AtlasLoot.db.profile.LastBoss = "EmptyTable";
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
        AtlasLoot_RefreshQuickLookButtons();
        AtlasLootCharDB["WishList"] = {};
        AtlasLootCharDB["SearchResult"] = {};
        AtlasLootCharDB.LastSearchedText = "";
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
function AtlasLoot_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_ACTION_FORBIDDEN");
	this:RegisterEvent("ADDON_ACTION_BLOCKED");
	--Enable the use of /al or /atlasloot to open the loot browser
	SLASH_ATLASLOOT1 = "/atlasloot";
	SLASH_ATLASLOOT2 = "/al";
	SlashCmdList["ATLASLOOT"] = function(msg)
		AtlasLoot_SlashCommand(msg);
	end
end

AtlasLoot_Difficulty = {
		
		["ClassicDungeon"] = {"Normal", "Bloodforged"};
		["ClassicDungeonExt"] = {"Normal", "Heroic", "Mythic", "Mythic 1", "Mythic 2","Mythic 3","Mythic 4","Mythic 5", "Mythic 6","Mythic 7","Mythic 8","Mythic 9", "Mythic 10","Bloodforged" };
		["ClassicRaid"] = {"Normal Flex", "Heroic Flex", "Ascended","Bloodforged" };
		["BCDungeon"] = {"Normal/Heroic", "Mythic", "Mythic 1", "Mythic 2","Mythic 3","Mythic 4","Mythic 5", "Mythic 6","Mythic 7","Mythic 8","Mythic 9", "Mythic 10","Bloodforged" };
		["BCRaid"] = {"Normal Flex", "Heroic Flex", "Ascended","Bloodforged" };
		["WrathDungeon"] = {"Normal/Heroic", "Mythic", "Mythic 1", "Mythic 2","Mythic 3","Mythic 4","Mythic 5", "Mythic 6","Mythic 7","Mythic 8","Mythic 9", "Mythic 10","Bloodforged" };
		["WrathRaid"] = {"Normal Flex", "Heroic Flex", "Ascended","Bloodforged" };
		["Crafting"] = {"Crafting Pattern", "Normal", "Bloodforged" };
		["CraftingExt"] = {"Crafting Pattern Uncommen", "Crafting Pattern Rare", "Crafting Pattern Epic", "Item Uncommen", "Item Rare", "Item Epic" };
		
		
		
		["Bloodforged"] = {1};
		["Normal"] = {2};
		["Heroic"] = {3};
		["Mythic"] = {4};
		["Ascended"] = {4};
		["MythicPlus"] = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14};

}

--[[
AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame):
dataID - Name of the loot table
dataSource - Table in the database where the loot table is stored
boss - Text string to use as a title for the loot page
pFrame - Data structure describing how and where to anchor the item frame (more details, see the function AtlasLoot_SetItemInfoFrame)
This fuction is not normally called directly, it is usually invoked by AtlasLoot_ShowBossLoot.
It is the workhorse of the mod and allows the loot tables to be displayed any way anywhere in any mod.
]]
function AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame)
	--Set up local variables needed for GetItemInfo, etc
	local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture, itemColor;
	local iconFrame, nameFrame, extraFrame, itemButton;
	local text, extra;
	local wlPage, wlPageMax = 1, 1;
	local isItem;
	local spellName, spellIcon;

    --If the loot table name has not been passed, throw up a debugging statement
	if dataID == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataID!");
        return;
	end
	--used when there is an extra loottable instead of using itemIDsDatabase

	if dataID:match("MENU") then
		isTablereference = false
		notPattern = false
		isItemID = false
		AtlasLoot_DewdropSubMenu2:Unregister(AtlasLootDefaultFrame_SubMenu2);
		AtlasLootDefaultFrame_SubMenu2:Disable();
		AtlasLootDefaultFrame_SelectedTable2:SetText("");
		AtlasLootDefaultFrame_SelectedTable2:Hide();
		DewDrop2Enable = false
	elseif isTablereference and not notPattern then
		if DewDrop2Enable then
			dataID = gsub(dataID, lastReference, "")
		end
		dataID = dataID .. tableReference
		DewDrop2Enable = true
		lastReference = tableReference
	elseif isTablereference and notPattern then
		if DewDrop2Enable then
			dataID = gsub(dataID, lastReference, "")
		end
		dataID = dataID .. tableReference
		DewDrop2Enable = true
		lastReference = tableReference
	else
		DewDrop2Enable = false
	end
	
		--Used to enable difficulty menu if its not a subtable
	if AtlasLoot_DewDropDown_SubTables2[dataID] and DropMenu2 == true then
		AtlasLootDefaultFrame_SubMenu2:Enable();
		AtlasLoot_DewdropSubMenu2:Unregister(AtlasLootDefaultFrame_SubMenu2);
		AtlasLoot_DewdropSubMenu2Register(AtlasLoot_DewDropDown_SubTables2[dataID]);
		--Sets difficulty text if theres none there
		if not SelectedTable2TextSet then
		AtlasLootDefaultFrame_SelectedTable2:SetText(AtlasLoot_TableNames[AtlasLoot_DewDropDown_SubTables2[dataID][1][3]][1]);
		end
		AtlasLootDefaultFrame_SelectedTable2:Show();
		SelectedTable2TextSet = true
	elseif DewDrop2Enable then
		AtlasLootDefaultFrame_SubMenu2:Enable();
	elseif not AtlasLoot_DewDropDown_SubTables2[dataID] and DropMenu2 == true then
		AtlasLoot_DewdropSubMenu2:Unregister(AtlasLootDefaultFrame_SubMenu2);
		AtlasLootDefaultFrame_SubMenu2:Disable();
		AtlasLootDefaultFrame_SelectedTable2:SetText("");
		AtlasLootDefaultFrame_SelectedTable2:Hide();
		SelectedTable2TextSet = false
	end
	
    	--Get AtlasQuest out of the way
	if (AtlasQuestInsideFrame) then
		HideUIPanel(AtlasQuestInsideFrame);
	end

    --Ditch the Quicklook selector
    AtlasLoot_QuickLooks:Hide();
    AtlasLootQuickLooksButton:Hide();
	
	-- Hide the Filter Check-Box
	AtlasLootFilterCheck:Hide();
    
    dataSource_backup = dataSource;
	if dataID == "SearchResult" or dataID == "WishList" then
        ItemindexID = ""
		AtlasLootDefaultFrame_SubMenu2:Disable();
		AtlasLootDefaultFrame_SelectedTable2:SetText("");
		AtlasLootDefaultFrame_SelectedTable2:Hide();
		dataSource = {};
        -- Match the page number to display
        wlPage = tonumber(dataSource_backup:match("%d+$"));
        -- Aquiring items of the page
        if dataID == "SearchResult" then
            dataSource[dataID], wlPageMax = AtlasLoot:GetSearchResultPage(wlPage);
        elseif dataID == "WishList" then
            dataSource[dataID], wlPageMax = AtlasLoot_GetWishListPage(wlPage);
        end
        -- Make page number reasonable
        if wlPage < 1 then wlPage = 1 end
        if wlPage > wlPageMax then wlPage = wlPageMax end
    else
        dataSource = AtlasLoot_Data;
    end
	--Hide UI objects so that only needed ones are shown
	for i = 1, 30, 1 do
        getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide();
		getglobal("AtlasLootMenuItem_"..i):Hide();
        getglobal("AtlasLootItem_"..i):Hide();
        getglobal("AtlasLootItem_"..i).itemID = 0;
        getglobal("AtlasLootItem_"..i).spellitemID = 0;
	end
    
    if AtlasLoot_TableNames[dataID] ~= nil and AtlasLoot_TableNames[dataID][2] == "Menu" then
        AtlasLoot_GenerateAtlasMenu(dataID, pFrame);
        return;
    end

	-- Create the loottable
	if (dataID == "SearchResult") or (dataID == "WishList") or (AtlasLoot_IsLootTableAvailable(dataID)) then
		--Iterate through each item object and set its properties
		for i = 1, 30, 1 do
			--Check for a valid object (that it exists, and that it has a name)
			if(dataSource[dataID][i] ~= nil and dataSource[dataID][i][4] ~= "") then					
				--Finds ItemIDS of none normal gear				
				if  AL_FindId(string.sub(dataSource[dataID][i][4], 5), ItemindexID) == nil or  AL_FindId(string.sub(dataSource[dataID][i][4], 5), ItemindexID) == '' or not tonumber(ItemindexID) then
					IDfound = dataSource[dataID][i][2]
				else
					IDfound = AL_FindId(string.sub(dataSource[dataID][i][4], 5), ItemindexID)
				end
				if string.sub(IDfound, 1, 1) == "s" then
					isItem = false;
				else
					isItem = true;
				end
				if isItem then
					--print(dataSource[dataID][i][2])
					
					--print(dataSource[dataID][i][2])
					itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(IDfound);
					--If the client has the name of the item in cache, use that instead.
					--This is poor man's localisation, English is replaced be whatever is needed
					if(GetItemInfo(IDfound)) then
						_, _, _, itemColor = GetItemQualityColor(itemQuality);
						text = itemColor..itemName;
					else
						if(GetItemInfo(IDfound)) then
							_, _, _, itemColor = GetItemQualityColor(itemQuality);
							text = itemColor..itemName;
						else
							--If the item is not in cache, use the saved value and process it
							text = dataSource[dataID][i][4];
							text = AtlasLoot_FixText(text);
						end
					end
				else
					spellName, _, spellIcon, _, _, _, _, _, _ = GetSpellInfo(string.sub(IDfound, 2));
					if spellName then
                        text = AtlasLoot_FixText(string.sub(dataSource[dataID][i][4], 1, 4)..spellName);
                    else
                        text = dataSource[dataID][i][4];
                        text = AtlasLoot_FixText(text);
                    end
				end

				--Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
				AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, boss, pFrame};
				if dataID ~= "FilterList" then
					AtlasLootItemsFrame.refreshOri = {dataID, dataSource_backup, boss, pFrame}
				end
                
				--Insert the item description
                if dataSource[dataID][i][6] and dataSource[dataID][i][6] ~= "" then
                	extra = dataSource[dataID][i][6];
                elseif dataSource[dataID][i][5] then
                    extra = dataSource[dataID][i][5];
                else
                    extra = "";
                end
				extra = AtlasLoot_FixText(extra);

				--Use shortcuts for easier reference to parts of the item button
				itemButton = getglobal("AtlasLootItem_"..dataSource[dataID][i][1]);
				iconFrame  = getglobal("AtlasLootItem_"..dataSource[dataID][i][1].."_Icon");
				nameFrame  = getglobal("AtlasLootItem_"..dataSource[dataID][i][1].."_Name");
				extraFrame = getglobal("AtlasLootItem_"..dataSource[dataID][i][1].."_Extra");

				--If there is no data on the texture an item should have, show a big red question mark
				if dataSource[dataID][i][3] == "?" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
				elseif dataSource[dataID][i][3] == "" then
					iconFrame:SetTexture(GetItemIcon(IDfound));
				elseif (not isItem) and (spellIcon) then
					if tonumber(dataSource[dataID][i][3]) then
						iconFrame:SetTexture(GetItemIcon(tonumber(dataSource[dataID][i][3])));
					elseif dataSource[dataID][i][3] == "" then
						iconFrame:SetTexture(spellIcon);
                    elseif type(dataSource[dataID][i][3]) == "string" then
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][3]);
					else
						iconFrame:SetTexture(spellIcon);
					end
				else
					--else show the texture
					iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][3]);
				end
				itemButton.itemTexture = dataSource[dataID][i][3];
                if iconFrame:GetTexture() == nil then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
				end
                itemButton.name = text;
                itemButton.extra = extra;
				
                --Highlight items in the wishlist
                if IDfound ~= "" and IDfound ~= 0 and dataID ~= "WishList" and AtlasLootWishList["Options"][UnitName("player")]["Mark"] == true then
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
				if((string.sub(IDfound, 1, 1) == "s") and (AtlasLoot.db.profile.CraftingLink ~= 1) and (tonumber(dataSource[dataID][i][3]))) then
                    itemButton.itemID = dataSource[dataID][i][3];
                    itemButton.spellitemID = dataSource[dataID][i][3];
				elseif ((string.sub(IDfound, 1, 1) == "s") and notPattern == true and (tonumber(dataSource[dataID][i][3]))) then
                    itemButton.itemID = dataSource[dataID][i][3];
                    itemButton.spellitemID = dataSource[dataID][i][3];
				else					
					itemButton.itemID = IDfound;			

						if tonumber(dataSource[dataID][i][3]) then
							itemButton.spellitemID = dataSource[dataID][i][3];
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
				    itemButton.iteminfo.idcore = dataSource[dataID][i][3];
					itemButton.iteminfo.icontexture = GetItemIcon(dataSource[dataID][i][3]);
                    itemButton.storeID = dataSource[dataID][i][3];
                    itemButton.dressingroomID = dataSource[dataID][i][3];
				end
                if dataSource[dataID][i][5] then
                    itemButton.desc = dataSource[dataID][i][5];
                else
                    itemButton.desc = nil;
                end
                if dataSource[dataID][i][6] then
                    itemButton.price = dataSource[dataID][i][6];
                else
                    itemButton.price = nil;
                end
                if dataSource[dataID][i][7] and dataSource[dataID][i][7] ~= "" then
				    itemButton.droprate = dataSource[dataID][i][7];
                else
                    itemButton.droprate = nil;
                end
                if (dataID == "SearchResult" or dataID == "WishList") and dataSource[dataID][i][8] then
                    itemButton.sourcePage = dataSource[dataID][i][8];
                end
				itemButton.i = 1;
				itemButton:Show();
                
                if IDfound == 0 then getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide(); end

            end
		end

        AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, boss, pFrame};
		if dataID ~= "FilterList" then
			AtlasLootItemsFrame.refreshOri = {dataID, dataSource_backup, boss, pFrame}
		end
		
        --If the item is not in cache, querying the server may cause a disconnect
        --Show a red box around the item to indicate this to the user
        --((dataSource[dataID][i][2] ~= 0) and (not GetItemInfo(dataSource[dataID][i][2]))
        for i = 1, 30, 1 do
            itemID = getglobal("AtlasLootItem_"..i).itemID;
            if itemID and itemID ~= 0 and (string.sub(itemID, 1, 1) ~= "s") then
                if GetItemInfo(itemID) then
                    getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide();
                else
                    getglobal("AtlasLootItem_"..i.."_Unsafe"):Show();
                end
            else
                getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide();
            end
        end
        
        --This is a valid QuickLook, so show the UI objects
        AtlasLoot_QuickLooks:Show();
        AtlasLootQuickLooksButton:Show();
		
		-- Show the Filter Check-Box
		if dataID ~= "WishList" and dataID ~= "SearchResult" and dataSource_backup ~= "AtlasLootCrafting" and not isTablereference then
			AtlasLootFilterCheck:Show();
		end
		--Hide navigation buttons by default, only show what we need
		getglobal("AtlasLootItemsFrame_BACK"):Hide();
		getglobal("AtlasLootItemsFrame_NEXT"):Hide();
		getglobal("AtlasLootItemsFrame_PREV"):Hide();
        if dataID ~= "SearchResult" and dataID ~= "WishList" then
		    AtlasLoot_BossName:SetText(AtlasLoot_TableNames[dataID][1]);
        else
            AtlasLoot_BossName:SetText(boss);
        end
		--Consult the button registry to determine what nav buttons are required
		if dataID == "SearchResult" or dataID == "WishList" then
			if wlPage < wlPageMax then
				getglobal("AtlasLootItemsFrame_NEXT"):Show();
				getglobal("AtlasLootItemsFrame_NEXT").lootpage = dataID.."Page"..(wlPage + 1);
			end
			if wlPage > 1 then
				getglobal("AtlasLootItemsFrame_PREV"):Show();
				getglobal("AtlasLootItemsFrame_PREV").lootpage = dataID.."Page"..(wlPage - 1);
			end
		else
			local tablebase = dataSource[dataID];
			if tablebase.Next then
				getglobal("AtlasLootItemsFrame_NEXT"):Show();
				getglobal("AtlasLootItemsFrame_NEXT").lootpage = tablebase.Next;
			end
			if tablebase.Prev then
				getglobal("AtlasLootItemsFrame_PREV"):Show();
				getglobal("AtlasLootItemsFrame_PREV").lootpage = tablebase.Prev;
			end
			if tablebase.Back then
				getglobal("AtlasLootItemsFrame_BACK"):Show();
				getglobal("AtlasLootItemsFrame_BACK").lootpage = tablebase.Back;			
			end
			
		end
	end

	--For Alphamap and Atlas integration, show a 'close' button to hide the loot table and restore the map view
	if (AtlasLootItemsFrame:GetParent() == AlphaMapAlphaMapFrame or AtlasLootItemsFrame:GetParent() == AtlasFrame) then
		AtlasLootItemsFrame_CloseButton:Show();
	else
		AtlasLootItemsFrame_CloseButton:Hide();
	end

	--Anchor the item frame where it is supposed to be
	AtlasLoot_SetItemInfoFrame(pFrame);
	if ATLASLOOT_FILTER_ENABLE == true and dataID ~= "FilterList" then
		AtlasLoot_HideNoUsableItems()
	end
	AtlasLoot_CurrentBoss = dataID
	if AtlasLoot.db.profile.ItemAutoQuery then AtlasLoot_QueryLootPage(); end
end

--[[
AtlasLoot_GenerateAtlasMenu(dataID, pFrame)
dataID - Identifier of the loot table to show
pFrame - Where to anchor the menu
This function allows menus to be defined in essentially the same way as
normal loot tables
]]
function AtlasLoot_GenerateAtlasMenu(dataID, pFrame)
    local extra;
    local text;
    local dataSource = AtlasLoot_Data;
    --Hide UI objects so that only needed ones are shown
	for i = 1, 30, 1 do
        getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide();
		getglobal("AtlasLootMenuItem_"..i):Hide();
        getglobal("AtlasLootItem_"..i):Hide();
	end
    for i = 1, 30, 1 do
        --Check for a valid object (that it exists, and that it has a name)
        if(AtlasLoot_Data[dataID][i] ~= nil and AtlasLoot_Data[dataID][i][4] ~= "") then

            text = AtlasLoot_Data[dataID][i][4];
            text = AtlasLoot_FixText(text);
            
            --Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
            AtlasLootItemsFrame.refresh = {dataID, "", "", pFrame};
                
            --Insert the item description
            if AtlasLoot_Data[dataID][i][5] then
                extra = AtlasLoot_Data[dataID][i][5];
            else
                extra = "";
            end
            extra = AtlasLoot_FixText(extra);

            --Use shortcuts for easier reference to parts of the item button
            itemButton = getglobal("AtlasLootMenuItem_"..AtlasLoot_Data[dataID][i][1]);
            iconFrame  = getglobal("AtlasLootMenuItem_"..AtlasLoot_Data[dataID][i][1].."_Icon");
            nameFrame  = getglobal("AtlasLootMenuItem_"..AtlasLoot_Data[dataID][i][1].."_Name");
            extraFrame = getglobal("AtlasLootMenuItem_"..AtlasLoot_Data[dataID][i][1].."_Extra");

            --If there is no data on the texture an item should have, show a big red question mark
            if AtlasLoot_Data[dataID][i][3] == "?" then
                iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
            else
                iconFrame:SetTexture("Interface\\Icons\\"..AtlasLoot_Data[dataID][i][3]);
            end
            itemButton.itemTexture = AtlasLoot_Data[dataID][i][3];
            if iconFrame:GetTexture() == nil then
                iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
            end
            itemButton.name = text;
            itemButton.extra = extra;
            --Store where we want the menu button to link to
            itemButton.lootpage = AtlasLoot_Data[dataID][i][2];
				
            --Set the name and description of the item
            nameFrame:SetText(text);
            extraFrame:SetText(extra);
            extraFrame:Show();

            itemButton.i = 1;
            itemButton:Show();
			
        end
        
    end
    
    
    AtlasLoot_BossName:SetText(AtlasLoot_TableNames[dataID][1]);
    
    --This is not a valid QuickLook, so hide the UI objects
    AtlasLoot_QuickLooks:Hide();
    AtlasLootQuickLooksButton:Hide();
	AtlasLootFilterCheck:Hide();
    
    --Hide navigation buttons by default, only show what we need
    getglobal("AtlasLootItemsFrame_BACK"):Hide();
    getglobal("AtlasLootItemsFrame_NEXT"):Hide();
    getglobal("AtlasLootItemsFrame_PREV"):Hide();
    
    local tablebase = AtlasLoot_Data[dataID];
    if tablebase.Next then
        getglobal("AtlasLootItemsFrame_NEXT"):Show();
        getglobal("AtlasLootItemsFrame_NEXT").lootpage = tablebase.Next;
    end
    if tablebase.Prev then
        getglobal("AtlasLootItemsFrame_PREV"):Show();
        getglobal("AtlasLootItemsFrame_PREV").lootpage = tablebase.Prev;
    end
    if tablebase.Back then
        getglobal("AtlasLootItemsFrame_BACK"):Show();
        getglobal("AtlasLootItemsFrame_BACK").lootpage = tablebase.Back;
    end
    
    --For Alphamap and Atlas integration, show a 'close' button to hide the loot table and restore the map view
	if (AtlasLootItemsFrame:GetParent() == AlphaMapAlphaMapFrame or AtlasLootItemsFrame:GetParent() == AtlasFrame) then
		AtlasLootItemsFrame_CloseButton:Show();
	else
		AtlasLootItemsFrame_CloseButton:Hide();
	end

	--Anchor the item frame where it is supposed to be
	AtlasLoot_SetItemInfoFrame(pFrame);
    
end

--[[
AtlasLoot_SetItemInfoFrame(pFrame):
pFrame - Data structure with anchor info.  Format: {Anchor Point, Relative Frame, Relative Point, X Offset, Y Offset }
This function anchors the item frame where appropriate.  The main Atlas frame can be passed instead of a custom pFrame.
If no pFrame is specified, the Atlas Frame is used if Atlas is installed.
]]
function AtlasLoot_SetItemInfoFrame(pFrame)
	if ( pFrame ) then
		--If a pFrame is specified, use it
		if(pFrame==AtlasFrame and AtlasFrame) then
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetParent(AtlasFrame);
			AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
		else
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetParent(pFrame[2]);
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetPoint(pFrame[1], pFrame[2], pFrame[3], pFrame[4], pFrame[5]);
		end
	elseif ( AtlasFrame ) then
		--If no pFrame is specified and Atlas is installed, anchor in Atlas
		AtlasLootItemsFrame:ClearAllPoints();
		AtlasLootItemsFrame:SetParent(AtlasFrame);
		AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
	else
		--Last resort, dump the items frame in the middle of the screen
		AtlasLootItemsFrame:ClearAllPoints();
		AtlasLootItemsFrame:SetParent(UIParent);
		AtlasLootItemsFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
	end
	AtlasLootItemsFrame:Show();
end

--[[
AtlasLootItemsFrame_OnCloseButton:
Called when the close button on the item frame is clicked
]]
function AtlasLootItemsFrame_OnCloseButton()
	--Set no loot table as currently selected
	AtlasLootItemsFrame.activeBoss = nil;
	--Fix the boss buttons so the correct icons are displayed
    if AtlasFrame and AtlasFrame:IsVisible() then
        if ATLAS_CUR_LINES then
            for i=1,ATLAS_CUR_LINES do
                if getglobal("AtlasBossLine"..i.."_Selected"):IsVisible() then
                    getglobal("AtlasBossLine"..i.."_Selected"):Hide();
                    getglobal("AtlasBossLine"..i.."_Loot"):Show();
                end
            end
        end
    end
	--Hide the item frame
	AtlasLootItemsFrame:Hide();
end

--[[
AtlasLootMenuItem_OnClick:
Requests the relevant loot page from a menu screen
]]
function AtlasLootMenuItem_OnClick()
	if this.lootpage ~= nil and this.lootpage ~= "" then
		AtlasLoot_ShowBossLoot(this.lootpage, "", AtlasLoot_AnchorFrame);
	end
end

--[[
AtlasLoot_NavButton_OnClick:
Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]

function AtlasLoot_NavButton_OnClick()
	if AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[4] then
		if strsub(this.lootpage, 1, 16) == "SearchResultPage" then
			AtlasLoot_ShowItemsFrame("SearchResult", this.lootpage, (AL["Search Result: %s"]):format(AtlasLootCharDB.LastSearchedText or ""), AtlasLootItemsFrame.refresh[4]);
		elseif strsub(this.lootpage, 1, 12) == "WishListPage" then
			AtlasLoot_ShowItemsFrame("WishList", this.lootpage, AL["Wishlist"], AtlasLootItemsFrame.refresh[4]);
		else
			AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], "", AtlasLootItemsFrame.refresh[4]);
		end
    else
		--Fallback for if the requested loot page is a menu and does not have a .refresh instance
		AtlasLoot_ShowItemsFrame(this.lootpage, "", "", AtlasFrame);
	end
end

--[[
AtlasLoot_IsLootTableAvailable(dataID):
Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
dataID: Loot table dataID
]]
function AtlasLoot_IsLootTableAvailable(dataID)

	local menu_check=false;

	local moduleName=nil;

	for k,v in pairs(AtlasLoot_MenuList) do
		if v == dataID then
			menu_check=true;
		end
	end

	if menu_check then
		return true;
	else
		if not AtlasLoot_TableNames[dataID] then
			DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot Error!"].." "..WHITE..dataID..AL[" not listed in loot table registry, please report this message to the AtlasLoot forums at https://discord.gg/uYCE2X2FgA"]);
			return false;
		end

		local dataSource = AtlasLoot_TableNames[dataID][2];

		moduleName = AtlasLoot_GetLODModule(dataSource);

		if AtlasLoot_Data[dataID] then
			return true;
		else
			if moduleName then
                if not IsAddOnLoaded(moduleName) then
                    loaded, reason=LoadAddOn(moduleName);
                    if not loaded then
                        if (reason == "MISSING") or (reason == "DISABLED") then
                            DEFAULT_CHAT_FRAME:AddMessage(GREEN..AL["AtlasLoot"]..": "..ORANGE..AtlasLoot_TableNames[dataID][1]..WHITE..AL[" is unavailable, the following load on demand module is required: "]..ORANGE..moduleName);
                            return false;
                        else
                            DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot Error!"].." "..WHITE..AL["Status of the following module could not be determined: "]..ORANGE..moduleName);
                            return false;
                        end
                    end
                end
                if AtlasLoot_Data[dataID] then
                    if ATLASLOOT_DEBUGMESSAGES then
                        DEFAULT_CHAT_FRAME:AddMessage(GREEN..AL["AtlasLoot"]..": "..ORANGE..moduleName..WHITE.." "..AL["sucessfully loaded."]);
                    end
                    collectgarbage("collect");
                    return true;
                else
                    DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot Error!"].." "..ORANGE..AtlasLoot_TableNames[dataID][1]..WHITE..AL[" could not be accessed, the following module may be out of date: "]..ORANGE..moduleName);
                    return false;
                end
            else
                DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot Error!"].." "..ORANGE..AL["Loot module returned as nil!"]);
                return false;
            end
		end
	end
end

--[[
AtlasLoot_GetLODModule(dataSource)
Returns the name of the module that needs to be loaded
dataSource: Location of the loot table
]]
function AtlasLoot_GetLODModule(dataSource)
	if (dataSource=="AtlasLootOriginalWoW") then
		return "AtlasLoot_OriginalWoW";
	elseif (dataSource=="AtlasLootBurningCrusade") then
		return "AtlasLoot_BurningCrusade";
	elseif (dataSource=="AtlasLootCrafting") then
		return "AtlasLoot_Crafting";
	elseif (dataSource=="AtlasLootWorldEvents") then
		return "AtlasLoot_WorldEvents";
	elseif (dataSource=="AtlasLootWotLK") then
		return "AtlasLoot_WrathoftheLichKing";
	end
end

--[[
AtlasLoot_LoadAllModules()
Used to load all available LoD modules
]]
function AtlasLoot_LoadAllModules()
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
AtlasLoot_ShowQuickLooks(button)
button: Identity of the button pressed to trigger the function
Shows the GUI for setting Quicklooks
]]
function AtlasLoot_ShowQuickLooks(button)
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
                    AtlasLootCharDB["QuickLooks"][1]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], AtlasLootItemsFrame.refreshOri[4]};
                    AtlasLoot_RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 2",
				"tooltipTitle", AL["QuickLook"].." 2",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 2",
				"func", function()
					AtlasLootCharDB["QuickLooks"][2]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], AtlasLootItemsFrame.refreshOri[4]};
                    AtlasLoot_RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
            dewdrop:AddLine(
				"text", AL["QuickLook"].." 3",
				"tooltipTitle", AL["QuickLook"].." 3",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 3",
				"func", function()
					AtlasLootCharDB["QuickLooks"][3]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], AtlasLootItemsFrame.refreshOri[4]};
                    AtlasLoot_RefreshQuickLookButtons();
                    dewdrop:Close(1);
				end
			);
            dewdrop:AddLine(
				"text", AL["QuickLook"].." 4",
				"tooltipTitle", AL["QuickLook"].." 4",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 4",
				"func", function()
					AtlasLootCharDB["QuickLooks"][4]={AtlasLootItemsFrame.refreshOri[1], AtlasLootItemsFrame.refreshOri[2], AtlasLootItemsFrame.refreshOri[3], AtlasLootItemsFrame.refreshOri[4]};
                    AtlasLoot_RefreshQuickLookButtons();
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
AtlasLoot_RefreshQuickLookButtons()
Enables/disables the quicklook buttons depending on what is assigned
]]
function AtlasLoot_RefreshQuickLookButtons()
    i=1;
    while i<5 do
        if ((not AtlasLootCharDB["QuickLooks"][i]) or (not AtlasLootCharDB["QuickLooks"][i][1])) or (AtlasLootCharDB["QuickLooks"][i][1]==nil) then
            getglobal("AtlasLootPanel_Preset"..i):Disable();
            getglobal("AtlasLootDefaultFrame_Preset"..i):Disable();
        else
            getglobal("AtlasLootPanel_Preset"..i):Enable();
            getglobal("AtlasLootDefaultFrame_Preset"..i):Enable();
        end
        i=i+1;
    end
end

--[[
AtlasLoot_QueryLootPage()
Querys all valid items on the current loot page.
]]
function AtlasLoot_QueryLootPage()
    i=1;
    local querytime = 0;
    local now = 0;
    while i<31 do
        now = GetTime();
        if now - querytime > 0.01 then
            querytime = GetTime();        
            button = getglobal("AtlasLootItem_"..i);
            queryitem = button.itemID;
            if (queryitem) and (queryitem ~= nil) and (queryitem ~= "") and (queryitem ~= 0) and (string.sub(queryitem, 1, 1) ~= "s") then
				AtlasLootTooltip:SetHyperlink("item:"..queryitem..":0:0:0:0:0:0:0");
				AtlasLootTooltip:SetHyperlink("item:60"..queryitem..":0:0:0:0:0:0:0");
            end
            i=i+1;
        end
    end
end

--[[
AtlasLoot_AddTooltip(frameb, tooltiptext)
Adds explanatory tooltips to UI objects.
]]
function AtlasLoot_AddTooltip(frameb, tooltiptext)
   if not tooltiptext or not frameb then return end
   local frame = getglobal(frameb)
   frame:SetScript("OnEnter", function()
      GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
      GameTooltip:SetText(tooltiptext)
      GameTooltip:Show()
   end)
   frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

--[[
AL_FindId(name, difficulty)
Finds the Ids of other difficulties based on the name of the item and the difficulty parameter given.
On the form of {Name, {normal, heroic, mythic, mythic1, mythic2, ... ,mythicN}}
]]
function AL_FindId(name, difficulty)
	for index, items in pairs(ItemIDsDatabase) do
		for key, eachItem in ipairs(items) do
			if eachItem == name then 
				return items[2][difficulty]
			end
		end
	end
end

-- https://replit.com/languages/lua
-- ItemIDsDatabase = {
-- 	--name, {normal, heroic, mythic, mythicN}
-- 	{"test1", {1000, 2000, 3000, 4000} },
-- 	{"test2", {1002, 2002, 3002, 4002} },
-- }
-- --[[
-- AL_FindId(name, difficulty)
-- Finds the Ids of other difficulties based on the name of the item and the difficulty parameter given.
-- On the form of {Name, {normal, heroic, mythic, mythic1, mythic2, ... ,mythicN}}
-- ]]

-- name = "test1"
-- difficulty = 2
	
-- for index, items in pairs(ItemIDsDatabase) do
-- 	--print(index, '\t', items)
	
-- 	for key, eachItem in ipairs(items) do
-- 	--	for key2, eachItem2 in ipairs(eachItem) do
-- 	--		print('\t', items[1], eachItem2)
-- 	--	end
-- 			print("test")
-- 		if eachItem == name then 
-- 			print(key, '\t', eachItem)
-- 			print(items[2][difficulty])
-- 		end
-- 		--	print('\t', key, value)
-- 	end
-- end