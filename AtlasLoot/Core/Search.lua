local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local modules = { "AtlasLoot_BurningCrusade", "AtlasLoot_Crafting", "AtlasLoot_OriginalWoW", "AtlasLoot_WorldEvents", "AtlasLoot_WrathoftheLichKing" };
local currentPage = 1;
local SearchResult = nil;

-- Supported Operators
local BINARYOPERATORS = { "&" };
local OPERATORS = { "<>", "<=", ">=", "=", "<", ">" };

-- Supported Stat Filters
local STATFILTERS = {
	-- Base Stats
	["stamina"] = "ITEM_MOD_STAMINA_SHORT",
	["stam"] = "ITEM_MOD_STAMINA_SHORT",
	["sta"] = "ITEM_MOD_STAMINA_SHORT",
	
	["strength"] = "ITEM_MOD_STRENGTH_SHORT",
	["str"] = "ITEM_MOD_STRENGTH_SHORT",
	
	["agility"] = "ITEM_MOD_AGILITY_SHORT",
	["agi"] = "ITEM_MOD_AGILITY_SHORT",
	
	["intellect"] = "ITEM_MOD_INTELLECT_SHORT",
	["int"] = "ITEM_MOD_INTELLECT_SHORT",
	
	["spirit"] = "ITEM_MOD_SPIRIT_SHORT",
	["spir"] = "ITEM_MOD_SPIRIT_SHORT",
	["spi"] = "ITEM_MOD_SPIRIT_SHORT",
	
	["health"] = "ITEM_MOD_HEALTH_SHORT",
	["mana"] = "ITEM_MOD_MANA_SHORT",
	
	["mp5"] = "ITEM_MOD_POWER_REGEN0_SHORT",
	["mpr"] = "ITEM_MOD_POWER_REGEN0_SHORT",
	
	["hp5"] = "ITEM_MOD_HEALTH_REGEN_SHORT",
	["hpr"] = "ITEM_MOD_HEALTH_REGEN_SHORT",
	
	--Sockets
	["socketblue"] = "EMPTY_SOCKET_BLUE",
	["socketred"] = "EMPTY_SOCKET_RED",
	["socketyellow"] = "EMPTY_SOCKET_YELLOW",
	
	["socketnocolor"] = "EMPTY_SOCKET_NO_COLOR",
	["socketwhite"] = "EMPTY_SOCKET_NO_COLOR",
	
	["socketmeta"] = "EMPTY_SOCKET_META",
	["meta"] = "EMPTY_SOCKET_META",
	
	--Secondary Stats
	["attackpowerferal"] = "ITEM_MOD_FERAL_ATTACK_POWER_SHORT",
	["attackpowferal"] = "ITEM_MOD_FERAL_ATTACK_POWER_SHORT",
	["apferal"] = "ITEM_MOD_FERAL_ATTACK_POWER_SHORT",
	
	["attackpower"] = "ITEM_MOD_ATTACK_POWER_SHORT",
	["attackpow"] = "ITEM_MOD_ATTACK_POWER_SHORT",
	["ap"] = "ITEM_MOD_ATTACK_POWER_SHORT",
	
	["spellpower"] = "ITEM_MOD_SPELL_POWER_SHORT",
	["spellpow"] = "ITEM_MOD_SPELL_POWER_SHORT",
	["sp"] = "ITEM_MOD_SPELL_POWER_SHORT",
	
	["spellpenetration"] = "ITEM_MOD_SPELL_PENETRATION_SHORT",
	["spellpen"] = "ITEM_MOD_SPELL_PENETRATION_SHORT",
	["spp"] = "ITEM_MOD_SPELL_PENETRATION_SHORT",
	
	["crit"] = "ITEM_MOD_CRIT_RATING_SHORT",
	["haste"] = "ITEM_MOD_HASTE_RATING_SHORT",
	
	["hit"] = "ITEM_MOD_HIT_RATING_SHORT",
	
	["armorpenetration"] = "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT",
	["armourpenetration"] = "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT",
	["armorpen"] = "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT",
	["armourpen"] = "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT",
	["arp"] = "ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT",
	
	["expertise"] = "ITEM_MOD_EXPERTISE_RATING_SHORT",
	["exp"] = "ITEM_MOD_EXPERTISE_RATING_SHORT",
	
	["dps"] = "ITEM_MOD_DAMAGE_PER_SECOND_SHORT",
	
	["resilience"] = "ITEM_MOD_RESILIENCE_RATING",
	["resil"] = "ITEM_MOD_RESILIENCE_RATING",
	["res"] = "ITEM_MOD_RESILIENCE_RATING",
	
	["defense"] = "ITEM_MOD_DEFENSE_SKILL_RATING_SHORT",
	["def"] = "ITEM_MOD_DEFENSE_SKILL_RATING_SHORT",
	
	["dodge"] = "ITEM_MOD_DODGE_RATING_SHORT",
	["dod"] = "ITEM_MOD_DODGE_RATING_SHORT",
	
	["block"] = "ITEM_MOD_BLOCK_RATING_SHORT",
	
	["blockvalue"] = "ITEM_MOD_BLOCK_VALUE_SHORT",
	["blockval"] = "ITEM_MOD_BLOCK_VALUE_SHORT",
	["bv"] = "ITEM_MOD_BLOCK_VALUE_SHORT",
	
	["parry"] = "ITEM_MOD_PARRY_RATING_SHORT",
	
	--Resistances
	["armor"] = "RESISTANCE0_NAME",
	["armour"] = "RESISTANCE0_NAME",
	["arm"] = "RESISTANCE0_NAME",
	["resistancephysical"] = "RESISTANCE0_NAME",
	["resistancephys"] = "RESISTANCE0_NAME",
	["resphys"] = "RESISTANCE0_NAME",
	
	["resistanceholy"] = "RESISTANCE1_NAME",
	["resholy"] = "RESISTANCE1_NAME",
	
	["resistancefire"] = "RESISTANCE2_NAME",
	["resfire"] = "RESISTANCE2_NAME",
	
	["resistancenature"] = "RESISTANCE3_NAME",
	["resnature"] = "RESISTANCE3_NAME",
	["resnat"] = "RESISTANCE3_NAME",
	
	["resistanceforst"] = "RESISTANCE4_NAME",
	["resfrost"] = "RESISTANCE4_NAME",
	
	["resistanceshadow"] = "RESISTANCE5_NAME",
	["resshadow"] = "RESISTANCE5_NAME",
	["resshad"] = "RESISTANCE5_NAME",
	
	["resistancearcane"] = "RESISTANCE6_NAME",
	["resarcane"] = "RESISTANCE6_NAME",
	["resarc"] = "RESISTANCE6_NAME"
};

