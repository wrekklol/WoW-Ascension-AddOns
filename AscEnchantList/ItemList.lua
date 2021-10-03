
local frame = CreateFrame("Frame", "AIO_RandomEnchFrame", UIParent)
frame.rare = {"ffffffffCommon","ff1eff00Uncommon", "ff0070ddRare", "ffa335eeEpic", "ffff8000Legendary"}
SLASH_RES1,SLASH_RES2,SLASH_RES3,SLASH_RES4 = "/randomench", "/RES", "/re", "/randomenchants"
SlashCmdList["RES"] = function(msg) if AIO_RandomEnchFrame:IsShown() then AIO_RandomEnchFrame:Hide() else AIO_RandomEnchFrame:Show() end end

frame:SetMovable(1)
frame:SetResizable(1)
frame:SetPoint("CENTER")
frame:SetSize(750,500)
frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",tile = true, tileSize = 12, edgeSize = 12,insets = setmetatable({},{__index = function() return 2 end}) 
	});
frame:SetBackdropColor(0,0,0,0.7)
frame:SetBackdropBorderColor(0.8,0.7,0,0.7)

frame:SetMovable(1)
frame:SetResizable(1)
frame:EnableMouse(1)
frame:RegisterForDrag("LeftButton", "RightButton")
frame:SetScript("OnDragStart", function(s,e) if e=="RightButton" then s:StartSizing() else s:StartMoving() end end)
frame:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
frame:SetMinResize(525,350)
frame:SetScript("OnLoad", function(s)
	local s = s or AIO_RandomEnchFrame
	if not s.db then return end
	s.cur = {}
	s.numLines = s.numLines or 1
	s.title = s.title or ""
	
	for k,v in pairs (s.db) do
		if type(v)=="table" then
			local _, id, name, desc, rarity, icon = unpack(v)
			if ( strlower(name..desc):find(strlower(gsub(s.title,"(%W)",function(x) if x=="|" then return "\124" end return ("%" .. x) end))) and s["Check"..(rarity:match("%d"))]:GetChecked() ) then
				local x = tonumber(rarity:match("%d"))
				x = strsub(s.rare[x],1,8)				
				table.insert(s.cur,{icon, name, desc, x, id })
			end
		end
	end
	


	
	if s.numLines < #s.cur then
		s.slider:SetMinMaxValues(0, #s.cur - s.numLines)
	else
		s.slider:SetMinMaxValues(0,0)
	end


	for ench = 1, s.numLines do
		local field = s["btn"..ench] -- btns 1-5
		if not s.cur[ench+s.slider:GetValue()] then
			field.icon:SetTexture(0,0,0,0)
			field.link:SetText("")
			field.desc:SetText("")
			field.tooltip = {"Empty Field.", "No random enchants were found. #sorry"}
			field.CurrentLink = ""
		else
			local icon, name, desc, r, id = unpack(s.cur[ench+s.slider:GetValue()])
			field.icon:SetTexture(icon,1)
			field.link:SetText(format("|c%s%s",r, format("[%s]", name) ))
			field.desc:SetText(desc)
			field.tooltip = { format("|c%s%s",r, format("%s", name)) , desc}
			field.CurrentLink = format("|c%s|Hspell:%s:RE|h[%s]|h|r",r,id, name)
		end
	end
	
	
end)
frame:SetScript("OnShow", function(s)
	s.db = AIO_REs or {}
	s:GetScript("OnLoad")(s)
end)
frame:SetScript("OnSizeChanged", function(s) 
	local n
	if not frame["btn1"] then return end
	for x=1,20 do
		if frame["btn"..x]:GetBottom() < frame:GetBottom() then
			n = n or x
			frame["btn"..x]:Hide()
		else
			frame["btn"..x]:Show()
		end	
		
	end
	n = n or 20
	if s.numLines and s.numLines == (n-1) then
	else
		s.numLines = (n-1); s:GetScript("OnLoad")(s)
	end
end)


local f = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
f:SetSize(25,25)
f:SetPoint("TOPRIGHT")

for k,v in pairs(frame.rare) do
	frame["Check"..k] = CreateFrame("CheckButton", "AIO_CheckBtn"..k, frame, "ChatConfigCheckButtonTemplate")
	local f = frame["Check"..k]
	_G[f:GetName().."Text"]:SetText("|c"..v)
	f:SetPoint("TOPRIGHT",-100*k,0)
	f:SetSize(25,25)
	f:SetChecked(1)
	f:SetScript("OnClick", function(s) s:GetParent():GetScript("OnLoad")(s:GetParent()) end)
end

frame.edit = CreateFrame("EditBox", "AIO_SEARCH_RE", frame)
local f = frame.edit
f:SetFont(ChatFrame1:GetFont(),14,"OUTLINE")
f:SetTextInsets(3,3,0,0)
f:SetPoint("TOPLEFT",5,-30)
f:SetPoint("BOTTOMRIGHT",frame,"TOPRIGHT",-5,-60)
f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",tile = true, tileSize =12, edgeSize =12,insets = setmetatable({},{__index = function() return 3 end}) 
});
f:SetBackdropColor(0,0,0,0.7)
f:SetBackdropBorderColor(1,0.7,0,1)
f:SetAutoFocus(false)
f:SetScript("OnEscapePressed", function(s) s:ClearFocus(); s:SetText(s:GetParent().title or "") end)
f:SetScript("OnEnterPressed", function(s) s:ClearFocus(); s:GetParent().title = s:GetText(); s:GetParent():GetScript("OnLoad")(s:GetParent()) end)
f:SetScript("OnEditFocusGained", function(s) s:HighlightText(); s.i:Hide() end)

