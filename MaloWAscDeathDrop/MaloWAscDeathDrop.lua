
-- Frame setup for udpate
local total = 0
local function madd_update(self, elapsed)
	total = total + elapsed
	if total >= 0.1 then
		total = 0
		madd_onUpdate()
    end
end

local f = CreateFrame("frame", "MaloWAscDeathDrop", UIParent)
f:SetPoint("CENTER")
f:SetScript("OnUpdate", madd_update)
f:SetSize(1, 1)
f:Show()

-- Prints message in chatbox
function madd_Print(msg)
	MaloWUtils_Print("MADD: " .. msg)
end

local lastItemChange = nil
local lastDeath = nil
-- Events
local hasLoaded = false
function madd_onEvent(self, event, arg1, ...)
	if event == "ADDON_LOADED" and arg1 == "MaloWPlayground" then
		hasLoaded = true
		lastItemChange = GetTime()
	elseif event == "BAG_UPDATE" or event == "UNIT_INVENTORY_CHANGED" then 
		lastItemChange = GetTime()
	elseif event == "PLAYER_DEAD" then 
		lastDeath = GetTime()
	end
end
f:RegisterEvent("ADDON_LOADED");
f:RegisterEvent("BAG_UPDATE");
f:RegisterEvent("UNIT_INVENTORY_CHANGED");
f:RegisterEvent("PLAYER_DEAD");
f:SetScript("OnEvent", madd_onEvent);


-- OnUpdate
function madd_onUpdate(self, elapsed)
	if lastItemChange and lastDeath == nil and GetTime() > lastItemChange + 1 then
		lastItemChange = nil
		madd_updateItemState()
		return
	end
	
	if lastDeath and GetTime() > lastDeath + 1 then
		lastDeath = nil
		madd_printLostItems()
		return
	end
end

local itemState = {}
function madd_updateItemState()
	itemState = MaloWUtils_GetEquippedAndInventoryItemState()
end

function madd_printLostItems()
	local prints = {}
	for slot = 0, 23 do 
		itemId = GetInventoryItemID("player", slot);
		local item = itemState["equipped"][slot]
		if not itemId and item then 
			prints[#prints + 1] = "Dropped equipped item: " .. item.link
		end
	end
	for bag = 0, 4 do 
		for bagSlot = 1, GetContainerNumSlots(bag) do 
			local itemId = GetContainerItemID(bag, bagSlot)
			local item = itemState["bags"][bag][bagSlot]
			if not itemId and item then 
				if item.count > 1 then 
					prints[#prints + 1] = "Dropped item in bags: " .. item.link .. "x" .. tostring(item.count)
				else
					prints[#prints + 1] = "Dropped item in bags: " .. item.link
				end
			elseif itemId and item then 
				local texture, itemCount, locked, quality, readable, lootable = GetContainerItemInfo(bag, bagSlot)
				if itemCount < item.count then 
					prints[#prints + 1] = "Dropped item in bags: " .. item.link .. "x" .. tostring(item.count - itemCount)
				end
			end
		end
	end 
	if #prints > 0 then
		MaloWUtils_Print("MaloWAscDeathDrop report:")
		for i = 1, #prints do 
			MaloWUtils_Print(prints[i])
		end
	end
end







