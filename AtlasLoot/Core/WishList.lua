--[[
File containing functions related to the wish list.

Functions:
AtlasLoot_AddToWishlist(itemID, itemTexture, itemName, lootPage, sourcePage)
AtlasLoot_DeleteFromWishList(itemID)
AtlasLoot_WishListCheck(itemID, all)

<local> ClearLines()
<local> AddWishListOptions(parrent,name,icon,xxx,tabname,tab2)
<local> AddTexture(par, num)
AtlasLoot_RefreshWishlists()
AtlasLoot_CreateWishlistOptions()
]]
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")

local ALModule = AtlasLoot:NewModule("WishList", "AceSerializer-3.0", "AceComm-3.0")

AtlasLoot_WishListDrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_WishListOptions = AceLibrary("Dewdrop-2.0");

AtlasLoot_WishList = nil;
local playerName = UnitName("player");
local itemID, itemTexture, itemName, lootPage, sourcePage, xtyp, xarg2, xarg3, difficulty;
local OptionsLoadet = false;
local curaddicon, curaddname = "","";
local curtable = {"","",""};
local editName = false;

AtlasLootWishList = {}

-- Colours stored for code readability
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

function AtlasLoot:ShowWishList(listType,arg2,arg3)
	AtlasLoot_CurrentWishList = {["Show"] = {ListType = listType, ListNum = arg2 ,Name = "WishLists", Icon = AtlasLootWishList[listType][arg2].Icon}};
	local numPages = math.ceil(#AtlasLootWishList[listType][arg2]/30);
	for n = 1 ,numPages, 1 do
		table.insert(AtlasLoot_CurrentWishList["Show"], {Name = "Page "..n})
	end
		for i,v in ipairs(AtlasLootWishList[listType][arg2]) do
			local itemNum
			if (v[1]-(math.floor(v[1]/30)*30)) == 0 then
				itemNum = 30;
			else
				itemNum = v[1]-(math.floor(v[1]/30)*30);
			end
			table.insert(AtlasLoot_CurrentWishList["Show"][math.ceil(v[1]/30)], {itemNum,v[2],v[3],v[4],v[5],v[6],v[7],v[8]});
		end
	AtlasLoot:ShowItemsFrame("Show", "AtlasLoot_CurrentWishList", arg3 or 1);
	AtlasLoot_WishListDrop:Close(1)
end

--[[
AtlasLoot_WishListAddDropClick(typ, arg2, arg3, arg4)
Add a item too the wishlist or show the selected wishlist
]]
function AtlasLoot_WishListAddDropClick(typ, arg2, arg3, arg4)
	if arg4 == true then
		if typ == "addOwn" then
			AtlasLoot:ShowWishList("Own",arg2);
		elseif typ == "addShared" then
			AtlasLoot:ShowWishList("Shared",arg2);
		end
	else
		xtyp = typ
		xarg2 = arg2
		if typ == "addOwn" then
			if AtlasLoot_WishListCheck(itemID) then
				DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..AtlasLoot_FixText(itemName)..RED..AL[" already in the WishList!"]..WHITE.." ("..AtlasLootWishList["Own"][arg2].Name..")");
				return;
			end
			if(AtlasLootItemsFrame.refresh[1] == "SearchResult") then
				local dataID, _, dataPage = strsplit("|", sourcePage);
				table.insert(AtlasLootWishList["Own"][arg2], { #AtlasLootWishList["Own"][arg2] + 1, itemID, itemTexture, itemName, AtlasLoot_Data[dataID][tonumber(dataPage)].Name, "", "", sourcePage});
			else
				table.insert(AtlasLootWishList["Own"][arg2], { #AtlasLootWishList["Own"][arg2] + 1, itemID, itemTexture, itemName, AtlasLoot_Data[AtlasLootItemsFrame.refresh[1]].Name, "", "", sourcePage});
			end
			if AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] then
				AtlasLoot:SortWishList(nil,"Own", arg2);
			end
			DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..AtlasLoot_FixText(itemName)..GREY..AL[" added to the WishList."]..WHITE.." ("..AtlasLootWishList["Own"][arg2].Name..")");
			AtlasLoot_WishListDrop:Close(1)
		elseif typ == "addShared" then
			if AtlasLoot_WishListCheck(itemID) then
				DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..AtlasLoot_FixText(itemName)..RED..AL[" already in the WishList!"]..WHITE.." ("..AtlasLootWishList["Shared"][arg2].Name);
				return;
			end
			table.insert(AtlasLootWishList["Shared"][arg2], { #AtlasLootWishList["Shared"][arg2] + 1, itemID, itemTexture, itemName, lootPage, "", "", sourcePage});
			if AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] then
				AtlasLoot:SortWishList(nil,"Shared", arg2);
			end
			DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..AtlasLoot_FixText(itemName)..GREY..AL[" added to the WishList."]..WHITE.." ("..AtlasLootWishList["Shared"][arg2].Name..")");
			AtlasLoot_WishListDrop:Close(1)
		end
	end
end

function AtlasLoot:CloneTable(t)				-- return a copy of the table t
	local new = {};					-- create a new table
	local i, v = next(t, nil);		-- i is an index of t, v = t[i]
	while i do
		if type(v)=="table" then 
			v=AtlasLoot:CloneTable(v);
		end
		new[i] = v;
		i, v = next(t, i);			-- get next index
	end
	return new;
end

-- Add CustomHeader 
function AtlasLoot:AddItemCustomHeader(num,text)
	for i,v in ipairs(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum]) do
		if num <= v[1] then
			v[1] = v[1] + 1;
		end
	end
	if text == "" or text == nil then
		table.insert(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum],{num, 0, "Blank", WHITE..text, ""});
	else
		table.insert(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum],{num, 0, "INV_Box_01", WHITE..text, ""});
	end
	AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, AtlasLoot_CurrentWishList["Show"].ListNum,AtlasLootItemsFrame.refresh[3]);
