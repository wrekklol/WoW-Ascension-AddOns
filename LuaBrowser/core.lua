local f = CreateFrame("Frame",nil,UIParent);
local modName = "LuaBrowser";
local rawget = rawget;
local type = type;

-- Global Chat Message Function
function AzMsg(msg) DEFAULT_CHAT_FRAME:AddMessage(tostring(msg):gsub("|1","|cffffff80"):gsub("|2","|cffffffff"),0.5,0.75,1.0); end

-- Settings
local filter;
local sortMethod = "type";
local typeFilter = {};

-- Constants
local ITEM_HEIGHT;
local NUM_ITEMS = 12;

-- Work Variables
local root;
local history = {};
local data = {};
local rootTypes = {};
local metaParent;

-- Data
local sortMethods = { "none", "type", "name", "data" };
local typeList = {
	["nil"]			= { color = "|cffc0c0c0", icon = "Interface\\Icons\\Spell_Shadow_MindTwisting" },
	["function"]	= { color = "|cffff5000", icon = "Interface\\Icons\\Inv_Misc_SummerFest_BrazierRed" },
	["string"]		= { color = "|cff00ff00", icon = "Interface\\Icons\\Inv_Misc_SummerFest_BrazierGreen" },
	["number"]		= { color = "|cff00c0ff", icon = "Interface\\Icons\\Inv_Misc_SummerFest_BrazierBlue" },
	["boolean"]		= { color = "|cffff60ff", icon = "Interface\\Icons\\Ability_Creature_Disease_05" },
	["table"]		= { color = "|cffffff00", icon = "Interface\\Icons\\Inv_Misc_SummerFest_BrazierOrange" },
	["userdata"]	= { color = "|cffffffff", icon = "Interface\\Icons\\Spell_DeathKnight_AntiMagicZone" },
	["widget"]		= { color = "|cff00dbba", icon = "Interface\\Icons\\Ability_Druid_LunarGuidance" },
};

-- Show all types
for k in next, typeList do
	typeFilter[k] = true;
end

--------------------------------------------------------------------------------------------------------
--                                          Helper Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Own version of type() which detects widgets
local function datatype(v)
	local dType = type(v);
	if (dType == "table") and (rawget(v,0)) and (type(v[0]) == "userdata") then
		return "widget";
	else
		return dType;
	end
end

-- Sorts Entries
local function SortEntriesFunc(a,b)
	if (sortMethod == "type") then
		local infoA, infoB = datatype(rawget(root,a)), datatype(rawget(root,b));
		if (infoA ~= infoB) then
			return infoA < infoB;
		end
	elseif (sortMethod == "data") then
		local infoA, infoB = rawget(root,a), rawget(root,b);
		if (infoA ~= infoB) then
			return tostring(infoA) < tostring(infoB);
		end
	end
	return tostring(a) < tostring(b);
end

-- Counts Number of Entries
local function GetTableEntries(tbl)
	local cnt = 0;
	for _ in next, tbl do
		cnt = (cnt + 1);
	end
	return cnt;
end

--------------------------------------------------------------------------------------------------------
--                                                Code                                                --
--------------------------------------------------------------------------------------------------------

