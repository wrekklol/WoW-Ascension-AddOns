local MODNAME	= "AltTabber"

local AL3		= LibStub("AceLocale-3.0")

-- Localization
-- enUS stuff
local L = AL3:NewLocale(MODNAME, "enUS", true)

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."

	if GetLocale() == "enUS" or GetLocale() == "enGB" then return end
end

-- deDE stuff
local L = AL3:NewLocale(MODNAME, "deDE")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- frFR stuff
local L = AL3:NewLocale(MODNAME, "frFR")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- zhCN stuff
local L = AL3:NewLocale(MODNAME, "zhCN")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- zhTW stuff
local L = AL3:NewLocale(MODNAME, "zhTW")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- koKR stuff
local L = AL3:NewLocale(MODNAME, "koKR")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- esES stuff
local L = AL3:NewLocale(MODNAME, "esES")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end

-- esMX stuff
local L = AL3:NewLocale(MODNAME, "esMX")

if L then
	L["BGSNDON"] = "Enabling sound in background so you can hear ready checks while alt-tabbed."
	L["ENABLESOUNDSYSTEM"] = "Sound system is not enabled.  Sound system must be enabled to hear sounds.  Enabling sound system (should not notice a difference in sounds that are played)."
	return
end