local ITEMSOCKETSTATFILTERS = {
	"EMPTY_SOCKET_BLUE",
	"EMPTY_SOCKET_RED",
	"EMPTY_SOCKET_YELLOW",
	"EMPTY_SOCKET_META",
	"EMPTY_SOCKET_NO_COLOR"
};

local ITEMINFOFILTERS = {
	["ilvl"] = "ilvl",
	["minlvl"] = "minlvl",
	["type"] = "type",
	["subtype"] = "subtype",
	["quality"] = "quality"
};

local ITEMINFOVALUEFILTERS = {
	["poor"] = 0,
	["common"] = 1,
	["uncommon"] = 2,
	["rare"] = 3,
	["epic"] = 4,
	["legendary"] = 5,
	["artifact"] = 6,
	["heirloom"] = 7
};

local ITEMINFOEQUIPMENTLOC = {
	["INVTYPE_NON_EQUIP"] = "INVTYPE_NON_EQUIP",
	["INVTYPE_HEAD"] = "INVTYPE_HEAD",
	["INVTYPE_NECK"] = "INVTYPE_NECK",
	["INVTYPE_SHOULDER"] = "INVTYPE_SHOULDER",
	["INVTYPE_BODY"] = "INVTYPE_BODY",
	["INVTYPE_CHEST"] = "INVTYPE_CHEST",
	["INVTYPE_WAIST"] = "INVTYPE_WAIST",
	["INVTYPE_LEGS"] = "INVTYPE_LEGS",
	["INVTYPE_FEET"] = "INVTYPE_FEET",
	["INVTYPE_WRIST"] = "INVTYPE_WRIST",
	["INVTYPE_HAND"] = "INVTYPE_HAND",
	["INVTYPE_FINGER"] = "INVTYPE_FINGER",
	["INVTYPE_TRINKET"] = "INVTYPE_TRINKET",
	["INVTYPE_WEAPON"] = "INVTYPE_WEAPON",
	["INVTYPE_SHIELD"] = "INVTYPE_SHIELD",
	["INVTYPE_RANGED"] = "INVTYPE_RANGED",
	["INVTYPE_CLOAK"] = "INVTYPE_CLOAK",
	["INVTYPE_2HWEAPON"] = "INVTYPE_2HWEAPON",
	["INVTYPE_BAG"] = "INVTYPE_BAG",
	["INVTYPE_TABARD"] = "INVTYPE_TABARD",
	["INVTYPE_ROBE"] = "INVTYPE_ROBE",
	["INVTYPE_WEAPONMAINHAND"] = "INVTYPE_WEAPONMAINHAND",
	["INVTYPE_WEAPONOFFHAND"] = "INVTYPE_WEAPONOFFHAND",
	["INVTYPE_HOLDABLE"] = "INVTYPE_HOLDABLE",
	["INVTYPE_AMMO"] = "INVTYPE_AMMO",
	["INVTYPE_THROWN"] = "INVTYPE_THROWN",
	["INVTYPE_RANGEDRIGHT"] = "INVTYPE_RANGEDRIGHT",
	["INVTYPE_QUIVER"] = "INVTYPE_QUIVER",
	["INVTYPE_RELIC"] = "INVTYPE_RELIC"
};

