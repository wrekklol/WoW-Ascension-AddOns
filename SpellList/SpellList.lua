--[[	SpellList
	by SDPhantom
	http://www.phantomweb.org	]]
------------------------------------------

----------------------------------
--[[	Local Vars (Prototypes)	]]
----------------------------------
local Name,Addon=...;
local Title=select(2,GetAddOnInfo(Name));

Addon.MaxSpellID=9999999;--	Last known spell (This is the internal limit for this build)
Addon.MinFPS=5;--		Minimal FPS for the scannew command (this will freeze the game if <=0 with FPSThrottle set that low)
Addon.Options={
	MaxSpellID=Addon.MaxSpellID;
	FPSThrottle=10;
};
SpellList_Options=Addon.Options;

SpellList=Addon;

--------------------------
--[[	Version Check	]]
--------------------------
local codebuild,gamebuild=tonumber(Title:match("%d+$")),tonumber((select(2,GetBuildInfo())));
if codebuild~=nil and codebuild<gamebuild then
	print(("%s was coded for build %d and may not detect all spells in the current build. Please look for %s or higher.")
		:format(Title,codebuild,Title:match("v[%d%.]+$"):gsub("%d+$",gamebuild)));
end

--------------------------
--[[	Cache Control	]]
--------------------------
Addon.CacheControl=setmetatable({
	SpellCache={};
	LookupByID={};
	MasterList={};
	FilteredList={};
	FilterString="";
	Scanner=CreateFrame("Frame");
},{__index={
--	Icon Management		(Doesn't really belong here, but only these functions use it)
	DefaultIcon="Interface\\Icons\\INV_Misc_QuestionMark";
	BlockedIcons={
		"Interface\\Icons\\Ability_Temp";--	Doesn't exist
	};

--	Filter Funcs
	FilterCheck=function(self,str,sid,sname,srank)
			if not str then str=self.FilterString; end
--			if not str:find("^(%s*%)$") then str=str:gsub("%s*%(%s*%)$",""); end
			str=str	:gsub("%s*%(%s*","%(")
				:gsub("%s*%)%s*","%)")
				:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])","%%%1")
				:lower();
			return (tonumber(str)==sid or ("%s(%s)"):format(sname,srank):lower():find(str));
		end;
	FilterList=function(self,str)
			local fixedstr=tostring(str);
			if (type(str)~="string" and type(str)~="number") or fixedstr==self.FilterString then return; end
			self.FilterString=fixedstr;
			table.wipe(self.FilteredList);
			if type(str)=="number" and self.SpellCache[str] then
				self.Scanner.FilterPos=nil;--	Stops an existing FilteredList rebuild
				self.FilteredList[1]=self.SpellCache[str];

				local listframe=Addon.ListFrame;
				if listframe:IsShown() then listframe:Update(); end
			else
				self.Scanner.FilterPos=0;--	Triggers the scanner to rebuild FilteredList
			end
		end;

--	Cache Funcs
	AddSpell=function(self,sid)
			if not sid or self.SpellCache[sid] then return nil; end
			local name,rank,icon=GetSpellInfo(sid);
			if not name then return nil; end

--			Scan blocked icons
			if icon and #self.BlockedIcons>0 then
				for i,j in ipairs(self.BlockedIcons) do
					if icon==j then icon=self.DefaultIcon;break; end
				end
			end

			local tbl={SpellID=sid,Name=name,Rank=rank,Icon=icon or self.DefaultIcon};
			self.SpellCache[sid]=tbl;
			self.MasterList[#self.MasterList+1]=tbl;
			if self:FilterCheck(nil,sid,name,rank) then
				self.FilteredList[#self.FilteredList+1]=tbl;
			end

			return true;
		end;

--	Scanner Init
	InitScanner=function(self)
			local obj=self.Scanner;
			obj.FilterPos=nil;
			obj.ScanPos=0;
			obj.FirstPass=false;
			obj.RunTime=0;

			obj:HookScript("OnUpdate",function(self,elapsed)
				debugprofilestart();

				local cache=Addon.CacheControl;
				local mlist=cache.MasterList;
				local flist=cache.FilteredList;

				local listframe=Addon.ListFrame;

				if self.FilterPos then
					self.LastAction="Filter";
				elseif self.ScanPos then
					self.LastAction="Scan";
				end

				local changeflag=false;
				local limit=1/math.max(Addon.Options.FPSThrottle,Addon.Options.MaxSpellID<math.huge and 0 or Addon.MinFPS)
				while (elapsed-self.RunTime+debugprofilestop()/1000<limit or not self.FirstPass) and (self.FilterPos or self.ScanPos) do
					if self.FilterPos then
						self.FilterPos=self.FilterPos+1;
						if self.FilterPos>#mlist then self.FilterPos=nil;break; end
						local dat=mlist[self.FilterPos];
						if dat and cache:FilterCheck(nil,dat.SpellID,dat.Name,dat.Rank) then
							flist[#flist+1]=dat;
							changeflag=true;
						end
					elseif self.ScanPos then
						if cache:AddSpell(self.ScanPos) then changeflag=true; end
						self.ScanPos=self.ScanPos+1;
						if self.ScanPos>Addon.Options.MaxSpellID then self.ScanPos=nil;break; end
					end
					self.FirstPass=true;
				end

				local txt="";
				if self.FilterPos then
					txt=("Filtering: %u / %u (%0.3f%%)"):format(self.FilterPos,#mlist,100*self.FilterPos/#mlist);
					local ptr=flist[#flist];
					if ptr then txt=txt..("\nLast Spell: %u - |T%s:0|t %s(%s)"):format(ptr.SpellID,ptr.Icon,ptr.Name,ptr.Rank); end
				elseif self.ScanPos then
					self.LastAction="Filter";
					if Addon.Options.MaxSpellID<math.huge then
						txt=("Scanning: %u / %u (%0.3f%%)"):format(self.ScanPos,Addon.MaxSpellID,100*self.ScanPos/Addon.MaxSpellID);
					else
						txt=("Scanning: %u / \226\136\158"):format(self.ScanPos);
					end
					local ptr=mlist[#mlist];
					if ptr then txt=txt..("\nLast Spell: %u - |T%s:0|t %s(%s)"):format(ptr.SpellID,ptr.Icon,ptr.Name,ptr.Rank); end
				else
					txt=self.LastAction.." Complete!";
					local ptr=flist[#flist];
					if ptr then txt=txt..("\nLast Spell: %u - |T%s:0|t %s(%s)"):format(ptr.SpellID,ptr.Icon,ptr.Name,ptr.Rank); end
				end
				listframe.Status:SetText(txt);

				if listframe:IsShown() and changeflag then listframe:Update(); end

				self.FirstPass=false;
				self.RunTime=debugprofilestop()/1000;
			end);
		end;
}});
Addon.CacheControl:InitScanner();

--------------------------
--[[	UI Setup	]]
--------------------------
UIPanelWindows["SpellListFrame"]={area="doublewide",pushable=0,whiledead=1};--	Register UI Panel

function SpellListFrame_OnLoad(self)
	Addon.ListFrame=self;
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_LOGOUT");
	self.Title:SetText(Title);

--	List Buttons
	self.Buttons={};
	for i=1,33 do
		local obj=CreateFrame("Button","$parentSpellButton"..i,self,"SpellListButtonTemplate");
		obj:SetPoint("TOPLEFT",self,"TOPLEFT",22,-76-(i-1)*10);
		obj.IDText:SetText(i);
		obj.SpellText:SetText("Spell"..i);
		obj.RankText:SetText("(Rank "..i..")");
		self.Buttons[i]=obj;
	end

--	Detail Frame
	self.DetailTooltip={};
	self.DetailAnchor={--	Left=348	Right=-30	Top=-74		Bottom=36	Width=304	Height=337
		{"TOPLEFT",self,"TOPLEFT",348,-74};
		{"TOPLEFT",self,"TOPLEFT",348,-244};
	};
	for i=1,2 do
		local obj=CreateFrame("GameTooltip","SpellListFrameDetailTooltip"..i,self,"GameTooltipTemplate");
		obj:SetParent(self);
		obj:SetFrameLevel(self:GetFrameLevel()+1);
		self.DetailTooltip[i]=obj;

--[	Hack to fix the positioning issue when using frame scales
local anchor=self.DetailAnchor[i]
local scale=0.75;
self.DetailTooltip[i]:SetScale(scale);
anchor[4]=anchor[4]/scale;
anchor[5]=anchor[5]/scale;
--]]

	end
	self.SelectSpell=function(self,sid)
			self.SelID=(self.SelID~=sid and sid or nil);
		end;
	self.IsSelected=function(self,sid)
			return sid and sid==self.SelID;
		end;
	self.ShowDetails=function(self,sid)
			if not sid and not self.SelID then
				for i=1,2 do self.DetailTooltip[i]:Hide(); end
				return;
			end

			local cache=Addon.CacheControl.SpellCache;
			local dat={cache[sid or self.SelID],(self.SelID and sid) and cache[self.SelID] or nil};
			for i=1,2 do
				self.DetailTooltip[i]:Hide();
				if dat[i] then
					self.DetailTooltip[i]:SetOwner(self,"ANCHOR_NONE");
					self.DetailTooltip[i]:ClearAllPoints();
					self.DetailTooltip[i]:SetPoint(unpack(self.DetailAnchor[i]));
					self.DetailTooltip[i]:SetHyperlink("spell:"..dat[i].SpellID);

					local txt1,txt2=_G[self.DetailTooltip[i]:GetName().."TextLeft1"],_G[self.DetailTooltip[i]:GetName().."TextRight1"];
					txt1:SetText(("|T%s:32|t %s"):format(dat[i].Icon,txt1:GetText()));
					self.DetailTooltip[i]:Show();

--[
					local tidx=1;
					while txt1 or txt2 do
						if txt1 then txt1:SetTextColor(0,0,0); end
						if txt2 then txt2:SetTextColor(0,0,0); end
						txt1,txt2,tidx=_G[self.DetailTooltip[i]:GetName().."TextLeft"..tidx],_G[self.DetailTooltip[i]:GetName().."TextRight"..tidx],tidx+1;
					end

					self.DetailTooltip[i]:SetBackdropBorderColor(0,0,0,0);
					self.DetailTooltip[i]:SetBackdropColor(0,0,0,0);
--]]
				end
			end
		end;

--	Scroll Functions
	self.Offset=0;
	self.Bottom=0;
	self.ScrollStep=1;
	self.Scroll:SetValue(0);
	self.Scroll:SetValueStep(self.ScrollStep);
	self.ScrollTo=function(self,val)
			val=math.max(0,math.min(val,self.Bottom));
			self.Offset=val;
			self.Scroll:SetValue(val);
			self:Refresh();
		end;
	self.ScrollBy=function(self,val)
			self:ScrollTo(self.Offset+val);
		end;

--	Mouse Wheel Support
	self.WheelStep=3;
	self:EnableMouseWheel(1);
	self:HookScript("OnMouseWheel",function(self,val)
		self:ScrollBy(-val*self.WheelStep);
	end);

--	List/Frame Functions
	self.Toggle=function(self,show)
		_G[((show==false or (self:IsShown() and not show)) and "Hide" or "Show").."UIPanel"](self);
	end;
	self.Update=function(self)
			local cache=Addon.CacheControl;

			self.Bottom=math.max(0,#cache.FilteredList-#self.Buttons);
			self.Scroll:SetMinMaxValues(0,self.Bottom);
			if self.Bottom>0 then self.Scroll:Enable() else self.Scroll:Disable() end

			self.Range:SetText(("%d / %d"):format(#cache.FilteredList,#cache.MasterList));

			self:Refresh();
		end;
	self.Refresh=function(self)
			for i,j in ipairs(self.Buttons) do
				local ptr=Addon.CacheControl.FilteredList[i+self.Offset];
				if ptr then
					j.Dat=ptr;
					j.IDText:SetText(ptr.SpellID);
					j.SpellText:SetText(("|T%s:0|t %s"):format(ptr.Icon,ptr.Name));
					j.RankText:SetText(ptr.Rank~="" and "("..ptr.Rank..")" or "");
					j:Show();

					if MouseIsOver(j) then
						j:GetScript("OnEnter")(j);
					end
				else
					j.Dat=nil;
					j:Hide();
				end
			end
		end;

--	Auto Filter
	hooksecurefunc("PickupAction",function(slot) self.FromActionSlot=slot; end);--	self is an upvalue from the OnLoad handler
	self:HookScript("OnUpdate",function(self)
		if self.FromActionSlot and not GetCursorInfo() then
			self.FromActionSlot=nil;
		end
	end);

--	Filter Hook (Sets the Filter Box to the string passed and clears the Auto Filter)
	hooksecurefunc(Addon.CacheControl,"FilterList",function(self,str)
		Addon.ListFrame.FilterText:SetText(self.FilterString);
		Addon.ListFrame.AutoFilter.Detail:SetText("Auto Filter\n|cff888888(Empty)|r");
		Addon.ListFrame.AutoFilter:SetNormalTexture(nil);
	end);
end

function SpellListFrame_OnEvent(self,event,...)
	if event=="ADDON_LOADED" and (...)==Name then
		self:UnregisterEvent(event);
		Addon.Options=SpellList_Options;
		Addon.Options.MaxSpellID=math.max(Addon.Options.MaxSpellID,Addon.MaxSpellID);
	elseif event=="PLAYER_LOGOUT" then
		SlashCmdList["SPELLLIST"]("scanstop");
	end
end

function SpellListFrame_OnShow(self)
	self:Update();
	if self.SelID then self:ShowDetails(); end
	if not self.FirstShow then
		self.Scroll:SetValue(0);--	The thumb texture for the scroll bar doesn't show until SetValue is called while SpellListFrame is shown
		self.FirstShow=true;
	end
end

function SpellListScrollFrame_OnValueChanged(self,val)
	local parent=self:GetParent();
	val=math.floor(val);
	if parent.Offset~=val then parent:ScrollTo(val); end--	Calling this function does cause this event to fire
end

function SpellListFilterText_OnEnterPressed(self)
	self:ClearFocus();

	local txt=self:GetText();
	txt=txt:gsub("^%s+","");
	if final then txt=txt:gsub("%s+$",""); end
	txt=txt:gsub("%s%s+"," ");
	self:SetText(txt);

	local cache=Addon.CacheControl;
	if txt~=cache.FilterString then
		cache:FilterList(txt);
	end
end

function SpellListAutoFilter_OnClick(self)
	local parent=self:GetParent();
	local cursor,arg1,arg2=GetCursorInfo();
	local name="";

	if cursor=="companion" then
		local _,name,sid,icon=GetCompanionInfo(arg2,arg1);
		Addon.CacheControl:FilterList(sid);
		self.Detail:SetText(name);
		self:SetNormalTexture(icon);
	elseif cursor=="item" then
		local sname,srank=GetItemSpell(arg1);
		if sname then
			name=("%s(%s)"):format(sname,srank);
		else
			name=GetItemInfo(arg1);
		end

		Addon.CacheControl:FilterList(name);
		self.Detail:SetText(arg2.."\n"..(sname and name or "|cffff0000Item has no spell.|r"));
		self:SetNormalTexture(GetItemIcon(arg1));
	elseif cursor=="spell" then
		local sid=tonumber(GetSpellLink(arg1,arg2):match("|Hspell:(%d+)|h"));
		local info=self.Top.CacheControl.SpellCache[sid];
		Addon.CacheControl:FilterList(sid);
		self.Detail:SetFormattedText("%s(%s)",info.Name,info.Rank);
		self:SetNormalTexture(GetSpellTexture(arg1,arg2));
	elseif cursor=="macro" then
		local mname,icon=GetMacroInfo(arg1);
		local sname,srank=GetMacroSpell(arg1);
		if sname then
			name=("%s(%s)"):format(sname,srank);
		else
			name="";
		end

		Addon.CacheControl:FilterList(name);
		self.Detail:SetText(mname.."\n"..(sname and name or "|cffff0000Macro has no spell.|r"));
		self:SetNormalTexture(icon);
	elseif not cursor then
		Addon.CacheControl:FilterList("");--		Filter hook defined on load clears the Auto Filter already
	end

	if cursor then
		if parent.FromActionSlot then
			PlaceAction(parent.FromActionSlot);
		else
			ClearCursor();
		end
	end
end

--------------------------
--[[	Slash Commands	]]
--------------------------

SlashCmdList["SPELLLIST"]=function(msg)
	local obj=SpellList;
	local idx=1;
	local arg={};
	for i in msg:gmatch("([^%s]+)") do arg[idx],idx=i,idx+1; end

	if arg[1] then
		local cmd=arg[1]:lower();
		if cmd=="fps" then
			Addon.Options.FPSThrottle=math.max(0,tonumber(arg[2]) or 10);
		elseif cmd=="filter" then
			if #arg>1 then
				local name="";
				for i=2,#arg do
					name=name..(i>2 and " " or "")..arg[i];
				end

--				Process links
				local ltype,lid,lname=name:match("|H([^:]+):(%d+).-|h%[(.-)%]|h");
				if ltype then
					if ltype=="enchant" or ltype=="spell" or ltype=="trade" then
						name=lid;
					elseif ltype=="item" then
						local sname,srank=GetItemSpell(lid);
						if sname then
							name=("%s(%s)"):format(sname,srank);
						else
							name=lname;
						end
					else
						name=lname;
					end
				end

				Addon.CacheControl:FilterList(name);
			else
				Addon.CacheControl:FilterList("");
			end

			if not Addon.ListFrame:IsShown() then ShowUIPanel(Addon.ListFrame); end
		elseif cmd=="toggle" then Addon.ListFrame:Toggle();
		elseif cmd=="reset" then Addon.CacheControl:FilterList("");
		elseif cmd=="scannew" then
			local scanner=Addon.CacheControl.Scanner;
			if not scanner.ScanPos then scanner.ScanPos=obj.MaxSpellID; end
			Addon.Options.MaxSpellID=math.huge;
			Addon.ListFrame:Toggle(true);
		elseif cmd=="scanstop" then
			local scanner=Addon.CacheControl.Scanner;
			if scanner.ScanPos then
				local list=Addon.CacheControl.MasterList;
				Addon.Options.MaxSpellID=math.max(Addon.MaxSpellID,list[#list].SpellID);
				scanner.ScanPos=nil;
			end
		else
			print(Title,"Usage: [/SpellList or /SL]");
			print("/SL [Command] [Args]");
			print("     filter - Sets filter to given spell name (Leave 'Args' blank to reset)");
			print("     fps - Sets scanner FPS threshold (Default at 10)");
			print("     help - Displays this help text");
			print("     reset - Resets filter");
			print("     toggle - Toggle spell list window (Default command)");
			print("     scannew - Starts scanning for new spells");
			print("     scanstop - Stops scanning for spells");
		end
	else
		Addon.ListFrame:Toggle();
	end
end;
SLASH_SPELLLIST1="/spelllist";
SLASH_SPELLLIST2="/sl";