end

-- Opens edit wishlist name/icon window
function AtlasLoot:EditWishList()
	AtlasLootWishList_AddFrame:Show()
    AtlasLottAddEditWishList:SetText(AL["Edit Wishlist"]);
    AtlasLootWishListNewName:SetText(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name);
    curaddicon = AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Icon;
    editName = true;
    AtlasLoot_WishListDrop:Close(1);
end

-- Moves wishlist item
function AtlasLoot:MoveWishlistItem(pos,itemNum,replaceNum,replaceNum2)
	itemNum = itemNum + ((AtlasLootItemsFrame.refresh[3]-1)*30);
	if pos == "Up" then replaceNum = itemNum - 1; replaceNum2 = 1 elseif pos == "Down" then replaceNum = itemNum + 1; replaceNum2 = -1 end
	if replaceNum ~= 0 then
		for i,v in ipairs(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum]) do
			if itemNum == v[1] then
				v[1] = replaceNum;
			elseif v[1] == replaceNum then
				v[1] = v[1] + replaceNum2;
			end
		end
		AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, AtlasLoot_CurrentWishList["Show"].ListNum,AtlasLootItemsFrame.refresh[3]);
	end
end

--Sort wishlist
function AtlasLoot:SortWishList(refresh,type,tNumb)
	local sorted = {};
	local name = AtlasLootWishList[type][tNumb].Name;
	local icon = AtlasLootWishList[type][tNumb].Icon;
		for i,v in ipairs(AtlasLootWishList[type][tNumb]) do
			local function tableCheck()
				for n,t in ipairs(sorted) do
					if t[2][5] == v[5] then
						return t
					end
				end
			end
				if v[2] ~= 0 and tableCheck() then
					table.insert(tableCheck(),v);
				elseif v[2] ~= 0 then
					table.insert(sorted,{{0, 0, "INV_Box_01", WHITE..v[5], ""},v});
				end
		end
		AtlasLootWishList[type][tNumb] = {};
		local num = 1
		for i,v in ipairs(sorted) do
			for n,t in ipairs(v) do
				if num ~= 1 and t[3] == "INV_Box_01" then
					table.insert(AtlasLootWishList[type][tNumb],{num, 0, "Blank", WHITE.." ", ""});
					num = num + 1;
				end
					table.insert(AtlasLootWishList[type][tNumb],{num,t[2],t[3],t[4],t[5],t[6],t[7],t[8]});
					num = num + 1;
			end
		end
		AtlasLootWishList[type][tNumb].Name = name;
		AtlasLootWishList[type][tNumb].Icon = icon;
		if refresh then
		AtlasLoot:ShowWishList(type, tNumb);
		end
end

-- Opens add wishlist name/icon window
function AtlasLoot:AddWishList()
	AtlasLootWishList_AddFrame:Show();
    AtlasLottAddEditWishList:SetText(AL["Add Wishlist"]);
    AtlasLoot_WishListDrop:Close(1);
end

-- Clones a shared wishlist to personal table
function AtlasLoot:CloneSharedWishList()
	table.insert(AtlasLootWishList["Own"],AtlasLootWishList[AtlasLootItemsFrame.refresh[1]][AtlasLootItemsFrame.refresh[3]]);
    AtlasLoot_WishListDrop:Close(1);
end

-- Clones a shared wishlist to personal table
function AtlasLoot:SetDefaultWishList()
	if AtlasLoot_CurrentWishList["Show"].ListType == "Own" then
		AtlasLootWishList["Options"][playerName]["DefaultWishList"] = {AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum};
	end
    AtlasLoot_WishListDrop:Close(1);
end

-- Deletes current wishlist
function AtlasLoot:DeleteWishList()
	if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
		StaticPopup_Show("ATLASLOOT_DELETE_WISHLIST");
		AtlasLoot_WishListDrop:Close(1);
	end
end

-- Share current wishlist
function AtlasLoot:ShareWishList()
	StaticPopup_Show ("ATLASLOOT_SEND_WISHLIST",AtlasLootWishList["Own"][AtlasLoot_CurrentWishList["Show"].ListNum].Name);
end

--[[ 
AtlasLoot:WishListSwapButton
Main panel wishlistswap button
 ]]
 function AtlasLoot:WishListSwapButton(xitemID, xitemTexture, xitemName, xlootPage, xsourcePage, button, show)
	if AtlasLoot_CurrentWishList["Show"].ListType == "Own" then
		if AtlasLootWishList["Shared"][1] then
			AtlasLoot_WishListAddDropClick("addShared", 1, "", show);
			AtlasLootItemsFrame_Wishlist_Swap:SetText("Own");
		end
	elseif AtlasLoot_CurrentWishList["Show"].ListType == "Shared" then
		AtlasLoot_WishListAddDropClick("addOwn", AtlasLootWishList["Options"][playerName]["DefaultWishList"][3] or 1, "", show);
		AtlasLootItemsFrame_Wishlist_Swap:SetText("Shared");
	end
