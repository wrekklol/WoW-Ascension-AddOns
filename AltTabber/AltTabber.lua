--[[

****************************************************************************************
Alt-Tabber

File date: 2009-12-27T05:12:21Z 
Project version: v1.6-2-gb054bc3

Author: Ackis

****************************************************************************************

]]

local MODNAME	= "AltTabber"

AltTabber		= LibStub("AceAddon-3.0"):NewAddon(MODNAME, "AceConsole-3.0", "AceEvent-3.0")

local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local AL3		= LibStub("AceLocale-3.0")

local L = AL3:GetLocale(MODNAME, false)

local GetCVar = GetCVar
local SetCVar = SetCVar
local PlaySoundFile = PlaySoundFile

function addon:OnInitialize()

	if LibStub:GetLibrary("LibAboutPanel", true) then
		LibStub("LibAboutPanel").new(nil, MODNAME)
	else
		self:Print("Lib AboutPanel not loaded.")
	end

end
-- http://www.wowwiki.com/index.php?title=API_PlaySoundFile&oldid=1805695

-- http://www.wowwiki.com/PlaySoundFile_macros
function addon:OnEnable()

	self:RegisterEvent("READY_CHECK")
	self:RegisterEvent("LFG_PROPOSAL_SHOW")

	-- If the Battlefield Entry doesn't have an onshow, create one.
	if (not StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow) then
		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow = function()
			PlaySoundFile("Sound\\Spells\\PVPEnterQueue.wav")
		end
	end

end

function addon:READY_CHECK()

	local Sound_EnableSFX = GetCVar("Sound_EnableSFX")
	local Sound_EnableAllSound = GetCVar("Sound_EnableAllSound")

	-- Abuses a bug? in that PlaySoundFile will still play
	-- If sound is off, we want to play the readycheck
	if (Sound_EnableSFX == "0") then
		-- If background sound is on, we can't do anything
		if (GetCVar("Sound_EnableSoundWhenGameIsInBG") == "0") then
			self:Print(L["BGSNDON"])
			SetCVar("Sound_EnableSoundWhenGameIsInBG", "1")
		-- If the entire sound processing is off, we can't deal with it
		elseif (Sound_EnableAllSound == "0") then
			self:Print(L["ENABLESOUNDSYSTEM"])
			SetCVar("Sound_EnableAllSound","1")
			-- Disable all the other types of sounds
			SetCVar("Sound_EnableSFX","0")
			SetCVar("Sound_EnableAmbience","0")
			SetCVar("Sound_EnableMusic","0")
		-- We just have sound off so we can play it
		else
			PlaySoundFile("Sound\\interface\\ReadyCheck.wav")
		end
	end

end

function addon:LFG_PROPOSAL_SHOW()

	-- Hack, lets just call the ready check code so that we still play some sound
	self:READY_CHECK()

end