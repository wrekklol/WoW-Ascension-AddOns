--[[
Options.lua
Functions:
AtlasLoot_OptionsPanelOnLoad(panel)
AtlasLootOptions_Init()
AtlasLootOptions_OnLoad()
AtlasLootOptions_SafeLinksToggle()
AtlasLootOptions_AllLinksToggle()
AtlasLootOptions_DefaultTTToggle()
AtlasLootOptions_LootlinkTTToggle()
AtlasLootOptions_ItemSyncTTToggle()
AtlasLootOptions_EquipCompareToggle()
AtlasLootOptions_OpaqueToggle()
AtlasLootOptions_ItemIDToggle()
AtlasLootOptions_MinimapToggle()
AtlasLootOptions_LoDSpam()
AtlasLootOptions_LoDStartup()
AtlasLoot_SetupLootBrowserSlider(frame, mymin, mymax, step)
AtlasLoot_UpdateLootBrowserSlider(frame)
AtlasLoot_DisplayHelp();
AtlasLoot_CreateOptionsInfoTooltips()
]]

local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

--Invoke libraries
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

function AtlasLoot_OptionsPanelOnLoad(panel)
    panel.name=AL["AtlasLoot"];
    InterfaceOptions_AddCategory(panel);
end

function AtlasLootOptions_Init()
    --Initialise all the check boxes on the options frame
    AtlasLootOptionsFrameSafeLinks:SetChecked(AtlasLoot.db.profile.SafeLinks);
	AtlasLootOptionsFrameDefaultTT:SetChecked(AtlasLoot.db.profile.DefaultTT);
	AtlasLootOptionsFrameLootlinkTT:SetChecked(AtlasLoot.db.profile.LootlinkTT);
	AtlasLootOptionsFrameItemSyncTT:SetChecked(AtlasLoot.db.profile.ItemSyncTT);
    AtlasLootOptionsFrameEquipCompare:SetChecked(AtlasLoot.db.profile.EquipCompare);
    AtlasLootOptionsFrameOpaque:SetChecked(AtlasLoot.db.profile.Opaque);
    AtlasLootOptionsFrameAutoInstance:SetChecked(AtlasLoot.db.profile.AutoCurrentInstance);
    AtlasLootOptionsFrameItemID:SetChecked(AtlasLoot.db.profile.ItemIDs);
    AtlasLootOptionsFrameLoDStartup:SetChecked(AtlasLoot.db.profile.LoadAllLoDStartup);
    AtlasLootOptionsFrameLootBrowserScale:SetValue(AtlasLoot.db.profile.LootBrowserScale);
end

function AtlasLootOptions_OnLoad()
    --Disable checkboxes of missing addons
    if( not LootLink_SetTooltip ) then
        AtlasLootOptionsFrameLootlinkTT:Disable();
        AtlasLootOptionsFrameLootlinkTTText:SetText(AL["|cff9d9d9dLootlink Tooltips|r"]);
    end
    if( not ItemSync ) then
        AtlasLootOptionsFrameItemSyncTT:Disable();
        AtlasLootOptionsFrameItemSyncTTText:SetText(AL["|cff9d9d9dItemSync Tooltips|r"]);
    end
    AtlasLootOptions_Init();
    temp=AtlasLoot.db.profile.SafeLinks;
end

function AtlasLootOptions_SafeLinksToggle()
	if(AtlasLoot.db.profile.SafeLinks) then
		AtlasLoot.db.profile.SafeLinks = false;
        AtlasLoot.db.profile.AllLinks = true;
	else
		AtlasLoot.db.profile.SafeLinks = true;
        AtlasLoot.db.profile.AllLinks = false;
	end
	AtlasLootOptions_Init();
end

function AtlasLootOptions_DefaultTTToggle()
	AtlasLoot.db.profile.DefaultTT = true;
    AtlasLoot.db.profile.LootlinkTT = false;
    AtlasLoot.db.profile.ItemSyncTT = false;
	AtlasLootOptions_Init();
end

function AtlasLootOptions_LootlinkTTToggle()
	AtlasLoot.db.profile.DefaultTT = false;
    AtlasLoot.db.profile.LootlinkTT = true;
    AtlasLoot.db.profile.ItemSyncTT = false;
	AtlasLootOptions_Init();
end

function AtlasLootOptions_ItemSyncTTToggle()
    AtlasLoot.db.profile.DefaultTT = false;
    AtlasLoot.db.profile.LootlinkTT = false;
    AtlasLoot.db.profile.ItemSyncTT = true;
	AtlasLootOptions_Init();
end