end

--[[ 
AtlasLoot:WishListButton
Main panel wishlist button
 ]]
function AtlasLoot:WishListButton(xitemID, xitemTexture, xitemName, xlootPage, xsourcePage, button, show, buttonclick)
	if buttonclick == "RightButton" then
		AtlasLoot_ShowWishListDropDown(xitemID, xitemTexture, xitemName, xlootPage, xsourcePage, button, show, "Enable")
	elseif buttonclick == "LeftButton" then
		if AtlasLootWishList["Own"][1] then
			AtlasLoot_WishListAddDropClick("addOwn", AtlasLootWishList["Options"][playerName]["DefaultWishList"][3] or 1, "", show)
		else
			DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..AL["Please Create a Wishlist First."]);
		end
	end
end

--[[
AtlasLoot_ShowWishListDropDown(xitemID, xitemTexture, xitemName, xlootPage, xsourcePage, button, show)
Show the dropdownlist with the wishlists
]]
function AtlasLoot_ShowWishListDropDown(xitemID, xitemTexture, xitemName, xlootPage, xsourcePage, button, show, panelButton)
	itemID, itemTexture, itemName, lootPage, sourcePage = xitemID, xitemTexture, xitemName, xlootPage, xsourcePage
	if AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] == true and panelButton ~= "Enable" then
		AtlasLoot_WishListAddDropClick("addOwn", AtlasLootWishList["Options"][playerName]["DefaultWishList"][3], "", nil)
		return
	else
		if AtlasLoot_WishListDrop:IsOpen(button) then
			AtlasLoot_WishListDrop:Close(1);
		else
			local setOptions = function(level, value)
				if level == 1 then
					AtlasLoot_WishListDrop:AddLine(
						"text", AL["Own Wishlists"],
						"tooltipTitle", AL["Own Wishlists"],
						"value", "OwnWishlists",
						"arg1", "1",
						"hasArrow", true,
						"func", AtlasLoot_WishListAddDropClick,
						"notCheckable", true
					);
					AtlasLoot_WishListDrop:AddLine(
						"text", AL["Shared Wishlists"],
						"tooltipTitle", AL["Shared Wishlists"],
						"value", "SharedWishlists",
						"arg1", "1",
						"hasArrow", true,
						"func", AtlasLoot_WishListAddDropClick,
						"notCheckable", true
					);
					AtlasLoot_WishListDrop:AddLine(
						"text", AL["Add Wishlist"],
						"func", function() AtlasLoot:AddWishList() end,
						"notCheckable", true
					);
					AtlasLoot_WishListDrop:AddLine(
						"text", AL["Close"],
						"func", function() AtlasLoot_WishListDrop:Close(1) end,
						"notCheckable", true
					);
				elseif level == 2 then
					if value == "OwnWishlists" then
						for k,v in pairs(AtlasLootWishList["Own"]) do
							if type(v) == "table" then
								AtlasLoot_WishListDrop:AddLine(
									"text", v.Name,
									"tooltipTitle", v.Name,
									"func", AtlasLoot_WishListAddDropClick,
									"arg1", "addOwn",
									"arg2", k,
									"arg3", "",
									"arg4", show,
									"notCheckable", true
								);
							end
						end
					elseif value == "SharedWishlists" then
						for k,v in pairs(AtlasLootWishList["Shared"]) do
							if type(v) == "table" then
								AtlasLoot_WishListDrop:AddLine(
									"text", v.Name,
									"tooltipTitle", v.Name,
									"func", AtlasLoot_WishListAddDropClick,
									"arg1", "addShared",
									"arg2", k,
									"arg3", "",
									"arg4", show,
									"notCheckable", true
								);
							end
						end
					end
				end
			end
			AtlasLoot_WishListDrop:Open(button,
				"point", function(parent)
					return "TOP", "BOTTOM";
				end,
				"children", setOptions
			);
		end

	--	DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..AL["Please set a default Wishlist."]);
	end
end

--[[
AtlasLoot_DeleteFromWishList(itemID)
Deletes the specified items from the wishlist
]]
function AtlasLoot_DeleteFromWishList(itemID,btnNumber)
	btnNumber  = btnNumber + ((AtlasLootItemsFrame.refresh[3] - 1) * 30);
	if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
	   for i, v in ipairs(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum]) do
			if v[1] == btnNumber then
				local numPos = v[1];
				DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..AtlasLoot_FixText(v[4])..GREY..AL[" deleted from the WishList."]..WHITE.." ("..AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name..")");
				table.remove(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum], i);
				--Sort wishlist after deleting an item
				for n,table in ipairs(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum]) do
					if numPos <= table[1] then
						table[1] = table[1] - 1;
					end
				end
				break;
			end
	   end
	end
	AtlasLootItemsFrame:Hide();
	AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, AtlasLoot_CurrentWishList["Show"].ListNum,AtlasLootItemsFrame.refresh[3]);
 end

