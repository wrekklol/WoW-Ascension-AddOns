-- Setup some locals
local UnitFramesImproved_PlayerFrame_IsMoving = false;

-- Debug function. Adds message to the chatbox (only visible to the loacl player)
function dout(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end

function tokenize(str)
	local tbl = {};
	for v in string.gmatch(str, "[^ ]+") do
		tinsert(tbl, v);
	end
	return tbl;
end

-- Create the addon main instance
local UnitFramesImproved = CreateFrame('Button', 'UnitFramesImproved');

-- Event listener to make sure we enable the addon at the right time
function UnitFramesImproved:PLAYER_ENTERING_WORLD()
	EnableUnitFramesImproved();
end

-- Event listener to make sure we've loaded our settings and thta we apply them
function UnitFramesImproved:VARIABLES_LOADED()
	dout("UnitFramesImproved settings loaded!");
	
	-- Set some default settings
	if (characterSettings == nil) then
		UnitFramesImproved_LoadDefaultSettings();
	end
	
	if (characterSettings["PlayerFrameX"] == nil) then
		UnitFramesImproved_LoadDefaultSettings();
	end
	
	UnitFramesImproved_ApplySettings(characterSettings);
end

function UnitFramesImproved_ApplySettings(settings)
	UnitFramesImproved_SetFrameScale(settings["FrameScale"])
end

function UnitFramesImproved_LoadDefaultSettings()
	characterSettings = {}
	characterSettings["FrameScale"] = "1.0";
	characterSettings["PlayerFrameX"] = 0;
	characterSettings["PlayerFrameY"] = 0;
	characterSettings["PlayerFrameMoved"] = false;
	characterSettings["PlayerFrameAnchor"] = "TOPLEFT";
end

function EnableUnitFramesImproved()
	-- Generic status text hook
	hooksecurefunc("TextStatusBar_UpdateTextString", UnitFramesImproved_TextStatusBar_UpdateTextString);
	
	-- Hook PlayerFrame functions
	hooksecurefunc("PlayerFrame_ToPlayerArt", UnitFramesImproved_PlayerFrame_ToPlayerArt);
	hooksecurefunc("PlayerFrame_ToVehicleArt", UnitFramesImproved_PlayerFrame_ToVehicleArt);
	PlayerFrame:SetScript("OnMouseDown", UnitFramesImproved_PlayerFrame_OnMouseDown);
	PlayerFrame:SetScript("OnMouseUp", UnitFramesImproved_PlayerFrame_OnMouseUp);
	
	-- Hook TargetFrame functions
	hooksecurefunc("TargetFrame_Update", UnitFramesImproved_TargetFrame_Update);
	hooksecurefunc("TargetFrame_CheckFaction", UnitFramesImproved_TargetFrame_CheckFaction);
	hooksecurefunc("TargetFrame_CheckClassification", UnitFramesImproved_TargetFrame_CheckClassification);
	
	-- BossFrame hooks
	--hooksecurefunc("BossTargetFrame_OnLoad", UnitFramesImproved_BossTargetFrame_OnLoad);
	hooksecurefunc(Boss1TargetFrame, "Show", UnitFramesImproved_BossTargetFrame_Show);
	hooksecurefunc(Boss2TargetFrame, "Show", UnitFramesImproved_BossTargetFrame_Show);
	hooksecurefunc(Boss3TargetFrame, "Show", UnitFramesImproved_BossTargetFrame_Show);
	
	-- FocusFrame hooks
	hooksecurefunc("FocusFrame_SetSmallSize", UnitFramesImproved_FocusFrame_SetSmallSize);
	hooksecurefunc(FocusFrame, "Show", UnitFramesImproved_FocusFrame_Show);

	-- For debug
	--hooksecurefunc(FocusFrame.borderTexture, "SetTexture", print);
	PlayerFrameHealthBar.capNumericDisplay = true;
	
	-- Setup relative layout for targetframe compared to PlayerFrame
	TargetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPRIGHT", 36, 0);
	
	-- Set up some stylings
	UnitFramesImproved_Style_PlayerFrame();
	
	PlayerFrameHealthBar.lockColor = true;
end

function UnitFramesImproved_Style_PlayerFrame()
	PlayerFrameHealthBar:SetWidth(119);
	PlayerFrameHealthBar:SetHeight(29);
	PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-22);
	PlayerFrameHealthBarText:SetPoint("CENTER",50,6);
	PlayerFrameTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
	PlayerStatusTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-Player-Status");
	PlayerFrameHealthBar:SetStatusBarColor(UnitColor("player"));
	PlayerFrameManaBar:SetPoint("TOPLEFT", 106, -52)
	PlayerFrameManaBarText:SetPoint("CENTER", 42, -8)
	PlayerFrameEnergyBar:Hide()
	PlayerFrameEnergyBarText:Hide()
	PlayerFrameRageBar:Hide()
	PlayerFrameRageBarText:Hide()
	UnitFramePortrait_Update(PlayerFrame)
