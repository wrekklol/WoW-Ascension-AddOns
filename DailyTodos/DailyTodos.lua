DTD = LibStub("AceAddon-3.0"):NewAddon("DTD", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

--local Astrolabe = DongleStub("Astrolabe-1.0")
local QTip = LibStub('LibQTip-1.0')
local AceGUI = LibStub("AceGUI-3.0")
DTD.LDBIcon = LibStub("LibDBIcon-1.0")

local DTDLauncher = LibStub("LibDataBroker-1.1", true):NewDataObject("DTD", {
	type = "launcher",
	icon = "Interface\\Icons\\inv_scroll_09",
	OnClick = function(_,button) -- fires when a user clicks on the minimap icon
			if button == "RightButton" then
				DTD_Database.profile.showTrackingFrame = not DTD_Database.profile.showTrackingFrame
				if DTD_Database.profile.showTrackingFrame then
					DTD.TrackingFrame:Show()
				else
					DTD.TrackingFrame:Hide()
				end
			else
				DTD:InitUI()
			end
		end,
	OnTooltipShow = function(tt) -- tooltip that shows when you hover over the minimap icon
			local cs = "|cffffffcc"
			local ce = "|r"
			tt:AddLine("Daily To-Do's")
			tt:AddLine(string.format("%sLeft-Click%s to open the configuration window", cs, ce))
			tt:AddLine(string.format("%sRight-Click%s to hide/show the tracking window", cs, ce))
			tt:AddLine(string.format("%sDrag%s to move this button", cs, ce))
		end,
	})

local professionQuests = {
	-- 1: Home City Fishing
	-- 2: Dalaran Fishing
	-- 3: Shattrath Fishing
	--
	-- 4: Home City Cooking
	-- 5: Dalaran Cooking
	-- 6: Shattrath Cooking
	--
	-- 7: Jewelcrafting
	
	---
	--- COOKING
	---
		--- Home City
			-- Alliance
			[26190] = 4, -- A Fisherman's Feast
			[26177] = 4, -- Feeling Crabby?
			[26192] = 4, -- Orphans Like Cookies Too!
			[26153] = 4, -- Penny's Pumpkin Pancakes
			[26183] = 4, -- The King's Cider
			-- Horde
			[26227] = 4, -- Careful, this fruit bites back
			[26226] = 4, -- Crawfish Creole?
			[26235] = 4, -- Even Thieves Get Hungry
			[26220] = 4, -- Everything is Better With Bacon
			[26233] = 4, -- Stealing from Our Own
			[26234] = 4, -- Stealing from Our Own
		
		--- Dalaran
			-- Alliance
			[13103] = 5, -- Cheese for Glowergold
			[13101] = 5, -- Convention at the Legerdemain
			[13100] = 5, -- Infused Mushroom Meatloaf
			[13107] = 5, -- Mustard Dogs!
			[13102] = 5, -- Sewer Stew
			-- Horde
			[13115] = 5, -- Cheese for Glowergold
			[13113] = 5, -- Convention at the Legerdemain
			[13112] = 5, -- Infused Mushroom Meatloaf
			[13116] = 5, -- Mustard Dogs!
			[13114] = 5, -- Sewer Stew
		
		--- Shattrath
			[11380] = 6, -- Manalicious
			[11377] = 6, -- Revenge is Tasty
			[11381] = 6, -- Soup for the Soul
			[11379] = 6, -- Super Hot Stew
		
	---
	--- FISHING
	---
		--- Home City
		
		-- Alliance
		[26488] = 1, -- Big Gulp
		[26420] = 1, -- Diggin' For Worms
		[26414] = 1, -- Hitting a Walleye
		[26442] = 1, -- Rock Lobster
		[26536] = 1, -- Thunder Falls
		
		-- Horde
		[26588] = 1, -- A Furious Catch
		[26572] = 1, -- A Golden Opportunity
		[26557] = 1, -- A Staggering Effort
		[26543] = 1, -- Clammy Hands
		[26556] = 1, -- No Dumping Allowed
		
		--- Dalaran
		[13833] = 2, -- Blood Is Thicker
		[13834] = 2, -- Dangerously Delicious
		[13836] = 2, -- Disarmed!
		[13832] = 2, -- Jewel of the Sewers
		[13830] = 2, -- The Ghostfish
		
		--- Shattrath
		[11666] = 3, -- Bait Bandits
		[11665] = 3, -- Crocolisks in the City
		[11669] = 3, -- Felblood Fillet
		[11668] = 3, -- Shrimpin' Ain't Easy
		[11667] = 3, -- The One That Got Away
	---
	--- JC
	---
		--- Alliance
		[25105] = 7, -- Nibbler! No!
		[25154] = 7, -- A Present for Lila
		[25156] = 7, -- Elemental Goo
		[25155] = 7, -- Ogrezonians in the Mood
		[25157] = 7, -- The Latest Fashion!
		--- Horde
		[25158] = 7, -- Nibbler! No!
		[25160] = 7, -- A Present for Lila
		[25162] = 7, -- Elemental Goo
		[25161] = 7, -- Ogrezonians in the Mood
		[25159] = 7, -- The Latest Fashion!
}
local windowOpen = false
local tab = 1

local CharacterName, CharacterFaction = UnitName("player"), string.upper(UnitFactionGroup("player"))

local QUEST_COMPLETE = "Interface\\RAIDFRAME\\ReadyCheck-Ready.blp"
local QUEST_ACCEPTED = "Interface\\GossipFrame\\DailyActiveQuestIcon.blp"
local QUEST_AVAILABLE = "Interface\\GossipFrame\\DailyQuestIcon.blp"

local DailyTodos_UpdateInterval = 1.0
local DailyTodos_TimeSinceLastUpdate = 0.0
local DailyTodos_Updates = 598
local DailyTodos_BigUpdate = 600

DTD:RegisterChatCommand("dtd","InitUI")
DTD:RegisterChatCommand("dailytodo","InitUI")
DTD:RegisterChatCommand("DTDs","InitUI")
DTD:RegisterChatCommand("dailytodos","InitUI")

-----------------------------------------------------------------------
-- Memoizing table for quest names.	-- All thanks to Torhal for this (:
-----------------------------------------------------------------------
local quest_names = _G.setmetatable({}, {
	__index = function(t, id_num)
		_G.GameTooltip:SetOwner(_G.UIParent, _G.ANCHOR_NONE)
		_G.GameTooltip:SetHyperlink(("quest:%s"):format(_G.tostring(id_num)))

		local quest_name = _G["GameTooltipTextLeft1"]:GetText()
		_G.GameTooltip:Hide()

		if not quest_name then
			return _G.UNKNOWN
		end
		t[id_num] = quest_name
		return quest_name
	end,
})

function DTD:OnInitialize()
    -- Called when the addon is loaded
    DTD_Database = LibStub("AceDB-3.0"):New("DailyTodoDB",defaults)

	if DailyTodoQuests == nil then
        DailyTodoQuests = {}
    end
    
    DTD:CreateMinimapButton()
	
	DTD:CreateTrackingFrame()
end

function DTD:OnEnable()
    -- Called when the addon is enabled
    self:Print("Daily To-Do's enabled. /dtd to configure.")
	
	-- TODO expire completed quests

	-- Check to see if there is a quest completion profile for this character yet
    if not DTD_Database.realm.side[CharacterName] then
		if CharacterFaction == 'ALLIANCE' then
	    	DTD_Database.realm.side[CharacterName] = 1
		else
			DTD_Database.realm.side[CharacterName] = 2
		end
		DTD_Database.realm.completedQuests[CharacterName] = {}
		DTD_Database.realm.acceptedQuests[CharacterName] = {}
    end
    
    -- Register quest complete
    self:RegisterEvent("QUEST_ACCEPTED")
    self:RegisterEvent("QUEST_COMPLETE")
end

-- Objective selection tab
function DTD:DrawGroup1(container)
    -- Draw the settings
    --
    -- PROFESSION QUESTS
    --
    container:SetLayout("Fill")

    local ScrollFrame = AceGUI:Create("ScrollFrame")
    ScrollFrame:SetLayout("Flow")
    ScrollFrame:SetWidth(250)
    container:AddChild(ScrollFrame)

    ScrollFrame:PauseLayout()

    local DailyHeroicCheckBox = AceGUI:Create("CheckBox")
    DailyHeroicCheckBox:SetLabel("Daily Heroic Dungeon")
    if DTD_Database.profile.dailyheroic then
        DailyHeroicCheckBox:SetValue(DTD_Database.profile.dailyheroic)
    end
    DailyHeroicCheckBox:SetCallback("OnValueChanged", function()
        DTD_Database.profile.dailyheroic = DailyHeroicCheckBox:GetValue()
        DTD:ReloadTrackingFrame()
    end)
    ScrollFrame:AddChild(DailyHeroicCheckBox)

	local DailyMythicCheckBox = AceGUI:Create("CheckBox")
    DailyMythicCheckBox:SetLabel("Daily Mythic Dungeon")
    if DTD_Database.profile.dailymythic then
        DailyMythicCheckBox:SetValue(DTD_Database.profile.dailymythic)
    end
    DailyMythicCheckBox:SetCallback("OnValueChanged", function()
        DTD_Database.profile.dailymythic = DailyMythicCheckBox:GetValue()
        DTD:ReloadTrackingFrame()
    end)
    ScrollFrame:AddChild(DailyMythicCheckBox)

    local CustomGroup = AceGUI:Create("InlineGroup")
    CustomGroup:SetTitle("Custom Daily Groups")
    CustomGroup:SetLayout("Flow")
    ScrollFrame:AddChild(CustomGroup)

	local ProfessionsGroup = AceGUI:Create("InlineGroup")
    ProfessionsGroup:SetTitle("Profession Dailies")
    ProfessionsGroup:SetLayout("Flow")
    ScrollFrame:AddChild(ProfessionsGroup)

    --
    -- DAILIES
    --

    local ReputationGroup = AceGUI:Create("InlineGroup")
    ReputationGroup:SetTitle("Reputation")
    ReputationGroup:SetLayout("Flow")
    ScrollFrame:AddChild(ReputationGroup)

    local DescText = AceGUI:Create("Label")
    DescText:SetText("Check off each faction who's reputation daily quests you would like to be reminded to complete.")
    DescText:SetColor(0,1,0)
    ReputationGroup:AddChild(DescText)

    -- Loop through the factions and create a checkbox for each
    local cbs = {}
    local j = 0
    local sorted_factions = {}
    for k in pairs(factions) do
        table.insert(sorted_factions, k)
    end
    table.sort(sorted_factions)
	for _, id in ipairs(sorted_factions) do
        local v = factions[id]
		if v["s"] == nil or v['s'] == DTD_Database.realm.side[CharacterName] then
            j = j + 1
			local i = j
			cbs["factionCB"..i] = AceGUI:Create("CheckBox")
			cbs["factionCB"..i]:SetLabel(v["n"])
			cbs["factionCB"..i]:SetFullWidth(true)
			-- load the previous checkbox state
			if DTD_Database.profile.factionsTracking[id] then
				cbs["factionCB"..i]:SetValue(DTD_Database.profile.factionsTracking[id])
			end
			
			-- Register toggle checkback
			cbs["factionCB"..i]:SetCallback("OnValueChanged",function () 
				--DTD_Database.profile.factionsTracking[i] = cbs["factionCB"..i]:GetValue()
				if cbs["factionCB"..i]:GetValue() then
					DTD_Database.profile.factionsTracking[id] = true
				else
					DTD_Database.profile.factionsTracking[id] = nil
                    for _, qid in pairs(v['q']) do
                        DailyTodoQuests[qid] = nil
                    end
				end
				DTD:ReloadTrackingFrame()
			end)
			cbs["factionCB"..i]:SetCallback("OnEnter",function ()
				GameTooltip:SetOwner(cbs["factionCB"..i].frame, "ANCHOR_CURSOR", 0, 0)
				if v["s"] == DTD_Database.realm.side[CharacterName] then
					GameTooltip:AddLine(v["n"],0,1,0)
					GameTooltip:AddLine(UnitFactionGroup("player"),1,1,1)
				else
					GameTooltip:AddLine(v["n"])
					GameTooltip:AddLine("Neutral",1,1,1)
				end
				GameTooltip:Show()
			end)
			
			cbs["factionCB"..i]:SetCallback("OnLeave",function () GameTooltip:Hide() end)
			
			if id >= 10000 or id < 10 then
				if factions[id]["c"] == 2 and factions[id]["c2"] ~= nil then						-- Veto if they do not have the appropriate profession
					if factions[id]["c2"] == 2 then 		-- It's a cooking quest
						ProfessionsGroup:AddChild(cbs["factionCB"..i])
					end
					if factions[id]["c2"] == 1 then		-- It's a fishing quest
						ProfessionsGroup:AddChild(cbs["factionCB"..i])
					end
					if factions[id]["c2"] == 3 then		-- It's a fishing quest
						ProfessionsGroup:AddChild(cbs["factionCB"..i])
					end
				else
					CustomGroup:AddChild(cbs["factionCB"..i])
				end
			else
				ReputationGroup:AddChild(cbs["factionCB"..i])
			end
		end
	end
	
	local RestoreLbl = AceGUI:Create("Label")
	RestoreLbl:SetText("Restore all quests that have been removed from the main tracking frame.")
	RestoreLbl:SetFullWidth(true)
	ScrollFrame:AddChild(RestoreLbl)
	
	local RestoreIgnoredBtn = AceGUI:Create("Button")
	RestoreIgnoredBtn:SetText("Restore quests")
	RestoreIgnoredBtn:SetFullWidth(true)
	RestoreIgnoredBtn:SetCallback("OnClick",function () 
												DTD_Database.profile.dontTrack = {}
												DTD:ReloadTrackingFrame()
											end)
	ScrollFrame:AddChild(RestoreIgnoredBtn)
	
	ScrollFrame:ResumeLayout()	
end

-- Options and settings tab
function DTD:DrawGroup2(container)
	container:SetLayout("Flow")
	-- Show/hide the minimap icon
	local ShowMinimapCB = AceGUI:Create("CheckBox")
	ShowMinimapCB:SetLabel("Show Minimap Icon")
	ShowMinimapCB:SetValue(not DTD_Database.profile.minimapIcon['hide'])
	ShowMinimapCB:SetCallback("OnValueChanged", 
										function()
												DTD_Database.profile.minimapIcon['hide'] = not ShowMinimapCB:GetValue()
												if DTD_Database.profile.minimapIcon['hide'] then
													DTD.LDBIcon:Hide("DTD")
												else
													DTD.LDBIcon:Show("DTD")
												end
										end)
	container:AddChild(ShowMinimapCB)
	
	
	-- Show/hide the tracker frame
	local ShowTrackerCB = AceGUI:Create("CheckBox")
	ShowTrackerCB:SetLabel("Show Tracking Frame")
	if DTD_Database.profile.showTrackingFrame then
		ShowTrackerCB:SetValue(DTD_Database.profile.showTrackingFrame)
	end
	ShowTrackerCB:SetCallback("OnValueChanged", 
										function() 
												DTD_Database.profile.showTrackingFrame = ShowTrackerCB:GetValue()
												if DTD_Database.profile.showTrackingFrame then
													DTD.TrackingFrame:Show()
												else
													DTD.TrackingFrame:Hide()
												end
										end)
	container:AddChild(ShowTrackerCB)
	
	-- Show/hide the rep bars
	local ShowRepCB = AceGUI:Create("CheckBox")
	ShowRepCB:SetLabel("Show Reputation in Headers")
	if DTD_Database.profile.showRep then
		ShowRepCB:SetValue(DTD_Database.profile.showRep)
	end
	ShowRepCB:SetCallback("OnValueChanged", 
										function() 
												DTD_Database.profile.showRep = ShowRepCB:GetValue()
												DTD:ReloadTrackingFrame()
										end)
	container:AddChild(ShowRepCB)
	
	-- Lock/unlock the tracker frame
	local LockTrackerCB = AceGUI:Create("CheckBox")
	LockTrackerCB:SetLabel("Lock Tracking Frame")
	if DTD_Database.profile.lockTrackingFrame then
		LockTrackerCB:SetValue(DTD_Database.profile.lockTrackingFrame)
	end
	LockTrackerCB:SetCallback("OnValueChanged", 
										function() 
												DTD_Database.profile.lockTrackingFrame = LockTrackerCB:GetValue()
												if DTD_Database.profile.lockTrackingFrame then
													DTD.TrackingFrame:SetMovable(false)
    												DTD.TrackingFrame:EnableMouse(false)
    											else
    												DTD.TrackingFrame:SetMovable(true)
    												DTD.TrackingFrame:EnableMouse(true)
    											end
										end)
	container:AddChild(LockTrackerCB)
	
	
	local AnnounceGroup = AceGUI:Create("InlineGroup")
	AnnounceGroup:SetTitle("Announce quest completion")
	AnnounceGroup:SetLayout("Flow")
	container:AddChild(AnnounceGroup)
	
		-- Dropdown
		local AnnounceQuestCompletionDD = AceGUI:Create("Dropdown")		
		AnnounceQuestCompletionDD:SetLabel("Announce in:")
		AnnounceQuestCompletionDD:SetList({[1] = "Blizzard Raid Warning"})
		if IsAddOnLoaded("MikScrollingBattleText") then
			AnnounceQuestCompletionDD:AddItem(2,"Mik's Scrolling Battle Text")
			if MikSBT.IsModDisabled() then
				AnnounceQuestCompletionDD:SetItemDisabled(2,1,true)
				AnnounceQuestCompletionDD:SetValue(1)
				DTD_Database.profile.announceMethod = 1
			end
		end
		if IsAddOnLoaded("Parrot") then
			AnnounceQuestCompletionDD:AddItem(3,"Parrot")
		end
		if IsAddOnLoaded("SCT") then
			AnnounceQuestCompletionDD:AddItem(4,"Scrolling Combat Text")
		end
		AnnounceQuestCompletionDD:SetValue(DTD_Database.profile.announceMethod)
		AnnounceQuestCompletionDD:SetDisabled(not DTD_Database.profile.announceQuestCompletion)
		AnnounceQuestCompletionDD:SetCallback("OnValueChanged", function (_,_,value) 
																	DTD_Database.profile.announceMethod = value
																end)
		AnnounceGroup:AddChild(AnnounceQuestCompletionDD)
		
		-- Announce quest completion
		local AnnounceQuestCompletionCB = AceGUI:Create("CheckBox")
		AnnounceQuestCompletionCB:SetLabel("Enable")
		AnnounceQuestCompletionCB:SetValue(DTD_Database.profile.announceQuestCompletion)
		AnnounceQuestCompletionCB:SetCallback("OnValueChanged",function ()
																	DTD_Database.profile.announceQuestCompletion = AnnounceQuestCompletionCB:GetValue()
																	if DTD_Database.profile.announceQuestCompletion == true then
																		AnnounceQuestCompletionDD:SetDisabled(false)
																	else
																		AnnounceQuestCompletionDD:SetDisabled(true)
																	end
																end)
		AnnounceGroup:AddChild(AnnounceQuestCompletionCB)
	
	-- Reset all data
	local ResetDataBtn = AceGUI:Create("Button")
	ResetDataBtn:SetText("Reset All Data")
	ResetDataBtn:SetCallback("OnClick", function()
											container:ReleaseChildren()
											DTD:DrawGroup2(container)
											DTD:ResetData() 
										end)
	container:AddChild(ResetDataBtn)
end

local function SelectGroup(container,event,group)
	container:ReleaseChildren()
	if group == "tab1" then
		DTD:DrawGroup1(container)
	elseif group == "tab2" then
		DTD:DrawGroup2(container)
	end
end

function DTD:InitUI()	
	collectgarbage()
	if windowOpen then 
		DTD.MainWindow:Release()
		windowOpen = false
		return
	end
	-- Create a container frame
	-- Called when the user enters the console command
	DTD.MainWindow = AceGUI:Create("Window")
	DTD.MainWindow:SetCallback("OnClose",function(widget)
										windowOpen = false
										AceGUI:Release(widget)
									end)
	DTD.MainWindow:SetTitle("Daily To-Do's")
	DTD.MainWindow:SetWidth("300")
	DTD.MainWindow:SetHeight("400")
	DTD.MainWindow:SetLayout("Fill")
	DTD.MainWindow:EnableResize(false)
	
	TabGroup = AceGUI:Create("TabGroup")
	TabGroup:SetTabs({{value = "tab1",text="Select Objectives"}, {value = "tab2",text="Options"}})
	TabGroup:SetCallback("OnGroupSelected", SelectGroup)
	TabGroup:SetWidth(250)
	TabGroup:SetLayout("Fill")
	TabGroup:SelectTab("tab1")
	DTD.MainWindow:AddChild(TabGroup)
	
	windowOpen = true
	_G["DTD_Menu"] = DTD.MainWindow
	table.insert(UISpecialFrames, "DTD_Menu")
end

--
-- Tracker Frame
--

function DTD:CreateTrackingFrame()
	DTD.TrackingFrame = CreateFrame("Frame","TrackingFrame",UIParent)
	DTD.TrackingFrame:SetMovable(true)
    DTD.TrackingFrame:EnableMouse(true)
    DTD.TrackingFrame:SetClampedToScreen(true)
    DTD.TrackingFrame:RegisterForDrag("LeftButton")
    DTD.TrackingFrame:SetScript("OnUpdate",DTD_OnUpdate)
    DTD.TrackingFrame:SetScript("OnDragStart", DTD.TrackingFrame.StartMoving)
    DTD.TrackingFrame:SetScript("OnDragStop", DTD.TrackingFrame.StopMovingOrSizing)
	DTD.TrackingFrame:SetBackdropColor(0,0,0,1);
	DTD.TrackingFrame:SetHeight(200)
	DTD.TrackingFrame:SetWidth(200)
	DTD.TrackingFrame:SetAlpha(1.0)
	
    local lbls = {}
    local lblBtns = {}
    local headers = {} 
    local btns = {}
    local ypos = 0
    
    -- Create title text
    local title = DTD.TrackingFrame:CreateFontString("TitleText",nil,"GameFontNormalLarge")
	title:SetText("|cff7FFF00Daily To-Do's|r")
	title:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",-4,-ypos)
	title:Show()
	ypos = ypos + 18
    
    DTD.timer = DTD.TrackingFrame:CreateFontString("TimerText",nil,"GameFontNormal")
	DTD.timer:SetText("|cffFFFFFF ("..GetDailyQuestsCompleted().."/"..GetMaxDailyQuests()..") "..SecondsToTime(GetQuestResetTime()).."|r")
	DTD.timer:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",5,-ypos)
	DTD.timer:Show()
	
	ypos = ypos + 14
    
    i = 0
    
    ------
	------ TRACK DAILY HEROIC
	------
    if DTD_Database.profile.dailyheroic then
		local DHLbl= DTD.TrackingFrame:CreateFontString("dailyheroic",nil,"GameFontNormal")
		if DTD_Database.realm.dailyHeroic[CharacterName] ~= nil then
			color = "|cff00FF00"
		else
			color = "|cffff0000"
		end
		DHLbl:SetText(color.."Daily Heroic Dungeon|r")
		DHLbl:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",0,-ypos)
		ypos = ypos+14
	end
	if DTD_Database.profile.dailymythic then
		local DHLbl= DTD.TrackingFrame:CreateFontString("dailyheroic",nil,"GameFontNormal")
		if DTD_Database.realm.dailyMythic[CharacterName] ~= nil then
			color = "|cff00FF00"
		else
			color = "|cffff0000"
		end
		DHLbl:SetText(color.."Daily Mythic Dungeon|r")
		DHLbl:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",0,-ypos)
		ypos = ypos+14
	end
    
    ------
	------ TRACK OTHER DAILIES
	------
    for id, v in pairs(factions) do    
		if DTD_Database.profile.factionsTracking[id] then
			
			local isFaction = false
			
			-- Get the faction info
			local name, _, standingID, barMin, barMax, barValue, _, _, _, _, _, _, _ = GetFactionInfoByID(id)
			if name == v["n"] then
				isFaction = true
			end
			
			-- Create the Faction header and the expand/contract button
			btns[i] = CreateFrame("Button",nil,DTD.TrackingFrame,"OptionsButtonTemplate")
			if DTD_Database.profile.trackFactionsExpanded[id] then
				btns[i]:SetText("-")
			else
				btns[i]:SetText("+")
			end
			btns[i]:SetWidth(10)
			btns[i]:SetHeight(10)
			btns[i]:SetAlpha(1)
			btns[i]:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",2,-ypos-2)
			btns[i]:SetScript("OnClick",function ()
											if DTD_Database.profile.trackFactionsExpanded[id] then
												DTD_Database.profile.trackFactionsExpanded[id] = nil
												DTD:ReloadTrackingFrame()
											else
												DTD_Database.profile.trackFactionsExpanded[id] = true
												DTD:ReloadTrackingFrame()
											end
										end)
			btns[i]:Show()
			
			headers[i] = DTD.TrackingFrame:CreateFontString("header"..i,nil,"GameFontNormal")
			headers[i]:SetText(v["n"])
			headers[i]:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",16,-ypos)
			headers[i]:Show()
			
			if isFaction and DTD_Database.profile.showRep then
				local repbar = CreateFrame("StatusBar", nil, DTD.TrackingFrame)
				repbar:SetPoint("TOPLEFT", DTD.TrackingFrame, "TOPLEFT", 16, -ypos)
				repbar:SetWidth(headers[i]:GetWidth()+12)
				repbar:SetHeight(14)
				repbar:SetStatusBarTexture("Interface\\Addons\\DailyTodos\\Textures\\Bar")
				repbar:GetStatusBarTexture():SetHorizTile(false)
				repbar:GetStatusBarTexture():SetVertTile(false)
				repbar:SetStatusBarColor(FACTION_BAR_COLORS[standingID].r,FACTION_BAR_COLORS[standingID].g,FACTION_BAR_COLORS[standingID].b)
				repbar:SetMinMaxValues(barMin,barMax)
				repbar:SetValue(barValue)
				
				repbar.bg = repbar:CreateTexture(nil, "BACKGROUND")
				repbar.bg:SetTexture("Interface\\Addons\\DailyTodos\\Textures\\Bar")
				repbar.bg:SetAllPoints(true)
				repbar.bg:SetVertexColor(0.35*FACTION_BAR_COLORS[standingID].r, 0.35*FACTION_BAR_COLORS[standingID].g, 0.35*FACTION_BAR_COLORS[standingID].b)
				
				repbar.value = repbar:CreateFontString(nil, nil,"GameFontNormal")
				repbar.value:SetPoint("CENTER", repbar, "CENTER", 0, 0)
				--repbar.value:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
				repbar.value:SetJustifyH("CENTER")
				repbar.value:SetShadowOffset(1, -1)
				repbar.value:SetTextColor(1, 1, 1)
				repbar.value:SetText(v["n"])
				
				repbar:SetScript("OnEnter",function ()
												repbar.value:SetText((barValue-barMin).." / "..(barMax-barMin))
											end)
				repbar:SetScript("OnLeave",function () repbar.value:SetText(v["n"]) end)
			end
			
			ypos = ypos+16
			--	make sure the header is expanded
			if DTD_Database.profile.trackFactionsExpanded[id] then
				-- Detect a prof quest
--[[				if id < 10 then
					local qCat = 0
					if id < 4 then
						qCat = 1
					elseif id < 7 then
						qCat = 3
					elseif id == 7 then
						qCat = 5
					end
					qCat = qCat + (DTD_Database.profile.friendly-1)
					cat = factions[qCat]["id"]
					--print(factions[qCat]["name"])
				end
				local cat = dailyQuests[id] -- TODO
]]    			for n, q in pairs(v['q']) do
    				local quest = DailyTodoQuests[q]
                    if quest == nil then
                        local loaded, reason = LoadAddOn("DailyTodos_Quests")

                        if not loaded then
                            print("Failed to load quest DB. " .. reason)
                        else
                            quest = dtd_dailyQuests[q]
                            DailyTodoQuests[q] = dtd_dailyQuests[q]
                        end

                    end

            		-- TODO filter by character level UnitLevel("player")
    				-- If the quest is the right faction, or neutral and the quest is not one selected to be ignored and is not a holiday quest
					if (quest["s"] == DTD_Database.realm.side[CharacterName] or quest["s"] == nil) and quest["c"] ~= 1008 and DTD_Database.profile.dontTrack[q] ~= true then
						local level = quest["l"]
						local color = "|cffFFFFFF"
						
						----
						---- Create the little icon thingy
						----
						lblBtns[i.."-"..n] = CreateFrame("Button",nil,DTD.TrackingFrame)
						lblBtns[i.."-"..n]:RegisterForClicks("LeftButtonUp","RightButtonUp")
						local tx = lblBtns[i.."-"..n]:CreateTexture()
						tx:SetAllPoints(lblBtns[i.."-"..n])
						lblBtns[i.."-"..n]:SetBackdrop(tx)
						lblBtns[i.."-"..n]:SetWidth(12)
						lblBtns[i.."-"..n]:SetHeight(12)
						lblBtns[i.."-"..n]:SetAlpha(1)
						if DTD_Database.realm.completedQuests[CharacterName][q] then
							tx:SetTexture(QUEST_COMPLETE,1)
						elseif DTD_Database.realm.acceptedQuests[CharacterName][q] then
							tx:SetTexture(QUEST_ACCEPTED,1)
						else
							tx:SetTexture(QUEST_AVAILABLE,1)
						end	
						lblBtns[i.."-"..n]:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",15,-ypos)
						lblBtns[i.."-"..n]:Show()
						----
						---- Create the label for the quest
						----
						lbls[i.."-"..n] = DTD.TrackingFrame:CreateFontString("quest"..n,nil,"GameFontNormalSmall")
						if DTD_Database.realm.completedQuests[CharacterName][q] then
							color = "|cff00FF00"
						end
						
						-- Not a profession quest, so localize the name automatically
						if q > 10 then
							quest["n"] = quest_names[q] -- fix for Torhal's localization code. reload the data so it doesn't say "unknown"
							quest["n"] = quest_names[q]
						end
						if level == nil or level < 1 then
							lbls[i.."-"..n]:SetText(color..quest["n"].."|r")
						else
							lbls[i.."-"..n]:SetText("|cff74BBFB["..quest["l"].."]|r "..color..quest["n"].."|r")
						end
						lbls[i.."-"..n]:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",27,-ypos)
						lbls[i.."-"..n]:Show()
						
						----
						---- Create the invisible button so that the list items are clickable
						----
						
						lblBtns[i.."-"..n] = CreateFrame("Button",nil,DTD.TrackingFrame)
						lblBtns[i.."-"..n]:RegisterForClicks("LeftButtonUp","RightButtonUp")
						local tx = lblBtns[i.."-"..n]:CreateTexture()
						tx:SetAllPoints(lblBtns[i.."-"..n])
						tx:SetTexture(1,1,1,0.1)
						lblBtns[i.."-"..n]:SetHighlightTexture(tx)
						lblBtns[i.."-"..n]:SetWidth(lbls[i.."-"..n]:GetStringWidth())
						lblBtns[i.."-"..n]:SetHeight(12)
						lblBtns[i.."-"..n]:SetAlpha(1)
						lblBtns[i.."-"..n]:SetPoint("TOPLEFT",DTD.TrackingFrame,"TOPLEFT",27,-ypos)
						lblBtns[i.."-"..n]:SetScript("OnClick", function (_, button)
																	if button == "RightButton" then
																		DTD_Database.profile.dontTrack[q] = true
																		DTD:ReloadTrackingFrame()
																	else
																		if DTD_Database.realm.completedQuests[CharacterName][q] then
																			DTD_Database.realm.completedQuests[CharacterName][q] = nil
																		else
																			DTD_Database.realm.completedQuests[CharacterName][q] = true
																		end
																		DTD:ReloadTrackingFrame()
																	end
																end) 
						lblBtns[i.."-"..n]:SetScript("OnEnter", function ()
																	if DTD_Tooltips then
																		DTD_Tooltips:CreateQuestTooltip(lblBtns[i.."-"..n],q)
																	end
																end)
						lblBtns[i.."-"..n]:SetScript("OnLeave", function ()
																	if DTD_Tooltips then
																		QTip:Release(self.tooltip)
																		self.tooltip = nil
																		--GameTooltip:Hide()
																	end
																end)
						lblBtns[i.."-"..n]:Show()
						
						ypos = ypos+12
					end
				end
			end
		end
    end
    
    -- Reposition after creating
    DTD.TrackingFrame:SetHeight(ypos+32)
    local xO,yO = DTD_Database.profile.TrackingFramePos[1],DTD_Database.profile.TrackingFramePos[2]
    DTD.TrackingFrame:SetPoint(DTD_Database.profile.TrackingFramePos[3],nil,DTD_Database.profile.TrackingFramePos[3],xO,yO-(DTD.TrackingFrame:GetHeight()/2))
    
    collectgarbage()
    
    if not DTD_Database.profile.showTrackingFrame then
		DTD.TrackingFrame:Hide()
	else
		DTD.TrackingFrame:Show()
	end
end

function DTD:ReloadTrackingFrame()
	-- Reload the onscreen tracking frame
	local point, relativeTo, relativePoint, xOfs, yOfs = DTD.TrackingFrame:GetPoint()
	DTD_Database.profile.TrackingFramePos[1] = xOfs
    DTD_Database.profile.TrackingFramePos[2] = yOfs+(DTD.TrackingFrame:GetHeight()/2)
    DTD_Database.profile.TrackingFramePos[3] = point
	
	DTD.TrackingFrame:Hide()
	DTD.TrackingFrame = nil
	collectgarbage()
	
	DTD:CreateTrackingFrame()
end

--
-- Minimap Button
--

function DTD:CreateMinimapButton()
	-- create / register the minimap button
	DTD.LDBIcon:Register("DTD", DTDLauncher, DTD_Database.profile.minimapIcon)
end

--
--	QUEST TRACKING
--

function DTD:QUEST_ACCEPTED(_,id)
	local _, _, _, _, _, _, _, isDaily, questID = GetQuestLogTitle(id)
	if isDaily then
		-- Correct for profession quests
		if professionQuests[questID] ~= nil then
			DTD_Database.realm.acceptedQuests[CharacterName][professionQuests[questID]] = true
		-- Set the quest to accepted
		else
			DTD_Database.realm.acceptedQuests[CharacterName][questID] = true
		end
	end
	DTD:ReloadTrackingFrame()
end

function DTD:QUEST_COMPLETE()
	local name = GetTitleText()
	local message = "|cff22CCFF\"".. name .. "\"|r complete!"
	DTD_Announcements:Announce(message)
	
	local questID = nil

	for id=1, GetNumQuestLogEntries() do
		local title, _, _, _, _, _, _, _, qid = GetQuestLogTitle(id)
		if title == name then
			questID = qid
			break
		end
	end
	
	if questID ~= nil then
		if professionQuests[questID] then
			DTD_Database.realm.completedQuests[CharacterName][professionQuests[questID]] = true
            DTD_Database.realm.acceptedQuests[CharacterName][professionQuests[questID]] = nil
		else
			DTD_Database.realm.completedQuests[CharacterName][questID] = true
            DTD_Database.realm.acceptedQuests[CharacterName][questID] = nil
		end

		
		DTD:ReloadTrackingFrame()
	end
end


function DTD:ResetData()
	DTD_Database:ResetDB()
	collectgarbage()
	
	DailyTodos_Updates = DailyTodos_BigUpdate - 5

	DTD.LDBIcon:Show("DTD")
	DTD:ReloadTrackingFrame()
end

--
-- Reset completed quests for all characters in the realm if Dailies have reset.
--
function DTD_ResetExpiredDailies()
	-- expire any completed dailies that are too IsAddOnLoaded
	local t = time()
	if t > DTD_Database.realm.nextReset then
		DTD_Database.realm.nextReset = t + GetQuestResetTime()
		for name in pairs(DTD_Database.realm.side) do
			DTD_Database.realm.completedQuests[name] = {}
		end
		DTD_Database.realm.dailyHeroic = {}
		DTD_Database.realm.dailyMythic = {}
		DTD:ReloadTrackingFrame()
	end
end


--
-- OnUpdate, just for fun
--
function DTD_OnUpdate(self, elapsed)
	DailyTodos_TimeSinceLastUpdate = DailyTodos_TimeSinceLastUpdate + elapsed; 	

	if (DailyTodos_TimeSinceLastUpdate > DailyTodos_UpdateInterval) then
		DTD.timer:SetText("|cffFFFFFF ("..GetDailyQuestsCompleted().."/"..GetMaxDailyQuests()..") "..SecondsToTime(GetQuestResetTime()).."|r")
		DTD_ResetExpiredDailies()
		DailyTodos_TimeSinceLastUpdate = 0;
		DailyTodos_Updates = DailyTodos_Updates + 1

		if DailyTodos_Updates > DailyTodos_BigUpdate then
			-- update this characters accepted daily quests
			DTD_Database.realm.acceptedQuests[CharacterName] = {}
			for id=1, 50 do -- GetNumQuestLogEntries returns unreliable results.  this is the maximum amount of header+quests a person can have
				local _, _, _, _, _, _, _, isDaily, questID = GetQuestLogTitle(id)
				if isDaily then
					DTD_Database.realm.acceptedQuests[CharacterName][questID] = true
				end
			end
			-- check if the daily TBC Heroic has been completed
			local doneToday, _, _, _, _, _ = GetLFGDungeonRewards(418)
			if doneToday then
				DTD_Database.realm.dailyHeroic[CharacterName] = true
			else
				DTD_Database.realm.dailyHeroic[CharacterName] = nil
			end
			-- check if the daily TBC Mythic has been completed
			local doneToday, _, _, _, _, _ = GetLFGDungeonRewards(419)
			if doneToday then
				DTD_Database.realm.dailyMythic[CharacterName] = true
			else
				DTD_Database.realm.dailyMythic[CharacterName] = nil
			end
			DailyTodos_Updates = 0
		end
	end
end