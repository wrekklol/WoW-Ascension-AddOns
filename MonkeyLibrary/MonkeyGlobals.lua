
-- turn on or off debugging
MONKEYLIB_DEBUG				= false;


-- change the error window so we can actually READ the error
if (MONKEYLIB_DEBUG) then

	-- Another Blizzard hack, I just can't see errors without this
	ScriptErrors:SetWidth(600);
	ScriptErrors_Message:SetWidth(580);
	ScriptErrors:SetPoint("BOTTOM", "UIParent", "BOTTOM", 0, 100);
	ScriptErrors:SetPoint("TOP", "UIParent", "BOTTOM", 0, 220);
end


-- global "constants"
MONKEYLIB_VERSION			= "2.9.8";
--MONKEYLIB_TITLE_COLOUR		= { r = 1.0, g = 0.5, b = 0 };
MONKEYLIB_TITLE_COLOUR		= { r = 0.12, g = 0.55, b = 0.76 };