end

function UnitFramesImproved_SetFrameScale(scale)
	PlayerFrame:SetScale(scale);
	TargetFrame:SetScale(scale);
	FocusFrame:SetScale(scale);
	Boss1TargetFrame:SetScale(scale*0.9);
	Boss2TargetFrame:SetScale(scale*0.9);
	Boss3TargetFrame:SetScale(scale*0.9);
	
	characterSettings["FrameScale"] = scale;
end

-- Slashcommand stuff
SLASH_UNITFRAMESIMPROVED1 = "/unitframesimproved";
SLASH_UNITFRAMESIMPROVED2 = "/ufi";
SlashCmdList["UNITFRAMESIMPROVED"] = function(msg, editBox)
	local tokens = tokenize(msg);
	if(table.getn(tokens) > 0 and strlower(tokens[1]) == "reset") then
		StaticPopup_Show("LAYOUT_RESET");
	elseif(table.getn(tokens) > 0 and strlower(tokens[1]) == "settings") then
		InterfaceOptionsFrame_OpenToCategory(UnitFramesImproved.panelSettings);
	elseif(table.getn(tokens) > 0 and strlower(tokens[1]) == "scale") then
		if(table.getn(tokens) > 1) then
			UnitFramesImproved_SetFrameScale(tokens[2]);
		else
			dout("Please supply a number, between 0.0 and 10.0 as the second parameter.");
		end
	else
		dout("Valid commands for UnitFramesImproved are:")
		dout("    help    (shows this message)");
		dout("    scale # (scales the layout of the player frames)");
		dout("    reset   (resets the layout of the player frames)");
		dout("");
		dout("To move the player and target, hold SHIFT and ALT while dragging the player frame around.");
		dout("The target frame is linked to the player frame and cannot be separated.");
	end
end

