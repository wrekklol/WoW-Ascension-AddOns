DTD_Tooltips = DTD:NewModule("Tooltips", "AceEvent-3.0")

local QTip = LibStub('LibQTip-1.0')
local Crayon = LibStub("LibCrayon-3.0")

local TooltipIconSize = 16
local TEXTURE_LINK_FORMAT = "|T%s:%d:%d:0:%d|t "

local QUEST_COMPLETE = "Interface\\RAIDFRAME\\ReadyCheck-Ready.blp"
local QUEST_NOT_COMPLETE = "Interface\\RAIDFRAME\\ReadyCheck-NotReady.blp"
local QUEST_ACCEPTED = "Interface\\GossipFrame\\DailyActiveQuestIcon.blp"
local QUEST_AVAILABLE = "Interface\\GossipFrame\\DailyQuestIcon.blp"
local CLASSLESS_ICON = "Interface\\Icons\\Mail_GMIcon"

local function RGBToHex(r, g, b)
	r = r <= 255 and r >= 0 and r or 0
	g = g <= 255 and g >= 0 and g or 0
	b = b <= 255 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r, g, b)
end

local function RGBPercToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end

-- backported API call
function bp_GetCurrencyInfo(idx) -- name, texture
    local t = {
			{42, "Badge of Justice", "Spell_Holy_ChampionsBond"},
			{61, "Dalaran Jewelcrafter's Token", "INV_Misc_Gem_Variety_01"},
			{81, "Epicurean's Award", "INV_Misc_Ribbon_01"},
			{101, "Emblem of Heroism", "Spell_Holy_ProclaimChampion"},
			{102, "Emblem of Valor", "Spell_Holy_ProclaimChampion_02"},
			{103, "Arena Points", "Spell_Holy_ChampionsBond"},
			{104, "Honor Points", "Spell_Holy_ChampionsBond"},
			{161, "Stone Keeper's Shard", "INV_Misc_Platnumdisks"},
			{181, "Honor Points", "INV_Banner_03"},
			{201, "Venture Coin", "INV_Misc_Coin_16"},
			{221, "Emblem of Conquest", "Spell_Holy_ChampionsGrace"},
			{241, "Champion's Seal", "Ability_Paladin_ArtofWar"},
			{301, "Emblem of Triumph", "spell_holy_summonchampion"},
			{321, "Isle of Conquest Mark of Honor", "INV_Jewelry_Necklace_27"},
			{341, "Emblem of Frost", "inv_misc_frostemblem_01"},
			{395, "Badge of Justice", "Spell_Holy_ChampionsBond"},
			{51, "Mystic Rune", "inv_custom_ReforgeToken"},
			{364, "Mark of Ascension", "Mail_GMIcon"}
		}
    for _, v in pairs(t) do
        if idx == v[1] then
            return v[2], v[3]
        end
    end
end

function DTD_Tooltips:CreateQuestTooltip(parent,id)
	quest = DailyTodoQuests[id]
	local tooltip = QTip:Acquire("DTDTooltip",2,"LEFT","LEFT")
	DTD.tooltip = tooltip
	
	-- Title the tooltip with the quest name
	tooltip:AddHeader(quest["n"])
	tooltip:AddSeparator()
	
	-- ClasslessDB ID
	if id > 20 then
		tooltip:AddLine(format(TEXTURE_LINK_FORMAT, CLASSLESS_ICON, 16, 16, -2)..id)
	end
	
	tooltip:AddLine()
	
	tooltip:AddHeader("Rewards:")
	tooltip:AddSeparator()
	
		-- Show the monetary award
		if quest["m"] ~= nil then
				tooltip:AddLine(format(TEXTURE_LINK_FORMAT,"Interface\\ICONS\\INV_Misc_Coin_17.blp",16,16,-2).."|cffFFFFFF"..GetCoinTextureString(quest["m"]).."|r")
		end
		
		-- Show the currency reward
		if quest["cr"] ~= nil then
			for _,reward in ipairs(quest["cr"]) do
				local name, texture = bp_GetCurrencyInfo(reward[1])
				tooltip:AddLine(format(TEXTURE_LINK_FORMAT,"Interface\\Icons\\"..texture,16,16,-2)..reward[2].." "..name)
			end	
		end
		
		-- Shows the item reward if no choices
