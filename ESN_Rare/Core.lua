-- This addon was inspired by SilverDragon from Kemayo and NPCScan from Saiket. Some parts of the code were borrowed from SilverDragon.
-- Thanks to Bl4ckSh33p for his help.
-----------------------------------------------------------------------------------------------------------------------------

ESN_Rare = LibStub("AceAddon-3.0"):NewAddon("ESN_Rare", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "LibSink-2.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("ESN_Rare")
local SML = LibStub("LibSharedMedia-3.0");
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
-----
local db
local MAX_ACCOUNT_MACROS, MAX_CHARACTER_MACROS = 36, 18
local nameplates = {}
local num_worldchildren
local units_to_scan = {'targettarget', 'party1target', 'party2target', 'party3target', 'party4target', 'party5target'}
local already_cached = {}
local first_cachescan = true
local cache_tooltip = CreateFrame("GameTooltip", "ESN_RareCacheTooltip")
cache_tooltip:AddFontStrings(
    cache_tooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
	cache_tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
)

SML:Register("sound", "Miau", "Interface\\AddOns\\ESN_Rare\\Media\\alarm.mp3");

local tameable = {
	[35189] = true,
	[33776] = true,
	[8213] = true,
	[8211] = true,
	[462] = true,
	[18241] = true,
	[14228] = true,
	[8205] = true,
	[8207] = true,
	[8208] = true,
	[8204] = true,
	[3581] = true,
	[5828] = true,
	[5842] = true,
	[5834] = true,
	[5829] = true,
	[5865] = true,
	[14430] = true,
	[471] = true,
	[6584] = true,
	[6585] = true,
	[6582] = true,
	[6581] = true,
	[3068] = true,
	[5807] = true,
	[14343] = true,
	[14344] = true,
	[14339] = true,
	[1140] = true,
	[1112] = true,
	[12431] = true,
	[12432] = true,
	[12433] = true,
	[4132] = true,
	[5937] = true,
	[14232] = true,
	[14234] = true,
	[14233] = true,
	[14237] = true,
	[4380] = true,
	[2753] = true,
	[2850] = true,
	[2931] = true,
	[2175] = true,
	[2172] = true,
	[2476] = true,
	[14268] = true,
	[14266] = true,
	[10359] = true,
	[10357] = true,
	[14472] = true,
	[14476] = true,
	[14473] = true,
	[14477] = true,
	[32485] = true,
	[32517] = true,
	[14222] = true,
	[14223] = true,
	[20932] = true,
	[521] = true,
	[574] = true,
	[10644] = true,
	[12037] = true,
	[10200] = true,
	[8277] = true,
	[5823] = true,
	[14491] = true,
	[4425] = true,
	[14279] = true,
	[14280] = true,
	[616] = true,
	[5349] = true,
	[5356] = true,
	[11497] = true,
	[5352] = true,
	[8300] = true,
	[8299] = true,
	[8301] = true,
	[8303] = true,
	[10077] = true,
	[8660] = true,
	[1132] = true,
	[1130] = true,
	[17144] = true,
}
---------------------------------------------------------------------------------------------------------------------------------
local options = {
    name = "Config",
    desc = "Basic settings",
	type = "group",
	order = 10,
    get = function(info) return db[info[#info]] end,
	set = function(info, value) db[info[#info]] = value end,
	args = {
		mapnote = {
            type = "toggle",
            name = L["Kartenmarkierung"],
            desc = L["Kartenmarkierung Ein/Ausschalten (Benötigt HandyNotes)."],
			order = 20,
       },
        macro = {
            type = "toggle",
            name = L["(Rare) Macro zum anwählen des Mobs"],
            desc = L["Macrogenerierung Ein/Ausschalten."],
			order = 10,
		},
        clog = {
            type = "toggle",
            name = L["Kampflog überwachen"],
            desc = L["Kampflog Überwachung Ein/Ausschalten. (Reload UI empfohlen)"],
			order = 30,
		},
        nplate = {
            type = "toggle",
            name = L["Namensplaketten überwachen"],
            desc = L["Namensplaketten Überwachung Ein/Ausschalten."],
			order = 40,
		},
        mmap = {
            type = "toggle",
            name = L["Minimap überwachen"],
            desc = L["Minimap Überwachung (bei Mouseover) Ein/Ausschalten. (Benötigt Reload UI! - Prozessoraufwändig)"],
			order = 50,
		},
        npccache = {
            type = "toggle",
            name = L["Cache Dateien überwachen"],
            desc = L["Cache Datei Überwachung Ein/Ausschalten. (Nachdem der seltene gefunden wurde muß die Cachedatei gelöscht werden um ihn nochmal finden zu können)"],
			order = 60,
		},		
        mover = {
            type = "toggle",
            name = L["Mouseover überwachen"],
            desc = L["Mouseover Überwacung Ein/Ausschalten."],
			order = 70,
		},		
		scan = {
			type = "range",
			name = L["Scan Frequenz"],
			desc = L["Wie oft nach Rare Scannen (0 deaktiviert Scannen)"],
			min = 0, 
			max = 10, 
			step = 0.1,
			order = 100,
		},
    },
}

local ausgabe_options = {
    name = "Ausgabe",
    desc = "Ausgabe Optionen",
	type = "group",
	order = 20,
    get = function(info) return db[info[#info]] end,
	set = function(info, value) db[info[#info]] = value end,
	args = {
        zeit = {
            type = "range",
            name = L["Intervall"],
            desc = L["Die Zeit zwischen Warnungen in Sek. eingeben."],
			min = 0, 
			max = 30, 
			step = 1,
			order = 100,
        },
		playsound = {
            type = "toggle",
            name = L["Warnton"],
            desc = L["Warnton Ein/Ausschalten."],
			order = 30,
       },
        showDead = {
            type = "toggle",
            name = L["Warnung bei Toten"],
            desc = L["Warnungen bei Toten Ein/Ausschalten."],
			order = 10,
        },
--        flash = {
--            type = "toggle",
--            name = L["Bildschirm blinken"],
--            desc = L["Bildschirm blinken Ein/Ausschalten."],
--			order = 40,
--		},
        stameable = {
            type = "toggle",
            name = L["Zähmbare melden"],
            desc = L["Zähmbare bei CacheScan auch melden."],
			order = 20,
		},
		town = {
            type = "toggle",
            name = L["In Städten keine Meldungen"],
            desc = L["Gibt keine Warnungen in Städten aus."],
			order = 50,
		},
        wsound = {
            type = "select",
			dialogControl = "LSM30_Sound",
            name = L["Warnton"],
            desc = L["Warnton auswählen"],
			values = AceGUIWidgetLSMlists.sound,
			order = 110,
		},
		output = ESN_Rare:GetSinkAce3OptionsDataTable(),
    },
}
ausgabe_options.args.output.inline = true
ausgabe_options.args.output.order = 200

local defaults = {
    profile =  {
		zeit = 3,
		playsound = false,
		mapnote = true,
		showDead = true,
		macro = true,
--		flash = true,
		clog = true,
		nplate = true,
		mmap = true,
		npccache = true,
		mover = false,
		stameable = true,
		town = true,
		scan = 0.5,
		wsound = "",
		sinkOptions = {}
    },
}

function ESN_Rare:OnInitialize()
    -- Called when the addon is loaded
	self.db = LibStub("AceDB-3.0"):New("ESN_RareDB", defaults)
	db = self.db.profile
	self:SetSinkStorage(self.db.profile.sinkOptions)

	local acreg = LibStub("AceConfigRegistry-3.0")
	acreg:RegisterOptionsTable("ESN_Rare", options)
	acreg:RegisterOptionsTable("ESN_Rare Ausgabe", ausgabe_options)
	
	local acdia = LibStub("AceConfigDialog-3.0")
	acdia:AddToBlizOptions("ESN_Rare", "ESN_Rare")
	acdia:AddToBlizOptions("ESN_Rare Ausgabe", "Output", "ESN_Rare")
	
	self:RegisterChatCommand("rare", "ChatCommand")
    self:RegisterChatCommand("ESN_Rare", "ChatCommand")	
end

function ESN_Rare:OnEnable()
    -- Called when the addon is enabled
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	if self.db.profile.mover then
		self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	end
	if self.db.profile.clog then 
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end
	if self.db.profile.mmap then
		GameTooltip:HookScript("OnUpdate", ESN_Rare.TT_OnShow)
	end
	if self.db.profile.scan > 0 then
		self:ScheduleRepeatingTimer("CheckNearby", self.db.profile.scan)
	end
end

function ESN_Rare:UPDATE_MOUSEOVER_UNIT()
	if not self.db.profile.mover then
		return
	end
	self:ProcessUnit("mouseover")
end

function ESN_Rare:PLAYER_TARGET_CHANGED()
	self:ProcessUnit("target")
end

function ESN_Rare:GenerateMacro(name)
	if InCombatLockdown() then return end	
	local macroIndex = GetMacroIndexByName("Rare")
	local body = "/targetexact "..name.."\n/script SetRaidTargetIcon(\"target\",8)"
	if macroIndex == 0 then
		local numglobal,numperchar = GetNumMacros()
		if numglobal < MAX_ACCOUNT_MACROS then
			CreateMacro("Rare", 44, body, nil, nil)
		else
			DEFAULT_CHAT_FRAME:AddMessage("\124TInterface\\Icons\\INV_Misc_Gem_Bloodstone_02:0\124t ESN_Rare: MAX ACCOUNT MACROS !", 1.0, 0.0, 0.0)
		end
	else	
		EditMacro(macroIndex, "Rare", 44, body, nil, nil)
	end
end

function ESN_Rare:Output(name,level,typ,dead)
	local sorry = ""
	local unittype = UnitClassification("target")
	local map = GetMapInfo()
	local text ="Rare: "..name.." ("..level..") "..sorry.." ["..typ.."]"
	
	if InCombatLockdown() and (unittype == "rare" or unittype == "rareelite") then
		--nix
	elseif self.db.profile.town and (map == "Ogrimmar" or map == "Undercity" or map == "SilvermoonCity" or map == "ShattrathCity" or map == "ThunderBluff" or map == "Dalaran" or map == "Stormwind" or map == "Ironforge" or map == "Darnassis" or map == "TheExodar") then
		--nix
	else	
		if self.ti == nil or (GetTime() - self.ti > self.db.profile.zeit) then
			self.ti = GetTime()
			if dead then
				sorry = L["ist bereits tot"]
			end	
			if (not dead or self.db.profile.showDead) then
				self:Pour(text, 0, 1, 0, nil, nil, nil, nil, nil, "Interface\\Icons\\INV_Misc_Head_Dragon_01")
			end
			if self.db.profile.playsound and (not dead or self.db.profile.showDead) then
				PlaySoundFile(SML:Fetch("sound", self.db.profile.wsound)) 
			end
--			if self.db.profile.flash and (not dead or self.db.profile.showDead) then
--				UIFrameFlash(LowHealthFrame, 0.5, 0.5, 2, false, 0.5)
--			end
			if self.db.profile.mapnote and HandyNotes and (not dead or self.db.profile.showDead) then
				HandyNotes_ESN_Rare:AddESN_RareEntry(name)
			end
			if self.db.profile.macro and (not dead or self.db.profile.showDead) then
				ESN_Rare:GenerateMacro(name)
			end
		end
	end
end

function ESN_Rare:ProcessUnit(unit)
	if UnitPlayerControlled(unit) then return end
	local unittype = UnitClassification(unit)
	if not (unittype == "rare" or unittype == "rareelite") then return end
	if not (UnitIsVisible(unit)) then return end
	local name = UnitName(unit)
	local level = UnitLevel(unit) or "??"
	local typ = unit
	local dead = UnitIsDead(unit)
	
	ESN_Rare:Output(name,level,typ,dead)
end

function ESN_Rare:TT_OnShow()
	if not db.mmap then
		return
	end
	local mouseFocus = GetMouseFocus()	
	if (mouseFocus) then
		mouseFocus = mouseFocus:GetName()
		-- Ignore non Minimap
		if mouseFocus ~= "Minimap" then
			return
		end
	end
	local name = " "
	local level = "??"
	local typ = L["Minimap"]
	local dead = nil
	
	local tooltip = GameTooltipTextLeft1:IsVisible()
	if tooltip then
		for i=1, GameTooltip:NumLines() do
			local mytext = getglobal("GameTooltipTextLeft" .. i)
			local text = mytext:GetText()
			if text then 
				for line in text:gmatch("[^\n]+") do		
					local name = line
					if line:find("|c") then
						name = line:match("|c%x%x%x%x%x%x%x%x([^|]+)|r")
					end		
					for id, rname in pairs(L["Rares"]) do
						if rname == name then
							ESN_Rare:Output(name,level,typ,dead)
							break -- it's pretty unlikely there'll be two rares on screen at once
						end
					end
				end
			end
		end
	end
end

function ESN_Rare:COMBAT_LOG_EVENT_UNFILTERED(event_name,timestamp, event,source, source_name, source_flags,dest, dest_name, dest_flags,...)
	if not self.db.profile.clog then
		return
	end
	local mobid = 0
	local name = " "
	local level = "??"
	local typ = L["Kampflog"]
	local dead = nil
	----Quelle
	if source:sub(5, 5) == "3" then
		mobid = tonumber(source:sub(9, 12), 16)
		name = source_name
		----RareID
		if L["Rares"][mobid] then
			ESN_Rare:Output(name,level,typ,dead)
		end
	end
	----Ziel
	if dest:sub(5, 5) == "3" then
		mobid = tonumber(dest:sub(9, 12), 16)
		name = dest_name
		----RareID
		if L["Rares"][mobid] then
			ESN_Rare:Output(name,level,typ,dead)
		end
	end
end

function ESN_Rare:CheckNearby()
	ESN_Rare:ScanTargets()
	if self.db.profile.nplate then
		ESN_Rare:ScanNameplates()
	end
	if self.db.profile.npccache then
		ESN_Rare:ScanCache()
	end
end

function ESN_Rare:ScanTargets()
	for _, unit in ipairs(units_to_scan) do
		self:ProcessUnit(unit)
	end
end

function ESN_Rare:process_possible_nameplate(frame)
	-- This was mostly copied from "Nameplates - Nameplate Modifications" by Biozera.
	-- Nameplates are unnamed children of WorldFrame.
	-- So: drop it if it's not the right type, has a name, or we already know about it.
	if frame:GetObjectType() ~= "Frame" or frame:GetName() or nameplates[frame] then
		return
	end
	local name, level, bar, icon, border, glow
	for i=1,frame:GetNumRegions(),1 do
		local region = select(i, frame:GetRegions())
		if region then
			local oType = region:GetObjectType()
			if oType == "FontString" then
				local point, _, relativePoint = region:GetPoint()
				if point == "BOTTOM" and relativePoint == "CENTER" then
					name = region
				elseif point == "CENTER" and relativePoint == "BOTTOMRIGHT" then
					level = region
				end
			elseif oType == "Texture" then
				local path = region:GetTexture()
				if path == "Interface\\TargetingFrame\\UI-RaidTargetingIcons" then
					icon = region
				elseif path == "Interface\\Tooltips\\Nameplate-Border" then
					border = region
				elseif path == "Interface\\Tooltips\\Nameplate-Glow" then
					glow = region
				end
			end
		end
	end
	for i=1,frame:GetNumChildren(),1 do
		local childFrame = select(i, frame:GetChildren())
		if childFrame:GetObjectType() == "StatusBar" then
			bar = childFrame
		end
	end
	if name and level and bar and border and glow then -- We have a nameplate!
		nameplates[frame] = {name = name, level = level, bar = bar, border = border, glow = glow}
		return true
	end
end

function ESN_Rare:ScanNameplates()
	if GetCVarBool("nameplateShowEnemies") ~= 1 then
		return
	end
	local typ = L["Plakette"]
	local dead = nil
	if num_worldchildren ~= WorldFrame:GetNumChildren() then
		num_worldchildren = WorldFrame:GetNumChildren()
		for i=1, num_worldchildren, 1 do
			ESN_Rare:process_possible_nameplate(select(i, WorldFrame:GetChildren()))
		end
	end	
	for nameplate, regions in pairs(nameplates) do
		if nameplate:IsVisible() then
			local platename = regions.name:GetText()
			for id, rname in pairs(L["Rares"]) do
				if rname == platename then
					ESN_Rare:Output(regions.name:GetText(),regions.level:GetText(),typ,dead)
					break -- it's pretty unlikely there'll be two rares on screen at once
				end
			end	
		end
	end
end

local function is_cached(id)
	-- this doesn't work with just clearlines and the setowner outside of this, and I'm not sure why
	cache_tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
	cache_tooltip:SetHyperlink(("unit:0xF53000%04X000000"):format(id))
	return cache_tooltip:IsShown()
end
ESN_Rare.is_cached = is_cached
ESN_Rare.already_cached = already_cached

function ESN_Rare:ScanCache()
	local name = "ScanCache"
	local level = "??"
	local typ = "CacheScan"
	local dead = nil
	if first_cachescan then
		for id, value in pairs(L["Rares"]) do
			if is_cached(id) then
				already_cached[id] = true
			end
		end
		first_cachescan = false
		return
	end
	for id, value in pairs(L["Rares"]) do
		if id and (not tameable[id] or self.db.profile.stameable) and not already_cached[id] and is_cached(id) then
			already_cached[id] = true
			ESN_Rare:Output(value,level,typ,dead)
		end
	end
	first_cachescan = false
end

function ESN_Rare:PrintCache()
	print(L["Seltene Gegner im Cache:"])
	for id, value in pairs (ESN_Rare.already_cached) do
		print (L["Rares"][id].." (ID: "..id..")")
	end
end

function ESN_Rare:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory("ESN_Rare")
    elseif input == "cache" then
		ESN_Rare:PrintCache()
	else
        LibStub("AceConfigCmd-3.0").HandleCommand(ESN_Rare, "rare", "ESN_Rare", input)
    end
end