local ITEMLEVELGEAREQUIPFILTER = {
	["INVTYPE_NON_EQUIP"] = "INVTYPE_NON_EQUIP",
	["INVTYPE_BODY"] = "INVTYPE_BODY",
	["INVTYPE_BAG"] = "INVTYPE_BAG",
	["INVTYPE_AMMO"] = "INVTYPE_AMMO",
	["INVTYPE_QUIVER"] = "INVTYPE_QUIVER"
};

-- Slash command that prints out all used item filter keys
SLASH_ATLASLOOTITEMINFOFILTERS1 = "/atlaslootfilterkeys";
SlashCmdList["ATLASLOOTITEMINFOFILTERS"] = function(msg, editBox)
	local sortedTable = { "socket", "sockets", "gem", "gems", "ilvl" };
	for index, statItem in pairs(STATFILTERS) do
		table.insert(sortedTable, index);
	end
	table.sort(sortedTable, function(a,b) return a < b; end)

	local filterKeys = "Filter keys: [ ";
	for i, filterIndex in pairs(sortedTable) do
		if i == 1 then
			filterKeys = filterKeys..filterIndex;
		else
			filterKeys = filterKeys..", "..filterIndex;
		end
	end
	filterKeys = filterKeys.." ]";
	
	print(filterKeys);
end

-- Slash command that prints filter examples
SLASH_ATLASLOOTITEMINFOFILTEREXAMPLE1 = "/atlaslootfilterexample";
SlashCmdList["ATLASLOOTITEMINFOFILTEREXAMPLE"] = function(msg, editBox)
	print("Single search example: str>40");
	print("Multi search example: str>40&ilvl<140&ilvl>=120&int>0&socket>2");
end

function AtlasLoot:ShowSearchResult()
	AtlasLoot_ShowItemsFrame("SearchResult", "SearchResultPage"..currentPage, (AL["Search Result: %s"]):format(AtlasLootCharDB.LastSearchedText or ""), pFrame);
end

