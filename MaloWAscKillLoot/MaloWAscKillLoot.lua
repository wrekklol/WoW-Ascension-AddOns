
-- Frame setup for update
local total = 0
local function makl_update(self, elapsed)
	total = total + elapsed
	if total >= 0.1 then
		total = 0
		makl_onUpdate()
    end
end
local f = CreateFrame("frame", "MaloWAscKillLootFrame", UIParent)
f:SetPoint("CENTER")
f:SetScript("OnUpdate", makl_update)
f:SetSize(1, 1)
f:Show()

-- Cmds
SlashCmdList["MAKLCOMMAND"] = function(msg)
	local arguments = MaloWUtils_SplitStringOnSpace(msg)
	local command = arguments[1]
	if command == "asd" then
		makl_asd()
	else
		makl_print("Unrecognized command: " .. command)
	end
end 
SLASH_MAKLCOMMAND1 = "/makl";

-- Prints message in chatbox
function makl_print(msg)
	MaloWUtils_Print("MAKL: " .. msg)
end

-- Events
local hasLoaded = false
local lastHonorKillTime = nil
local lastMoneyChangeTime = nil
local lastMoney = 0
function makl_onEvent(self, event, arg1, arg2, arg3, arg4, ...)
	if event == "ADDON_LOADED" and arg1 == "MaloWAscKillLoot" then
		hasLoaded = true
		lastMoney = GetMoney()
	elseif event == "PLAYER_PVP_KILLS_CHANGED" then
		lastHonorKillTime = GetTime()
	elseif event == "PLAYER_MONEY" then
		lastMoneyChangeTime = GetTime()
	elseif event == "CHAT_MSG_ADDON" then 
		if arg1 and string.sub(arg1, 1, 5) == "MAKL:" then 
			if arg4 ~= UnitName("player") then
				makl_print(arg4 .. string.sub(arg1, 6))
			end
		end
	end
end
f:RegisterEvent("ADDON_LOADED");
f:RegisterEvent("PLAYER_PVP_KILLS_CHANGED");
f:RegisterEvent("PLAYER_MONEY");
f:RegisterEvent("CHAT_MSG_ADDON");
f:SetScript("OnEvent", makl_onEvent);

local ascAddonsLoaded = false
-- OnUpdate
function makl_onUpdate(self, elapsed)
	if not ascAddonsLoaded  and first_frame ~= nil then
		ascAddonsLoaded = true
		local hookAscFrame = CreateFrame("frame", nil, first_frame)
		hookAscFrame:SetPoint("CENTER")
		hookAscFrame:SetScript("OnShow", makl_onShow)
		hookAscFrame:SetScript("OnHide", makl_onHide)
		hookAscFrame:SetSize(1, 1)
	end
	makl_checkForGainedMoney()
end


local itemStateBeforeLoot = {}
function makl_onShow(self)
	makl_announce(" opened loot")
	itemStateBeforeLoot = MaloWUtils_GetEquippedAndInventoryItemState()
end

function makl_onHide(self)
	makl_announceGainedItems()
end

function makl_checkForGainedMoney()
	local now = GetTime()
	if lastHonorKillTime and lastHonorKillTime + 1 < now and lastMoneyChangeTime and lastMoneyChangeTime + 1 < now then
		local nowMoney = GetMoney()
		local gainedMoney = nowMoney - lastMoney
		if gainedMoney > 1000 * UnitLevel("player") then 
			makl_announceGainedMoney(gainedMoney)
			lastMoney = nowMoney
			lastHonorKillTime = nil
			lastMoneyChangeTime = nil
			return
		end
	end
	
	if lastHonorKillTime and lastHonorKillTime + 1 < now then
		lastHonorKillTime = nil
	end
	
	if lastMoneyChangeTime and lastMoneyChangeTime + 1 < now then 
		lastMoney = GetMoney()
		lastMoneyChangeTime = nil
	end
end

function makl_announceGainedMoney(gainedMoney)
	makl_announce(" looted " .. tostring(gainedMoney / 10000) .. "g.")
end

function makl_announceGainedItems()
	local prints = {}
	for bag = 0, 4 do 
		for bagSlot = 1, GetContainerNumSlots(bag) do 
			local itemId = GetContainerItemID(bag, bagSlot)
			local item = itemStateBeforeLoot["bags"][bag][bagSlot]
			if itemId and not item then 
				local texture, itemCount, locked, quality, readable, lootable = GetContainerItemInfo(bag, bagSlot)
				local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, 
					itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)
				if itemCount > 1 then 
					prints[#prints + 1] = " looted item: " .. itemLink .. "x" .. tostring(itemCount)
				else
					prints[#prints + 1] = " looted item: " .. itemLink
				end
			elseif itemId and item then 	
				local texture, itemCount, locked, quality, readable, lootable = GetContainerItemInfo(bag, bagSlot)
				if itemCount > item.count then 
					prints[#prints + 1] = " looted item: " .. item.link .. "x" .. tostring(itemCount - item.count)
				end
			end
		end
	end 
	if #prints > 0 then
		for i = 1, #prints do 
			makl_announce(prints[i])
		end
	end
end

function makl_announce(msg)
	--MaloWUtils_Print("MAKL Announce: " .. msg)
	SendAddonMessage("MAKL:" .. msg, "DoesntWork", "RAID");
end



-- 
function makl_asd()
	
end