function AtlasLootOptions_OpaqueToggle()
    AtlasLoot.db.profile.Opaque=AtlasLootOptionsFrameOpaque:GetChecked();
    if (AtlasLoot.db.profile.Opaque) then
        AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1);
    else
        AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65);
    end
    AtlasLootOptions_Init();
end

function AtlasLoot:Options_AutoInstanceToggle()
    AtlasLoot.db.profile.AutoCurrentInstance = AtlasLootOptionsFrameAutoInstance:GetChecked();
end

function AtlasLootOptions_LoDStartup()
    if (AtlasLoot.db.profile.LoadAllLoDStartup) then
        AtlasLoot.db.profile.LoadAllLoDStartup = false;
    else
        AtlasLoot.db.profile.LoadAllLoDStartup = true;
    end
    AtlasLootOptions_Init();
end

function AtlasLootOptions_ItemIDToggle()
    AtlasLoot.db.profile.ItemIDs=AtlasLootOptionsFrameItemID:GetChecked();
    AtlasLootOptions_Init();
end

function AtlasLoot_SetupLootBrowserSlider(frame, mymin, mymax, step)
    _G[frame:GetName().."Text"]:SetText(AL["Loot Browser Scale: "].." ("..frame:GetValue()..")");
	frame:SetMinMaxValues(mymin, mymax);
	_G[frame:GetName().."Low"]:SetText(mymin);
	_G[frame:GetName().."High"]:SetText(mymax);
	frame:SetValueStep(step);
end

--Borrowed from Atlas, thanks Dan!
local function round(num, idp)
   local mult = 10 ^ (idp or 0);
   return math.floor(num * mult + 0.5) / mult;
end

function AtlasLoot_UpdateLootBrowserSlider(frame)
    _G[frame:GetName().."Text"]:SetText(AL["Loot Browser Scale: "].." ("..round(frame:GetValue(),2)..")");
end

function AtlasLoot_UpdateLootBrowserScale()
	AtlasLootDefaultFrame:SetScale(AtlasLoot.db.profile.LootBrowserScale);
end

function AtlasLoot_DisplayHelp()
	if not _G["AtlasLootHelpFrame_HelpText"] then
		local framewidht = InterfaceOptionsFramePanelContainer:GetWidth()
		local panel3 = CreateFrame("ScrollFrame", "AtlasLootHelpFrame_HelpTextFrameScroll", AtlasLootHelpFrame, "UIPanelScrollFrameTemplate")
		local scc = CreateFrame("Frame", "AtlasLootHelpFrame_HelpTextFrame", panel3)
			panel3:SetScrollChild(scc)
			panel3:SetPoint("TOPLEFT", AtlasLootHelpFrame, "TOPLEFT", 10, -25)
			scc:SetPoint("TOPLEFT", panel3, "TOPLEFT", 0, 0)
			panel3:SetWidth(framewidht-45)  
			panel3:SetHeight(400) 
			scc:SetWidth(framewidht-45)  
			scc:SetHeight(400)  
			panel3:SetHorizontalScroll(-50)
			panel3:SetVerticalScroll(50)
			panel3:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile="", tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }})
			panel3:SetScript("OnVerticalScroll", function()  end)
			panel3:EnableMouse(true)
			panel3:SetVerticalScroll(0)
			panel3:SetHorizontalScroll(0)
		local Text = scc:CreateFontString("AtlasLootHelpFrame_HelpText","OVERLAY","GameFontNormal")
			Text:SetPoint("TOPLEFT", scc, "TOPLEFT", 0, 0)
			Text:SetText(
            ORANGE..AL["How to open the standalone Loot Browser:"].."\n"..
            WHITE..AL["If you have AtlasLootFu enabled, click the minimap button, or alternatively a button generated by a mod like Titan or FuBar.  Finally, you can type '/al' in the chat window."].."\n\n"..
            ORANGE..AL["How to link an item to someone else:"].."\n"..
            WHITE..AL["Shift+Left Click the item like you would for any other in-game item"].."\n\n"..
            ORANGE..AL["How to view an item in the Dressing Room:"].."\n"..
            WHITE..AL["Simply Ctrl+Left Click on the item.  Sometimes the dressing room window is hidden behind the Atlas or AtlasLoot windows, so if nothing seems to happen move your Atlas or AtlasLoot windows and see if anything is hidden."].."\n\n"..
            ORANGE..AL["How to add an item to the wishlist:"].."\n"..
            WHITE..AL["Alt+Left Click any item to add it to the wishlist."].."\n\n"..
            ORANGE..AL["How to delete an item from the wishlist:"].."\n"..
            WHITE..AL["While on the wishlist screen, just Alt+Left Click on an item to delete it."].."\n\n"..
            ORANGE..AL["What else does the wishlist do?"].."\n"..
            WHITE..AL["If you Left Click any item on the wishlist, you can jump to the loot page the item comes from.  Also, on a loot page any item already in your wishlist is marked with a yellow star."].."\n\n"..
            ORANGE..AL["How to set of change a page filter:"].."\n"..
            WHITE..AL["If you Right Click on the filter check box you will get a drop downmenu with a list of filters. Click the filter you want to use or click add filter set to add new custom filters."].."\n\n"..
            ORANGE..AL["HELP!! I have broken the mod somehow!"].."\n"..
            WHITE..AL["Use the reset buttons available in the options menu, or type '/al reset' in your chat window."].."\n\n"..
            GREY..AL["For further help, see our website and forums: "]..GREEN.."https://discord.gg/uYCE2X2FgA"
            );
			Text:SetWidth(framewidht-80)
			Text:SetJustifyH("LEFT")
			Text:SetJustifyV("TOP")
	end
