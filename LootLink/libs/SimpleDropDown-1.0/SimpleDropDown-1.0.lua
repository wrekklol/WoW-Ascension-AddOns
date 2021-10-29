--[[

	SimpleDropDown-1.0: a very basic replacement for UIDropDownMenu
		Copyright 2010 by Telo
		All Rights Reserved except that you are granted a license to include
			and use this library in any World of Warcraft AddOn provided that
			you do not alter the code in any way.
			
	- Implements a very simple DropDown menu system as a replacement for
		UIDropDownMenu for the most basic use cases
	- The motivation for creating this library was to avoid taint issues that
		might arise from using the built-in system
	
]]

assert(LibStub, "SimpleDropDown-1.0 requires LibStub");

local lib = LibStub:NewLibrary("SimpleDropDown-1.0", 0);
if( not lib ) then
	return;
end

function lib:Initialize(dropdown, initialize)
	self:CreateFrames();
	local menu = self.menu;

	menu:Hide();	
	menu.maxWidth = 0;
	menu.numButtons = 0;

	if( initialize ) then
		dropdown.initialize = initialize;
	end
	if( dropdown.initialize ) then
		self.dropdown = dropdown;
		-- Call the provided initialization function, which should use AddButton to add entries
		dropdown.initialize(menu);
	end
end

function lib:ToggleMenu(dropdown)
	self:CreateFrames();
	local menu = self.menu;
	
	if( menu:IsShown() and self.dropdown == dropdown ) then
		menu:Hide();
	else
		local point = dropdown.point or "TOPLEFT";
		local relativeTo = dropdown.relativeTo or dropdown:GetName().."Left";
		local relativePoint = dropdown.relativePoint or "BOTTOMLEFT";
		local xOffset = dropdown.xOffset or 8;
		local yOffset = dropdown.yOffset or 22;
		
		menu:ClearAllPoints();
		menu:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset);
		
		self:Initialize(dropdown);
		self:UpdateDropdownText(dropdown);
		
		if( menu.numButtons > 0 ) then
			-- Hide any unused buttons
			local index;
			local startIndex = menu.numButtons + 1;
			local maxIndex = #menu.menuButtons;
			for index = startIndex, maxIndex do
				menu.menuButtons[index]:Hide();
			end
			
			menu:Show();
		else
			menu:Hide();
		end
	end
end

function lib:CloseMenu()
	if( self.menu ) then
		self.menu:Hide();
	end
end

function lib:AddButton(info)
	local index = (self.menu and self.menu.numButtons or 0) + 1;
	
	self:CreateFrames(index);
	local menu = self.menu;

	menu.numButtons = index;
	menu:SetHeight(index * 16 + 30);
	
	local button = menu.menuButtons[index];
	local buttonName = button:GetName();
	local normalText = _G[buttonName.."NormalText"];
	local check = _G[buttonName.."Check"];
	
	local width = 40;
	
	if( info.text ) then
		if( info.colorCode ) then
			button:SetText(info.colorCode..info.text.."|r");
		else
			button:SetText(info.text);
		end
		width = width + normalText:GetWidth();
	else
		button:SetText("");
	end
	
	if( width > menu.maxWidth ) then
		menu.maxWidth = width;
	end
	
	button.text = info.text;
	button.func = info.func;
	button.arg1 = info.arg1;
	button.arg2 = info.arg2;
	button.tooltipTitle = info.tooltipTitle;
	button.tooltipText = info.tooltipText;
	button.value = info.value or info.text;
	
	if( self:GetSelectedName(self.dropdown) ) then
		button.checked = self:GetSelectedName(self.dropdown) == info.text;
	elseif( self:GetSelectedID(self.dropdown) ) then
		button.checked = self:GetSelectedID(self.dropdown) == index;
	elseif( self:GetSelectedValue(self.dropdown) ) then
		button.checked = self:GetSelectedValue(self.dropdown) == button.value;
	end
	
	if( button.checked ) then
		check:Show();
	else
		check:Hide();
	end
	
	button:SetPoint("TOPLEFT", menu, "TOPLEFT", 17, -((index - 1) * 16 + 15));
	button:Show();
end

function lib:GetSelectedName(dropdown)
	return dropdown.selectedName;
end

function lib:SetSelectedName(dropdown, name)
	dropdown.selectedName = name;
	dropdown.selectedID = nil;
	dropdown.selectedValue = nil;
	self:RefreshMenu(dropdown);
end

function lib:GetSelectedID(dropdown)
	if( dropdown.selectedID ) then
		return dropdown.selectedID;
	elseif( self.menu ) then
		local index, button;
		for index, button in ipairs(self.menu.menuButtons) do
			if( self:GetSelectedName(dropdown) ) then
				if( self:GetSelectedName(dropdown) == button.text ) then
					return index;
				end
			elseif( self:GetSelectedValue(dropdown) ) then
				if( self:GetSelectedValue(dropdown) == button.value ) then
					return index;
				end
			end
		end
	end
	return nil;
end