-- Update List
local function EntryList_Update()
	FauxScrollFrame_Update(f.scroll,#data,#f.entries,ITEM_HEIGHT);
	local index = f.scroll.offset;
	for i = 1, #f.entries do
		index = (index + 1);
		local btn = f.entries[i];
		if (index <= #data) then
			local k = data[index];
			local v = rawget(root,k);
			local dType = datatype(v);
			-- very messy line, but just trying to avoid string garbage
			btn.name:SetFormattedText("%s%s\n|cffc0c0c0%s%s%s",typeList[dType].color,tostring(k),dType,(dType == "table" or dType == "widget") and "; entries = "..GetTableEntries(v) or "",dType == "widget" and "; "..v:GetObjectType() or "");
			btn.value:SetText(tostring(v));
			btn.icon:SetTexture(typeList[dType].icon);
			btn.key = k;
			btn:Show();
		else
			btn:Hide();
		end
	end
	-- Resize
	f.entries[1]:SetPoint("TOPRIGHT",(#data <= #f.entries and -8 or -24),-8);
end

-- Set Filter
local function SetFilter(newFilter)
	filter = newFilter;
	if (filter) then
		f.btnReset:Enable();
	else
		f.btnReset:Disable();
	end
end

-- Set Browsing Root
local function SetRoot(newRoot)
	-- Backup History
	if (root) and (root ~= newRoot) and (#history == 0 or newRoot ~= history[#history].root) then
		history[#history + 1] = { root = root, offset = f.scroll.offset, filter = filter };
		SetFilter(nil);
	end
	-- Copy root to indexed table
	lbRoot = newRoot;
	root = newRoot;
	wipe(data);
	for k, v in next, root do
		local dType = datatype(v);
		if (typeFilter[dType] ~= false) and (not filter or tostring(k):lower():match(filter)) then
			data[#data + 1] = k;
		end
	end
	-- Done
	local origCount = GetTableEntries(root);
	f.header:SetText("Lua Browser (|cffffff00"..(origCount == #data and #data or #data.."|r/|cffffff00"..origCount).."|r)")
	f.root:SetText(tostring(root));
	if (sortMethod ~= "none") then
		sort(data,SortEntriesFunc);
	end
	EntryList_Update();
end

-- History: Go Back
local function HistoryGoBack()
	if (#history > 0) then
		local entry = history[#history];
		SetFilter(entry.filter);
		SetRoot(entry.root);
		FauxScrollFrame_OnVerticalScroll(f.scroll,entry.offset * ITEM_HEIGHT,ITEM_HEIGHT,EntryList_Update);
		history[#history] = nil;
	end
end

-- Entry OnClick
local function Entry_OnClick(self,button)
	-- Right
	if (button == "RightButton") then
		if (IsShiftKeyDown()) then
			root[self.key] = nil;
			SetRoot(root);
		else
			HistoryGoBack();
		end
	-- Left
	else
		local v = rawget(root,self.key);
		local dType = type(v);
		-- link value
		local activeEdit = ChatEdit_GetActiveWindow();
		if (IsModifiedClick("CHATLINK")) and (activeEdit and activeEdit:IsVisible()) then
			activeEdit:Insert(self.key.." = "..tostring(v));
		-- table
		elseif (dType == "table") then
			if (IsShiftKeyDown()) then
				local mt = getmetatable(v);
				if (mt) then
					metaParent = v;
					f.btnMeta:Enable();
					SetRoot(mt);
				else
					AzMsg("Table has no meta table.");
				end
			else
				SetRoot(v);
			end
		-- function
		elseif (dType == "function") then
			local ret = { v(metaParent or IsShiftKeyDown() and root or nil) };
			if (#ret > 0) then
				SetRoot(ret);
			end
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                          DropDown - Filter                                         --
--------------------------------------------------------------------------------------------------------

local function DropDown_Init(dropDown,list)
	for typeName, typeTbl in next, typeList do
		local tbl = list[#list + 1];
		tbl.text = typeTbl.color..typeName; tbl.value = typeName; tbl.checked = typeFilter[typeName];
	end
end

local function DropDown_SelectValue(dropDown,entry,index)
	if (IsShiftKeyDown()) then
		for key in next, typeFilter do
			typeFilter[key] = (key == entry.value) or not typeFilter[key];
		end
	else
		typeFilter[entry.value] = not typeFilter[entry.value];
	end
	SetRoot(root);
end

f.dropDown = AzDropDown.CreateDropDown(f,120,nil,DropDown_Init,DropDown_SelectValue);
f.dropDown:SetPoint("BOTTOMLEFT",12,12);
f.dropDown.label:SetText("Type Filter...");

--------------------------------------------------------------------------------------------------------
--                                           DropDown - Sort                                          --
--------------------------------------------------------------------------------------------------------

local function DropDown2_Init(dropDown,list)
	for index, method in ipairs(sortMethods) do
		list[index].text = method; list[index].value = method; list[index].checked = (sortMethod == method);
	end
end

local function DropDown2_SelectValue(dropDown,entry,index)
	sortMethod = entry.value;
	if (sortMethod ~= "none") then
		sort(data,SortEntriesFunc);
		EntryList_Update();
	else
		SetRoot(root);
	end
end

f.dropDown2 = AzDropDown.CreateDropDown(f,120,nil,DropDown2_Init,DropDown2_SelectValue);
f.dropDown2:SetPoint("LEFT",f.dropDown,"RIGHT",8,0);
f.dropDown2.label:SetText("Sort Method...");

--------------------------------------------------------------------------------------------------------
--                                           Widget Creation                                          --
--------------------------------------------------------------------------------------------------------

local function OnMouseDown(self,button)
	if (button == "LeftButton") then
		f:StartMoving();
	end
end

local function OnMouseUp(self,button)
	if (button == "LeftButton") then
		f:StopMovingOrSizing();
	else
		HistoryGoBack();
	end
end

f:SetWidth(520);
f:SetHeight(420);
f:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 3, right = 3, top = 3, bottom = 3 } });
f:SetBackdropColor(0.1,0.22,0.35,1);
f:SetBackdropBorderColor(0.1,0.1,0.1,1);
f:EnableMouse(1);
f:SetMovable(1);
f:SetFrameStrata("HIGH");
f:SetToplevel(1);
f:SetPoint("CENTER");
f:Hide();

f:SetScript("OnMouseDown",OnMouseDown);
f:SetScript("OnMouseUp",OnMouseUp);

f.outline = CreateFrame("Frame",nil,f);
f.outline:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } });
f.outline:SetBackdropColor(0.1,0.1,0.2,1);
f.outline:SetBackdropBorderColor(0.8,0.8,0.9,0.4);
f.outline:SetPoint("TOPLEFT",12,-38);
f.outline:SetPoint("BOTTOMRIGHT",-12,42);

f.close = CreateFrame("Button",nil,f,"UIPanelCloseButton");
f.close:SetPoint("TOPRIGHT",-5,-5);
f.close:SetScript("OnClick",function() f:Hide(); end);

f.header = f:CreateFontString(nil,"ARTWORK","GameFontHighlight");
f.header:SetFont(f.header:GetFont(),24,"THICKOUTLINE");
f.header:SetPoint("TOPLEFT",12,-12);

f.root = f:CreateFontString(nil,"ARTWORK","GameFontHighlight");
f.root:SetFont(f.header:GetFont(),16,"OUTLINE");
f.root:SetPoint("RIGHT",f.close,"LEFT",-8,-1);
f.root:SetJustifyH("RIGHT");

local function RootFrame_OnEnter(self)
	wipe(rootTypes);
	for k, v in next, root do
		local dType = datatype(v);
		rootTypes[dType] = (rootTypes[dType] or 0) + 1;
	end
	GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
	GameTooltip:AddLine("Data Type Count",1,1,1);
	for type, count in next, rootTypes do
		GameTooltip:AddDoubleLine(type,count,nil,nil,nil,1,1,1);
	end
	GameTooltip:Show();
end

f.rootFrame = CreateFrame("Frame",nil,f);
f.rootFrame:SetHeight(20);
f.rootFrame:SetPoint("LEFT",f.root);
f.rootFrame:SetPoint("RIGHT",f.root);
f.rootFrame:EnableMouse(1);
f.rootFrame:SetScript("OnLeave",function(self) GameTooltip:Hide(); end);
f.rootFrame:SetScript("OnEnter",RootFrame_OnEnter);
f.rootFrame:SetScript("OnMouseDown",OnMouseDown);
f.rootFrame:SetScript("OnMouseUp",OnMouseUp);

f.btnRefresh = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnRefresh:SetWidth(75);
f.btnRefresh:SetHeight(24);
f.btnRefresh:SetPoint("BOTTOMRIGHT",-12,12);
f.btnRefresh:SetScript("OnClick",function(self) SetRoot(root); end);
f.btnRefresh:SetText("Refresh");

f.btnReset = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnReset:SetWidth(75);
f.btnReset:SetHeight(24);
f.btnReset:SetPoint("RIGHT",f.btnRefresh,"LEFT",-6,0);
f.btnReset:SetScript("OnClick",function(self) SetFilter(nil); SetRoot(root); end);
f.btnReset:SetText("Clear Filter");
f.btnReset:Disable();

f.btnMeta = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnMeta:SetWidth(75);
f.btnMeta:SetHeight(24);
f.btnMeta:SetPoint("RIGHT",f.btnReset,"LEFT",-6,0);
f.btnMeta:SetScript("OnClick",function(self) metaParent = nil; self:Disable(); end);
f.btnMeta:SetText("Clear Meta");
f.btnMeta:Disable();

-- Create Entries
ITEM_HEIGHT = (f.outline:GetHeight() - 16) / NUM_ITEMS - 1;
f.entries = {};
for i = 1, NUM_ITEMS do
	local e = CreateFrame("Button",nil,f.outline);
	e:SetWidth(ITEM_HEIGHT);
	e:SetHeight(ITEM_HEIGHT);
	e:RegisterForClicks("AnyUp");
	e:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
	e:SetScript("OnClick",Entry_OnClick);

	if (i == 1) then
		e:SetPoint("TOPLEFT",8,-8);
		e:SetPoint("TOPRIGHT",-8,-8);
	else
		e:SetPoint("TOPLEFT",f.entries[i - 1],"BOTTOMLEFT",0,-1);
		e:SetPoint("TOPRIGHT",f.entries[i - 1],"BOTTOMRIGHT",0,-1);
	end

	e.icon = e:CreateTexture(nil,"ARTWORK");
	e.icon:SetPoint("TOPLEFT");
	e.icon:SetPoint("BOTTOMLEFT");
	e.icon:SetWidth(ITEM_HEIGHT);
	e.icon:SetTexCoord(0.07,0.93,0.07,0.93);

	e.name = e:CreateFontString(nil,"ARTWORK","GameFontNormal");
	e.name:SetPoint("LEFT",e.icon,"RIGHT",4,0);
	e.name:SetJustifyH("LEFT");

	e.value = e:CreateFontString(nil,"ARTWORK","GameFontNormal");
	e.value:SetPoint("RIGHT",-4,0);
	e.value:SetPoint("LEFT",e.name,"RIGHT",12,0);
	e.value:SetJustifyH("RIGHT");

	f.entries[i] = e;
end

f.scroll = CreateFrame("ScrollFrame","LuaBrowserScroll",f,"FauxScrollFrameTemplate");
f.scroll:SetPoint("TOPLEFT",f.entries[1]);
f.scroll:SetPoint("BOTTOMRIGHT",f.entries[#f.entries],-6,-1);
f.scroll:SetScript("OnVerticalScroll",function(self,offset) FauxScrollFrame_OnVerticalScroll(self,offset,ITEM_HEIGHT,EntryList_Update) end);

--------------------------------------------------------------------------------------------------------
--                                           Slash Handling                                           --
--------------------------------------------------------------------------------------------------------
_G["SLASH_"..modName.."1"] = "/lb";
SlashCmdList[modName] = function(cmd)
	-- Extract Parameters
	local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
	param1 = (param1 and param1:lower() or cmd:lower());
	-- Options
	if (param1 == "") then
		if (#data == 0) then
			SetRoot(_G);
		end
		f:Show();
	-- Mouse
	elseif (param1 == "mouse") then
		SetRoot(GetMouseFocus());
		f:Show();
	-- MouseMeta
	elseif (param1 == "mousemeta") then
		metaParent = GetMouseFocus();
		SetRoot(getmetatable(metaParent));
		f.btnMeta:Enable();
		f:Show();
	-- Code
	elseif (param1 == "code") then
		RunScript("LuaBrowserTemp = "..param2);
		if (type(LuaBrowserTemp) == "table") then
			SetRoot(LuaBrowserTemp);
			f:Show();
		else
			AzMsg("Code result is not a table");
		end
		LuaBrowserTemp = nil;
	-- Filter
	elseif (param1 == "filter") then
		SetFilter(param2 ~= "" and param2:lower() or nil);
		SetRoot(root or _G);
		AzMsg("Filter set to |cff00ff00\""..tostring(filter).."\"|r.");
		f:Show();
	-- Invalid or No Command
	else
		UpdateAddOnMemoryUsage();
		AzMsg(format("----- |2%s|r |1%s|r ----- |1%.2f |2kb|r -----",modName,GetAddOnMetadata(modName,"Version"),GetAddOnMemoryUsage(modName)));
		AzMsg("The following |2parameters|r are valid for this addon:");
		AzMsg(" |2mouse|r = Browse GetMouseFocus()");
		AzMsg(" |2mousemeta|r = Browse the metatable of GetMouseFocus()");
		AzMsg(" |2code <code>|r = Browse the return of RunScript(code)");
		AzMsg(" |2filter <word>|r = Sets the filter");
	end
end