frame.editBox = CreateFrame("EditBox", "AIO_COPY_RE", UIParent)
local fe = frame.editBox
fe:SetFont(ChatFrame1:GetFont(),14,"OUTLINE")
fe:SetTextInsets(3,3,0,0)
fe:SetAllPoints(frame)
fe:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",tile = true, tileSize =12, edgeSize =12,insets = setmetatable({},{__index = function() return 3 end}) 
});
fe:SetBackdropColor(0,0,0,0.7)
fe:SetBackdropBorderColor(1,0.7,0,1)
fe:SetAutoFocus(false)
fe:SetScript("OnEscapePressed", function(s) s:ClearFocus(); s:Hide() end)
fe:SetScript("OnEnterPressed", function(s) s:ClearFocus(); s:Hide() end)
fe:SetScript("OnEditFocusGained", function(s) s:HighlightText(); end)
fe:SetScript("OnShow", function(s)
	local i = 1;
	s.text = [=[//Listing Random Enchantments as javascript (rarity from 1=common to 5=legendary)
		var REs = {	]=]
	for k,v in pairs (AIO_REs or {}) do
		if type(v)=="table" then
			local _, id, name, desc, rarity, icon = unpack(v)
			local x = tonumber(rarity:match("%d"))
			s.text = s.text.."\r\n".. format("%d:{name:%q, description:%q, rarity:%d},",i,name,desc,x)
			i = i + 1;
		end
	end
	s.text = s.text ..[=[}]=]
	
	s:SetMaxLetters(s.text:len()) s:SetText(s.text or ""); s:HighlightText();
AIO_RandomEnchFrame:Hide(); s:SetFocus(); end)
fe:SetScript("OnHide", function(s) AIO_RandomEnchFrame:Show(); end)
fe:SetMultiLine(true)
fe:SetMaxLetters(100)


f.i = f:CreateFontString()
f.i:SetAllPoints(f)
f.i:SetFontObject(GameFontRed)
f.i:SetText("  Search...")
f.i:SetJustifyH("LEFT")