--[[
AtlasLoot_WishListCheck(itemID, all):
Returns true if an item is already in the wishlist
]]
function AtlasLoot_WishListCheck(itemID, all)
	if all == true then
		local rettex = ""
		if not AtlasLootWishList["Options"][playerName]["markInTable"] then AtlasLootWishList["Options"][playerName]["markInTable"] = "own" end
		if AtlasLootWishList["Options"][playerName]["markInTable"] == "own" then
			for k,v in ipairs(AtlasLootWishList["Own"]) do
				if type(v) == "table" then
					for i,j in ipairs(AtlasLootWishList["Own"][k]) do
						if AtlasLootWishList["Own"][k][i][2] == itemID then
							if AtlasLootWishList["Own"][k].Icon ~= "" then
								rettex = rettex.."|T"..AtlasLootWishList["Own"][k].Icon..":0|t"
							else
								rettex = rettex.."|TInterface\\Icons\\INV_Misc_QuestionMark:0|t"
							end
							break
						end
					end
				end
			end
		elseif AtlasLootWishList["Options"][playerName]["markInTable"] == "all" then
			for k,v in ipairs(AtlasLootWishList["Own"]) do
				for i,j in ipairs(AtlasLootWishList["Own"][k]) do
					for b,c in ipairs(AtlasLootWishList["Own"][k][i]) do
						if AtlasLootWishList["Own"][k][i][b][2] == itemID then
							if AtlasLootWishList["Own"][k][i].Icon ~= "" then
								rettex = rettex.."|T"..AtlasLootWishList["Own"][k][i].Icon..":0|t"
							else
								rettex = rettex.."|TInterface\\Icons\\INV_Misc_QuestionMark:0|t"
							end
							break
						end
					end
				end
			end
            for k,v in pairs(AtlasLootWishList["Shared"]) do
				for i,j in pairs(AtlasLootWishList["Shared"][k]) do
					for b,c in pairs(AtlasLootWishList["Shared"][k][i]) do
						if AtlasLootWishList["Shared"][k][i][b][2] == itemID then
							if AtlasLootWishList["Shared"][k][i].Icon ~= "" then
								rettex = rettex.."|T"..AtlasLootWishList["Shared"][k][i].Icon..":0|t"
							else
								rettex = rettex.."|TInterface\\Icons\\INV_Misc_QuestionMark:0|t"
							end
							break
						end
					end
				end
			end
		end
		if rettex == "" then 
			return false
		else
			return true, rettex
		end
	else
		if xtyp == "addOwn" then
			for _, v in ipairs(AtlasLootWishList["Own"][xarg2]) do
				if v[2] == itemID then
					return true;
				end
			end
		elseif xtyp == "addShared" then
			for _, v in ipairs(AtlasLootWishList["Shared"][xarg2]) do
				if v[2] == itemID then
					return true;
				end
			end
		end
		return false;
	end
end

--[[
AtlasLoot:WishListOptionsRegister:
Constructs the wishlist options category menu.
]]
function AtlasLoot:WishListOptionsRegister()
	AtlasLoot_WishListOptions:Register(AtlasLootItemsFrame_Wishlist_Options,
		'point', function(parent)
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
				AtlasLoot_WishListOptions:AddLine(
					"text", AL["Add Wishlist"],
					"func", function() AtlasLoot:AddWishList() end,
					"notCheckable", true
				);
				AtlasLoot_WishListOptions:AddLine(
					"text", AL["Edit Wishlist"],
					"func", function() AtlasLoot:EditWishList() end,
					"notCheckable", true
				);
				AtlasLoot_WishListOptions:AddLine(
					"text", AL["Sort Wishlist"],
					"func", function() AtlasLoot:SortWishList(true,AtlasLoot_CurrentWishList["Show"].ListType,AtlasLoot_CurrentWishList["Show"].ListNum) end,
					"notCheckable", true
				);
				if  AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" and AtlasLoot_CurrentWishList["Show"].ListType == "Shared" then
					AtlasLoot_WishListOptions:AddLine(
						"text", AL["Copy Wishlist To Own"],
						"func", function() AtlasLoot:CloneSharedWishList() end,
						"notCheckable", true
					);
				end
				if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" and AtlasLoot_CurrentWishList["Show"].ListType == "Own" then
					AtlasLoot_WishListOptions:AddLine(
						"text", AL["Make Wishlist Default"],
						"func", function() AtlasLoot:SetDefaultWishList() end,
						"notCheckable", true
					);
				end
				AtlasLoot_WishListOptions:AddLine(
					"text", AL["Delete Wishlist"],
					"func", function() AtlasLoot:DeleteWishList() end,
					"notCheckable", true
				);
				--Close button
				AtlasLoot_WishListOptions:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_WishListOptions:Close() end,
					'notCheckable', true
				);
			end,
			'dontHook', true
		)
end

-- **********************************************************************
-- Options:
--	<local> ClearLines()
--	<local> AddWishListOptions(parrent,name,icon,xxx,tabname,tab2)
--	<local> AddTexture(par, num)
-- 	<local> GenerateTabNum(strg,sender)
--	AtlasLoot_RefreshWishlists()
--	AtlasLoot_CreateWishlistOptions()

-- **********************************************************************
local AddWishlist = "new"

local firstload = true

local xpos = 0
local ypos = 0

--[[
StaticPopupDialogs["ATLASLOOT_DELETE_WISHLIST"]
This is shown, if you want too delete a wishlist
]]
StaticPopupDialogs["ATLASLOOT_DELETE_WISHLIST"] = {
	text = AL["Delete Wishlist"],
	button1 = AL["Delete"],
	button2 = AL["Cancel"],
	OnShow = function()
		this:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function()
		table.remove(AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType], AtlasLoot_CurrentWishList["Show"].ListNum);
		AtlasLootWishList["Options"][playerName]["DefaultWishList"][3] = 1;
		if AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][1] == nil then
			AtlasLoot:ShowItemsFrame("EmptyTable", "AtlasLoot_Data", 1);
		else
			AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, 1);
		end
		AtlasLoot_WishListDrop:Close(1);
	end,
	OnCancel = function ()
		AtlasLoot_WishListDrop:Close(1);
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

