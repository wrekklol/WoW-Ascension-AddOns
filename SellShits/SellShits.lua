SellShits = { }

function SellShits:OnInitialize()
	SellButton:Hide()

	self:RegisterEvent("MERCHANT_SHOW");
	self:RegisterEvent("MERCHANT_CLOSED");
end;

function SellShits:MERCHANT_SHOW()
	SellButton:Show()
	self:Sell(true);
end;

function SellShits:MERCHANT_CLOSED()
	SellButton:Hide()
end;

function SellShits:Sell(bTrashOnly)
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
end;