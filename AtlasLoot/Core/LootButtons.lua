local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local DEFAULT = "|cffFFd200";
local ParseTooltip_Enabled = false;
local AtlasLootScanTooltip = CreateFrame("GAMETOOLTIP","AtlasLootScanTooltip",nil,"GameTooltipTemplate");
AtlasLootScanTooltip:SetOwner(UIParent, "ANCHOR_NONE");


function AtlasLoot_GetEnchantLink(enchantID)
   if not enchantID then return end
   local EnchantLink = nil
   AtlasLootScanTooltip:SetOwner(UIParent, "ANCHOR_NONE")
   AtlasLootScanTooltip:ClearLines();
   AtlasLootScanTooltip:SetHyperlink("enchant:"..enchantID);
   AtlasLootScanTooltip:Show()
   local tooltipline = _G["AtlasLootScanTooltipTextLeft1"]
   local text = tooltipline:GetText()
   if text and string.find(text, ":") then
      EnchantLink = "|cffffd000|Henchant:"..enchantID.."|h["..text.."]|h|r"
   else
      EnchantLink = GetSpellLink(enchantID)
   end
   AtlasLootScanTooltip:Hide()
   return EnchantLink
end

--------------------------------------------------------------------------------
-- Item OnEnter
-- Called when a loot item is moused over
--------------------------------------------------------------------------------
function AtlasLootItem_OnEnter(self)
    local isItem;
    AtlasLootTooltip:ClearLines();
    for i=1, 30, 1 do
        if (_G["AtlasLootTooltipTextRight"..i] ~= nil) then
            _G["AtlasLootTooltipTextRight"..i]:SetText("");
        end
    end
    if self.itemID and (self.itemID ~= 0) then
        if string.sub(self.itemID, 1, 1) == "s" then
            isItem = false;
        else
            isItem = true;
        end
        if isItem then
            local color = strsub(_G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), 3, 10);
            local name = strsub(_G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), 11);
            if(self.itemID ~= 0 and self.itemID ~= "" and self.itemID ~= nil and AtlasLootDKPValues and AtlasLootClassPriority) then
                Identifier = "Item"..self.itemID;
                DKP = AtlasLootDKPValues[Identifier];
                priority = AtlasLootClassPriority[Identifier];
            else
                DKP = nil;
                priority = nil;
            end
            --Lootlink tooltips
            if( AtlasLoot.db.profile.LootlinkTT ) then
                --If we have seen the item, use the game tooltip to minimise same name item problems
                if(GetItemInfo(self.itemID) ~= nil) then
                    _G[self:GetName().."_Unsafe"]:Hide();
                    AtlasLootTooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() / 2), 24);
                    AtlasLootTooltip:SetHyperlink("item:"..self.itemID..":0:0:0");
                    if ( AtlasLoot.db.profile.ItemIDs ) then
                        AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..self.itemID, nil, nil, nil, 1);
                    end
                    if( self.droprate ~= nil) and ( self.droprate:match("=EI=") ) then
                        AtlasLootTooltip:AddLine(AL["Extra Info: "]..string.sub(self.droprate, 5), 1, 1, 0);
                    elseif( self.droprate ~= nil) then
                        AtlasLootTooltip:AddLine(AL["Drop Rate: "]..self.droprate, 1, 1, 0);
                    end
                    if( DKP ~= nil and DKP ~= "" ) then
                        AtlasLootTooltip:AddLine(RED..DKP.." "..AL["DKP"], 1, 1, 0, 1);
                    end
                    if( priority ~= nil and priority ~= "" ) then
                        AtlasLootTooltip:AddLine(GREEN..AL["Priority:"].." "..priority, 1, 1, 0, 1);
                    end
                    AtlasLootTooltip:Show();
                    if((AtlasLoot.db.profile.EquipCompare and ((not EquipCompare_RegisterTooltip) or (not EquipCompare_Enabled)))) or IsShiftKeyDown() then
                        AtlasLootItem_ShowCompareItem(self); --- CALL MISSING METHOD TO SHOW 2 TOOLTIPS (Item Compare)
                    end
                    if (LootLink_AddItem) then
                        LootLink_AddItem(name, self.itemID..":0:0:0", color);
                    end
                else
                    _G[self:GetName().."_Unsafe"]:Show();
                    AtlasLootTooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() / 2), 24);
                    if (LootLink_Database and LootLink_Database[self.itemID]) then
                       LootLink_SetTooltip(AtlasLootTooltip, LootLink_Database[self.itemID][1], 1);
                    else
                       LootLink_SetTooltip(AtlasLootTooltip,strsub(_G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), 11), 1);
                    end
                    if ( AtlasLoot.db.profile.ItemIDs ) then
                        AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..self.itemID, nil, nil, nil, 1);
                    end
                    if( self.droprate ~= nil) and (self.droprate:match("=EI=")) then
                        AtlasLootTooltip:AddLine(AL["Extra Info: "]..string.sub(self.droprate, 5), 1, 1, 0);
                    elseif( self.droprate ~= nil) then
                        AtlasLootTooltip:AddLine(AL["Drop Rate: "]..self.droprate, 1, 1, 0);
                    end
                    if( DKP ~= nil and DKP ~= "" ) then
                        AtlasLootTooltip:AddLine(RED..DKP.." "..AL["DKP"], 1, 1, 0);
                    end
                    if( priority ~= nil and priority ~= "" ) then
                        AtlasLootTooltip:AddLine(GREEN..AL["Priority:"].." "..priority, 1, 1, 0);
                    end
                    AtlasLootTooltip:AddLine(" ");
                    AtlasLootTooltip:AddLine(AL["You can right-click to attempt to query the server.  You may be disconnected."], nil, nil, nil, 1);
                    AtlasLootTooltip:Show();
                end
            --Item Sync tooltips
            elseif( AtlasLoot.db.profile.ItemSyncTT ) then
                if(GetItemInfo(self.itemID) ~= nil) then
                    _G[self:GetName().."_Unsafe"]:Hide();
                end
                ItemSync:ButtonEnter();
                if ( AtlasLoot.db.profile.ItemIDs ) then
                    GameTooltip:AddLine(BLUE..AL["ItemID:"].." "..self.itemID, nil, nil, nil, 1);
                end
                if( self.droprate ~= nil) and ( self.droprate:match("=EI=") ) then
                    AtlasLootTooltip:AddLine(AL["Extra Info: "]..string.sub(self.droprate, 5), 1, 1, 0);
                elseif( self.droprate ~= nil) then
                    AtlasLootTooltip:AddLine(AL["Drop Rate: "]..self.droprate, 1, 1, 0);
                end
                if( DKP ~= nil and DKP ~= "" ) then
                    GameTooltip:AddLine(RED..DKP.." "..AL["DKP"], 1, 1, 0);
                end 
                if( priority ~= nil and priority ~= "" ) then
                    GameTooltip:AddLine(GREEN..AL["Priority:"].." "..priority, 1, 1, 0);
                end
                GameTooltip:Show();
                if((AtlasLoot.db.profile.EquipCompare and ((not EquipCompare_RegisterTooltip) or (not EquipCompare_Enabled)))) or IsShiftKeyDown() then
                    GameTooltip_ShowCompareItem(); --- CALL MISSING METHOD TO SHOW 2 TOOLTIPS (Item Compare)
                end
            --Default game tooltips
            else
                if(self.itemID ~= nil) then
                    if(GetItemInfo(self.itemID) ~= nil) then
                        _G[self:GetName().."_Unsafe"]:Hide();
                        AtlasLootTooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() / 2), 24);
                        AtlasLootTooltip:SetHyperlink("item:"..self.itemID..":0:0:0");
                        if ( AtlasLoot.db.profile.ItemIDs ) then
                            AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..self.itemID, nil, nil, nil, 1);
                        end
                        if( self.droprate ~= nil) and ( self.droprate:match("=EI=") ) then
                            AtlasLootTooltip:AddLine(AL["Extra Info: "]..string.sub(self.droprate, 5), 1, 1, 0);
                        elseif( self.droprate ~= nil) then
                            AtlasLootTooltip:AddLine(AL["Drop Rate: "]..self.droprate, 1, 1, 0);
                        end
                        if( DKP ~= nil and DKP ~= "" ) then
                            AtlasLootTooltip:AddLine(RED..DKP.." "..AL["DKP"], 1, 1, 0);
                        end
                        if( priority ~= nil and priority ~= "" ) then
                            AtlasLootTooltip:AddLine(GREEN..AL["Priority:"].." "..priority, 1, 1, 0);
                        end
                        AtlasLootTooltip:Show();
                        if((AtlasLoot.db.profile.EquipCompare and ((not EquipCompare_RegisterTooltip) or (not EquipCompare_Enabled)))) or IsShiftKeyDown() then
                            AtlasLootItem_ShowCompareItem(self); --- CALL MISSING METHOD TO SHOW 2 TOOLTIPS (Item Compare)
                        end
                    end
                end
            end
        else
            spellID = string.sub(self.itemID, 2);
            AtlasLootTooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() / 2), 24);
            AtlasLootTooltip:ClearLines();
            AtlasLootTooltip:SetHyperlink(AtlasLoot_GetEnchantLink(spellID));
            AtlasLootTooltip:Show();
            if(self.spellitemID and ((AtlasLoot.db.profile.EquipCompare and ((not EquipCompare_RegisterTooltip) or (not EquipCompare_Enabled))) or IsShiftKeyDown())) then
                AtlasLootItem_ShowCompareItem(self); --- CALL MISSING METHOD TO SHOW 2 TOOLTIPS (Item Compare)
            end    
        end
    end
