---------------------------------------------------------
-- Addon declaration
HandyNotes_QuestGivers = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_QuestGivers", "AceEvent-3.0")
local HQG = HandyNotes_QuestGivers
local Astrolabe = DongleStub("Astrolabe-0.4")
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes_QuestGivers", false)
local G = {}

---------------------------------------------------------
-- Our db upvalue and db defaults
local db
local defaults = {
	profile = {
		icon_scale         = 1.0,
		icon_alpha         = 1.0,
	},
}

---------------------------------------------------------
-- Options table
local options = {
	type = "group",
	name = L["QuestGivers"],
	desc = L["QuestGivers"],
	get = function(info) return db[info.arg] end,
	set = function(info, v)
		db[info.arg] = v
		HQG:SendMessage("HandyNotes_NotifyUpdate", "QuestGivers")
	end,
	args = {
		desc = {
			name = L["These settings control the look and feel of the QuestGiver icons."],
			type = "description",
			order = 0,
		},
		flight_icons = {
			type = "group",
			name = L["QuestGiver Icons"],
			desc = L["QuestGiver Icons"],
			order = 20,
			inline = true,
			args = {
				icon_scale = {
					type = "range",
					name = L["Icon Scale"],
					desc = L["The scale of the icons"],
					min = 0.25, max = 2, step = 0.01,
					arg = "icon_scale",
					order = 10,
				},
				icon_alpha = {
					type = "range",
					name = L["Icon Alpha"],
					desc = L["The alpha transparency of the icons"],
					min = 0, max = 1, step = 0.01,
					arg = "icon_alpha",
					order = 20,
				},
			},
		},
	},
}

---------------------------------------------------------
-- Localize some globals
local next = next
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes

---------------------------------------------------------
-- Constants
local icon = "Interface\\GossipFrame\\AvailableQuestIcon"
local HQG_Data

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HQGHandler = {}


local color = function (text, color, alpha)
	return "|c"..(alpha or "ff")..(color or "ffffff")..(text or "").."|r"
end

local white = function (text)
	return color(text, 'ffffff')
end

local PlayerLevel = UnitLevel("player")

function HQGHandler:OnEnter(mapFile, coord)
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

	local data = HQG_Data[mapFile][coord]

	tooltip:SetText(white(data.name))

	local multi = (data.starts > 1) and 's' or ''
	local starts = 'Starts ' .. white(data.starts .. ' quest' .. multi) .. ':'
	tooltip:AddLine(starts)

	local _, quest
	for quest_name, quest_level in pairs(data.quests) do
		local c = ((quest_level > PlayerLevel) and 'ff0000') or '00ff00'
		if quest_level == 0 then c = '88aaff' end
		local level = ((quest_level > 0) and quest_level) or '??'
		tooltip:AddLine(color('[' .. level .. '] ' .. quest_name, c))
	end

	tooltip:Show()
end

function HQGHandler:OnLeave(mapFile, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

do
	-- This is a custom iterator we use to iterate over every node in a given zone
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do -- Have we reached the end of this zone?
			if value then
				return state, nil, icon, db.icon_scale, db.icon_alpha
			end
			state, value = next(t, state) -- Get next data
		end
		return nil, nil, nil, nil
	end

	function HQGHandler:GetNodes(mapFile)
		return iter, HQG_Data[mapFile], nil
	end
end


---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HQG:OnInitialize()
	-- Set up our database
	self.db = LibStub("AceDB-3.0"):New("HandyNotes_QuestGiversDB", defaults)
	db = self.db.profile

	-- Initialize our database with HandyNotes
	HandyNotes:RegisterPluginDB("QuestGivers", HQGHandler, options)

	HQG_Data = HQG_GetData()
end

function HQG:OnEnable()
end

function HQG:OnDisable()
end

