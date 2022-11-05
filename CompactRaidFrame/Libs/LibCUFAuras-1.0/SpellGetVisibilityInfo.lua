local lib, version = LibStub("LibCUFAuras-1.0");
if ( not lib ) then error("not found LibCUFAuras-1.0") end
if ( version > 1 ) then return end

local PLAYER_CLASS = select(2, UnitClass("player"));

local function SetRaidCombatInfo(hasCustom, alwaysShowMine, showForMySpec)
    return {
        hasCustom = hasCustom, -- whether the spell visibility should be customized, if false it means always display
        alwaysShowMine = alwaysShowMine,-- whether to show the spell if cast by the player/player's pet/vehicle (e.g. the Paladin Forbearance debuff)
        showForMySpec = showForMySpec, -- whether to show the spell for the current specialization of the player
    };
end

local CLASS_AURAS = {
    --== PRIEST ==--
    -- Weakened Soul
    [GetSpellInfo(6788)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, true, true),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Divine Spirit
    [GetSpellInfo(48073)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Prayer of Spirit
    [GetSpellInfo(48074)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Shadow Protection
    [GetSpellInfo(48169)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Prayer of Shadow Protection
    [GetSpellInfo(48170)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Prayer of Fortitude
    [GetSpellInfo(48162)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Power Word: Fortitude
    [GetSpellInfo(48161)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== DEATHKNIGHT ==--
    -- Winter Horn
    [GetSpellInfo(57623)] = {
        ["RAID_INCOMBAT"]   = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Path of Frost
    [GetSpellInfo(3714)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== PALADIN ==--
    -- Blessing of Kings
    [GetSpellInfo(20217)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Greater Blessing of Kings
    [GetSpellInfo(25898)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Blessing of Wisdom
    [GetSpellInfo(48936)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Greater Blessing of Wisdom
    [GetSpellInfo(48938)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Blessing of Might
    [GetSpellInfo(48932)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Greater Blessing of Might
    [GetSpellInfo(48934)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Blessing of Sanctuary
    [GetSpellInfo(20911)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Greater Blessing of Sanctuary
    [GetSpellInfo(25899)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },

    --== DRUID ==--
    -- Mark of the Wild
    [GetSpellInfo(48469)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Gift of the Wild
    [GetSpellInfo(48470)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Thorns
    [GetSpellInfo(53307)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== SHAMAN ==--
    -- Earth Shield
    [GetSpellInfo(49284)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, true, true),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, true, true),
    },
    -- Windfury Totem
    [GetSpellInfo(8515)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, true),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Grounding Totem
    [GetSpellInfo(8177)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, true),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== WARRIOR ==--
    -- Battle Shout
    [GetSpellInfo(47436)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Commanding Shout
    [GetSpellInfo(47440)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== MAGE ==--
    -- Arcane Intellect
    [GetSpellInfo(42995)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Dalaran Intellect
    [GetSpellInfo(61024)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Dalaran Brilliance
    [GetSpellInfo(61316)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Arcane Brilliance
    [GetSpellInfo(43002)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Dampen Magic
    [GetSpellInfo(43015)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Focus Magic
    [GetSpellInfo(54646)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== WARLOCK ==--
    -- Unending Breath
    [GetSpellInfo(5697)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },

    --== ANY DEBUFF SPELLS ==--
    -- Chill of the Throne
    [GetSpellInfo(69127)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Deserter
    [GetSpellInfo(26013)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, true),
    },
    -- Strange Feeling
    [GetSpellInfo(31694)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, false),
    },
    -- Quel'Delar's Compulsion
    [GetSpellInfo(70013)] = {
        ["RAID_INCOMBAT"]    = SetRaidCombatInfo(true, false, false),
        ["RAID_OUTOFCOMBAT"] = SetRaidCombatInfo(true, false, false),
    },
};
lib.CLASS_AURAS = CLASS_AURAS;