end

--------------------------------------------------------------------------------
-- Item OnLeave
-- Called when the mouse cursor leaves a loot item
--------------------------------------------------------------------------------
function AtlasLootItem_OnLeave(self)
    --Hide the necessary tooltips
    if( AtlasLoot.db.profile.LootlinkTT ) then
        AtlasLootTooltip:Hide();
    elseif( AtlasLoot.db.profile.ItemSyncTT ) then
        if(GameTooltip:IsVisible()) then
            GameTooltip:Hide();
        end
    else
        if(self.itemID ~= nil) then
		    AtlasLootTooltip:Hide();
            GameTooltip:Hide();
	    end
    end
    if ( ShoppingTooltip2:IsVisible() or ShoppingTooltip1.IsVisible) then
       ShoppingTooltip2:Hide();
       ShoppingTooltip1:Hide();
    end
end

--------------------------------------------------------------------------------
-- Item OnClick
-- Called when a loot item is clicked on
--------------------------------------------------------------------------------
function AtlasLootItem_OnClick(self ,arg1)
    local isItem;
	local color = strsub(_G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), 1, 10);
	local id = self:GetID();
	local name = strsub(_G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), 11);
    if string.sub(self.itemID, 1, 1) == "s" then
            isItem = false;
        else
            isItem = true;
        end
    if isItem then
        local iteminfo = GetItemInfo(self.itemID);
        local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(self.itemID);
        --If shift-clicked, link in the chat window
        if arg1=="RightButton" and ATLASLOOT_ITEM_UNLOCK then
            AtlasLoot:MoveWishlistItem("Down",self.number);
        elseif IsAltKeyDown() and arg1=="LeftButton" and ATLASLOOT_ITEM_UNLOCK then
            StaticPopup_Show("ATLASLOOT_ADD_CUSTOMHEADER");
            StaticPopupDialogs.ATLASLOOT_ADD_CUSTOMHEADER.num = self.number;
        elseif (arg1=="LeftButton") and ATLASLOOT_ITEM_UNLOCK then
            AtlasLoot:MoveWishlistItem("Up",self.number);
        elseif (arg1=="RightButton" and IsAltKeyDown()) then
            OpenAscensionDBURL("?item="..self.itemID)
        elseif(arg1=="RightButton" and not iteminfo and self.itemID ~= 0) then
            AtlasLootTooltip:SetHyperlink("item:"..self.itemID..":0:0:0:0:0:0:0");
            if not AtlasLoot.db.profile.ItemSpam then
                DEFAULT_CHAT_FRAME:AddMessage(AL["Server queried for "]..color.."["..name.."]".."|r"..AL[".  Right click on any other item to refresh the loot page."]);
            end
        elseif(arg1=="RightButton" and iteminfo) then
            if not AtlasLoot.db.profile.ItemSpam then
                DEFAULT_CHAT_FRAME:AddMessage(itemLink..AL[" is safe."]);
            end
        elseif(IsShiftKeyDown() and iteminfo and (AtlasLoot.db.profile.SafeLinks or AtlasLoot.db.profile.AllLinks)) then
            ChatEdit_InsertLink(itemLink);
        elseif(IsShiftKeyDown() and AtlasLoot.db.profile.AllLinks) then
            ChatEdit_InsertLink(color.."|Hitem:"..self.itemID..":0:0:0:0:0:0:0|h["..name.."]|h|r");
        elseif(ChatFrameEditBox and ChatFrameEditBox:IsVisible() and IsShiftKeyDown()) then
            ChatFrameEditBox:Insert(name);  -- <-- this line just inserts plain text, does not need any adjustment
        --If control-clicked, use the dressing room
        elseif(IsControlKeyDown() and iteminfo) then
            DressUpItemLink(itemLink);
        elseif IsAltKeyDown() then
            if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
                AtlasLoot_DeleteFromWishList(self.itemID,self.number);
            else
                if(AtlasLootItemsFrame.refresh[1] == "SearchResult") then
                    local datID, _, datPage = strsplit("|", self.sourcePage);
                    AtlasLoot_ShowWishListDropDown(self.itemID, self.itemTexture, _G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(), AtlasLoot_Data[datID][tonumber(datPage)].Name, 
                                                    datID .. "|" .. "AtlasLoot_Data" .. "|" .. tostring(datPage), self);
                else
                    AtlasLoot_ShowWishListDropDown(self.itemID, self.itemTexture, _G["AtlasLootItem_"..self:GetID().."_Name"]:GetText(),
                                                        AtlasLoot_BossName:GetText(), self.dataID .. "|" .. "AtlasLoot_Data" .. "|" .. tostring(self.tablenum), self);
                end
            end
        elseif((AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList") and self.sourcePage) then
            local dataID, dataSource, dataPage = strsplit("|", self.sourcePage);
            if(dataID and dataSource) then
                AtlasLoot:ShowItemsFrame(dataID, "AtlasLoot_Data", tonumber(dataPage));
            end
        elseif( self.sourcePage and self.sourcePage:match("=LT=") ) then
            local dataID, dataSource, dataPage = strsplit("|", string.sub(self.sourcePage, 5));
                if(dataID and dataSource) then
                    ATLASLOOT_BACKENABLED = true;
                    AtlasLoot:ShowItemsFrame(dataID, "AtlasLoot_Data", tonumber(dataPage));
                end
        elseif (arg1=="LeftButton") and self.sourcePage then
           --Create token table if there isnt one
            if AtlasLoot_TokenData[self.sourcePage] == nil then
                AtlasLoot:CreateToken(self.sourcePage)
            end
            --Show token table
            AtlasLoot:ShowItemsFrame(self.sourcePage, "AtlasLoot_TokenData", 1);
        end
    else
        if IsShiftKeyDown() then
            spellID = string.sub(self.itemID, 2);
            ChatEdit_InsertLink(AtlasLoot_GetEnchantLink(spellID));
        elseif (arg1=="RightButton" and IsAltKeyDown()) then
            OpenAscensionDBURL("?item="..self.itemID)
        elseif IsAltKeyDown() then
            if AtlasLootItemsFrame.refresh[2] == "AtlasLoot_CurrentWishList" then
                AtlasLoot_DeleteFromWishList(self.itemID, self.number);
            else
                spellName, _, _, _, _, _, _, _, _ = GetSpellInfo(string.sub(self.itemID, 2));
                --spellIcon = GetItemIcon(self.dressingroomID);
                if(AtlasLootItemsFrame.refresh[1] == "SearchResult") then
                    local datID, _, datPage = strsplit("|", self.sourcePage);
                    AtlasLoot_ShowWishListDropDown(self.itemID, self.dressingroomID, "=ds="..spellName, 
                                                        AtlasLoot_Data[datID][tonumber(datPage)].Name, self.sourcePage, self);
                else
                    AtlasLoot_ShowWishListDropDown(self.itemID, self.dressingroomID, "=ds="..spellName, AtlasLoot_BossName:GetText(), self.dataID .. "|" .. "AtlasLoot_Data" .. "|" .. tostring(self.tablenum), self);
                end
            end
        elseif(IsControlKeyDown()) then
            DressUpItemLink("item:"..self.dressingroomID..":0:0:0:0:0:0:0");
        elseif((AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and self.sourcePage) then
            local dataID, dataSource, dataPage = strsplit("|", self.sourcePage);
            if(dataID and dataSource) then
                AtlasLoot:ShowItemsFrame(dataID, "AtlasLoot_Data", tonumber(dataPage));
            end
        elseif( self.sourcePage and self.sourcePage:match("=LT=") ) then
        local dataID, dataSource, dataPage = strsplit("|", string.sub(self.sourcePage, 5));
            if(dataID and dataSource) then
                ATLASLOOT_BACKENABLED = true;
                AtlasLoot:ShowItemsFrame(dataID, "AtlasLoot_Data", tonumber(dataPage));
            end
        end
    end
end

-------
-- Missing GameToolTip method
-- Enables item comparing. I've ripped self method directly from GameTooltip.lua and modified to work with AtlasLootTooltip /siena
-------
function AtlasLootItem_ShowCompareItem(self)
   local shift = 1;
   local item,link = nil,nil
   if self.spellitemID and self.spellitemID ~= "" and self.spellitemID ~= 0 then
      item = AtlasLootTooltip:GetSpell()
      _,link = GetItemInfo(self.spellitemID)
   else
      item,link = AtlasLootTooltip:GetItem();
   end

   if ( not link ) then
      return
   end

   ShoppingTooltip1:SetOwner(AtlasLootTooltip, "ANCHOR_NONE");
   ShoppingTooltip2:SetOwner(AtlasLootTooltip, "ANCHOR_NONE");
   ShoppingTooltip3:SetOwner(AtlasLootTooltip, "ANCHOR_NONE");

   local item1 = nil;
   local item2 = nil;
   local item3 = nil;
   local side = "left";
   if ( ShoppingTooltip1:SetHyperlinkCompareItem(link, 1, 1, AtlasLootTooltip) ) then
      item1 = true;
   end
   if ( ShoppingTooltip2:SetHyperlinkCompareItem(link, 2, 1, AtlasLootTooltip) ) then
      item2 = true;
   end
   if ( ShoppingTooltip3:SetHyperlinkCompareItem(link, 3, 1, AtlasLootTooltip) ) then
      item3 = true;
   end
   if not item1 and not item2 and not item3 then 
        return 
    end

   if item3 then
        if not item1 then
            item1, item3 = true, nil;
            ShoppingTooltip1:SetHyperlinkCompareItem(link, 3, 1, AtlasLootTooltip);
        elseif not item2 then
            item2, item3 = true, nil;
            ShoppingTooltip2:SetHyperlinkCompareItem(link, 3, 1, AtlasLootTooltip);
        end
    end
    if item2 and not item1 then
        item1, item2 = true, nil;
        ShoppingTooltip1:SetHyperlinkCompareItem(link, 2, 1, AtlasLootTooltip);
    end

   local left, right, anchor1, anchor2 = AtlasLootTooltip:GetLeft(), AtlasLootTooltip:GetRight(), "TOPLEFT", "TOPRIGHT";
   if not left or not right then return end
	if (GetScreenWidth() - right) < left then anchor1, anchor2 = anchor2, anchor1 end

    if item1 then
		ShoppingTooltip1:ClearAllPoints();
		ShoppingTooltip1:SetPoint(anchor1, AtlasLootTooltip, anchor2, 0, -10);
		ShoppingTooltip1:Show();

		if item2 then
			ShoppingTooltip2:ClearAllPoints();
			ShoppingTooltip2:SetPoint(anchor1, ShoppingTooltip1, anchor2);
			ShoppingTooltip2:Show();
		end

        if item3 then
			ShoppingTooltip3:ClearAllPoints();
			ShoppingTooltip3:SetPoint(anchor1, ShoppingTooltip2, anchor2);
			ShoppingTooltip3:Show();
		end
	end

end