--[[
StaticPopupDialogs["ATLASLOOT_GET_WISHLIST"]
This is shown, if someone send you a wishlist
]]
StaticPopupDialogs["ATLASLOOT_GET_WISHLIST"] = {
	text = AL["%s sends you a Wishlist. Accept?"],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnShow = function()
		this:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function(self,data)
		ALModule:SendCommMessage("AtlasLootWishlist", "AcceptWishlist", "WHISPER", data)
	end,
	OnCancel = function (self,data)
		ALModule:SendCommMessage("AtlasLootWishlist", "CancelWishlist", "WHISPER", data)
	end,
	timeout = 15,
	whileDead = 1,
	hideOnEscape = 1
};

--[[
<local> AddTexture(par, num)
Add a Icon too the AddFrame. 
]]
local function AddTexture(par, num)
	local numIcons = GetNumMacroIcons();
	local iconTexture = GetMacroIconInfo(num);

	local Button = CreateFrame("BUTTON", nil, par, "UIPanelButtonTemplate")
		Button:SetHeight(20)
		Button:SetWidth(20)  
		Button:SetPoint("TOPLEFT", par, "TOPLEFT", xpos, ypos)
		Button:SetText("")
		Button:SetScript("OnClick", function()
			if AddWishlist == "new" then
				AtlasLootPrevTexture:SetTexture(iconTexture)
				curaddicon = iconTexture
			elseif AddWishlist == "edit" then
				AtlasLootPrevTexture:SetTexture(iconTexture)
				curaddicon = iconTexture
			end
		end)

	local Textur = Button:CreateTexture("textur","OVERLAY")
		Textur:SetPoint("TOPLEFT", Button, "TOPLEFT")
		Textur:SetTexture(iconTexture)
		Textur:SetHeight(20)
		Textur:SetWidth(20)

	if xpos == 280 then
		xpos = 0
		ypos = ypos - 20
	else
		xpos = xpos + 20
	end
end
function AtlasLoot:WishlistSetup()
	if not AtlasLootWishList["Own"] then AtlasLootWishList["Own"] = {Name = "Wishlists"} end
	if not AtlasLootWishList["Shared"] then AtlasLootWishList["Shared"] = {Name = "Shared Wishlists"} end
	if not AtlasLootWishList["Options"] then AtlasLootWishList["Options"] = {} end
	if not AtlasLootWishList["Options"][playerName] then AtlasLootWishList["Options"][playerName] = {} end
	if AtlasLootWishList["Options"][playerName]["Mark"] ~= true and AtlasLootWishList["Options"][playerName]["Mark"] ~= false then AtlasLootWishList["Options"][playerName]["Mark"] = true end
	if not AtlasLootWishList["Options"][playerName]["markInTable"] then AtlasLootWishList["Options"][playerName]["markInTable"] = "own" end
	if AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] ~= true and AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] ~= false then AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] = true end
	if AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] ~= true and AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] ~= false then AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] = true end
	if AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] ~= true and AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] ~= false then AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] = false end
	if not AtlasLootWishList["Options"][playerName]["DefaultWishList"] then AtlasLootWishList["Options"][playerName]["DefaultWishList"] = {"Own", "AtlasLootWishList", 1} end
