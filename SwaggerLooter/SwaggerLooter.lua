function slInit()
	slSetVariables();

	this:RegisterEvent("CONFIRM_DISENCHANT_ROLL");
	this:RegisterEvent("CONFIRM_LOOT_ROLL");
	this:RegisterEvent("START_LOOT_ROLL");
	StaticPopupDialogs["CONFIRM_LOOT_ROLL"] = nil;
end

function slEvent(event, ...)
	if event == "START_LOOT_ROLL" then
		local id, timer = ...;
		local _, _, _, quality, _, _, canGreed, canDE = GetLootRollItemInfo(id);
		if quality < 3 then
			if canGreed and not bDisenchantOverGreed then
				RollOnLoot(id, 2)
			elseif canDE then
				RollOnLoot(id, 3)
			end
		end
	elseif event == "CONFIRM_DISENCHANT_ROLL" or event == "CONFIRM_LOOT_ROLL" then
		local id, t = ...;
		ConfirmLootRoll(id, t);
	end
end

function slSetVariables()
	if (not slSettings) then
		slSettings = {};
		slSettings.bIsEnabled = true;
		slSettings.bDisenchantOverGreed = false;
	end
end

function slConfigFrame_OnShow()
	slConfigFrameEnabled:SetChecked(slSettings.bIsEnabled)
	slConfigFrameDisenchantOverGreed:SetChecked(slSettings.bDisenchantOverGreed)
end

function slConfigFrame_OnLoad(panel)
	panel.name = "Swagger Looter";

	panel.okay = function(self)
		slSettings.bIsEnabled = slConfigFrameEnabled:GetChecked();
		slSettings.bDisenchantOverGreed = slConfigFrameDisenchantOverGreed:GetChecked();
	end

	panel.cancel = function(self)
		slConfigFrame_OnShow()
	end

	InterfaceOptions_AddCategory(panel);
end