local PartyMembers = { }



function Party:OnEnable()
	PartyMembers.player = 
	{
		Index = 0,
		HealthText = PlayerHealthText
	}
	PartyMembers.party1 = 
	{
		Index = 1,
		HealthText = Party1HealthText
	}
	PartyMembers.party2 = 
	{
		Index = 2,
		HealthText = Party2HealthText
	}
	PartyMembers.party3 = 
	{
		Index = 3,
		HealthText = Party3HealthText
	}
	PartyMembers.party4 = 
	{
		Index = 4,
		HealthText = Party4HealthText
	}

	Party:RegisterEvent("UNIT_HEALTH", function(InEvent, InUnit) Party:OnHealthChange(InUnit) end)
	Party:RegisterEvent("PARTY_MEMBERS_CHANGED", function(InEvent) Party:OnPartyChange() end)

	PartyFrame:Show()

	Party:InitHealBindings()
	Party:OnPartyChange()
end



function Party:OnHealthChange(InUnit)
	if PartyMembers[InUnit] == nil or PartyMembers[InUnit].HealthText == nil then
		do return end
	end
	
	local HealthPercent = Party:GetHealthPercent(InUnit)
	local HealthText = PartyMembers[InUnit].HealthText

	if Party:CanHealUnit(InUnit) and HealthPercent < 100 then
		HealthText:SetText(math.floor(HealthPercent))
	else
		HealthText:SetText("-")
	end
end

function Party:GetHealthPercent(InUnit)
	if UnitIsFriend("player", InUnit) then
		return (UnitHealth(InUnit) / UnitHealthMax(InUnit)) * 100
	end
	return UnitHealth(InUnit)
end

function Party:CanHealUnit(InUnit, InSpellName)
	if InUnit == nil or UnitExists(InUnit) == nil then
		return false
	end

	local bIsCharmed = (UnitIsCharmed(InUnit) == 1)
	local bIsCorpse = (UnitIsCorpse(InUnit) == 1)
	local bIsDeadOrGhost = (UnitIsDeadOrGhost(InUnit) == 1)
	local bIsFriend = (UnitIsFriend("player", InUnit) == 1)
	local bIsInRange = ((UnitInParty(InUnit) == nil or UnitInRange(InUnit) == 1) and (InSpellName == nil or IsSpellInRange(InSpellName, InUnit) == 1))
	local bIsConnected = (UnitIsConnected(InUnit) == 1)
	local bIsVisible = (UnitIsVisible(InUnit) == 1)

	if bIsCharmed == true then
		print("UnitIsCharmed: " .. tostring(bIsCharmed))
	end
	if bIsCorpse == true then
		print("UnitIsCorpse: " .. tostring(bIsCorpse))
	end
	if bIsDeadOrGhost == true then
		print("UnitIsDeadOrGhost: " .. tostring(bIsDeadOrGhost))
	end
	if bIsFriend == false then
		print("UnitIsFriend: " .. tostring(bIsFriend))
	end
	if bIsInRange == false then
		print("UnitInRange: " .. tostring(bIsInRange))
	end
	if bIsConnected == false then
		print("UnitIsConnected: " .. tostring(bIsConnected))
	end
	if bIsVisible == false then
		print("UnitIsVisible: " .. tostring(bIsVisible))
	end

	local bCanHeal = (bIsCharmed == false and 
		bIsCorpse == false and 
		bIsDeadOrGhost == false and 
		bIsFriend == true and 
		bIsInRange == true and 
		bIsConnected == true and 
		bIsVisible == true);

	print("CAN HEAL: " .. tostring(bCanHeal))

	return bCanHeal
end



function Party:OnPartyChange()
	TankIndicator:Hide()

	for k in pairs(PartyMembers) do
		print(k)
		Party:OnHealthChange(k)
		if UnitInParty(k) ~= nil then
			--Party:OnHealthChange(k)
			if Party:UnitIsTank(k) then
				Party:SetTank(k)
			end
		end
	end
end

function Party:SetTank(InUnit)
	TankIndicator:Show()
	TankIndicator:SetText("T" .. PartyMembers[InUnit].Index)
end

function Party:UnitIsTank(InUnit)
	return UnitGroupRolesAssigned(InUnit) == "TANK"
end



function Party:InitHealBindings()
	-- Start Prefix
	local BigHealsPrefix = "CTRL-SHIFT-"
	local SmallHealsPrefix = "CTRL-ALT-"
	local InstantHealsPrefix = ""
	local AoEHealsPrefix = "ALT-"
	local HoTHealsPrefix = "SHIFT-"
	local ShortBuffsPrefix = "CTRL-"
	-- End Prefix

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
	local ok = SetBindingSpell(HoTHealsPrefix .. "2", "Rejuvenation") -- Druid
	SetBindingSpell(HoTHealsPrefix .. "3", "Lifebloom") -- Druid

	-- Short Buffs
	SetBindingSpell(ShortBuffsPrefix .. "1", "Power Word: Shield") -- Priest
	SetBindingSpell(ShortBuffsPrefix .. "2", "Earth Shield") -- Shaman
	SetBindingSpell(ShortBuffsPrefix .. "3", "Beacon of Light") -- Paladin
	SetBindingSpell(ShortBuffsPrefix .. "3", "Pain Suppression") -- Priest
	-- End Binding

	print(ok)
end

function Party:ClearHealBindings()
	--for i = 1, 9 do
	--	SetBinding(BigHealsPrefix .. i)
	--	SetBinding(SmallHealsPrefix .. i)
	--	SetBinding(InstantHealsPrefix .. i)
	--	SetBinding(AoEHealsPrefix .. i)
	--	SetBinding(HoTHealsPrefix .. i)
	--	SetBinding(ShortBuffsPrefix .. i)
	--end
end