end
--[[
AtlasLoot_CreateWishlistOptions()
Create the Options for the Wishlists(called on variables loadet)
]]
function AtlasLoot_CreateWishlistOptions()
	if OptionsLoadet then return end
	AtlasLoot:WishlistSetup();
	-- Add wishlistframe --
	local WishListAddFrame = CreateFrame("FRAME","AtlasLootWishList_AddFrame",UIParent)
		WishListAddFrame:Hide()
		WishListAddFrame:SetFrameStrata("TOOLTIP")
		WishListAddFrame:SetWidth(350)
		WishListAddFrame:SetHeight(250)
		WishListAddFrame:SetPoint("CENTER",UIParent)
		WishListAddFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
												edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
												tile = true, tileSize = 16, edgeSize = 16, 
												insets = { left = 4, right = 4, top = 4, bottom = 4 }});
		WishListAddFrame:SetMovable(true)
		WishListAddFrame:EnableMouse(true)
		WishListAddFrame:RegisterForDrag("LeftButton")
		WishListAddFrame:RegisterForDrag("LeftButton", "RightButton")
		WishListAddFrame:SetScript("OnMouseDown", function()
			this:StartMoving()
		end)
		WishListAddFrame:SetScript("OnMouseUp", WishListAddFrame.StopMovingOrSizing)

	local Textur = WishListAddFrame:CreateTexture("AtlasLootPrevTexture","OVERLAY")
		Textur:SetPoint("TOPRIGHT", WishListAddFrame, "TOPRIGHT", -40, -10)
		Textur:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
		Textur:SetHeight(40)
		Textur:SetWidth(40)

	local Text = WishListAddFrame:CreateFontString("AtlasLootAddWishListName","OVERLAY","GameFontNormal")
		Text:SetPoint("TOPLEFT", WishListAddFrame, "TOPLEFT", 10, -5)
		Text:SetText(AL["Wishlist name:"]);
		Text:SetHeight(20)

	local Edit1 = CreateFrame("EditBox", "AtlasLootWishListNewName", WishListAddFrame, "InputBoxTemplate")
		Edit1:SetPoint("LEFT", WishListAddFrame, "TOPLEFT", 15, -37)
		Edit1:SetWidth(250)
		Edit1:SetHeight(32)
		Edit1:SetAutoFocus(false)
		Edit1:SetTextInsets(0, 8, 0, 0)
		Edit1:SetScript("OnEnterPressed", function()
			this:ClearFocus();
			local text = this:GetText();
			curaddname = text
		end)
		Edit1:SetScript("OnShow", function()
			this:SetText(curaddname);
		end)

	local CloseButton = CreateFrame("BUTTON",nil, WishListAddFrame, "UIPanelCloseButton")
		CloseButton:SetPoint("TOPRIGHT", WishListAddFrame, "TOPRIGHT", -5, -5)	

	local WishListIconListSc = CreateFrame("ScrollFrame", "AtlasLootWishlistAddFrameIconList", WishListAddFrame, "UIPanelScrollFrameTemplate")
	local WishlistIconListIn = CreateFrame("Frame", "AtlasLootWishlistAddFrameIconListInhalt", WishListIconListSc)
		WishListIconListSc:SetScrollChild(WishlistIconListIn)
		WishListIconListSc:SetPoint("TOPLEFT", WishListAddFrame, "TOPLEFT", 10, -60)
		WishlistIconListIn:SetPoint("TOPLEFT", WishListIconListSc, "TOPLEFT", 0, 0)
		WishListIconListSc:SetWidth(310)  
		WishListIconListSc:SetHeight(150) 
		WishlistIconListIn:SetWidth(310)  
		WishlistIconListIn:SetHeight(150)  
		WishListIconListSc:SetHorizontalScroll(-50)
		WishListIconListSc:SetVerticalScroll(50)
		WishListIconListSc:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile="", tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }})
		WishListIconListSc:SetScript("OnVerticalScroll", function()  end)
		WishListIconListSc:EnableMouse(true)
		WishListIconListSc:SetVerticalScroll(0)
		WishListIconListSc:SetHorizontalScroll(0)

	local AddWishlistFr = CreateFrame("BUTTON", "AtlasLottAddEditWishList", WishListIconListSc, "UIPanelButtonTemplate")
		AddWishlistFr:SetHeight(20)
		AddWishlistFr:SetWidth(150)  
		AddWishlistFr:SetPoint("TOPLEFT", WishListIconListSc, "TOPLEFT",0,-1*(AtlasLootWishlistAddFrameIconList:GetHeight() + 5))
		AddWishlistFr:SetText(AL["Add Wishlist"])
		AddWishlistFr:SetScript("OnClick", function()
			curaddname = AtlasLootWishListNewName:GetText()
			if editName then
				if curaddicon == "" then
					curaddicon = "Interface\\Icons\\INV_Misc_QuestionMark"
				elseif curaddicon ~= "" then
					AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Name = curaddname;
					AtlasLootWishList[AtlasLoot_CurrentWishList["Show"].ListType][AtlasLoot_CurrentWishList["Show"].ListNum].Icon = curaddicon;
					WishListAddFrame:Hide();
					AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, AtlasLoot_CurrentWishList["Show"].ListNum);
				end
			else
				if curaddicon == "" then
					curaddicon = "Interface\\Icons\\INV_Misc_QuestionMark"
				elseif curaddicon ~= "" then
					table.insert( AtlasLootWishList["Own"],{Name = curaddname, Icon = curaddicon})
					WishListAddFrame:Hide();
					if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
						AtlasLoot:ShowWishList(AtlasLoot_CurrentWishList["Show"].ListType, AtlasLoot_CurrentWishList["Show"].ListNum);
					end
				end
			end
			editName = false;
			curaddicon = "";
			curaddname = "";
		end)

	local AddWishlistIcons = CreateFrame("BUTTON", nil, WishListIconListSc, "UIPanelButtonTemplate")
		AddWishlistIcons:SetHeight(20)
		AddWishlistIcons:SetWidth(150)  
		AddWishlistIcons:SetPoint("TOPLEFT", WishListIconListSc, "TOPLEFT",160,-1*(AtlasLootWishlistAddFrameIconList:GetHeight() + 5))
		AddWishlistIcons:SetText(AL["Show More Icons"])
		AddWishlistIcons:SetScript("OnClick", function()
			for i=211,GetNumMacroIcons() do
				AddTexture(WishlistIconListIn, i)
			end
		end)

		WishListAddFrame:SetScript("OnShow", function()
			if firstload then
				for i=1,210 do
					AddTexture(WishlistIconListIn, i)
				end
				firstload = false
			end
			if curaddicon == "" then
				AtlasLootPrevTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			else
				AtlasLootPrevTexture:SetTexture(curaddicon)
			end
		end)

	-- Add wishlistframe --
	
	local framewidht = InterfaceOptionsFramePanelContainer:GetWidth()

	local WishlistOptionsFrame = CreateFrame("FRAME", nil)
		WishlistOptionsFrame.name = AL["Wishlist"]
		WishlistOptionsFrame.parent = AL["AtlasLoot"]

	local WishListMark = CreateFrame("CheckButton", "AtlasLootOptionsWishListMark", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListMark:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -15)
		WishListMark:SetWidth(25)
		WishListMark:SetHeight(25)
		WishListMark:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Mark items in loot tables"]);
			if AtlasLootWishList["Options"][playerName]["Mark"] then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
				AtlasLootOptionsWishListMarkOwn:Disable();
				AtlasLootOptionsWishListMarkAll:Disable();
			end
		end)
		WishListMark:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["Mark"] then
				AtlasLootWishList["Options"][playerName]["Mark"] = false;
				AtlasLootOptionsWishListMarkOwn:Disable();
				AtlasLootOptionsWishListMarkAll:Disable();
			else
				AtlasLootWishList["Options"][playerName]["Mark"] = true;
				AtlasLootOptionsWishListMarkOwn:Enable();
				AtlasLootOptionsWishListMarkAll:Enable();
			end
		end)

	local WishListMarkOwn = CreateFrame("CheckButton", "AtlasLootOptionsWishListMarkOwn", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListMarkOwn:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -35)
		WishListMarkOwn:SetWidth(25)
		WishListMarkOwn:SetHeight(25)
		WishListMarkOwn:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Mark items from own Wishlist"]);
			if AtlasLootWishList["Options"][playerName]["markInTable"] == "own" then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListMarkOwn:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["markInTable"] == "own" then
				AtlasLootWishList["Options"][playerName]["markInTable"] = "all";
			else
				AtlasLootWishList["Options"][playerName]["markInTable"] = "own";
			end
			WishlistOptionsFrame:Hide()
			WishlistOptionsFrame:Show()
		end)

	local WishListMarkAll = CreateFrame("CheckButton", "AtlasLootOptionsWishListMarkAll", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListMarkAll:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -55)
		WishListMarkAll:SetWidth(25)
		WishListMarkAll:SetHeight(25)
		WishListMarkAll:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Mark items from all Wishlists"]);
			if AtlasLootWishList["Options"][playerName]["markInTable"] == "all" then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListMarkAll:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["markInTable"] == "own" then
				AtlasLootWishList["Options"][playerName]["markInTable"] = "all";
			else
				AtlasLootWishList["Options"][playerName]["markInTable"] = "own";
			end
			WishlistOptionsFrame:Hide()
			WishlistOptionsFrame:Show()
		end)

	local WishListShare = CreateFrame("CheckButton", "AtlasLootOptionsWishListShare", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListShare:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -75)
		WishListShare:SetWidth(25)
		WishListShare:SetHeight(25)
		WishListShare:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Enable Wishlist Sharing"]);
			if AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListShare:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] then
				AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] = false;
				AtlasLootOptionsWishListShareInCombat:Disable();
			else
				AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] = true;
				AtlasLootOptionsWishListShareInCombat:Enable();
			end
		end)

	local WishListShareInCombat = CreateFrame("CheckButton", "AtlasLootOptionsWishListShareInCombat", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListShareInCombat:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -95)
		WishListShareInCombat:SetWidth(25)
		WishListShareInCombat:SetHeight(25)
		WishListShareInCombat:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Auto reject in combat"]);
			if AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListShareInCombat:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] then
				AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] = false;
			else
				AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] = true;
			end
		end)

	local WishListAutoAdd = CreateFrame("CheckButton", "AtlasLootOptionsWishListAutoAdd", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListAutoAdd:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -115)
		WishListAutoAdd:SetWidth(25)
		WishListAutoAdd:SetHeight(25)
		WishListAutoAdd:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Always use default Wishlist"]);
			if AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] == true then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListAutoAdd:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] then
				AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] = false;
			else
				AtlasLootWishList["Options"][playerName]["UseDefaultWishlist"] = true;
			end
		end)
		
		local WishListAutoSort = CreateFrame("CheckButton", "AtlasLootOptionsWishListAutoSort", WishlistOptionsFrame, "OptionsCheckButtonTemplate")
		WishListAutoSort:SetPoint("LEFT", WishlistOptionsFrame, "TOPLEFT", 5, -135)
		WishListAutoSort:SetWidth(25)
		WishListAutoSort:SetHeight(25)
		WishListAutoSort:SetScript("OnShow", function()
			_G[this:GetName().."Text"]:SetText(AL["Auto Sort WishLists"]);
			if AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] == true then
				this:SetChecked(1);
			else
				this:SetChecked(nil);
			end
		end)
		WishListAutoSort:SetScript("OnClick", function()
			if AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] then
				AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] = false;
				AtlasLootItemsFrame_Wishlist_UnLock:Enable();
			else
				AtlasLootWishList["Options"][playerName]["AutoSortWishlist"] = true;
				AtlasLootItemsFrame_Wishlist_UnLock:Disable();
			end
		end)

	InterfaceOptions_AddCategory(WishlistOptionsFrame)
	OptionsLoadet = true
