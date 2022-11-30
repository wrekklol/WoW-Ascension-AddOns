local anchorFrameName = "EA_Anchor_Frame";

function EventAlert_CreateFrames()
	EventAlert_CreateAnchorFrame()
	EventAlert_CreateAnchorFrame2()
	EventAlert_CreateAnchorFrame3()

	EventAlert_CreatePrimaryAlertFrames()
	EventAlert_CreateAlternateAlertFrames()
	EventAlert_CreateOtherAlertFrames()

	EventAlert_CreateClassAlertMenuButtons()
	EventAlert_CreateAlternateAlertMenuButtons()
end

-- Create anchor frames used for mod customization.
function EventAlert_CreateAnchorFrame()
	if (EA_Config.AllowESC == true) then
		tinsert(UISpecialFrames,anchorFrameName);
	end
	
	local eaaf = CreateFrame("FRAME", anchorFrameName, UIParent);

	eaaf:SetFrameStrata("DIALOG");
	eaaf:ClearAllPoints();
	eaaf:SetPoint(EA_Position.Anchor, UIParent, EA_Position.xLoc, EA_Position.yLoc);

	eaaf.spellName = eaaf:CreateFontString(anchorFrameName.."_Name","OVERLAY");
	eaaf.spellName:SetFontObject(ChatFontNormal);
	eaaf.spellName:SetPoint("BOTTOM", 0, -15);

	eaaf.spellTimer = eaaf:CreateFontString(anchorFrameName.."_Timer","OVERLAY");
	eaaf.spellTimer:SetFontObject(ChatFontNormal);
	eaaf.spellTimer:SetPoint("TOP", 0, 20);
	
	eaaf.spellCounter = eaaf:CreateFontString(anchorFrameName.."_Counter","OVERLAY");
	eaaf.spellCounter:SetFontObject(ChatFontNormal);
	eaaf.spellCounter:SetPoint("RIGHT", 20, 0);

	eaaf:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

	eaaf:SetMovable(true)
	eaaf:EnableMouse(true)
	eaaf:SetScript("OnMouseDown",function()
		if (EA_Config.LockFrame == true) then
			DEFAULT_CHAT_FRAME:AddMessage("EventAlert: You must unlock the alert frame in order to move it or reset it's position.")
		else
			eaaf:StartMoving();
		end
	end)
	eaaf:SetScript("OnMouseUp",function()
		eaaf:StopMovingOrSizing();

		local EA_point, _, EA_relativePoint, EA_xOfs, EA_yOfs = EA_Anchor_Frame:GetPoint();

		EA_Position.Anchor = EA_point;
		EA_Position.relativePoint = EA_relativePoint;
		EA_Position.xLoc = EA_xOfs;
		EA_Position.yLoc = EA_yOfs;
	end)
end

function EventAlert_CreateAnchorFrame2()
	local eaaf2 = CreateFrame("FRAME", anchorFrameName.."2", UIParent);
	eaaf2:SetFrameStrata("DIALOG");
	eaaf2:ClearAllPoints();
	eaaf2:SetPoint("CENTER", EA_Anchor_Frame, 100+EA_Position.xOffset, 0+EA_Position.yOffset);
	eaaf2:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

	eaaf2.spellName = eaaf2:CreateFontString(anchorFrameName.."2_Name","OVERLAY");
	eaaf2.spellName:SetFontObject(ChatFontNormal);
	eaaf2.spellName:SetPoint("BOTTOM", 0, -15);

	eaaf2.spellTimer = eaaf2:CreateFontString(anchorFrameName.."2_Timer","OVERLAY");
	eaaf2.spellTimer:SetFontObject(ChatFontNormal);
	eaaf2.spellTimer:SetPoint("TOP", 0, 20);
	
	eaaf2.spellCounter = eaaf2:CreateFontString(anchorFrameName.."2_Counter","OVERLAY");
	eaaf2.spellCounter:SetFontObject(ChatFontNormal);
	eaaf2.spellCounter:SetPoint("RIGHT", 20, 0);
end

function EventAlert_CreateAnchorFrame3()
	local eaaf3 = CreateFrame("FRAME", anchorFrameName.."3", UIParent);
	eaaf3:SetFrameStrata("DIALOG");
	eaaf3:ClearAllPoints();
	eaaf3:SetPoint("CENTER", EA_Anchor_Frame2, 100+EA_Position.xOffset, 0+EA_Position.yOffset);
	eaaf3:SetBackdrop({bgFile = "Interface/Icons/Spell_Nature_Polymorph_Cow"});

	eaaf3.spellName = eaaf3:CreateFontString(anchorFrameName.."3_Name","OVERLAY");
	eaaf3.spellName:SetFontObject(ChatFontNormal);
	eaaf3.spellName:SetPoint("BOTTOM", 0, -15);

	eaaf3.spellTimer = eaaf3:CreateFontString(anchorFrameName.."3_Timer","OVERLAY");
	eaaf3.spellTimer:SetFontObject(ChatFontNormal);
	eaaf3.spellTimer:SetPoint("TOP", 0, 20);
	
	eaaf3.spellCounter = eaaf3:CreateFontString(anchorFrameName.."3_Counter","OVERLAY");
	eaaf3.spellCounter:SetFontObject(ChatFontNormal);
	eaaf3.spellCounter:SetPoint("RIGHT", 20, 0);