for x=1,20 do -- mouse scroll + chatlinks etc
	frame["btn"..x] = CreateFrame("Frame", frame:GetName().."Button"..x, frame)
	local f = frame["btn"..x]
	
	f.tooltip = {"[Test]","Description of Random Enchant which will be displayed in tooltip as well."}
	f:SetScript("OnLeave", function(s,e) GameTooltip:Hide()  end)
	
	f:SetScript("OnEnter", function(s,e) GameTooltip:SetOwner(s, "ANCHOR_CURSOR");
		if  s.CurrentLink:match(":RE") then 
			GameTooltip:SetHyperlink(s.CurrentLink) 
		else
			 GameTooltip:SetText(s.tooltip[1]); GameTooltip:AddLine(s.tooltip[2]);
		end GameTooltip:Show() end)
	--	f:SetScript("OnEnter", function(s,e) GameTooltip:SetOwner(s, "ANCHOR_CURSOR"); GameTooltip:SetText(s.tooltip[1]); GameTooltip:AddLine(s.tooltip[2]); GameTooltip:Show() end)
	
	f:EnableMouse(1)
	f:EnableMouseWheel(1)
	
	f:SetScript("OnMouseUp", function(s,b)
		if IsShiftKeyDown() and GetCurrentKeyBoardFocus() then
			GetCurrentKeyBoardFocus():SetText(GetCurrentKeyBoardFocus():GetText()..(s.CurrentLink))
		else
			print(s.CurrentLink)
		end
	end)
	f:SetScript("OnMouseWheel", function(s,i) s:GetParent().slider:SetValue(s:GetParent().slider:GetValue() - i * (IsShiftKeyDown() and 10 or 1)) end)
	
	f:SetPoint("TOPLEFT",0, -75-(x-1)*30)
	f:SetPoint("TOPRIGHT", -25, 75-(x-1)*30)
	f:SetHeight(30)
	f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",tile = true, tileSize =12, edgeSize =12,insets = setmetatable({},{__index = function() return 3 end}) 
	});
	f:SetBackdropColor(0,0,0,1)
	f:SetBackdropBorderColor(1,0.7,0,1)
	
	f.icon = f:CreateTexture()
	f.icon:SetPoint("TOPLEFT",10,-5)
	f.icon:SetSize(20,20)
	f.icon:SetTexture(0,1,0,1)
	
	f.link = f:CreateFontString()
	f.link:SetFont(ChatFrame1:GetFont(),14)
	f.link:SetText("[Test]")
	f.link:SetPoint("TOPLEFT", f.icon, "TOPRIGHT", 5,0)
	f.link:SetWidth(130)
	f.link:SetJustifyH("LEFT")
	
	f.desc = f:CreateFontString()
	f.desc:SetFont(ChatFrame1:GetFont(),14)
	f.desc:SetText("Description of Random Enchant which will be displayed in tooltip as well.")
	f.desc:SetPoint("TOPLEFT", f.link, "TOPRIGHT", 5,0)
	f.desc:SetPoint("RIGHT", f, "RIGHT")
	f.desc:SetTextColor(1,1,0,0.77)
	f.desc:SetJustifyH("LEFT")
end
-- scrolling system..
frame.slider = CreateFrame("Slider", "AIO_SliderGlobalName", frame, "OptionsSliderTemplate")
frame.slider:SetPoint("TOPLEFT", frame["btn1"], "TOPRIGHT")
frame.slider:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
frame.slider:SetOrientation('VERTICAL')
frame.slider:SetMinMaxValues(0,0)
frame.slider:SetValue(0)
frame.slider:SetValueStep(1)
frame.slider:SetScript("OnValueChanged", function(s) s:GetParent():GetScript("OnLoad")(s:GetParent()) end)

_G[frame.slider:GetName().."Low"]:SetText("")
_G[frame.slider:GetName().."High"]:SetText("")
_G[frame.slider:GetName().."Text"]:SetText("")

frame.Export = CreateFrame("Button", "AIO_RE_Export", frame, "GameMenuButtonTemplate")
frame.Export:SetPoint("TOPLEFT",0,20)
frame.Export:SetSize(160,20)
frame.Export:SetText("Export")
frame.Export:SetScript("OnClick", function() AIO_COPY_RE:Show() end)

frame:GetScript("OnSizeChanged")(frame, frame:GetSize())
fe:Hide()
frame:Hide()

for _,v in pairs({"ItemRefTooltip", "GameTooltip"}) do
hooksecurefunc(_G[v], "SetHyperlink", function(s,l)
	if l and l:find("%d:RE") and s:IsShown() then
		local name, rank = GetSpellInfo(l:match("spell:(%d+)"))
		rank = rank:match("Rank (%d+)")
		rank = strsub(AIO_RandomEnchFrame.rare[tonumber(rank)],1,8)
		s:AddLine(_G[ s:GetName().."TextLeft2"]:GetText(),nil,nil,nil,1)
		_G[ s:GetName().."TextLeft1"]:SetText(format( "|c%s%s|r" , rank, name))
		_G[ s:GetName().."TextLeft2"]:SetText("|cffffffffRandom Enchant|r")
		s:Show()
	end
end)
end 


