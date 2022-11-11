local PartyMemberIDs = { "player", "party1", "party2", "party3", "party4" }



function Party:OnEnable()
	print("prut")
	print("prut")
	print("prut")

	Party:RegisterEvent("UNIT_HEALTH", function(InEvent, InUnit) Party:OnHealthChange(InUnit) end)
	Party:RegisterEvent("PARTY_MEMBERS_CHANGED", function(InEvent) Party:OnPartyChange() end)
	
	PartyFrame:Show()
	
	--print(tostring(SpellMacroCreator == nil))
	--SpellMacroCreator:CreateBigHealMacro()

	Party:InitHealBindings()
end



function Party:OnHealthChange(InUnit)
	local UnitHealth = Party:GetHealthPercent(InUnit)
	local UnitHealthBar, UnitHealthText = Party:GetHealthBar(InUnit)

	if Party:CanHealUnit(InUnit) then
		UnitHealthBar:SetStatusBarColor(0, 1, 0)
		UnitHealthBar:SetValue(UnitHealth)
		UnitHealthText:SetText(math.floor(UnitHealth))
	else
		UnitHealthBar:SetStatusBarColor(0.1, 0.1, 0.1)
		UnitHealthBar:SetValue(100)
		UnitHealthText:SetText("")
	end
end

function Party:GetHealthPercent(InUnit)
	if UnitIsFriend("player", InUnit) then
		return (UnitHealth(InUnit) / UnitHealthMax(InUnit)) * 100
	end
	return UnitHealth(InUnit)
end

function Party:GetHealthBar(InUnit)
	if InUnit == "player" then
		return Party1Health, Party1HealthText
	end
	if InUnit == "party1" then
		return Party2Health, Party2HealthText
	end
	if InUnit == "party2" then
		return Party3Health, Party3HealthText
	end
	if InUnit == "party3" then
		return Party4Health, Party4HealthText
	end
	if InUnit == "party4" then
		return Party5Health, Party5HealthText
	end
end

function Party:CanHealUnit(InUnit, InSpellName)
	if InUnit == nil or UnitExists(InUnit) == nil then
		return false
	end

	local bIsCharmed = (UnitIsCharmed(InUnit) == 1)
	local bIsCorpse = (UnitIsCorpse(InUnit) == 1)
	local bIsDeadOrGhost = (UnitIsDeadOrGhost(InUnit) == 1)
	local bIsFriend = (UnitIsFriend("player", InUnit) == 1)
	local bIsInRange = ((UnitInParty(InUnit) == nil or UnitInRange(InUnit) == 1) and InSpellName == nil or IsSpellInRange(InSpellName, InUnit) == 1)
	local bIsConnected = (UnitIsConnected(InUnit) == 1)
	local bIsVisible = (UnitIsVisible(InUnit) == 1)

	print("UnitIsCharmed: " .. tostring(bIsCharmed))
	print("UnitIsCorpse: " .. tostring(bIsCorpse))
	print("UnitIsDeadOrGhost: " .. tostring(bIsDeadOrGhost))
	print("UnitIsFriend: " .. tostring(bIsFriend))
	print("UnitInRange: " .. tostring(bIsInRange))
	print("UnitIsConnected: " .. tostring(bIsConnected))
	print("UnitIsVisible: " .. tostring(bIsVisible))

	local bCanHeal = (bIsCharmed == false and 
		bIsCorpse ~= true and 
		bIsDeadOrGhost ~= true and 
		bIsFriend == true and 
		bIsInRange == true and 
		bIsConnected == true and 
		bIsVisible == true);

	print("CAN HEAL: " .. tostring(bCanHeal))

	return bCanHeal
end



function Party:OnPartyChange()
	TankIndicator:Hide()

	for i, id in pairs(PartyMemberIDs) do
		if UnitInParty(id) ~= nil then
			Party:OnHealthChange(id)
			if Party:UnitIsTank(id) then
				SetTank(id)
			end
		end
	end
end

function Party:SetTank(InUnit)
	TankIndicator:Show()

	for i, id in pairs(PartyMemberIDs) do
		if InUnit == id then
			TankIndicator:SetPoint("BOTTOMRIGHT", PartyFrame, "TOPLEFT", -141, 98 - 20 * i)
			break
		end
	end
