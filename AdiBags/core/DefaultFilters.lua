--[[
AdiBags - Adirelle's bag addon.
Copyright 2010-2021 Adirelle (adirelle@gmail.com)
All rights reserved.

This file is part of AdiBags.

AdiBags is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

AdiBags is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with AdiBags.  If not, see <http://www.gnu.org/licenses/>.
--]]

local addonName, addon = ...

local function isMythic(itemLink)
	local tip = CreateFrame("GameTooltip","Tooltip",nil,"GameTooltipTemplate")
	tip:SetOwner(UIParent, "ANCHOR_NONE")
	tip:SetHyperlink(itemLink);
	tip:Show()
	for i = 2,2 do--tip:NumLines() do
	   if(string.find(_G["TooltipTextLeft"..i]:GetText(), "Mythic ")) then
		  return true
	   end
	end
 end

function addon:SetupDefaultFilters()
	-- Globals: GetEquipmentSetLocations
	--<GLOBALS
	local _G = _G
	local BANK_CONTAINER = _G.BANK_CONTAINER
	local BANK_CONTAINER_INVENTORY_OFFSET = _G.BANK_CONTAINER_INVENTORY_OFFSET
	local EquipmentManager_UnpackLocation = _G.EquipmentManager_UnpackLocation
	local format = _G.format
	local pairs = _G.pairs
	local wipe = _G.wipe
	--GLOBALS>

	local L = addon.L

	-- Make some strings local to speed things
	local CONSUMMABLE = "Consumable" -- GetItemClassInfo(LE_ITEM_CLASS_CONSUMABLE)
	--Todo: Add Localization for Junk variable
	local JUNK = "Junk"--GetItemSubClassInfo(LE_ITEM_CLASS_MISCELLANEOUS, 0)
	local MISCELLANEOUS = "Miscellaneous"--GetItemClassInfo(LE_ITEM_CLASS_MISCELLANEOUS)
	local QUEST = "Quest"--GetItemClassInfo(LE_ITEM_CLASS_QUESTITEM)
	local RECIPE = "Recipe" --GetItemClassInfo(LE_ITEM_CLASS_RECIPE)
	local TRADE_GOODS = "Tradeskill" --GetItemClassInfo(LE_ITEM_CLASS_TRADEGOODS)
	local WEAPON = "Weapon" -- GetItemClassInfo(LE_ITEM_CLASS_WEAPON)
	local ARMOR = "Armor" --GetItemClassInfo(LE_ITEM_CLASS_ARMOR)
	local KEY = "Key" --GetItemClassInfo(LE_ITEM_CLASS_KEY)
	local MYTHICPLUS = "Mythic+" --GetItemClassInfo(Mythicplus)
	local ASCENSION = "Ascension" --GetItemClassInfo(Ascension)
	local JEWELRY = L['Jewelry']
	local EQUIPMENT = L['Equipment']
	local AMMUNITION = L['Ammunition']

	-- Define global ordering
	self:SetCategoryOrders{
		[QUEST] = 30,
		[TRADE_GOODS] = 20,
		[EQUIPMENT] = 10,
		[MYTHICPLUS] = 0,
		[CONSUMMABLE] = -10,
		[MISCELLANEOUS] = -20,
		[ASCENSION] = -30,
		[AMMUNITION] = -40,
		[KEY] = -50,
		[JUNK] = -60,
	}
	
	-- [90] Key
	do
		local keyFilter = addon:RegisterFilter('Key', 90, function(self, slotData)
			if slotData.bagFamily == 256 or slotData.class == KEY or slotData.subclass == KEY then
				return KEY
			else
				return false
			end
		end)
		keyFilter.uiName = KEY
		keyFilter.uiDesc = L['Put items categorized as keys in their own section.']
	end
	
	-- [75] Quest Items
	do
		local questItemFilter = addon:RegisterFilter('Quest', 75, function(self, slotData)
			if slotData.class == QUEST or slotData.subclass == QUEST then
				return QUEST
			else
				return false
			end
		end)
		questItemFilter.uiName = L['Quest Items']
		questItemFilter.uiDesc = L['Put quest-related items in their own section.']
	end
	
	-- name, 		_, quality, 		iLevel, 		reqLevel, 			class,			 subclass, 			equipSlot, 			texture, 		vendorPrice = GetItemInfo(itemId)
	-- slotData.name, slotData.quality, slotData.iLevel, slotData.reqLevel, slotData.class, slotData.subclass, slotData.equipSlot, slotData.texture, slotData.vendorPrice = name, quality, iLevel, reqLevel, class, subclass, equipSlot, texture, vendorPrice

	-- [70] Mythic+
	do
		local mythicPlusFilter = addon:RegisterFilter('MythicPlus', 70, function(self, slotData)	
			if slotData.texture == "Interface\\Icons\\inv_relics_hourglass" or slotData.name == "Outland Mythical Keystone Cache" or slotData.texture == "Interface\\Icons\\inv_legion_chest_legionfall" or ((slotData.class == ARMOR or slotData.class == WEAPON or slotData.class == JEWELRY) and isMythic(slotData.link)) then
				return MYTHICPLUS
			else
				return false
			end
		end)
		mythicPlusFilter.uiName = MythicPlus
		mythicPlusFilter.uiDesc = L['Put items categorized as Mythic in their own section.']
	end
	
	-- [60] Equipment
	do
		local equipCategories = {
			INVTYPE_2HWEAPON = WEAPON,
			INVTYPE_AMMO = MISCELLANEOUS,
			INVTYPE_BAG = MISCELLANEOUS,
			INVTYPE_BODY = MISCELLANEOUS,
			INVTYPE_CHEST = ARMOR,
			INVTYPE_CLOAK = ARMOR,
			INVTYPE_FEET = ARMOR,
			INVTYPE_FINGER = JEWELRY,
			INVTYPE_HAND = ARMOR,
			INVTYPE_HEAD = ARMOR,
			INVTYPE_HOLDABLE = WEAPON,
			INVTYPE_LEGS = ARMOR,
			INVTYPE_NECK = JEWELRY,
			INVTYPE_QUIVER = MISCELLANEOUS,
			INVTYPE_RANGED = WEAPON,
			INVTYPE_RANGEDRIGHT = WEAPON,
			INVTYPE_RELIC = JEWELRY,
			INVTYPE_ROBE = ARMOR,
			INVTYPE_SHIELD = WEAPON,
			INVTYPE_SHOULDER = ARMOR,
			INVTYPE_TABARD = MISCELLANEOUS,
			INVTYPE_THROWN = WEAPON,
			INVTYPE_TRINKET = JEWELRY,
			INVTYPE_WAIST = ARMOR,
			INVTYPE_WEAPON = WEAPON,
			INVTYPE_WEAPONMAINHAND = WEAPON,
			INVTYPE_WEAPONMAINHAND_PET = WEAPON,
			INVTYPE_WEAPONOFFHAND = WEAPON,
			INVTYPE_WRIST = ARMOR,
		}
		
		local equipmentFilter = addon:RegisterFilter('Equipment', 60, function(self, slotData)
			local equipSlot = slotData.equipSlot
			if equipSlot and equipSlot ~= "" then
				local rule = self.db.profile.dispatchRule
				local category
				if rule == 'category' then
					category = equipCategories[equipSlot] or _G[equipSlot]
				elseif rule == 'slot' then
					category = _G[equipSlot]
				end
				if category == ARMOR and self.db.profile.armorTypes and slotData.subclass then
					category = slotData.subclass
				end
				return category or EQUIPMENT, EQUIPMENT
			end
			local AscensionItemEquipmentList = {
				--Tier 1 Tokens
			2522360, 2522360, 2622360, 2722360,
			2522361, 2522361, 2622361, 2722361,
			2522350, 2522350, 2622350, 2722350,
			2522362, 2522362, 2622362, 2722362,
			2522363, 2522363, 2622363, 2722363,
			2522364, 2522364, 2622364, 2722364,
			2522359, 2522359, 2622359, 2722359,
			2522365, 2522365, 2622365, 2722365,
			--Tier 2 Tokens
			2522460, 2522460, 2622460, 2722460,
			2522461, 2522461, 2622461, 2722461,
			2522450, 2522450, 2622450, 2722450,
			2522462, 2522462, 2622462, 2722462,
			2522464, 2522464, 2622464, 2722464,
			2522463, 2522463, 2622463, 2722463,
			2522459, 2522459, 2622459, 2722459,
			2522465, 2522465, 2622465, 2722465,
			--Tier 3 Tokens
			22353, 22353, 102278, 222353,
			22354, 22354, 102286, 222354,
			22349, 22349, 102264, 222349,
			22355, 22355, 102262, 222355,
			22357, 22357, 102268, 222357,
			22356, 22356, 102300, 222356,
			22352, 22352, 102284, 222352,
			22358, 22358, 102290, 222358,
			--Tier 4 Tokens
			29761, 29761, 329761, 229761,
			29764, 29764, 329764, 229764,
			29753, 29753, 329753, 229753,
			29758, 29758, 329758, 229758,
			29767, 29767, 329767, 229767,
			--Tier 5 Tokens
			30243, 30243, 330243, 230243,
			30249, 30249, 330249, 230249,
			30237, 30237, 330237, 230237,
			30240, 30240, 330240, 230240,
			30246, 30246, 30246, 230246,
			--Quest items with loot
			232405, 332405
			}
			for k,v in pairs(AscensionItemEquipmentList) do
				if v == slotData.itemId then
					return EQUIPMENT
				end
			end
		end)
		equipmentFilter.uiName = EQUIPMENT
		equipmentFilter.uiDesc = L['Put any item that can be equipped (including bags) into the "Equipment" section.']
		
		function equipmentFilter:OnInitialize()
			self.db = addon.db:RegisterNamespace('Equipment', { profile = { dispatchRule = 'category', armorTypes = false } })
		end
		
		function equipmentFilter:GetOptions()
			return {
				dispatchRule = {
					name = L['Section setup'],
					desc = L['Select the sections in which the items should be dispatched.'],
					type = 'select',
					width = 'double',
					order = 10,
					values = {
						one = L['Only one section.'],
						category = L['Four general sections.'],
						slot = L['One section per item slot.'],
					},
				},
				armorTypes = {
					name = L['Split armors by types'],
					desc = L['Check this so armors are dispatched in four sections by type.'],
					type = 'toggle',
					order = 20,
					disabled = function() return self.db.profile.dispatchRule ~= 'category' end,
				},
			}, addon:GetOptionHandler(self, true)
		end
	end



	-- [50] Ascension+
	do
		local AscensionFilter = addon:RegisterFilter('Ascension', 50, function(self, slotData)	
			local AscensionItemList = {32912, 33016}
			--777910, 121421, 1903512, 1903513, 1903515, 121422, 110000, 777999, 640542, 1777028, 121421, 121422, 777999, 110000, 1903512, 1903513, 777910, 1903515, 640542, 977028, 1777028
			for k,v in pairs(AscensionItemList) do
				if v == slotData.itemId then
					return ASCENSION
				end
			end
		
			if slotData.quality >= 6 then
				return ASCENSION
			else
				return false
			end
		end)
		AscensionFilter.uiName = Ascension
		AscensionFilter.uiDesc = L['Put items categorized as Ascension in their own section.']
	end
	
	-- [10] Item classes
	do
		local itemCat = addon:RegisterFilter('ItemCategory', 10)
		itemCat.uiName = L['Item category']
		itemCat.uiDesc = L['Put items in sections depending on their first-level category at the Auction House.']
		..'\n|cffff7700'..L['Please note this filter matchs every item. Any filter with lower priority than this one will have no effect.']..'|r'
		
		function itemCat:OnInitialize(slotData)
			self.db = addon.db:RegisterNamespace(self.moduleName, {
				profile = {
					splitBySubclass = { false }
				}
			})
		end

		function itemCat:GetOptions()
			return {
				splitBySubclass = {
					name = L['Split by subcategories'],
					desc = L['Select which first-level categories should be split by sub-categories.'],
					type = 'multiselect',
					order = 10,
					values = {
						[TRADE_GOODS] = TRADE_GOODS,
						[CONSUMMABLE] = CONSUMMABLE,
						[MISCELLANEOUS] = MISCELLANEOUS,
						[RECIPE] = RECIPE,
					}
				}
			}, addon:GetOptionHandler(self, true)
		end

		function itemCat:Filter(slotData)
			local class, subclass = slotData.class, slotData.subclass
			if self.db.profile.splitBySubclass[class] then
				return subclass, class
			else
				return class
			end
		end

	end

end