end

-- **********************************************************************
-- WishListShare:
--	<local>SpamProtect(name)
-- 	ALModule:OnEnable()
--	AtlasLoot_GetWishList(wlstrg,sendername)
--	ALModule:OnCommReceived(prefix, message, distribution, sender)
-- **********************************************************************

local SpamFilter = {}
local SpamFilterTime = 10


--[[
<local> SpamProtect(name)
Check Spamfilter table
]]
local function SpamProtect(name)
	if not name then return true end
	if SpamFilter[string.lower(name)] then
		if GetTime() - SpamFilter[string.lower(name)] > SpamFilterTime then
			SpamFilter[string.lower(name)] = nil
			return true
		else
			return false
		end
	else
		return true
	end
end

--[[
ALModule:OnEnable()
Register the AceComm channel
]]
function ALModule:OnEnable()
    self:RegisterComm("AtlasLootWishlist")
end

--[[
AtlasLoot_GetWishList(wlstrg,sendername)
Get the Wishlist, Deserialize it and save it in the savedvariables table
]]
function AtlasLoot_GetWishList(wlstrg,sendername)
	if AtlasLootWishList["Shared"].Name == nil then
		AtlasLootWishList["Shared"].Name = "Shared Wish Lists"
	end
	local success, wltab = ALModule:Deserialize(wlstrg);
	if success then
		for i,v in ipairs(wltab) do
			v[8] = v[8].."|"..v[9].."|"..v[10];
			table.remove(v,9)
			table.remove(v,10)
		end
		table.insert(AtlasLootWishList["Shared"],wltab)
	end
