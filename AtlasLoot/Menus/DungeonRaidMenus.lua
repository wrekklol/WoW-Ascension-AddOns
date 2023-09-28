--Invoke all libraries
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

--Dungeon and Raid Menus
AtlasLoot_SubMenus["Dungeons and RaidsCLASSIC"] = {
    Module = "AtlasLootOriginalWoW";
    SubMenu = "Dungeons and RaidsCLASSIC";
    { "Raids:", "OldKeys", "Header" };
    { "", "ZulGurub", "", "Zul'Gurub" };
    { "", "MoltenCore", "", "Molten Core" };
    { "", "Onyxia60", "", "Onyxias Hort" };
    { "", "BlackwingLair", "", "Blackwing Lair" };
    { "", "RuinsofAQ", "", "Ruinen von Ahn'Qiraj" };
    { "", "TempleofAQ", "", "Tempel von Ahn'Qiraj" };
    { "", "Naxxramas60", "", "Naxxramas" };
    { "", "WorldBossesCLASSIC","", "World Bosses" };
    ---- Dungeons -----
    { "Dungeons:", "OldKeys", "Header" };
    { "", "BlackfathomDeeps", "", "Blackfathom Deeps" };
    { "", "BlackrockDepths", "", "Blackrock Depths" };
    { "", "LowerBlackrock", "", "Lower Blackrock Spire" };
    { "", "UpperBlackrock", "", "Upper Blackrock Spire" };
    { "", "TheDeadmines", "", "The Deadmines" };
    { "", "DireMaulNorth", "", "Dire Maul (North)" };
    { "", "DireMaulEast", "", "Dire Maul (East)" };
    { "", "DireMaulWest", "", "Dire Maul (West)" };
    { "", "Gnomeregan", "", "Gnomeregan" };
    { "", "Maraudon", "", "Maraudon" };
    { "", "RagefireChasm", "", "Ragefire Chasm" };
    { "", "RazorfenDowns", "", "Razorfen Downs" };
    { "", "RazorfenKraul", "", "Razorfen Kraul" };
    { "", "Scarlet Monastery", "", "Scarlet Monastery" };
    { "", "Scholomance", "", "Scholomance" };
    { "", "ShadowfangKeep", "", "Shadowfang Keep" };
    { "", "TheStockade", "", "The Stockade" };
    { "", "Stratholme", "", "Stratholme" };
    { "", "SunkenTemple", "", "Sunken Temple" };
    { "", "Uldaman", "", "Uldaman" };
    { "", "WailingCaverns", "", "Wailing Caverns" };
    { "", "ZulFarrak", "", "Zul'Farrak" };
};

AtlasLoot_SubMenus["Dungeons and RaidsTBC"] = {
    Module = "AtlasLootBurningCrusade";
    SubMenu = "Dungeons and RaidsTBC";
    { "Raids:", "BCKeys", "Header" };
    { "", "Karazhan", "", "Karazhan" };
    { "", "GruulsLair", "", "Gruul's Lair" };
    { "", "HCMagtheridon", "", "Magtheridon's Lair" };
    { "", "CFRSerpentshrine", "", "Serpentshrine Cavern" };
    { "", "TKEye", "", "The Eye" };
    { "", "ZulAman", "", "Zul'Aman" };
    { "", "CoTHyjal", "", "Mount Hyjal" };
    { "", "BlackTemple", "", "Black Temple" };
    { "", "SunwellPlateau", "", "Sunwell Plateau" };
    { "", "WorldBossesTBC","", "World Bosses" };
    ---- Dungeons -----
    { "Dungeons:", "BCKeys", "Header" };
    { "", "HCRamparts", "", "Hellfire Ramparts" };
    { "", "HCShatteredHalls", "", "The Shattered Halls" };
    { "", "HCFurnace", "", "The Blood Furnace" };
    { "", "TKBot", "", "The Botanica" };
    { "", "TKArc", "", "The Arcatraz" };
    { "", "TKMech", "", "The Mechanar" };
    { "", "AuchCrypts", "", "Auchenai Crypts" };
    { "", "AuchManaTombs", "", "Mana-Tombs" };
    { "", "AuchSethekk", "", "Sethekk Halls" };
    { "", "AuchShadowLab", "", "Shadow Labyrinth" };
    { "", "CoTOldHillsbrad", "", "Old Hillsbrad Foothills" };
    { "", "CoTBlackMorass", "", "The Black Morass" };
    { "", "CFRSlavePens", "", "The Slave Pens" };
    { "", "CFRSteamvault", "", "The Steamvault" };
    { "", "CFRUnderbog", "", "The Underbog" };
    { "", "MagistersTerrace", "", "Magisters' Terrace" };
};

AtlasLoot_SubMenus["Dungeons and RaidsWRATH"] = {
    Module = "AtlasLootWotLK";
    SubMenu = "Dungeons and RaidsWRATH";
    { "Raids:", "WrathKeys", "Header" };
    { "", "Naxxramas80", "Naxxramas" };
    { "", "Sartharion", "Sartharion" };
    { "", "Malygos", "Malygos" };
    { "", "VaultofArchavon", "Vault of Archavon" };
    { "", "Ulduar", "Ulduar" };
    { "", "TrialoftheCrusader", "Trial of the Crusader" };
    { "", "TrialoftheCrusader2", "Trial of the Crusader" };
    { "", "Onyxia80", "Onyxia" };
    { "", "IcecrownCitadel", "Icecrown Citadel" };
    { "", "Halion", "Halion" };
    ---- Dungeons -----
    { "Dungeons:", "WrathKeys", "Header" };
    { "", "Ahnkahet", "Ahnkahet" };
    { "", "AzjolNerub", "AzjolNerub" };
    { "", "CoTStratholme", "The Culling of Stratholme" };
    { "", "DrakTharonKeep", "DrakTharon Keep" };
    { "", "ForgeofSouls", "Forge of Souls" };
    { "", "Gundrak", "Gundrak" };
    { "", "HallsofLightning", "Halls of Lightning" };
    { "", "HallsofReflection", "Halls of Reflection" };
    { "", "HallsofStone", "Halls of Stone" };
    { "", "TheNexus", "The Nexus" };
    { "", "TheOculus", "The Oculus" };
    { "", "PitofSaron", "Pit of Saron" };
    { "", "TrialoftheChampion", "Trial of the Champion" };
    { "", "UtgardeKeep", "Utgarde Keep" };
    { "", "UtgardePinnacle", "Utgarde Pinnacle" };
    { "", "TheVioletHold", "The Violet Hold" };
};