end

--[[
AtlasLoot_CreateOptionsInfoTooltips()
Adds explanatory tooltips to Atlasloot options
]]
function AtlasLoot_CreateOptionsInfoTooltips()
   
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameDefaultTT", nil) -- AL["Default Tooltips"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameLootlinkTT", nil) -- AL["Lootlink Tooltips"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameItemSyncTT", nil) -- AL["ItemSync Tooltips"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameOpaque", nil) -- AL["Make Loot Table Opaque"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameItemID", nil) -- AL["Show itemIDs at all times"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameSafeLinks", nil) -- AL["Safe Chat Links |cff1eff00(recommended)|r"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameEquipCompare", nil) -- AL["Show Comparison Tooltips"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameLoDSpam", nil) -- AL["Notify on LoD Module Load"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrameLootBrowserScale", nil) -- Scale SLIDER
      AtlasLoot:AddTooltip("AtlasLootOptionsFrame_ResetAtlasLoot", nil) -- AL["Reset Frames"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrame_ResetWishlist", nil) -- AL["Reset Wishlist"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrame_ResetQuicklooks", nil) -- AL["Reset Quicklooks"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrame_FuBarShow", nil) -- AL["Show FuBar Plugin"]
      AtlasLoot:AddTooltip("AtlasLootOptionsFrame_FuBarHide", nil) -- AL["Hide FuBar Plugin"]
      AtlasLoot:AddTooltip("AtlasLoot_SelectLootBrowserStyle", nil) 
end

local function AtlasLoot_SelectLootBrowserStyle_Initialize()
	local info;
	info = {
        text = AL["New Style"];
        func = AtlasLoot_SelectLootBrowserStyle_OnClick;
    };
	UIDropDownMenu_AddButton(info);
    info = {
        text = AL["Classic Style"];
        func = AtlasLoot_SelectLootBrowserStyle_OnClick;
    };
	UIDropDownMenu_AddButton(info);
end

function AtlasLoot_OptionsOnShow()
    AtlasLoot_SelectLootBrowserStyle_Label:SetText(AL["Loot Browser Style:"]);
    UIDropDownMenu_Initialize(AtlasLoot_SelectLootBrowserStyle, AtlasLoot_SelectLootBrowserStyle_Initialize);
	UIDropDownMenu_SetSelectedID(AtlasLoot_SelectLootBrowserStyle, AtlasLoot.db.profile.LootBrowserStyle);
	UIDropDownMenu_SetWidth(AtlasLoot_SelectLootBrowserStyle, 150);
end

function AtlasLoot_SelectLootBrowserStyle_OnClick()
    local thisID = this:GetID();
	UIDropDownMenu_SetSelectedID(AtlasLoot_SelectLootBrowserStyle, thisID);
    AtlasLoot.db.profile.LootBrowserStyle = thisID;
    if( AtlasLoot.db.profile.LootBrowserStyle == 1 ) then
        AtlasLoot:SetNewStyle("new");
    else
        AtlasLoot:SetNewStyle("old");
    end
    AtlasLoot_OptionsOnShow();
end

local helpframe = CreateFrame("Frame", "AtlasLootHelpFrame")
        helpframe:SetSize(425,450);
        helpframe:Hide();
        helpframe:SetPoint("CENTER");
        helpframe.title = helpframe:CreateFontString("AtlasLootHelpFrame_Title", "OVERLAY", "GameFontHighlightLarge");
        helpframe.title:SetJustifyH("CENTER");
        helpframe.title:SetSize(400,30);
        helpframe.title:SetPoint("TOP", "AtlasLootHelpFrame","TOP");
        helpframe.title:SetText(AL["AtlasLoot Help"]);
        helpframe:SetScript("OnShow", function() AtlasLoot_DisplayHelp() end);

local optframe = CreateFrame("Frame", "AtlasLootOptionsFrame");
        optframe:Hide();
        optframe:SetSize(425,405);
        optframe:SetPoint("CENTER");
        optframe.title = optframe:CreateFontString("AtlasLoot_OptionsTitle", "OVERLAY", "GameFontHighlightLarge");
        optframe.title:SetJustifyH("CENTER");
        optframe.title:SetSize(400,30);
        optframe.title:SetPoint("TOP", "AtlasLootOptionsFrame","TOP");
        optframe.title:SetText(ATLASLOOT_VERSION);
        optframe.foobar = optframe:CreateFontString("AtlasLootOptionsFrame_FuBarNotice", "OVERLAY", "GameFontNormal");
        optframe.foobar:SetPoint("BOTTOM",0,45);
        optframe.foobar:SetText(AL["The Minimap Button is generated by the FuBar Plugin."].."\n"..AL["This is automatic, you do not need FuBar installed."]);
        optframe:SetScript("OnShow", function() AtlasLoot_OptionsOnShow() end);

local deftt = CreateFrame("CheckButton", "AtlasLootOptionsFrameDefaultTT", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        deftt:SetPoint("TOPLEFT",5,-40);
        AtlasLootOptionsFrameDefaultTTText:SetText(AL["Default Tooltips"]);
        deftt:SetScript("OnClick", function() AtlasLootOptions_DefaultTTToggle() end);

local lootlnk = CreateFrame("CheckButton", "AtlasLootOptionsFrameLootlinkTT", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        lootlnk:SetPoint("TOPLEFT",5,-70);
        AtlasLootOptionsFrameLootlinkTTText:SetText(AL["Lootlink Tooltips"]);
        lootlnk:SetScript("OnClick", function() AtlasLootOptions_LootlinkTTToggle() end);

local itemsync = CreateFrame("CheckButton", "AtlasLootOptionsFrameItemSyncTT", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        itemsync:SetPoint("TOPLEFT",5,-100);
        AtlasLootOptionsFrameItemSyncTTText:SetText(AL["ItemSync Tooltips"]);
        itemsync:SetScript("OnClick", function() AtlasLootOptions_ItemSyncTTToggle() end);

local opaque = CreateFrame("CheckButton", "AtlasLootOptionsFrameOpaque", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        opaque:SetPoint("TOPLEFT",5,-130);
        AtlasLootOptionsFrameOpaqueText:SetText(AL["Make Loot Table Opaque"]);
        opaque:SetScript("OnClick", function() AtlasLootOptions_OpaqueToggle() end);

local autoInstance = CreateFrame("CheckButton", "AtlasLootOptionsFrameAutoInstance", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        autoInstance:SetPoint("TOPLEFT",5,-160);
        AtlasLootOptionsFrameAutoInstanceText:SetText(AL["Auto Load Instance Loot Pages"]);
        autoInstance:SetScript("OnClick", function() AtlasLoot:Options_AutoInstanceToggle() end);

local itemid = CreateFrame("CheckButton", "AtlasLootOptionsFrameItemID", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        itemid:SetPoint("TOP",5,-130);
        AtlasLootOptionsFrameItemIDText:SetText(AL["Show itemIDs at all times"]);
        itemid:SetScript("OnClick", function() AtlasLootOptions_ItemIDToggle() end);

local lod = CreateFrame("CheckButton", "AtlasLootOptionsFrameLoDStartup", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        lod:SetPoint("TOP",5,-40);
        AtlasLootOptionsFrameLoDStartupText:SetText(AL["Load Loot Modules at Startup"]);
        lod:SetScript("OnClick", function() AtlasLootOptions_LoDStartup() end);

local safe = CreateFrame("CheckButton", "AtlasLootOptionsFrameSafeLinks", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        safe:SetPoint("TOP",5,-70);
        AtlasLootOptionsFrameSafeLinksText:SetText(AL["Safe Chat Links"]);
        safe:SetScript("OnClick", function() AtlasLootOptions_SafeLinksToggle() end);

local equip = CreateFrame("CheckButton", "AtlasLootOptionsFrameEquipCompare", AtlasLootOptionsFrame, "OptionsCheckButtonTemplate");
        equip:SetPoint("TOP",5,-100);
        AtlasLootOptionsFrameEquipCompareText:SetText(AL["Show Comparison Tooltips"]);
        equip:SetScript("OnClick", function()
            if(AtlasLoot.db.profile.EquipCompare) then
                AtlasLoot.db.profile.EquipCompare = false;
                if (EquipCompare_UnregisterTooltip) then
                    EquipCompare_UnregisterTooltip(AtlasLootTooltip);
                end
            else
                AtlasLoot.db.profile.EquipCompare = true;
                if (EquipCompare_RegisterTooltip) then
                    EquipCompare_RegisterTooltip(AtlasLootTooltip);
                end
            end
        end);

local sStyle = CreateFrame("Button", "AtlasLoot_SelectLootBrowserStyle", AtlasLootOptionsFrame, "UIDropDownMenuTemplate");
        sStyle.lable = sStyle:CreateFontString("AtlasLoot_SelectLootBrowserStyle_Label", "BACKGROUND", "GameFontNormalSmall");
        sStyle.lable:SetPoint("RIGHT", "AtlasLoot_SelectLootBrowserStyle", "LEFT",15,2);
        sStyle:SetPoint("TOP",30,-220);

local bscale = CreateFrame("Slider", "AtlasLootOptionsFrameLootBrowserScale", AtlasLootOptionsFrame,"OptionsSliderTemplate");
        bscale:SetSize(240,16);
        bscale:SetPoint("TOP", 0,-300);
        bscale:SetScript("OnShow", function(self) AtlasLoot_SetupLootBrowserSlider(self, 0.25, 1.5, 0.01) end);
        bscale:SetScript("OnValueChanged", function(self)
            AtlasLoot_UpdateLootBrowserSlider(self);
            AtlasLoot.db.profile.LootBrowserScale = self:GetValue();
            AtlasLoot_UpdateLootBrowserScale();
        end);

local resetwish = CreateFrame("Button", "AtlasLootOptionsFrame_ResetWishlist", AtlasLootOptionsFrame, "OptionsButtonTemplate");
        resetwish:SetSize(130,25);
        resetwish:SetPoint("TOP", 0, -325);
        resetwish:SetText(AL["Reset Wishlist"]);
        resetwish:SetScript("OnClick", function() AtlasLoot_Reset("wishlist") end);
        resetwish:SetScript("OnShow", function() resetwish:SetWidth(AtlasLootOptionsFrame_ResetWishlist:GetTextWidth()+20) end);

local resetAtlas = CreateFrame("Button", "AtlasLootOptionsFrame_ResetAtlasLoot", AtlasLootOptionsFrame, "OptionsButtonTemplate");
        resetAtlas:SetSize(130,25);
        resetAtlas:SetText(AL["Reset Frames"]);
        resetAtlas:SetPoint("RIGHT", "AtlasLootOptionsFrame_ResetWishlist", "LEFT", -10, 0);
        resetAtlas:SetScript("OnClick", function() AtlasLoot_Reset("frames") end);
        resetAtlas:SetScript("OnShow", function() resetAtlas:SetWidth(AtlasLootOptionsFrame_ResetAtlasLoot:GetTextWidth()+20) end)

local resetquick = CreateFrame("Button", "AtlasLootOptionsFrame_ResetQuicklooks", AtlasLootOptionsFrame, "OptionsButtonTemplate");
        resetquick:SetSize(130,25);
        resetquick:SetText(AL["Reset Quicklooks"]);
        resetquick:SetPoint("LEFT", "AtlasLootOptionsFrame_ResetWishlist", "RIGHT", 10, 0);
        resetquick:SetScript("OnClick", function() AtlasLoot_Reset("quicklooks") end);
        resetquick:SetScript("OnShow", function() resetquick:SetWidth(AtlasLootOptionsFrame_ResetQuicklooks:GetTextWidth()+20) end)

local fooshow = CreateFrame("Button", "AtlasLootOptionsFrame_FuBarShow", AtlasLootOptionsFrame, "OptionsButtonTemplate");
        fooshow:SetSize(150,25);
        fooshow:SetText(AL["Show FuBar Plugin"]);
        fooshow:SetPoint("TOP", "AtlasLootOptionsFrame", "TOP", -85, -390);
        fooshow:SetScript("OnClick", function()
            if AtlasLootFu then
                AtlasLootFu:Show();
            end
        end);

local foohide = CreateFrame("Button", "AtlasLootOptionsFrame_FuBarHide", AtlasLootOptionsFrame, "OptionsButtonTemplate");
        foohide:SetSize(150,25);
        foohide:SetText(AL["Hide FuBar Plugin"]);
        foohide:SetPoint("TOP", "AtlasLootOptionsFrame", "TOP", 85, -390);
        foohide:SetScript("OnClick", function()
            if AtlasLootFu then
                AtlasLootFu:Hide();
            end
        end);