--		if quest["itemrewards"] ~= nil then
--			for _,reward in ipairs(quest["itemrewards"]) do
--				local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo(reward[1])
--				if texture ~= nil and name ~= nil then
--					local r,g,b,_ = GetItemQualityColor(quality)
--					local line,_ = tooltip:AddLine(format(TEXTURE_LINK_FORMAT,texture,16,16,-2)..name)
--				else
--					tooltip:AddLine("Could not find item reward in cache")
--				end
				--print (quest["currencyrewards"][1])
--			end
--		end
		
		-- Shows the item reward if there is a choice
		if quest["ic"] ~= nil then
			tooltip:AddLine(Crayon:Gold("Pick one:"))
			for _,reward in ipairs(quest["ic"]) do
				local name, _, quality, _, _, _, _, _, _, texture, vendorPrice = GetItemInfo(reward[1])
				if texture ~= nil and name ~= nil then
--					local r,g,b,_ = GetItemQualityColor(quality)
					if vendorPrice > 0 then
						tooltip:AddLine(format(TEXTURE_LINK_FORMAT,GetItemIcon(reward[1]),16,16,-2)..name,"("..GetCoinTextureString(vendorPrice)..")")
					else
						GameTooltip:AddLine(format(TEXTURE_LINK_FORMAT,GetItemIcon(reward[1]),16,16,-2)..name)
					end
					GameTooltip:AddTexture()
				else
					GameTooltip:AddLine("Could not find item reward in cache")
				end
			end
		end
		
		-- Add the amount of reputation gained, but only if there is reputation rewarded
		if quest["rr"] ~= nil then
			for i=1,#quest["rr"] do
				local name, _, standingID, _, _, _, _, _, _, _, _, _, _ = GetFactionInfoByID(quest["rr"][i][1])
				if quest["rr"][i][2] > 10 then
					tooltip:AddLine(quest["rr"][i][2]..Crayon:Blue(" reputation with ")..Crayon:Colorize(RGBPercToHex(FACTION_BAR_COLORS[standingID].r,FACTION_BAR_COLORS[standingID].g,FACTION_BAR_COLORS[standingID].b),name))
				end
			end
		end
		
		-- Show the exp gained
		if quest["xp"] ~= nil then
			if quest["xp"] > 5 then
				tooltip:AddLine(quest["xp"]..Crayon:Purple(" experience."))
			end
		end
		
		--
		-- Tracking
		--
		local npc = npcInfo[questNpcs[id]]
		if npc ~= nil then
			tooltip:AddLine()
			tooltip:AddHeader("Quest Giver:")
			tooltip:AddSeparator()
			tooltip:AddLine(format(TEXTURE_LINK_FORMAT,QUEST_AVAILABLE,16,16,-2)..npc["name"])
		end
	
	-- Show other characters
	tooltip:AddHeader("Other Characters:")
	tooltip:AddSeparator()
	for name, side in pairs(DTD_Database.realm.side) do
		if quest['s'] == nil or quest['s'] == side then
			local tex = QUEST_NOT_COMPLETE
			local nameText
			if side == 2 then
				nameText = Crayon:Red(name)
			else
				nameText = Crayon:Blue(name)
			end
			if DTD_Database.realm.completedQuests[name][id] then
				tex = QUEST_COMPLETE
			elseif DTD_Database.realm.acceptedQuests[name][id] == true then
				tex = QUEST_ACCEPTED
			end

			tooltip:AddLine(format(TEXTURE_LINK_FORMAT,tex,12,12,-2)..nameText)
		end
	end
	
	tooltip:AddLine()
	tooltip:AddLine(Crayon:Red("Right click to blacklist."))
	
	if parent then
		tooltip:SmartAnchorTo(parent)
		tooltip:Show()
	end
	return tooltip
end