end

function Party:UnitIsTank(InUnit)
	return UnitGroupRolesAssigned(InUnit) == "TANK"
end



function Party:InitHealBindings()
	-- Start Prefix
	local BigHealsPrefix = "CTRL-SHIFT-NUMPAD"
	local SmallHealsPrefix = "CTRL-ALT-NUMPAD"
	local InstantHealsPrefix = "NUMPAD"
	local AoEHealsPrefix = "ALT-NUMPAD"
	local HoTHealsPrefix = "SHIFT-NUMPAD"
	local ShortBuffsPrefix = "CTRL-NUMPAD"
	-- End Prefix

	for i = 1, 9 do
		SetBinding(BigHealsPrefix .. i)
		SetBinding(SmallHealsPrefix .. i)
		SetBinding(InstantHealsPrefix .. i)
		SetBinding(AoEHealsPrefix .. i)
		SetBinding(HoTHealsPrefix .. i)
		SetBinding(ShortBuffsPrefix .. i)
	end

	-- Start Binding
	-- Big Heals
	SetBindingSpell(BigHealsPrefix .. "1", "Greater Heal") -- Priest
	SetBindingSpell(BigHealsPrefix .. "2", "Healing Touch") -- Druid
	SetBindingSpell(BigHealsPrefix .. "3", "Healing Wave") -- Shaman
	SetBindingSpell(BigHealsPrefix .. "4", "Holy Light") -- Paladin

	-- Small Heals
	SetBindingSpell(SmallHealsPrefix .. "1", "Flash Heal") -- Priest
	SetBindingSpell(SmallHealsPrefix .. "2", "Regrowth") -- Druid
	SetBindingSpell(SmallHealsPrefix .. "3", "Lesser Healing Wave") -- Shaman
	SetBindingSpell(SmallHealsPrefix .. "4", "Flash of Light") -- Paladin
	SetBindingSpell(SmallHealsPrefix .. "5", "Binding Heal") -- Priest
	SetBindingSpell(SmallHealsPrefix .. "6", "Penance") -- Priest

	-- Instant Heals
	SetBindingSpell(InstantHealsPrefix .. "1", "Holy Nova") -- Priest
	SetBindingSpell(InstantHealsPrefix .. "2", "Swiftmend") -- Druid
	SetBindingSpell(InstantHealsPrefix .. "3", "Holy Shock") -- Paladin
	SetBindingSpell(InstantHealsPrefix .. "4", "Lay on Hands") -- Paladin
	SetBindingSpell(InstantHealsPrefix .. "5", "Prayer of Mending") -- Priest
	SetBindingSpell(InstantHealsPrefix .. "5", "Riptide") -- Shaman

	-- AoE Heals
	SetBindingSpell(AoEHealsPrefix .. "1", "Prayer of Healing") -- Priest
	SetBindingSpell(AoEHealsPrefix .. "2", "Wild Growth") -- Druid
	SetBindingSpell(AoEHealsPrefix .. "3", "Chain Heal") -- Shaman
	SetBindingSpell(AoEHealsPrefix .. "4", "Tranquility") -- Druid
	SetBindingSpell(AoEHealsPrefix .. "5", "Efflorescence") -- Druid
	SetBindingSpell(AoEHealsPrefix .. "6", "Circle of Healing") -- Priest
	SetBindingSpell(AoEHealsPrefix .. "7", "Halo") -- Priest
	SetBindingSpell(AoEHealsPrefix .. "7", "Healing Rain") -- Shaman

	-- HoT Heals
	SetBindingSpell(HoTHealsPrefix .. "1", "Renew") -- Priest
	SetBindingSpell(HoTHealsPrefix .. "2", "Rejuvenation") -- Druid
	SetBindingSpell(HoTHealsPrefix .. "3", "Lifebloom") -- Druid

	-- Short Buffs
	SetBindingSpell(ShortBuffsPrefix .. "1", "Power Word: Shield") -- Priest
	SetBindingSpell(ShortBuffsPrefix .. "2", "Earth Shield") -- Shaman
	SetBindingSpell(ShortBuffsPrefix .. "3", "Beacon of Light") -- Paladin
	SetBindingSpell(ShortBuffsPrefix .. "3", "Pain Suppression") -- Priest
	-- End Binding
end