end

-- Create primary alert frames
function EventAlert_CreatePrimaryAlertFrames()
	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
    end
end

-- Create alternate alert frames
function EventAlert_CreateAlternateAlertFrames()
	for index,value in pairs(EA_AltItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
    end
end

-- Create other alert frames. (Mostly trinket procs)
function EventAlert_CreateOtherAlertFrames()
	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
    end
end

-- Create Class Alert menu buttons, etc
function EventAlert_CreateClassAlertMenuButtons()
	local offsetIncrementX = 200
	local offsetIncrementY = 20
	
	local buttonOffsetX = 20
	local buttonOffsetY = 0

	for index,value in pairs(EA_Items) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

		if buttonOffsetY ~= 0 and buttonOffsetY % 640 == 0 then
			buttonOffsetY = 0
			buttonOffsetX = buttonOffsetX + offsetIncrementX
		end
		
		buttonOffsetY = buttonOffsetY - offsetIncrementY

    	local EA_name, EA_rank = GetSpellInfo(index);

        local ClassEventCheckButton = CreateFrame("CheckButton", index, Class_Events_Frame, "OptionsCheckButtonTemplate");
		ClassEventCheckButton:SetPoint("TOPLEFT", buttonOffsetX, buttonOffsetY);

        if (EA_rank == "") then
            getglobal(ClassEventCheckButton:GetName().."Text"):SetText(EA_name.."   ["..index.."]");
        else
            getglobal(ClassEventCheckButton:GetName().."Text"):SetText(EA_name.." ("..EA_rank..")   ["..index.."]");
        end

        ClassEventCheckButton:SetChecked(EA_Items[index]);
        ClassEventCheckButton:SetChecked(EA_Items[index]);

		local function ClassEventButtonGetChecked()
        	if (ClassEventCheckButton:GetChecked()) then
           		EA_Items[index] = true
			else
		   		EA_Items[index] = false
			end
        end
        ClassEventCheckButton:RegisterForClicks("AnyUp");
		ClassEventCheckButton:SetScript("OnClick", ClassEventButtonGetChecked)
	end
end

-- Create Alternate Alert menu buttons, etc
function EventAlert_CreateAlternateAlertMenuButtons()
	local offsetIncrementX = 200
	local offsetIncrementY = 20
	
	local buttonOffsetX = 20
	local buttonOffsetY = 0
	
	for index,value in pairs(EA_AltItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        buttonOffsetY = buttonOffsetY - offsetIncrementY

    	local EA_name, EA_rank = GetSpellInfo(index);

        local AltAlertCheckButton = CreateFrame("CheckButton", index, Alt_Alerts_Frame, "OptionsCheckButtonTemplate");
		AltAlertCheckButton:SetPoint("TOPLEFT", buttonOffsetX, buttonOffsetY);

        if (EA_rank == "") then
            getglobal(AltAlertCheckButton:GetName().."Text"):SetText(EA_name.."   ["..index.."]");
        else
            getglobal(AltAlertCheckButton:GetName().."Text"):SetText(EA_name.." ("..EA_rank..")   ["..index.."]");
        end

        AltAlertCheckButton:SetChecked(EA_AltItems[index]);
        AltAlertCheckButton:SetChecked(EA_AltItems[index]);

		local function AltAlertButtonGetChecked()
        	if (AltAlertCheckButton:GetChecked()) then
           		EA_AltItems[index] = true
			else
		   		EA_AltItems[index] = false
			end
        end
        AltAlertCheckButton:RegisterForClicks("AnyUp");
		AltAlertCheckButton:SetScript("OnClick", AltAlertButtonGetChecked)
	end
end

-- Create custom alert frames
function EventAlert_CreateCustomFrames()
	for index,value in pairs(EA_CustomItems) do
		if (type(value) == "number") then
			value = tostring(index)
		elseif (type(value) == "boolean") then
			if (value) then
				value = "true"
		    else
			    value = "false"
		    end
		end

        local eaf = CreateFrame("FRAME", "EAFrame_"..index, EA_Main_Frame);

        if (EA_Config.AllowESC == true) then
	        tinsert(UISpecialFrames,"EAFrame_"..index);
        end

        eaf:SetFrameStrata("DIALOG");

		eaf.spellName = eaf:CreateFontString("EAFrame_"..index.."_Name","OVERLAY");
		eaf.spellName:SetFontObject(ChatFontNormal);
		eaf.spellName:SetPoint("BOTTOM", 0, -15);

		eaf.spellTimer = eaf:CreateFontString("EAFrame_"..index.."_Timer","OVERLAY");
		eaf.spellTimer:SetFontObject(ChatFontNormal);
		eaf.spellTimer:SetPoint("TOP", 0, 20);
		
		eaf.spellCounter = eaf:CreateFontString("EAFrame_"..index.."_Counter","OVERLAY");
		eaf.spellCounter:SetFontObject(ChatFontNormal);
		eaf.spellCounter:SetPoint("RIGHT", 20, 0);

        eaf:SetScript("OnEvent", EventAlert_OnEvent);
        -- eaf:SetScript("OnUpdate", EventAlert_OnUpdate);
    end
end