function AtlasLoot:Search(Text)
	if not Text then return end
	Text = strtrim(Text);
	if Text == "" then return end
	
	-- Decide if we need load all modules or just specified ones
	local allDisabled = not self.db.profile.SearchOn.All;
	if allDisabled then
		for _, module in ipairs(modules) do
			if self.db.profile.SearchOn[module] == true then
				allDisabled = false;
				break;
			end
		end
	end
	if allDisabled then
		DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..WHITE..AL["You don't have any module selected to search on."]);
		return;
	end
	if self.db.profile.SearchOn.All then
		AtlasLoot_LoadAllModules();
	else
		for k, v in pairs(self.db.profile.SearchOn) do
			if k ~= "All" and v == true and not IsAddOnLoaded(k) and LoadAddOn(k) and self.db.profile.LoDNotify then
				DEFAULT_CHAT_FRAME:AddMessage(GREEN..AL["AtlasLoot"]..": "..ORANGE..k..WHITE.." "..AL["sucessfully loaded."]);
			end
		end
	end
	
    AtlasLootCharDB["SearchResult"] = {};
	AtlasLootCharDB.LastSearchedText = Text;
    
	local text = string.lower(Text);
    --[[if not self.db.profile.SearchOn.All then
        local module = AtlasLoot_GetLODModule(dataSource);
        if not module or self.db.profile.SearchOn[module] ~= true then return end
    end]]
	
	local function HaveBinaryOperator (textValue)
		for index, operator in ipairs(BINARYOPERATORS) do
			if string.find(textValue, operator) then
				return operator;
			end
		end
		return nil;
	end
	
	local function HaveOperator (textValue)
		for index, operator in ipairs(OPERATORS) do
			if string.find(textValue, operator) then
				return operator;
			end
		end
		return nil;
	end
	
	local function SplitString(str, delimiter)
		result = {};
		for match in (str..delimiter):gmatch("(.-)"..delimiter) do
			table.insert(result, match);
		end
		return result;
	end
	
	local function CompareNumbersByOperator (operator, baseValue, valueToCompare)
		if baseValue ~= nil and valueToCompare ~= nil
			and ((operator == "<>") and (baseValue ~= valueToCompare)
				or (operator == "<=") and (baseValue <= valueToCompare)
				or (operator == ">=") and (baseValue >= valueToCompare)
				or (operator == "=") and (baseValue == valueToCompare)
				or (operator == "<") and (baseValue < valueToCompare)
				or (operator == ">") and (baseValue > valueToCompare))
		then
			return true;
		end
		return false;
	end
	
	-- Region: Stat Filter
	local function IsSocketTermInSearchText(searchText)
		if string.find(searchText, "socket")
			or string.find(searchText, "sockets")
			or string.find(searchText, "gem")
			or string.find(searchText, "gems")
		then
			return true;
		end
		return false;
	end
	
	local function IsSocketTermEqualsSearchText(searchText)
		if searchText == "socket"
			or searchText == "sockets"
			or searchText == "gem"
			or searchText == "gems"
		then
			return true;
		end
		return false;
	end
	
	local function FilterSockets(searchTextItem, stats, operator)
		if stats then
			if IsSocketTermInSearchText(searchTextItem) then
				local searchedStatValue = tonumber(string.match(searchTextItem, "%d+"));
				local searchTerm = string.gsub(searchTextItem, tostring(searchedStatValue), "");
				searchTerm = string.gsub(searchTerm, operator, "");

				if IsSocketTermEqualsSearchText(searchTerm) then
					local socketCount = 0;
					for _, socketType in pairs(ITEMSOCKETSTATFILTERS) do
						if socketType then
							local statValue = tonumber(stats[socketType]);
							if statValue then
								socketCount = socketCount + statValue;
							end
						end
					end
					if CompareNumbersByOperator(operator, socketCount, searchedStatValue) then
						return true;
					end
				end
			end
		end
		return false;
	end
	
	local function HaveStat (textValue)
		for index, statItem in pairs(STATFILTERS) do
			if textValue == index then
				return STATFILTERS[index];
			end
		end
		return nil;
	end
	
	local function IsItemStatMatch(searchTextItem, stats, operator)
		if stats then
			local searchedStat = tonumber(string.match(searchTextItem, "%d+"));
			local searchTerm = searchTextItem.gsub(searchTextItem, tostring(searchedStat), "");
			searchTerm = string.gsub(searchTerm, operator, "");
		
			local statFilterFound = HaveStat(searchTerm);
			if statFilterFound then
				local statValue = tonumber(stats[statFilterFound]);
				if CompareNumbersByOperator(operator, statValue, searchedStat) then
					return true;
				end
			else
				return FilterSockets(searchTextItem, stats, operator);
			end
		end
		return false;
	end
	-- EndRegion
	
	-- Region: Item Level Filter
	local function HaveItemInfoFilter (textValue)
		for index, itemInfoFilter in pairs(ITEMINFOFILTERS) do
			if textValue == index then
				return index;
			end
		end
		return nil;
	end
	
	local function IsEquipableGear (textValue)
		if textValue == nil or textValue == "" then
			return false;
		end
		for index, equipLoc in ipairs(ITEMLEVELGEAREQUIPFILTER) do
			if string.find(textValue, equipLoc) then
				return false;
			end
		end
		return true;
	end
	
	local function IsItemLevelFilter (textValue)
		local itemLevelFilter = ITEMINFOFILTERS["ilvl"];
		if string.match(textValue, itemLevelFilter) then
			return true;
		end
		return false;
	end
	
	local function IsItemLevelFilterMatch(searchText, itemLvl, itemEquipLoc, operator)
		local searchedItemLevel = tonumber(string.match(searchText, "%d+"));
		local searchTerm = searchText.gsub(searchText, tostring(searchedItemLevel), "");
		searchTerm = string.gsub(searchTerm, operator, "");
		
		local itemInfoFilter = HaveItemInfoFilter(searchTerm);
		if itemInfoFilter and itemLvl ~= nil and itemLvl > 0
			--TODO Equipment filter patch
			--and IsEquipableGear(itemEquipLoc)
			and IsItemLevelFilter(itemInfoFilter)
		then
			if CompareNumbersByOperator(operator, itemLvl, searchedItemLevel) then
				return true;
			end
		end
		return false;
	end
	-- EndRegion
	
	-- Add item to Search Result
	local function AddItemToSearchResult(itemId, itemType, itemName, lootPage, dataId)
        table.insert(AtlasLootCharDB["SearchResult"], { 0, itemId, itemType, itemName, lootPage, "", "", dataId.."|".."\"\"" });
    end
	
	-- Checks for Partial Matching
    local partial = self.db.profile.PartialMatching;
	
	-- Checks for Item Filters by searching for an Operator in the search text
	local operator = HaveOperator(text);
	
    for dataID, data in pairs(AtlasLoot_Data) do
        for _, v in ipairs(data) do
            if type(v[2]) == "number" and v[2] > 0 then
                -- Name, Link, Quality(num), iLvl(num), minLvl(num), itemType(localized string), itemSubType(localized string), stackCount(num), itemEquipLoc(enum), texture(link to a local file), displayId(num)
                local itemName, _, itemQuality, itemLvl, minLvl, _, _, _, itemEquipLoc = GetItemInfo(v[2]);
                
                if not itemName then itemName = gsub(v[4], "=q%d=", "") end

                if operator ~= nil then
					local stats = GetItemStats("item:"..tostring(v[2]));
					
					 -- Currently only supports "&"
					local binaryOperator = HaveBinaryOperator(text);
					if binaryOperator ~= nil then
						local searchConditionsMet = true;
						local searchItems = SplitString(text, binaryOperator);
						
						if searchItems then
							for _, searchTextItem in ipairs(searchItems) do
								local localOperator = HaveOperator(searchTextItem);
								if not localOperator
									or not (
										-- Stat Filter
										IsItemStatMatch(searchTextItem, stats, localOperator)
										-- Item Level Filter
										or IsItemLevelFilterMatch(searchTextItem, itemLvl, itemEquipLoc, localOperator)
									)
								then
									searchConditionsMet = false;
									break;
								end
							end
							
							if searchConditionsMet then
								AddItemToSearchResult(v[2], v[3], itemName, lootpage, dataID);
							end
						end
					else
						-- Stat Filter
						if IsItemStatMatch(text, stats, operator)
							-- Item Level Filter
							or IsItemLevelFilterMatch(text, itemLvl, itemEquipLoc, operator)
						then
							AddItemToSearchResult(v[2], v[3], itemName, lootpage, dataID);
						end
						-- TODO itemQuality
						-- TODO minLvl
						-- TODO itemEquipLoc
					end
					
					-- Stat Table Cleanup
					if stats then
						table.wipe(stats);
					end
                end
				
                local found;
                if partial then
                    found = string.find(string.lower(itemName), text);
                else
                    found = string.lower(itemName) == text;
                end
                if found then
                    local _, _, quality = string.find(v[4], "=q(%d)=");
                    if quality then itemName = "=q"..quality.."="..itemName end
                    if AtlasLoot_TableNames[dataID] then lootpage = AtlasLoot_TableNames[dataID][1]; else lootpage = "Argh!"; end
                    table.insert(AtlasLootCharDB["SearchResult"], { 0, v[2], v[3], itemName, lootpage, "", "", dataID.."|".."\"\"" });
                end
            elseif (v[2] ~= nil) and (v[2] ~= "") and (string.sub(v[2], 1, 1) == "s") then 
                local spellName = GetSpellInfo(string.sub(v[2], 2));
                if not spellName then
                    if (string.sub(v[4], 1, 2) == "=d") then  
                        spellName = gsub(v[4], "=ds=", "");
                    else
                        spellName = gsub(v[4], "=q%d=", ""); 
                    end
                end
                local found;
                if partial then
                    found = string.find(string.lower(spellName), text);
                else
                    found = string.lower(spellName) == text;
                end
                if found then
                    spellName = string.sub(v[4], 1, 4)..spellName;
                    if AtlasLoot_TableNames[dataID][1] then lootpage = AtlasLoot_TableNames[dataID][1]; else lootpage = "Argh!"; end
                    table.insert(AtlasLootCharDB["SearchResult"], { 0, v[2], v[3], spellName, lootpage, "", "", dataID.."|".."\"\"" });
                end
            end
        end
    end
	
	if #AtlasLootCharDB["SearchResult"] == 0 then
		local itemFilterErrorMessage = "";
		if operator then
			itemFilterErrorMessage = [[
Please check if you have a typo in the filter.
To check filter keys, type "/atlaslootfilterkeys".
To check filter examples, type "/atlaslootfilterexample".
You might also have to query the server for item informations to load them into your client's Cache.]];
		end
		DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..WHITE..AL["No match found for"].." \""..Text.."\"."..itemFilterErrorMessage);
	else
		currentPage = 1;
		SearchResult = AtlasLoot_CategorizeWishList(AtlasLootCharDB["SearchResult"]);
		AtlasLoot_ShowItemsFrame("SearchResult", "SearchResultPage1", (AL["Search Result: %s"]):format(AtlasLootCharDB.LastSearchedText or ""), pFrame);
	end
end

function AtlasLoot:ShowSearchOptions(button)
	local dewdrop = AceLibrary("Dewdrop-2.0");
	if dewdrop:IsOpen(button) then
		dewdrop:Close(1);
	else
		local setOptions = function()
			dewdrop:AddLine(
				"text", AL["Search on"],
				"isTitle", true,
				"notCheckable", true
			);
			dewdrop:AddLine(
				"text", AL["All modules"],
				"checked", self.db.profile.SearchOn.All,
				"tooltipTitle", AL["All modules"],
				"tooltipText", AL["If checked, AtlasLoot will load and search across all the modules."],
				"func", function()
					self.db.profile.SearchOn.All = not self.db.profile.SearchOn.All;
				end
			);
			for _, module in ipairs(modules) do
				if IsAddOnLoadOnDemand(module) then
					local title = GetAddOnMetadata(module, "title");
					local notes = GetAddOnMetadata(module, "notes");
					dewdrop:AddLine(
						"text", title,
						"checked", self.db.profile.SearchOn.All or self.db.profile.SearchOn[module],
						"disabled", self.db.profile.SearchOn.All,
						"tooltipTitle", title,
						"tooltipText", notes,
						"func", function()
							if self.db.profile.SearchOn[module] == nil then
								self.db.profile.SearchOn[module] = true;
							else
								self.db.profile.SearchOn[module] = nil;
							end
						end
					);
				end
			end
			dewdrop:AddLine(
				"text", AL["Search options"],
				"isTitle", true,
				"notCheckable", true
			);
			dewdrop:AddLine(
				"text", AL["Partial matching"],
				"checked", self.db.profile.PartialMatching,
				"tooltipTitle", AL["Partial matching"],
				"tooltipText", AL["If checked, AtlasLoot search item names for a partial match."],
				"func", function() self.db.profile.PartialMatching = not self.db.profile.PartialMatching end
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

function AtlasLoot:GetOriginalDataFromSearchResult(itemID)
	for i, v in ipairs(AtlasLootCharDB["SearchResult"]) do
		if v[2] == itemID then 
            AtlasLoot_ShowWishListDropDown(v[2], v[3], v[4], v[5], v[8], this);        
        end
	end
end

-- Copied and modified from AtlasLoot_GetWishListPage
function AtlasLoot:GetSearchResultPage(page)
	if not SearchResult then SearchResult = AtlasLoot_CategorizeWishList(AtlasLootCharDB["SearchResult"]) end
	-- Calc for maximal pages
	local pageMax = math.ceil(#SearchResult / 30);
	if page < 1 then page = 1 end
	if page > pageMax then page = pageMax end
	currentPage = page;

	-- Table copy
    local k=1;
	local result = {};
	local start = (page - 1) * 30 + 1;
	for i = start, start + 29 do
		if not SearchResult[i] then break end
        SearchResult[i][1] = k;
		table.insert(result, SearchResult[i]);
        k=k+1;
	end
	return result, pageMax;
end