-- Setup the static popup dialog for resetting the UI
StaticPopupDialogs["LAYOUT_RESET"] = {
	text = "Are you sure you want to reset your layout?\nThis will automatically reload the UI.",
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		PlayerFrame:SetUserPlaced(false);
		UnitFramesImproved_LoadDefaultSettings();
		ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

-- Setup the static popup dialog for accepting the UI
StaticPopupDialogs["LAYOUT_ACCEPT"] = {
	text = "Are you sure you want to accept this layout?\nIf you choose to not accept it, your UI will have to be reloaded.\n\nYou can reset your layout later as well. Please visit the UnitFramesImproved addon page on curse.com for more information.",
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		PlayerFrame:SetUserPlaced(true);
		point, relativeTo, relativePoint, xOffset, yOffset = PlayerFrame:GetPoint(1);
		characterSettings["PlayerFrameMoved"] = true;
		characterSettings["PlayerFrameAnchor"] = point;
		characterSettings["PlayerFrameX"] = xOffset;
		characterSettings["PlayerFrameY"] = yOffset;
	end,
	OnCancel = function()
		PlayerFrame:SetUserPlaced(false);
		ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

-- Overloaded functions from Blizzard Unitframes Code
function UnitFramesImproved_PlayerFrame_OnMouseDown()
	if(IsShiftKeyDown() and IsAltKeyDown()) then
		UnitFramesImproved_PlayerFrame_IsMoving = true;
		PlayerFrame:SetUserPlaced(true);
		PlayerFrame:StartMoving();
	end
end

function UnitFramesImproved_PlayerFrame_OnMouseUp()
	if(UnitFramesImproved_PlayerFrame_IsMoving == true) then
		UnitFramesImproved_PlayerFrame_IsMoving = false;
		PlayerFrame:StopMovingOrSizing();
		StaticPopup_Show("LAYOUT_ACCEPT");
	end
end

function UnitFramesImproved_TextStatusBar_UpdateTextString(textStatusBar)
	local textString = textStatusBar.TextString;
	if(textString) then
		local value = textStatusBar:GetValue();
		local valueMin, valueMax = textStatusBar:GetMinMaxValues();

		if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( textStatusBar.pauseUpdates ) ) then
			textStatusBar:Show();
			if ( value and valueMax > 0 and ( GetCVarBool("statusTextPercentage") or textStatusBar.showPercentage ) and not textStatusBar.showNumeric) then
				if ( value == 0 and textStatusBar.zeroText ) then
					textString:SetText(textStatusBar.zeroText);
					textStatusBar.isZero = 1;
					textString:Show();
					return;
				end
				value = tostring(math.ceil((value / valueMax) * 100)) .. "%";
				if ( textStatusBar.prefix and (textStatusBar.alwaysPrefix or not (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) ) ) then
					textString:SetText(textStatusBar.prefix.." "..UnitFramesImproved_CapDisplayOfNumericValue(textStatusBar:GetValue()).." ("..value..")");
				else
					textString:SetText(UnitFramesImproved_CapDisplayOfNumericValue(textStatusBar:GetValue()).." ("..value..")");
				end
			elseif ( value == 0 and textStatusBar.zeroText ) then
				textString:SetText(textStatusBar.zeroText);
				textStatusBar.isZero = 1;
				textString:Show();
				return;
			else
				textStatusBar.isZero = nil;
				--local percent = tostring(math.ceil((value / valueMax) * 100)) .. "%";
				if ( textStatusBar.capNumericDisplay ) then
					value = UnitFramesImproved_CapDisplayOfNumericValue(value);
					valueMax = UnitFramesImproved_CapDisplayOfNumericValue(valueMax);
				end
				if ( textStatusBar.prefix and (textStatusBar.alwaysPrefix or not (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) ) ) then
					textString:SetText(textStatusBar.prefix.." "..value.."/"..valueMax);
				else
					textString:SetText(value.."/"..valueMax);
				end
			end
			
			if ( (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) or textStatusBar.forceShow ) then
				textString:Show();
			elseif ( textStatusBar.lockShow > 0 and (not textStatusBar.forceHideText) ) then
				textString:Show();
			else
				textString:Hide();
			end
		else
			textString:Hide();
			textString:SetText("");
			if ( not textStatusBar.alwaysShow ) then
				textStatusBar:Hide();
			else
				textStatusBar:SetValue(0);
			end
		end
	end
end

function UnitFramesImproved_PlayerFrame_ToPlayerArt(self)
	UnitFramesImproved_Style_PlayerFrame();
end

function UnitFramesImproved_PlayerFrame_ToVehicleArt(self)
	PlayerFrameHealthBar:SetHeight(12);
	PlayerFrameHealthBarText:SetPoint("CENTER",50,3);
end

function UnitFramesImproved_TargetFrame_Update(self)
	local thisName = self:GetName();
	
	-- Layout elements
	self.healthbar.lockColor = true
	self.healthbar:SetWidth(119);
	self.healthbar:SetHeight(29);
	self.healthbar:SetPoint("TOPRIGHT",-109, -22);
	self.manabar:SetPoint("TOPRIGHT",-109, -52)
	self.energybar:Hide()
	self.ragebar:Hide()
	self.ragebar.TextString:Hide()
	self.energybar.TextString:Hide()
	_G[thisName.."TextureFrameHealthBarText"]:SetPoint("CENTER",-50,6);
	self.deadText:SetPoint("CENTER",-50,6);
	self.nameBackground:Hide();
	
	-- Set back color of health bar
	if ( not UnitPlayerControlled(self.unit) and UnitIsTapped(self.unit) and not UnitIsTappedByPlayer(self.unit) and not UnitIsTappedByAllThreatList(self.unit) ) then
		-- Gray if npc is tapped by other player
		self.healthbar:SetStatusBarColor(0.5, 0.5, 0.5);
	else
		-- Standard by class etc if not
		self.healthbar:SetStatusBarColor(UnitColor(self.healthbar.unit));
	end
	UnitFramePortrait_Update(self)
end

function UnitFramesImproved_TargetFrame_CheckClassification(self, forceNormalTexture)
	local texture;
	local classification = UnitClassification(self.unit);
	if ( classification == "worldboss" or classification == "elite" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Elite";
	elseif ( classification == "rareelite" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Rare-Elite";
	elseif ( classification == "rare" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Rare";
	end
	if ( texture and not forceNormalTexture) then
		self.borderTexture:SetTexture(texture);
	else
		self.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
	end
end

function UnitFramesImproved_TargetFrame_CheckFaction(self)
	local factionGroup = UnitFactionGroup(self.unit);
	if ( UnitIsPVPFreeForAll(self.unit) ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
		self.pvpIcon:Show();
	elseif ( factionGroup and UnitIsPVP(self.unit) and UnitIsEnemy("player", self.unit) ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
		self.pvpIcon:Show();
	elseif ( factionGroup ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
		self.pvpIcon:Show();
	else
		self.pvpIcon:Hide();
	end
	
	-- Set back color of health bar
	if ( not UnitPlayerControlled(self.unit) and UnitIsTapped(self.unit) and not UnitIsTappedByPlayer(self.unit) and not UnitIsTappedByAllThreatList(self.unit) ) then
		-- Gray if npc is tapped by other player
		self.healthbar:SetStatusBarColor(0.5, 0.5, 0.5);
	else
		-- Standard by class etc if not
		self.healthbar:SetStatusBarColor(UnitColor(self.healthbar.unit));
	end
end

function UnitFramesImproved_BossTargetFrame_Show(self)
	self.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-UnitFrame-Boss");
	
	if (not (characterSettings["FrameScale"] == nil)) then
		self:SetScale(characterSettings["FrameScale"] * 0.9);
	end
end

function UnitFramesImproved_FocusFrame_Show(self)
	if (not FocusFrame.smallSize) then
		FocusFrame.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-FocusTargetingFrame");
	elseif (FocusFrame.smallSize) then
		FocusFrame.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
	end
end

function UnitFramesImproved_FocusFrame_SetSmallSize(smallSize, onChange)
	if (smallSize and not FocusFrame.smallSize) then
		FocusFrame.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-FocusTargetingFrame");
	elseif (not smallSize and FocusFrame.smallSize) then
		FocusFrame.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
	end
end

-- Utility functions
function UnitColor(unit)
	local r, g, b;
	if ( ( not UnitIsPlayer(unit) ) and ( ( not UnitIsConnected(unit) ) or ( UnitIsDeadOrGhost(unit) ) ) ) then
		--Color it gray
		r, g, b = 0.5, 0.5, 0.5;
	elseif ( UnitIsPlayer(unit) ) then
		--Try to color it by class.
		local localizedClass, englishClass = UnitClass(unit);
		local classColor = RAID_CLASS_COLORS[englishClass];
		if ( classColor ) then
			r, g, b = classColor.r, classColor.g, classColor.b;
		else
			if ( UnitIsFriend("player", unit) ) then
				r, g, b = 0.0, 1.0, 0.0;
			else
				r, g, b = 1.0, 0.0, 0.0;
			end
		end
	else
		r, g, b = UnitSelectionColor(unit);
	end
	
	return r, g, b;
end

function UnitFramesImproved_CapDisplayOfNumericValue(value)
	local strLen = strlen(value);
	local retString = value;
	if (true) then
		if ( strLen >= 10 ) then
			retString = string.sub(value, 1, -10).."."..string.sub(value, -9, -9).."G";
		elseif ( strLen >= 7 ) then
			retString = string.sub(value, 1, -7).."."..string.sub(value, -6, -6).."M";
		elseif ( strLen >= 4 ) then
			retString = string.sub(value, 1, -4).."."..string.sub(value, -3, -3).."k";
		end
	else
		if ( strLen >= 10 ) then
			retString = string.sub(value, 1, -10).."G";
		elseif ( strLen >= 7 ) then
			retString = string.sub(value, 1, -7).."M";
		elseif ( strLen >= 4 ) then
			retString = string.sub(value, 1, -4).."k";
		end
	end
	return retString;
end

-- Bootstrap
function UnitFramesImproved_StartUp(self)
	self:SetScript('OnEvent', function(self, event) self[event](self) end);
	self:RegisterEvent('PLAYER_ENTERING_WORLD');
	self:RegisterEvent('VARIABLES_LOADED');
end

UnitFramesImproved_StartUp(UnitFramesImproved);
