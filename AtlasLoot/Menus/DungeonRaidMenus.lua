--Invoke all libraries
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0");
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0");
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0");
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0");

--Dungeon and Raid Menus

    AtlasLoot_SubMenus["Dungeons and RaidsCLASSIC"] = {
        Module = "AtlasLootOriginalWoW";
        SubMenu = "Dungeons and RaidsCLASSIC";
        {"Raids:", "OldKeys", "Header"};
        {"", "ZulGurub", "", "Zul'Gurub"};
        {"", "MoltenCore", "", "Molten Core"};
        {"", "Onyxia60", "", "Onyxias Hort"};
        {"", "BlackwingLair", "", "Blackwing Lair"};
        {"", "RuinsofAQ", "", "Ruinen von Ahn'Qiraj"};
        {"", "TempleofAQ", "", "Tempel von Ahn'Qiraj"};
        {"", "Naxxramas60", "", "Naxxramas"};
        {"Dungeons:", "OldKeys", "Header"};
        {"", "BlackfathomDeeps", "", "Blackfathom Deeps"};
        {"", "BlackrockDepths", "", "Blackrock Depths"};
        {"", "LowerBlackrock", "", "Lower Blackrock Spire"};
        {"", "UpperBlackrock", "", "Upper Blackrock Spire"};
        {"", "TheDeadmines", "", "The Deadmines"};
        {"", "DireMaulNorth", "", "Dire Maul (North)"};
        {"", "DireMaulEast", "", "Dire Maul (East)"};
        {"", "DireMaulWest", "", "Dire Maul (West)"};
        {"", "Gnomeregan", "", "Gnomeregan"};
        {"", "Maraudon", "", "Maraudon"};
        {"", "RagefireChasm", "", "Ragefire Chasm"};
        {"", "RazorfenDowns", "", "Razorfen Downs"};
        {"", "RazorfenKraul", "", "Razorfen Kraul"};
        {"", "Scarlet Monastery", "", "Scarlet Monastery"};
        {"", "Scholomance", "", "Scholomance"};
        {"", "ShadowfangKeep", "", "Shadowfang Keep"};
        {"", "TheStockade", "", "The Stockade"};
        {"", "Stratholme", "", "Stratholme"};
        {"", "SunkenTemple", "", "Sunken Temple"};
        {"", "Uldaman", "", "Uldaman"};
        {"", "WailingCaverns", "", "Wailing Caverns"};
        {"", "ZulFarrak", "", "Zul'Farrak"};
    };

    AtlasLoot_SubMenus["Dungeons and RaidsTBC"] = {
        Module = "AtlasLootBurningCrusade";
        SubMenu = "Dungeons and RaidsTBC";
        {"Raids:", "BCKeys", "Header"};
        {"", "Karazhan", "", "Karazhan"};
        {"", "GruulsLair", "", "Gruul's Lair"};
        {"", "HCMagtheridon", "", "Magtheridon's Lair"};
        {"", "CFRSerpentshrine", "", "Serpentshrine Cavern"};
        {"", "TKEye", "", "The Eye"};
        {"", "ZulAman", "", "Zul'Aman"};
        {"", "CoTHyjal", "", "Mount Hyjal"};
        {"", "BlackTemple", "", "Black Temple"};
        {"", "SunwellPlateau", "", "Sunwell Plateau"};
        ---- Dungeons -----
        {"Dungeons:", "BCKeys", "Header"};
        {"", "HCRamparts", "", "Hellfire Ramparts"};
        {"", "HCShatteredHalls", "", "The Shattered Halls"};
        {"", "HCFurnace", "", "The Blood Furnace"};
        {"", "TKBot", "", "The Botanica"};
        {"", "TKArc", "", "The Arcatraz"};
        {"", "TKMech", "", "The Mechanar"};
        {"", "AuchCrypts", "", "Auchenai Crypts"};
        {"", "AuchManaTombs", "", "Mana-Tombs"};
        {"", "AuchSethekk", "", "Sethekk Halls"};
        {"", "AuchShadowLab", "", "Shadow Labyrinth"};
        {"", "CoTOldHillsbrad", "", "Old Hillsbrad Foothills"};
        {"", "CoTBlackMorass", "", "The Black Morass"};
        {"", "CFRSlavePens", "", "The Slave Pens"};
        {"", "CFRSteamvault", "", "The Steamvault"};
        {"", "CFRUnderbog", "", "The Underbog"};
        {"", "MagistersTerrace", "", "Magisters' Terrace"};
    };

    AtlasLoot_SubMenus["Dungeons and RaidsWRATH"] = {
        Module = "AtlasLootWotLK";
        SubMenu = "Dungeons and RaidsWRATH";
        {"Raids:", "WrathKeys", "Header"};
        {"", "Naxxramas80"};
        {"", "Sartharion"};
        {"", "Malygos"};
        {"", "VaultofArchavon_A"};
        {"", "Ulduar"};
        {"", "TrialoftheCrusader_A"};
        {"", "Onyxia_1"};
        {"", "IcecrownCitadel"};
        {"", "Halion"};
        {"Dungeons:", "WrathKeys", "Header"};
        {"", "Ahnkahet"};
        {"", "AzjolNerub"};
        {"", "CoTStratholme"};
        {"", "DrakTharonKeep"};
        {"", "ForgeofSouls"};
        {"", "Gundrak"};
        {"", "HallsofLightning"};
        {"", "HallsofReflection"};
        {"", "HallsofStone"};
        {"", "TheNexus"};
        {"", "TheOculus"};
        {"", "PitofSaron"};
        {"", "TrialoftheChampion"};
        {"", "UtgardeKeep"};
        {"", "UtgardePinnacle"};
        {"", "TheVioletHold"};
    };

    AtlasLoot_SubMenus["WorldBossesMenuCLASSIC"] = {
        Module = "AtlasLootOriginalWoW";
        { "","WorldBossesCLASSIC"};
    };

    AtlasLoot_SubMenus["WorldBossesMenuTBC"] = {
        Module = "AtlasLootBurningCrusade";
        { "","WorldBossesTBC"};
    };