function lib:SetSelectedID(dropdown, id)
	dropdown.selectedName = nil;
	dropdown.selectedID = id;
	dropdown.selectedValue = nil;
	self:RefreshMenu(dropdown);
end

function lib:GetSelectedValue(dropdown)
	return dropdown.selectedValue;
end

function lib:SetSelectedValue(dropdown, value)
	dropdown.selectedName = nil;
	dropdown.selectedID = nil;
	dropdown.selectedValue = value;
	self:RefreshMenu(dropdown);
end

function lib:UpdateDropdownText(dropdown)
	if( self.menu ) then
		local text = _G[dropdown:GetName().."Text"];
		local id = self:GetSelectedID(dropdown);
		if( id and id > 0 and id <= self.menu.numButtons) then
			local button = self.menu.menuButtons[id];
			text:SetText(button:GetText());
		end
	end
end

function lib:RefreshMenu(dropdown)
	if( self.menu ) then
		local index, button;
		for index, button in ipairs(self.menu.menuButtons) do
			if( index < self.menu.numButtons ) then
				local checked;
				if( self:GetSelectedName(dropdown) ) then
					checked = self:GetSelectedName(dropdown) == button.text;
				elseif( self:GetSelectedID(dropdown) ) then
					checked = self:GetSelectedID(dropdown) == index;
				elseif( self:GetSelectedValue(dropdown) ) then
					checked = self:GetSelectedValue(dropdown) == button.value;
				end

				local check = _G[button:GetName().."Check"];
				if( checked ) then
					check:Show();
				else
					check:Hide();
				end
			end
		end
		
		self:UpdateDropdownText(dropdown);
	end
end

function lib:SetWidth(dropdown, width, padding)
	local dropdownName = dropdown:GetName();
	
	_G[dropdownName.."Middle"]:SetWidth(width);
	if( padding ) then
		dropdown:SetWidth(width + padding);
		_G[dropdownName.."Text"]:SetWidth(width);
	else
		dropdown:SetWidth(width + 50);
		_G[dropdownName.."Text"]:SetWidth(width - 25);
	end
end

function lib:JustifyText(dropdown, justify)
	local text = _G[dropdown:GetName().."Text"];
	text:ClearAllPoints();
	if( justify == "LEFT" ) then
		text:SetPoint("LEFT", dropdown:GetName().."Left", "LEFT", 27, 2);
	elseif( justify == "RIGHT" ) then
		text:SetPoint("RIGHT", dropdown:GetName().."Right", "RIGHT", -43, 2);
	elseif( justify == "CENTER" ) then
		text:SetPoint("CENTER", dropdown:GetName().."Middle", "CENTER", -5, 2);
	end
	text:SetJustifyH(justify);
end

function lib:CreateFrames(numButtons)
	if( not self.menu ) then
		self.menu = CreateFrame("BUTTON", nil, UIParent, "SimpleDropDownMenuTemplate");
		local menu = self.menu;
		menu.maxWidth = 0;
		menu.menuButtons = { };
		menu:SetScript("OnClick", function(self) self:Hide(); end);
		menu:SetScript("OnEnter", function(self) self.timer = nil; end);
		menu:SetScript("OnLeave", function(self) self.timer = 2; end);
		menu:SetScript("OnUpdate",
			function(self, elapsed)
				if( self.timer ) then
					self.timer = self.timer - elapsed;
					if( self.timer < 0 ) then
						self:Hide();
						self.timer = nil;
					end
				end
			end);
		menu:SetScript("OnShow",
			function(self)
				local index, button;
				for index, button in ipairs(self.menuButtons) do
					button:SetWidth(self.maxWidth);
				end
				self:SetWidth(self.maxWidth + 25);
				self.timer = nil;
			end);
	end
	
	while( numButtons and numButtons > #self.menu.menuButtons ) do
		local index = #self.menu.menuButtons + 1;
		local button = CreateFrame("BUTTON", "SimpleDropDownMenuButton"..index, self.menu, "SimpleDropDownMenuButtonTemplate");
		button:SetID(index);
		button:SetScript("OnLoad", function(self) self:SetFrameLevel(2); end);
		button:SetScript("OnClick",
			function(self, button, down)
				self:GetParent():Hide();
				if( self.func ) then
					self.func(self, self.arg1, self.arg2, self.checked);
					PlaySound("UChatScrollButton");
				end
			end);
		button:SetScript("OnEnter",
			function(self, motion)
				self:GetParent().timer = nil;
				if( self.tooltipTitle or self.tooltipText ) then
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
					if( self.tooltipTitle ) then
						GameTooltip:AddLine(self.tooltipTitle, 1.0, 1.0, 1.0);
					end
					if( self.tooltipText ) then
						GameTooltip:AddLine(self.tooltipText);
					end
					GameTooltip:Show();
				end
			end);
		button:SetScript("OnLeave",
			function(self)
				self:GetParent().timer = 2;
				GameTooltip:Hide();
			end);
		
		tinsert(self.menu.menuButtons, button);
	end
end
