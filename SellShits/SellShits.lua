function ssInit()
	SellButton:Hide();

	this:RegisterEvent("MERCHANT_SHOW");
	this:RegisterEvent("MERCHANT_CLOSED");
end

function ssEvent()
	if event == "MERCHANT_SHOW" then
		SellButton:Show();
		Sell(true);
	elseif event == "MERCHANT_CLOSED" then
		SellButton:Hide();
	end
end

function Sell(bTrashOnly)
	-- local qstr = "";
	local i = 0;
	-- local _, caClass = UnitClass("player");
	repeat
		if not (GetContainerNumSlots(i) == nil) then
			ItemSlotNum = GetContainerNumSlots(i);

			j = 1;
			repeat
				ItemLink = GetContainerItemLink(i, j);
				if not (ItemLink == nil) then                        
					_, _, ItemQuality, ItemLevel, _, ItemType, _, _, _, _ = GetItemInfo(ItemLink);
					if (bTrashOnly) then
						if (ItemQuality == 0) then
							UseContainerItem(i, j);
						end
					else
						if (ItemQuality <= 2 and (ItemType == "Armor" or ItemType == "Weapon")) then
							UseContainerItem(i, j);
						end
					end
				end
				j = j + 1;
			until j >= ItemSlotNum + 1;
		end
		i = i + 1;
	until i >= 5
end