end

--[[
ALModule:OnCommReceived(prefix, message, distribution, sender)
Incomming messages from AceComm
]]
function ALModule:OnCommReceived(prefix, message, distribution, sender)
	if prefix ~= "AtlasLootWishlist" then return end
	if message == "SpamProtect" then
		--local _,_,timeleft = string.find( 10-(GetTime() - SpamFilter[string.lower(sender)]), "(%d+)%.")
		--DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["You must wait "]..WHITE..timeleft..RED..AL[" seconds before you can send a new Wishlist too "]..WHITE..sender..RED..".");
	elseif message == "FinishSend" then
		SpamFilter[string.lower(sender)] = GetTime()
	elseif message == "AcceptWishlist" then
		local wsltable = AtlasLoot:CloneTable(_G[curtable[2]][curtable[1]][curtable[3]]);
			for i,v in ipairs(wsltable) do
				v[4] = ""
				local dataID, dataSource, dataPage = strsplit("|", v[8])
				v[8] = dataID;
				v[9] = dataSource;
				v[10] = dataPage;
			end
		local sendData = ALModule:Serialize(wsltable);
		ALModule:SendCommMessage("AtlasLootWishlist", sendData, "WHISPER", sender);
	elseif message == "WishlistRequest" then

		if AtlasLootWishList["Options"][playerName]["AllowShareWishlist"] == true then
			if AtlasLootWishList["Options"][playerName]["AllowShareWishlistInCombat"] == true then
				if UnitAffectingCombat("player") then
					ALModule:SendCommMessage("AtlasLootWishlist", "CancelWishlist", "WHISPER", sender)
					DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..WHITE..sender..RED..AL[" tried to send you a Wishlist. Rejected because you are in combat."]);
				else
					local dialog = StaticPopup_Show("ATLASLOOT_GET_WISHLIST", sender);
					if ( dialog ) then
						dialog.data = sender;
					end
				end
			else
				local dialog = StaticPopup_Show("ATLASLOOT_GET_WISHLIST", sender);
				if ( dialog ) then
					dialog.data = sender;
				end
			end
		else
			ALModule:SendCommMessage("AtlasLootWishlist", "CancelWishlist", "WHISPER", sender)
		end

	elseif message == "CancelWishlist" then
		DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..WHITE..sender..RED..AL[" rejects your Wishlist."]);
	else
		SpamFilter[string.lower(sender)] = GetTime()
		AtlasLoot_GetWishList(message,sender)
		ALModule:SendCommMessage("AtlasLootWishlist", "FinishSend", "WHISPER", sender)
	end
end

--[[
StaticPopupDialogs["ATLASLOOT_SEND_WISHLIST"]
This is shown, if you want too share a wishlist
]]
StaticPopupDialogs["ATLASLOOT_SEND_WISHLIST"] = {
	text = AL["Send Wishlist (%s) to"],
	button1 = AL["Send"],
	button2 = AL["Cancel"],
	OnShow = function(self)
		self:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function()
		local name = _G[this:GetParent():GetName().."EditBox"]:GetText()
		if string.lower(name) == string.lower(playerName) then
			DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["You can't send Wishlists to yourself."]);
		elseif name == "" then

		else
			if SpamProtect(string.lower(name)) then
				curtable = {AtlasLoot_CurrentWishList["Show"].ListType, "AtlasLootWishList", AtlasLoot_CurrentWishList["Show"].ListNum};
				ALModule:SendCommMessage("AtlasLootWishlist", "WishlistRequest", "WHISPER", name);
			else
				local _,_,timeleft = string.find( 10-(GetTime() - SpamFilter[string.lower(name)]), "(%d+)%.")
				DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["You must wait "]..WHITE..timeleft..RED..AL[" seconds before you can send a new Wishlist to "]..WHITE..name..RED..".");
			end
		end
	end,
	hasEditBox = 1,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

--[[
StaticPopupDialogs["ATLASLOOT_ADD_CUSTOMHEADER"]
This is shown, if you want too add a CustomHeader to a wishlist
]]
StaticPopupDialogs["ATLASLOOT_ADD_CUSTOMHEADER"] = {
	text = "Add text for a Custom Header or leave blank for a blank",
	button1 = "Set Text",
	button2 = AL["Cancel"],
	OnShow = function(self)
		self:SetFrameStrata("TOOLTIP");
	end,
	OnAccept = function()
		local text = _G[this:GetParent():GetName().."EditBox"]:GetText();
		AtlasLoot:AddItemCustomHeader(StaticPopupDialogs.ATLASLOOT_ADD_CUSTOMHEADER.num,text);
	end,
	hasEditBox = 1,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};
