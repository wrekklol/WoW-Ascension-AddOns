local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")

	AtlasLoot_SubMenus["PVPCLASSIC"] = {
		Module = "AtlasLootOriginalWoW";
		{ "PVP Factions", "AVMisc", "Header"};
		{ "", "AVMisc"};
		{ "", "AB_A"};
		{ "", "AB_H"};
		{ "", "WSG_A"};
		{ "", "WSG_H"};
		{ "", "PVPWeapons60"};
		{ "", "PvP60Accessories"};
		{ "", "PvP60Ench"};
		{ "PVP Sets", "PVPDruid", "Header"};
		{ "", "PVPDruid"};
		{ "", "PVPHunter"};
		{ "", "PVPMage"};
		{ "", "PVPPaladin"};
		{ "", "PVPPriest"};
		{ "", "PVPRogue"};
		{ "", "PVPShaman"};
		{ "", "PVPWarlock"};
		{ "", "PVPWarrior"};
	};

	AtlasLoot_SubMenus["PVPTBC"] = {
		Module = "AtlasLootBurningCrusade";
		{ "PVP Factions", "PVPHellfire", "Header"};
		{ "", "PVPHellfire"};
		{ "", "PVPHalaa"};
		{ "", "PVPSpiritTowers"};
		{ "", "PVPTwinSpireRuins"};
		{ "", "PVP70RepGear"};
		{ "", "PvP70Accessories"};
		{ "", "PvP70NonSet"};
		{ "", "WeaponsTBC"};
		{ "PVP Sets", "ArenaDruidTBC", "Header"};
		{ "", "ArenaDruidTBC"};
		{ "", "ArenaHunterTBC"};
		{ "", "ArenaMageTBC"};
		{ "", "ArenaPaladinTBC"};
		{ "", "ArenaPriestTBC"};
		{ "", "ArenaRogueTBC"};
		{ "", "ArenaShamanTBC"};
		{ "", "ArenaWarlockTBC"};
		{ "", "ArenaWarriorTBC"};
	};

	AtlasLoot_SubMenus["PVPWRATH"] = {
		Module = "AtlasLootWotLK";
		{ "PVP Factions", "LakeWintergrasp", "Header"};
		{ "", "LakeWintergrasp"};
		{ "", "VentureBay"};
		{ "", "PvP80Misc"};
		{ "", "PVPidolWRATH"};
		{ "", "PvP80NonSet"};
		{ "", "WeaponsWRATH"};
		{ "PVP Sets", "ArenaDruidWRATH", "Header"};
		{ "", "ArenaDruidWRATH"};
		{ "", "ArenaHunterWRATH"};
		{ "", "ArenaMageWRATH"};
		{ "", "ArenaPaladinWRATH"};
		{ "", "ArenaPriestWRATH"};
		{ "", "ArenaRogueWRATH"};
		{ "", "ArenaShamanWRATH"};
		{ "", "ArenaWarlockWRATH"};
		{ "", "ArenaWarriorWRATH"};
		{ "", "ArenaDeathKnightWRATH"};
	};
