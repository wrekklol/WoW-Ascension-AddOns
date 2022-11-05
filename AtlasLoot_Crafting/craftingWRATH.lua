local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")

local ALCHEMY = GetSpellInfo(2259);
local BLACKSMITHING = GetSpellInfo(2018);
local ARMORSMITH = GetSpellInfo(9788);
local WEAPONSMITH = GetSpellInfo(9787);
local AXESMITH = GetSpellInfo(17041);
local HAMMERSMITH = GetSpellInfo(17040);
local SWORDSMITH = GetSpellInfo(17039);
local COOKING = GetSpellInfo(2550);
local ENCHANTING = GetSpellInfo(7411);
local ENGINEERING = GetSpellInfo(4036);
local GNOMISH = GetSpellInfo(20220);
local GOBLIN = GetSpellInfo(20221);
local FIRSTAID = GetSpellInfo(3273);
local FISHING = GetSpellInfo(63275);
local INSCRIPTION = GetSpellInfo(45357);
local JEWELCRAFTING = GetSpellInfo(25229);
local LEATHERWORKING = GetSpellInfo(2108);
local DRAGONSCALE = GetSpellInfo(10656);
local ELEMENTAL = GetSpellInfo(10658);
local TRIBAL = GetSpellInfo(10660);
local MINING = GetSpellInfo(2575);
local TAILORING = GetSpellInfo(3908);
local MOONCLOTH = GetSpellInfo(26798);
local SHADOWEAVE = GetSpellInfo(26801);
local SPELLFIRE = GetSpellInfo(26797);


local APPRENTICE = select(2, GetSpellInfo(2259));
local JOURNEYMAN = select(2, GetSpellInfo(3101));
local EXPERT = select(2, GetSpellInfo(3464));
local ARTISAN = select(2, GetSpellInfo(11611));
local MASTER = select(2, GetSpellInfo(28596));

-- Index
--- Tradeskill List
---- Alchemy
----- Battle Elixirs
----- Guardian Elixirs
----- Potions
----- Flasks
----- Transmutes
----- Miscellaneous
---- Blacksmithing
----- Armor
----- Weapons
----- Enhancements
----- Miscellaneous
----- Armorsmith
----- Weaponsmith
----- Axesmith
----- Hammersmith
----- Swordsmith
---- Cooking
---- Enchanting
----- Boots
----- Bracers
----- Chest
----- Cloaks
----- Gloves
----- Rings
----- Shields
----- 2 Hand Weapons
----- 1 Hand Weapons
----- Staves
----- Miscellaneous
---- Engineering
---- First Aid
---- Inscription
---- Jewelcrafting
---- Leatherworking
---- Mining
---- Tailoring
--- Profession Sets
---- Blacksmithing Mail Sets
---- Blacksmithing Plate Sets
---- Leatherworking Leather Sets
---- Leatherworking Mail Sets
---- Tailoring Sets
--- Other
---- Crafted Epic Weapons
--- Daily Profession Rewards
---- Cooking
---- Fishing
---- Jewelcrafting

	-----------------------
	--- Tradeskill List ---
	-----------------------

		---------------
		--- Alchemy ---
		---------------
	
	AtlasLoot_Data["AlchemyBattleElixirWRATH"] = {
		{ 1, "s60365", "44330", "=q1=Elixir of Armor Piercing", "=ds="};
		{ 2, "s60355", "44327", "=q1=Elixir of Deadly Strikes", "=ds="};
		{ 3, "s60357", "44329", "=q1=Elixir of Expertise", "=ds="};
		{ 4, "s60366", "44331", "=q1=Elixir of Lightning Speed", "=ds="};
		{ 5, "s60354", "44325", "=q1=Elixir of Accuracy", "=ds="};
		{ 6, "s53840", "39666", "=q1=Elixir of Mighty Agility", "=ds="..AL["Trainer"]};
		{ 7, "s54218", "40073", "=q1=Elixir of Mighty Strength", "=ds="..AL["Trainer"]};
		{ 8, "s53848", "40076", "=q1=Guru's Elixir", "=ds="..AL["Trainer"]};
		{ 9, "s53842", "40070", "=q1=Spellpower Elixir", "=ds="..AL["Trainer"]};
		{ 10, "s53841", "40068", "=q1=WRATH Elixir", "=ds="..AL["Trainer"]};
		Prev = "AlchemyBattleElixirTBC";
		Next = "AlchemyBattleElixirCLASSIC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};
	
	AtlasLoot_Data["AlchemyGuardianElixirWRATH"] = {
		{ 1, "s60356", "44328", "=q1=Elixir of Mighty Defense", "=ds="..AL["Discovery"]};
		{ 2, "s56519", "40109", "=q1=Elixir of Mighty Mageblood", "=ds="..AL["Discovery"]};
		{ 3, "s54220", "40097", "=q1=Elixir of Protection", "=ds="..AL["Discovery"]};
		{ 4, "s62410", "8827", "=q1=Elixir of Water Walking", "=ds="..AL["Discovery"]};
		{ 5, "s53898", "40078", "=q1=Elixir of Mighty Fortitude", "=ds="..AL["Trainer"]};
		{ 6, "s60367", "44332", "=q1=Elixir of Mighty Thoughts", "=ds="..AL["Trainer"]};
		{ 7, "s53847", "40072", "=q1=Elixir of Spirit", "=ds="..AL["Trainer"]};
		Prev = "AlchemyGuardianElixirTBC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["AlchemyPotionWRATH"] = {
		{ 1, "s54221", "40211", "=q1=Potion of Speed", "=ds="};
		{ 2, "s54222", "40212", "=q1=Potion of Wild Magic", "=ds="};
		{ 3, "s53904", "40087", "=q1=Powerful Rejuvenation Potion", "=ds="};
		{ 4, "s58868", "43570", "=q1=Endless Mana Potion", "=ds="..AL["Trainer"]};
		{ 5, "s53837", "33448", "=q1=Runic Mana Potion", "=ds="..AL["Trainer"]};
		{ 6, "s58871", "43569", "=q1=Endless Healing Potion", "=ds="..AL["Trainer"]};
		{ 7, "s53836", "33447", "=q1=Runic Healing Potion", "=ds="..AL["Trainer"]};
		{ 8, "s53936", "40213", "=q1=Mighty Arcane Protection Potion", "=ds="};
		{ 9, "s53939", "40214", "=q1=Mighty Fire Protection Potion", "=ds="..AL["Drop"]};
		{ 10, "s53937", "40215", "=q1=Mighty Frost Protection Potion", "=ds="..AL["Drop"]};
		{ 11, "s53942", "40216", "=q1=Mighty Nature Protection Potion", "=ds="..AL["Drop"]};
		{ 12, "s53938", "40217", "=q1=Mighty Shadow Protection Potion", "=ds="};
		{ 13, "s53905", "40093", "=q1=Indestructible Potion", "=ds="..AL["Trainer"]};
		{ 14, "s53900", "40081", "=q1=Potion of Nightmares", "=ds="..AL["Trainer"]};
		{ 15, "s53895", "40077", "=q1=Crazy Alchemist's Potion", "=ds="..AL["Trainer"]};
		{ 16, "s53839", "40067", "=q1=Icy Mana Potion", "=ds="..AL["Trainer"]};
		{ 17, "s53838", "39671", "=q1=Resurgent Healing Potion", "=ds="..AL["Trainer"]};
		Prev = "AlchemyPotionTBC";
		Next = "AlchemyPotionCLASSIC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["AlchemyFlaskWRATH"] = {
		{ 1, "s67025", "47499", "=q3=Flask of the North", "=ds="..AL["Trainer"]};
		{ 2, "s53903", "46377", "=q1=Flask of Endless Rage", "=ds="..AL["Trainer"]};
		{ 3, "s54213", "46378", "=q1=Flask of Pure Mojo", "=ds="..AL["Trainer"]};
		{ 4, "s53902", "46379", "=q1=Flask of Stoneblood", "=ds="..AL["Trainer"]};
		{ 5, "s53901", "46376", "=q1=Flask of the Frost Wyrm", "=ds="..AL["Trainer"]};	
		{ 6, "s62213", "44939", "=q1=Lesser Flask of Resistance", "=ds="..AL["Trainer"]};
		{ 7, "s53899", "40079", "=q1=Lesser Flask of Toughness", "=ds="..AL["Trainer"]};
		Prev = "AlchemyFlaskTBC";
		Next = "AlchemyFlaskCLASSIC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["AlchemyTransmuteWRATH"] = {
		{ 1, "s66659", "36919", "=q4=Transmute: Cardinal Ruby", "=ds="..AL["Quest Reward"]};
		{ 2, "s66658", "36931", "=q4=Transmute: Ametrine", "=ds="..AL["Trainer"]};
		{ 3, "s66662", "36928", "=q4=Transmute: Dreadstone", "=ds="..AL["Trainer"]};
		{ 4, "s66664", "36934", "=q4=Transmute: Eye of Zul", "=ds="..AL["Trainer"]};
		{ 5, "s66660", "36922", "=q4=Transmute: King's Amber", "=ds="..AL["Trainer"]};
		{ 6, "s66663", "36925", "=q4=Transmute: Majestic Zircon", "=ds="..AL["Trainer"]};
		{ 7, "s54020", "40248", "=q3=Transmute: Eternal Might", "=ds="..AL["Trainer"]};
		{ 8, "s57427", "41334", "=q3=Transmute: Earthsiege Diamond", "=ds="..AL["Trainer"]};
		{ 9, "s57425", "41266", "=q3=Transmute: Skyflare Diamond", "=ds="..AL["Trainer"]};
		{ 13, "s53777", "35624", "=q2=Transmute: Eternal Air to Earth", "=ds="};
		{ 14, "s53776", "35622", "=q2=Transmute: Eternal Air to Water", "=ds="};
		{ 15, "s53781", "35623", "=q2=Transmute: Eternal Earth to Air", "=ds="};
		{ 16, "s53782", "35627", "=q2=Transmute: Eternal Earth to Shadow", "=ds="};
		{ 17, "s53775", "35625", "=q2=Transmute: Eternal Fire to Life", "=ds="};
		{ 18, "s53774", "35622", "=q2=Transmute: Eternal Fire to Water", "=ds="};
		{ 19, "s53773", "36860", "=q2=Transmute: Eternal Life to Fire", "=ds="};
		{ 20, "s53771", "35627", "=q2=Transmute: Eternal Life to Shadow", "=ds="};
		{ 21, "s53779", "35624", "=q2=Transmute: Eternal Shadow to Earth", "=ds="};
		{ 22, "s53780", "35625", "=q2=Transmute: Eternal Shadow to Life", "=ds="};
		{ 23, "s53783", "35623", "=q2=Transmute: Eternal Water to Air", "=ds="};
		{ 24, "s53784", "36860", "=q2=Transmute: Eternal Water to Fire", "=ds="};
		{ 25, "s60350", "41163", "=q2=Transmute: Titanium", "=ds="..AL["Trainer"]};
		Prev = "AlchemyTransmuteTBC";
		Next = "AlchemyTransmuteCLASSIC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["AlchemyMiscWRATH"] = {
		{ 1, "s47050", "35751", "=q4=Assassin's Alchemist Stone", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Shattered Sun Offensive"]};
		{ 2, "s47046", "35748", "=q4=Guardian's Alchemist Stone", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Shattered Sun Offensive"]};
		{ 3, "s47049", "35750", "=q4=Redeemer's Alchemist Stone", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Shattered Sun Offensive"]};
		{ 4, "s47048", "35749", "=q4=Sorcerer's Alchemist Stone", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Shattered Sun Offensive"]};
		{ 5, "s17632", "13503", "=q4=Alchemist's Stone", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["The Sha'tar"]};
		{ 6, "s60403", "44323", "=q3=Indestructible Alchemist Stone", "=ds="..AL["Trainer"]};
		{ 7, "s60396", "44322", "=q3=Mercurial Alchemist Stone", "=ds="..AL["Trainer"]};
		{ 8, "s60405", "44324", "=q3=Mighty Alchemist Stone", "=ds="..AL["Trainer"]};
		{ 10, "s38070", "31080", "=q2=Mercurial Stone", "=ds="..AL["Trainer"]};
		{ 11, "s62409", "44958", "=q1=Ethereal Oil", "=ds="..AL["Trainer"]};
		{ 12, "s53812", "40195", "=q1=Pygmy Oil", "=ds="..AL["Trainer"]};
		Prev = "AlchemyMiscTBC";
		Next = "AlchemyMiscCLASSIC";
		Back = "ALCHEMYMENU";
		Submenu = "Expansion";
	};

		---------------------
		--- Blacksmithing ---
		---------------------

	AtlasLoot_Data["SmithingArmorWRATH"] = {
        { 1, "s70568", "49907", "=q4=Boots of Kingly Upheaval", "=ds="..AL["Vendor"]..""};
        { 2, "s70566", "49906", "=q4=Hellfrozen Bonegrinders", "=ds="..AL["Vendor"]..""};
        { 3, "s70565", "49903", "=q4=Legplates of Painful Death", "=ds="..AL["Vendor"]..""};
        { 4, "s70567", "49904", "=q4=Pillars of Might", "=ds="..AL["Vendor"]..""};
        { 5, "s70563", "49905", "=q4=Protectors of Life", "=ds="..AL["Vendor"]..""};
        { 6, "s70562", "49902", "=q4=Puresteel Legplates", "=ds="..AL["Vendor"]..""};
		{ 7, "s67130", "47592", "=q4=Breastplate of the White Knight", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 8, "s67091", "47591", "=q4=Breastplate of the White Knight", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 9, "s67131", "47571", "=q4=Saronite Swordbreakers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 10, "s67092", "47570", "=q4=Saronite Swordbreakers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 11, "s67096", "47574", "=q4=Sunforged Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 12, "s67135", "47575", "=q4=Sunforged Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 13, "s67095", "47593", "=q4=Sunforged Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 14, "s67134", "47594", "=q4=Sunforged Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 15, "s67093", "47589", "=q4=Titanium Razorplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 16, "s67132", "47590", "=q4=Titanium Razorplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 17, "s67094", "47572", "=q4=Titanium Spikeguards", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 18, "s67133", "47573", "=q4=Titanium Spikeguards", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 19, "s63188", "45559", "=q4=Battlelord's Plate Boots", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 20, "s63187", "45550", "=q4=Belt of the Titans", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 21, "s63191", "45551", "=q4=Indestructible Plate Girdle", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 22, "s63189", "45552", "=q4=Plate Girdle of Righteousness", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 23, "s63192", "45560", "=q4=Spiked Deathdealers", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 24, "s63190", "45561", "=q4=Treads of Destiny", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 25, "s55374", "41388", "=q4=Brilliant Titansteel Helm", "=ds="..AL["Trainer"] };
		{ 26, "s55377", "41394", "=q4=Brilliant Titansteel Treads", "=ds="..AL["Trainer"] };
		{ 27, "s55372", "41386", "=q4=Spiked Titansteel Helm", "=ds="..AL["Trainer"] };
		{ 28, "s55375", "41391", "=q4=Spiked Titansteel Treads", "=ds="..AL["Trainer"] };
		{ 29, "s55373", "41387", "=q4=Tempered Titansteel Helm", "=ds="..AL["Trainer"] };
		{ 30, "s55376", "41392", "=q4=Tempered Titansteel Treads", "=ds="..AL["Trainer"] };
		Next = "SmithingArmorWRATH2";
		Back = "SMITHINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["SmithingArmorWRATH2"] = {
        { 1, "s56400", "42508", "=q4=Titansteel Shield Wall", "=ds="..AL["Trainer"] };
		{ 2, "s61008", "43586", "=q4=Icebane Chestguard", "=ds="..AL["Trainer"] };
		{ 3, "s61009", "43587", "=q4=Icebane Girdle", "=ds="..AL["Trainer"] };
		{ 4, "s61010", "43588", "=q4=Icebane Treads", "=ds="..AL["Trainer"] };
		{ 5, "s55303", "41345", "=q3=Daunting Legplates", "=ds="..AL["Trainer"] };
		{ 6, "s55302", "41344", "=q3=Helm of Command", "=ds="..AL["Trainer"] };
		{ 7, "s56555", "42725", "=q3=Ornate Saronite Hauberk", "=ds="..AL["Trainer"] };
		{ 8, "s56554", "42726", "=q3=Ornate Saronite Legplates", "=ds="..AL["Trainer"] };
		{ 9, "s56556", "42728", "=q3=Ornate Saronite Skullshield", "=ds="..AL["Trainer"] };
		{ 10, "s55304", "41346", "=q3=Righteous Greaves", "=ds="..AL["Trainer"] };
		{ 11, "s55311", "41353", "=q3=Savage Saronite Hauberk", "=ds="..AL["Trainer"] };
		{ 12, "s55310", "41347", "=q3=Savage Saronite Legplates", "=ds="..AL["Trainer"] };
		{ 13, "s55312", "41350", "=q3=Savage Saronite Skullshield", "=ds="..AL["Trainer"] };
		{ 14, "s55301", "41357", "=q3=Daunting Handguards", "=ds="..AL["Trainer"] };
		{ 15, "s56553", "42724", "=q3=Ornate Saronite Gauntlets", "=ds="..AL["Trainer"] };
		{ 16, "s56550", "42727", "=q3=Ornate Saronite Pauldrons", "=ds="..AL["Trainer"] };
		{ 17, "s56551", "42729", "=q3=Ornate Saronite Waistguard", "=ds="..AL["Trainer"] };
		{ 18, "s56552", "42730", "=q3=Ornate Saronite Walkers", "=ds="..AL["Trainer"] };
		{ 19, "s55300", "41356", "=q3=Righteous Gauntlets", "=ds="..AL["Trainer"] };
		{ 20, "s55309", "41349", "=q3=Savage Saronite Gauntlets", "=ds="..AL["Trainer"] };
		{ 21, "s55306", "41351", "=q3=Savage Saronite Pauldrons", "=ds="..AL["Trainer"] };
		{ 22, "s55307", "41352", "=q3=Savage Saronite Waistguard", "=ds="..AL["Trainer"] };
		{ 23, "s55308", "41348", "=q3=Savage Saronite Walkers", "=ds="..AL["Trainer"] };
		{ 24, "s56549", "42723", "=q3=Ornate Saronite Bracers", "=ds="..AL["Trainer"] };
		{ 25, "s55305", "41354", "=q3=Savage Saronite Bracers", "=ds="..AL["Trainer"] };
		{ 26, "s55298", "41355", "=q3=Vengeance Bindings", "=ds="..AL["Trainer"] };
		{ 27, "s55058", "41129", "=q3=Brilliant Saronite Breastplate", "=ds="..AL["Trainer"] };
		{ 28, "s59441", "43870", "=q3=Brilliant Saronite Helm", "=ds="..AL["Trainer"] };
		{ 29, "s55186", "41189", "=q3=Chestplate of Conquest", "=ds="..AL["Trainer"] };
		{ 30, "s55187", "41190", "=q3=Legplates of Conquest", "=ds="..AL["Trainer"] };
		Next = "SmithingArmorWRATH3";
		Prev = "SmithingArmorWRATH";
		Back = "SMITHINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["SmithingArmorWRATH3"] = {
        { 1, "s55015", "41114", "=q3=Tempered Saronite Gauntlets", "=ds="..AL["Trainer"] };
		{ 2, "s55014", "41113", "=q3=Saronite Bulwark", "=ds="..AL["Trainer"] };
		{ 3, "s55017", "41116", "=q3=Tempered Saronite Bracers", "=ds="..AL["Trainer"] };
		{ 4, "s55057", "41128", "=q3=Brilliant Saronite Boots", "=ds="..AL["Trainer"] };
		{ 5, "s59440", "43865", "=q3=Brilliant Saronite Pauldrons", "=ds="..AL["Trainer"] };
		{ 6, "s54555", "40673", "=q3=Tempered Saronite Helm", "=ds="..AL["Trainer"] };
		{ 7, "s54556", "40675", "=q3=Tempered Saronite Shoulders", "=ds="..AL["Trainer"] };
		{ 8, "s59438", "43864", "=q3=Brilliant Saronite Bracers", "=ds="..AL["Trainer"] };
		{ 9, "s55056", "41127", "=q3=Brilliant Saronite Gauntlets", "=ds="..AL["Trainer"] };
		{ 10, "s54552", "40671", "=q3=Tempered Saronite Boots", "=ds="..AL["Trainer"] };
		{ 11, "s54553", "40672", "=q3=Tempered Saronite Breastplate", "=ds="..AL["Trainer"] };
		{ 12, "s59436", "43860", "=q3=Brilliant Saronite Belt", "=ds="..AL["Trainer"] };
		{ 13, "s55055", "41126", "=q3=Brilliant Saronite Legplates", "=ds="..AL["Trainer"] };
		{ 14, "s54551", "40669", "=q3=Tempered Saronite Belt", "=ds="..AL["Trainer"] };
		{ 15, "s54554", "40674", "=q3=Tempered Saronite Legplates", "=ds="..AL["Trainer"] };
		{ 16, "s54557", "40670", "=q3=Saronite Defender", "=ds="..AL["Trainer"] };
		{ 17, "s55013", "41117", "=q3=Saronite Protector", "=ds="..AL["Trainer"] };
		{ 18, "s54949", "40955", "=q2=Horned Cobalt Helm", "=ds="..AL["Trainer"] };
		{ 19, "s54948", "40954", "=q2=Spiked Cobalt Bracers", "=ds="..AL["Trainer"] };
		{ 20, "s54946", "40953", "=q2=Spiked Cobalt Belt", "=ds="..AL["Trainer"] };
		{ 21, "s54947", "40943", "=q2=Spiked Cobalt Legplates", "=ds="..AL["Trainer"] };
		{ 22, "s54945", "40952", "=q2=Spiked Cobalt Gauntlets", "=ds="..AL["Trainer"] };
		{ 23, "s54941", "40950", "=q2=Spiked Cobalt Shoulders", "=ds="..AL["Trainer"] };
		{ 24, "s54918", "40949", "=q2=Spiked Cobalt Boots", "=ds="..AL["Trainer"] };
		{ 25, "s54944", "40951", "=q2=Spiked Cobalt Chestpiece", "=ds="..AL["Trainer"] };
		{ 26, "s54978", "40956", "=q2=Reinforced Cobalt Shoulders", "=ds="..AL["Drop"]..": "..BabbleZone["Dragonblight"] };
		{ 27, "s54979", "40957", "=q2=Reinforced Cobalt Helm", "=ds="..AL["Drop"]..": "..BabbleZone["Grizzly Hills"] };
		{ 28, "s54980", "40958", "=q2=Reinforced Cobalt Legplates", "=ds="..AL["Drop"]..": "..BabbleZone["Zul'Drak"] };
		{ 29, "s54981", "40959", "=q2=Reinforced Cobalt Chestpiece", "=ds="..AL["Drop"]..": "..BabbleZone["Sholazar Basin"] };
		{ 30, "s54917", "40942", "=q2=Spiked Cobalt Helm", "=ds="..AL["Trainer"] };
		Prev = "SmithingArmorWRATH2";
		Next = "SmithingArmorWRATH4";
		Back = "SMITHINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["SmithingArmorWRATH4"] = {
        { 1, "s52570", "39085", "=q2=Cobalt Chestpiece", "=ds="..AL["Trainer"] };
		{ 2, "s52571", "39084", "=q2=Cobalt Helm", "=ds="..AL["Trainer"] };
		{ 3, "s52567", "39086", "=q2=Cobalt Legplates", "=ds="..AL["Trainer"] };
		{ 4, "s55835", "41975", "=q2=Cobalt Gauntlets", "=ds="..AL["Trainer"] };
		{ 5, "s55834", "41974", "=q2=Cobalt Bracers", "=ds="..AL["Trainer"] };
		{ 6, "s52572", "39083", "=q2=Cobalt Shoulders", "=ds="..AL["Trainer"] };
		{ 7, "s54550", "40668", "=q2=Cobalt Triangle Shield", "=ds="..AL["Trainer"] };
		{ 8, "s52568", "39087", "=q2=Cobalt Belt", "=ds="..AL["Trainer"] };
		{ 9, "s52569", "39088", "=q2=Cobalt Boots", "=ds="..AL["Trainer"] };
		Prev = "SmithingArmorWRATH3";
		Back = "SMITHINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["SmithingWeaponWRATH"] = {
		{ 1, "s63182", "45085", "=q4=Titansteel Spellblade", "=ds="..AL["Trainer"] };
		{ 2, "s55370", "41383", "=q4=Titansteel Bonecrusher", "=ds="..AL["Trainer"] };
		{ 3, "s55369", "41257", "=q4=Titansteel Destroyer", "=ds="..AL["Trainer"] };
		{ 4, "s55371", "41384", "=q4=Titansteel Guardian", "=ds="..AL["Trainer"] };
		{ 5, "s56234", "42435", "=q4=Titansteel Shanker", "=ds="..AL["Trainer"] };
		{ 6, "s55183", "41186", "=q3=Corroded Saronite Edge", "=ds="..AL["Trainer"] };
		{ 7, "s55184", "41187", "=q3=Corroded Saronite Woundbringer", "=ds="..AL["Trainer"] };
		{ 8, "s55185", "41188", "=q3=Saronite Mindcrusher", "=ds="..AL["Trainer"] };
		{ 9, "s56280", "42443", "=q3=Cudgel of Saronite Justice", "=ds="..AL["Trainer"] };
		{ 10, "s55182", "41185", "=q3=Furious Saronite Beatstick", "=ds="..AL["Trainer"] };
		{ 11, "s59442", "43871", "=q3=Saronite Spellblade", "=ds="..AL["Trainer"] };
		{ 12, "s55206", "41245", "=q3=Deadly Saronite Dirk", "=ds="..AL["Trainer"] };
		{ 13, "s55181", "41184", "=q3=Saronite Shiv", "=ds="..AL["Trainer"] };
		{ 14, "s55179", "41183", "=q3=Saronite Ambusher", "=ds="..AL["Trainer"] };
		{ 15, "s55177", "41182", "=q3=Savage Cobalt Slicer", "=ds="..AL["Trainer"] };
		{ 16, "s55174", "41181", "=q3=Honed Cobalt Cleaver", "=ds="..AL["Trainer"] };
		{ 17, "s55204", "41243", "=q2=Notched Cobalt War Axe", "=ds="..AL["Trainer"] };
		{ 18, "s55202", "41241", "=q2=Sure-fire Shuriken", "=ds="..AL["Trainer"] };
		{ 19, "s55201", "41240", "=q2=Cobalt Tenderizer", "=ds="..AL["Trainer"] };
		{ 20, "s55200", "41239", "=q2=Sturdy Cobalt Quickblade", "=ds="..AL["Trainer"] };
		{ 21, "s55203", "41242", "=q2=Forged Cobalt Claymore", "=ds="..AL["Trainer"] };
		Back = "SMITHINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["SmithingEnhancement1"] = {
		{ 1, "s55628", "INV_Jewelcrafting_ThoriumSetting", "=ds=Socket Bracer", "=ds="..AL["Trainer"] };
		{ 2, "s55641", "INV_GAUNTLETS_61", "=ds=Socket Gloves", "=ds="..AL["Trainer"] };
		{ 3, "s55656", "41611", "=q3=Eternal Belt Buckle", "=ds="..AL["Trainer"] };
		{ 4, "s62202", "44936", "=q3=Titanium Plating", "=ds="..AL["Vendor"]};
		{ 5, "s56357", "42500", "=q2=Titanium Shield Spike", "=ds="..AL["Trainer"] };
		{ 6, "s55839", "41976", "=q2=Titanium Weapon Chain", "=ds="..AL["Trainer"] };
		{ 7, "s29657", "23530", "=q2=Felsteel Shield Spike", "=ds=#sr# 360"};
		{ 8, "s29656", "23529", "=q2=Adamantite Sharpening Stone", "=ds=#sr# 350"};
		{ 9, "s34608", "28421", "=q2=Adamantite Weightstone", "=ds=#sr# 350"};
		{ 10, "s42688", "33185", "=q2=Adamantite Weapon Chain", "=ds=#sr# 335"};
		{ 11, "s22757", "18262", "=q2=Elemental Sharpening Stone", "=ds=#sr# 300"};
		{ 12, "s16651", "12645", "=q2=Thorium Shield Spike", "=ds=#sr# 275"};
		{ 13, "s9964", "7969", "=q2=Mithril Spurs", "=ds=#sr# 235"};
		{ 14, "s9939", "7967", "=q2=Mithril Shield Spike", "=ds=#sr# 215"};
		{ 15, "s29729", "23576", "=q1=Greater Ward of Shielding", "=ds=#sr# 375"};
		{ 16, "s32285", "25521", "=q1=Greater Rune of Warding", "=ds=#sr# 350"};
		{ 17, "s29728", "23575", "=q1=Lesser Ward of Shielding", "=ds=#sr# 340"};
		{ 18, "s32284", "23559", "=q1=Lesser Rune of Warding", "=ds=#sr# 325"};
		{ 19, "s29654", "23528", "=q1=Fel Sharpening Stone", "=ds=#sr# 300"};
		{ 20, "s34607", "28420", "=q1=Fel Weightstone", "=ds=#sr# 300"};
		{ 21, "s16641", "12404", "=q1=Dense Sharpening Stone", "=ds=#sr# 250"};
		{ 22, "s16640", "12643", "=q1=Dense Weightstone", "=ds=#sr# 250"};
		{ 23, "s9918", "7964", "=q1=Solid Sharpening Stone", "=ds=#sr# 200"};
		{ 24, "s9921", "7965", "=q1=Solid Weightstone", "=ds=#sr# 200"};
		{ 25, "s7224", "6041", "=q1=Steel Weapon Chain", "=ds=#sr# 190"};
		{ 26, "s7222", "6043", "=q1=Iron Counterweight", "=ds=#sr# 165"};
		{ 27, "s7221", "6042", "=q1=Iron Shield Spike", "=ds=#sr# 150"};
		{ 28, "s2674", "2871", "=q1=Heavy Sharpening Stone", "=ds=#sr# 125"};
		{ 29, "s3117", "3241", "=q1=Heavy Weightstone", "=ds=#sr# 125"};
		{ 30, "s2665", "2863", "=q1=Coarse Sharpening Stone", "=ds=#sr# 65"};
		Next = "SmithingEnhancement2";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["SmithingEnhancement2"] = {
		{ 1, "s3116", "3240", "=q1=Coarse Weightstone", "=ds=#sr# 65"};
		{ 2, "s2660", "2862", "=q1=Rough Sharpening Stone", "=ds=#sr# 1"};
		{ 3, "s3115", "3239", "=q1=Rough Weightstone", "=ds=#sr# 1"};
		Prev = "SmithingEnhancement1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["SmithingMisc1"] = {
		{ 1, "s59406", "43853", "=q2=Titanium Skeleton Key", "=ds="..AL["Trainer"] };
		{ 2, "s59405", "43854", "=q2=Cobalt Skeleton Key", "=ds="..AL["Trainer"] };
		{ 3, "s19669", "15872", "=q2=Arcanite Skeleton Key", "=ds=#sr# 275"};
		{ 4, "s19668", "15871", "=q2=Truesilver Skeleton Key", "=ds=#sr# 200"};
		{ 5, "s19667", "15870", "=q2=Golden Skeleton Key", "=ds=#sr# 150"};
		{ 6, "s19666", "15869", "=q2=Silver Skeleton Key", "=ds=#sr# 100"};
		{ 7, "s55732", "41745", "=q1=Titanium Rod", "=ds="..AL["Trainer"]};
		{ 8, "s32657", "25845", "=q1=Eternium Rod", "=ds=#sr# 360"};
		{ 9, "s32656", "25844", "=q1=Adamantite Rod", "=ds=#sr# 350"};
		{ 10, "s32655", "25843", "=q1=Fel Iron Rod", "=ds=#sr# 300"};
		{ 11, "s20201", "16206", "=q1=Arcanite Rod", "=ds=#sr# 275"};
		{ 12, "s16639", "12644", "=q1=Dense Grinding Stone", "=ds=#sr# 250"};
		{ 13, "s11454", "9060", "=q1=Inlaid Mithril Cylinder", "=ds=#sr# 200"};
		{ 14, "s14380", "11144", "=q1=Truesilver Rod", "=ds=#sr# 200"};
		{ 15, "s9920", "7966", "=q1=Solid Grinding Stone", "=ds=#sr# 200"};
		{ 16, "s14379", "11128", "=q1=Golden Rod", "=ds=#sr# 150"};
		{ 17, "s8768", "7071", "=q1=Iron Buckle", "=ds=#sr# 150"};
		{ 18, "s3337", "3486", "=q1=Heavy Grinding Stone", "=ds=#sr# 125"};
		{ 19, "s7818", "6338", "=q1=Silver Rod", "=ds=#sr# 100"};
		{ 20, "s3326", "3478", "=q1=Coarse Grinding Stone", "=ds=#sr# 75"};
		{ 21, "s3320", "3470", "=q1=Rough Grinding Stone", "=ds=#sr# 25"};
		Back = "SMITHINGMENU";
	};

	AtlasLoot_Data["Armorsmith1"] = {
		{ 1, "s36122", "30069", "=q3=Earthforged Leggings", "=ds=#sr# 260"};
		{ 2, "s36124", "30070", "=q3=Windforged Leggings", "=ds=#sr# 260"};
		{ 3, "s36129", "30074", "=q3=Heavy Earthforged Breastplate", "=ds=#sr# 330"};
		{ 4, "s36130", "30076", "=q3=Stormforged Hauberk", "=ds=#sr# 330"};
		{ 5, "s34533", "28483", "=q4=Breastplate of Kings", "=ds=#sr# 350"};
		{ 6, "s34529", "23563", "=q4=Nether Chain Shirt", "=ds=#sr# 350"};
		{ 7, "s34534", "28484", "=q4=Bulwark of Kings", "=ds=#sr# 375"};
		{ 8, "s36257", "28485", "=q4=Bulwark of the Ancient Kings", "=ds=#sr# 375"};
		{ 9, "s36256", "23565", "=q4=Embrace of the Twisting Nether", "=ds=#sr# 375"};
		{ 10, "s34530", "23564", "=q4=Twisting Nether Chain Shirt", "=ds=#sr# 375"};
		{ 11, "s55186", "41189", "=q3=Chestplate of Conquest", "=ds=#sr# 415"};
		{ 12, "s55187", "41190", "=q3=Legplates of Conquest", "=ds=#sr# 415"};
		Next = "Weaponsmith1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Weaponsmith1"] = {
		{ 1, "s36125", "30071", "=q3=Light Earthforged Blade", "=ds=#sr# 260"};
		{ 2, "s36128", "30073", "=q3=Light Emberforged Hammer", "=ds=#sr# 260"};
		{ 3, "s36126", "30072", "=q3=Light Skyforged Axe", "=ds=#sr# 260"};
		{ 4, "s55183", "41186", "=q3=Corroded Saronite Edge", "=ds=#sr# 415"};
		{ 5, "s55184", "41187", "=q3=Corroded Saronite Woundbringer", "=ds=#sr# 415"};
		{ 6, "s55185", "41188", "=q3=Saronite Mindcrusher", "=ds=#sr# 415"};
		Next = "Axesmith1";
		Prev = "Armorsmith1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Axesmith1"] = {
		{ 1, "s36135", "30088", "=q3=Skyforged Great Axe", "=ds=#sr# 330"};
		{ 2, "s36134", "30087", "=q3=Stormforged Axe", "=ds=#sr# 330"};
		{ 3, "s34543", "28434", "=q4=Lunar Crescent", "=ds=#sr# 350"};
		{ 4, "s34541", "28431", "=q4=The Planar Edge", "=ds=#sr# 350"};
		{ 5, "s34542", "28432", "=q4=Black Planar Edge", "=ds=#sr# 375"};
		{ 6, "s36261", "28436", "=q4=Bloodmoon", "=ds=#sr# 375"};
		{ 7, "s34544", "28435", "=q4=Mooncleaver", "=ds=#sr# 375"};
		{ 8, "s36260", "28433", "=q4=Wicked Edge of the Planes", "=ds=#sr# 375"};
		Next = "Hammersmith1";
		Prev = "Weaponsmith1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Hammersmith1"] = {
		{ 1, "s36137", "30093", "=q3=Great Earthforged Hammer", "=ds=#sr# 330"};
		{ 2, "s36136", "30089", "=q3=Lavaforged Warhammer", "=ds=#sr# 330"};
		{ 3, "s34545", "28437", "=q4=Drakefist Hammer", "=ds=#sr# 350"};
		{ 4, "s34547", "28440", "=q4=Thunder", "=ds=#sr# 350"};
		{ 5, "s34548", "28441", "=q4=Deep Thunder", "=ds=#sr# 375"};
		{ 6, "s34546", "28438", "=q4=Dragonmaw", "=ds=#sr# 375"};
		{ 7, "s36262", "28439", "=q4=Dragonstrike", "=ds=#sr# 375"};
		{ 8, "s36263", "28442", "=q4=Stormherald", "=ds=#sr# 375"};
		Next = "Swordsmith1";
		Prev = "Axesmith1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Swordsmith1"] = {
		{ 1, "s36133", "30086", "=q3=Stoneforged Claymore", "=ds=#sr# 330"};
		{ 2, "s36131", "30077", "=q3=Windforged Rapier", "=ds=#sr# 330"};
		{ 3, "s34535", "28425", "=q4=Fireguard", "=ds=#sr# 350"};
		{ 4, "s34538", "28428", "=q4=Lionheart Blade", "=ds=#sr# 350"};
		{ 5, "s36258", "28427", "=q4=Blazefury", "=ds=#sr# 375"};
		{ 6, "s34537", "28426", "=q4=Blazeguard", "=ds=#sr# 375"};
		{ 7, "s34540", "28429", "=q4=Lionheart Champion", "=ds=#sr# 375"};
		{ 8, "s36259", "28430", "=q4=Lionheart Executioner", "=ds=#sr# 375"};
		Prev = "Hammersmith1";
		Back = "SMITHINGMENU";
		Type = "Crafting";
	};

		---------------
		--- Cooking ---
		---------------

	AtlasLoot_Data["Cooking1"] = {
		{ 1, "s818", "Spell_Fire_Fire", "=ds=Basic Campfire", "=ds="};
		{ 2, "s66037", "44838", "=q1=Slow-Roasted Turkey", "=ds="};
		{ 3, "s66034", "44839", "=q1=Candied Sweet Potato", "=ds="};
		{ 4, "s66035", "44840", "=q1=Cranberry Chutney", "=ds="};
		{ 5, "s66036", "44836", "=q1=Pumpkin Pie", "=ds="};
		{ 6, "s66038", "44837", "=q1=Spice Bread Stuffing", "=ds="};
		{ 7, "s65454", "46691", "=q1=Bread of the Dead", "=ds="};
		{ 8, "s57423", "43015", "=q1=Fish Feast", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 9, "s58527", "43478", "=q1=Gigantic Feast", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 10, "s58528", "43480", "=q1=Small Feast", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 11, "s57441", "42999", "=q1=Blackened Dragonfin", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 12, "s57438", "42997", "=q1=Blackened Worg Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 13, "s64358", "45932", "=q1=Black Jelly", "=ds="..AL["Trainer"]};
		{ 14, "s57435", "43004", "=q1=Critter Bites", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 15, "s57439", "42998", "=q1=Cuttlesteak", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 16, "s57442", "43000", "=q1=Dragonfin Filet", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 17, "s45568", "34767", "=q1=Firecracker Salmon", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 18, "s57436", "42995", "=q1=Hearty Rhino", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 19, "s45570", "34769", "=q1=Imperial Manta Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 20, "s45555", "34754", "=q1=Mega Mammoth Meal", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 21, "s45559", "34758", "=q1=Mighty Rhino Dogs", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 22, "s45567", "34766", "=q1=Poached Northern Sculpin", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 23, "s57434", "42994", "=q1=Rhinolicious Wyrmsteak", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 24, "s57437", "42996", "=q1=Snapper Extreme", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 25, "s57440", "43005", "=q1=Spiced Mammoth Treats", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 26, "s45557", "34756", "=q1=Spiced Wyrm Burger", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 27, "s45571", "34768", "=q1=Spicy Blue Nettlefish", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 28, "s57433", "42993", "=q1=Spicy Fried Herring", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 29, "s45556", "34755", "=q1=Tender Shoveltusk Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 30, "s57443", "43001", "=q1=Tracker Snacks", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		Next = "Cooking2";
		Back = "CRAFTINGMENU";
	};

	AtlasLoot_Data["Cooking2"] = {
		{ 1, "s45558", "34757", "=q1=Very Burnt Worg", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 2, "s62350", "44953", "=q1=Worg Tartare", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s45554", "34753", "=q1=Great Feast", "=ds="..AL["Trainer"]};
		{ 4, "s53056", "39520", "=q1=Kungaloosh", "=ds="..AL["Quest"]..""};
		{ 5, "s58523", "43491", "=q1=Bad Clams", "=ds="..AL["Drop"]..""};
		{ 6, "s45569", "42942", "=q1=Baked Manta Ray", "=ds="..AL["Trainer"]};
		{ 7, "s58065", "43268", "=q1=Dalaran Clam Chowder", "=ds="..AL["Trainer"]};
		{ 8, "s42302", "33052", "=q1=Fisherman's Feast", "=ds="..AL["Trainer"]};
		{ 9, "s45561", "34760", "=q1=Grilled Bonescale", "=ds="..AL["Trainer"]};
		{ 10, "s45563", "34762", "=q1=Grilled Sculpin", "=ds="..AL["Trainer"]};
		{ 11, "s58525", "43492", "=q1=Haunted Herring", "=ds="..AL["Drop"]..""};
		{ 12, "s42305", "33053", "=q1=Hot Buttered Trout", "=ds="..AL["Trainer"]};
		{ 13, "s58521", "43488", "=q1=Last Week's Mammoth", "=ds="..AL["Drop"]..""};
		{ 14, "s45549", "34748", "=q1=Mammoth Meal", "=ds="..AL["Trainer"]};
		{ 15, "s57421", "34747", "=q1=Northern Stew", "=ds="..AL["Quest"]..""};
		{ 16, "s45566", "34765", "=q1=Pickled Fangtooth", "=ds="..AL["Trainer"]};
		{ 17, "s45565", "34764", "=q1=Poached Nettlefish", "=ds="..AL["Trainer"]};
		{ 18, "s45553", "34752", "=q1=Rhino Dogs", "=ds="..AL["Trainer"]};
		{ 19, "s45552", "34751", "=q1=Roasted Worg", "=ds="..AL["Trainer"]};
		{ 20, "s45562", "34761", "=q1=Sauteed Goby", "=ds="..AL["Trainer"]};
		{ 21, "s45550", "34749", "=q1=Shoveltusk Steak", "=ds="..AL["Trainer"]};
		{ 22, "s45560", "34759", "=q1=Smoked Rockfin", "=ds="..AL["Trainer"]};
		{ 23, "s45564", "34763", "=q1=Smoked Salmon", "=ds="..AL["Trainer"]};
		{ 24, "s33296", "27667", "=q1=Spicy Crawdad", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
		{ 25, "s58512", "43490", "=q1=Tasty Cupcake", "=ds="..AL["Drop"]..""};
		{ 26, "s45551", "34750", "=q1=Wyrm Delight", "=ds="..AL["Trainer"]};
		{ 27, "s38868", "31673", "=q1=Crunchy Serpent", "=ds="..AL["Vendor"]..", "..BabbleZone["Blade's Edge Mountains"]};
		{ 28, "s38867", "31672", "=q1=Mok'Nathal Shortribs", "=ds="..AL["Vendor"]..", "..BabbleZone["Blade's Edge Mountains"]};
		{ 29, "s33295", "27666", "=q1=Golden Fish Sticks", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
		{ 30, "s45022", "34411", "=q1=Hot Apple Cider", "=ds="..AL["Vendor"]..""};
		Prev = "Cooking1";
		Next = "Cooking3";
		Back = "CRAFTINGMENU";
	};

	AtlasLoot_Data["Cooking3"] = {	
		{ 1, "s33287", "27658", "=q1=Roasted Clefthoof", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
		{ 2, "s43707", "33825", "=q1=Skullfish Soup", "=ds="..AL["Drop"]..""};
		{ 3, "s43765", "33872", "=q1=Spicy Hot Talbuk", "=ds="..AL["Drop"]..""};
		{ 4, "s33289", "27660", "=q1=Talbuk Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
		{ 5, "s33288", "27659", "=q1=Warp Burger", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
		{ 6, "s33293", "27664", "=q1=Grilled Mudfish", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
		{ 7, "s33294", "27665", "=q1=Poached Bluefish", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
		{ 8, "s42296", "33048", "=q1=Stewed Trout", "=ds="..AL["Trainer"]};
		{ 9, "s33286", "27657", "=q1=Blackened Basilisk", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
		{ 10, "s33292", "27663", "=q1=Blackened Sporefish", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
		{ 11, "s33285", "27656", "=q1=Sporeling Snack", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
		{ 12, "s33290", "27661", "=q1=Blackened Trout", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
		{ 13, "s43761", "33867", "=q1=Broiled Bloodfin", "=ds="..AL["Drop"]..""};
		{ 14, "s33279", "27651", "=q1=Buzzard Bites", "=ds="..AL["Quest"]..""};
		{ 15, "s36210", "30155", "=q1=Clam Bar", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
		{ 16, "s25659", "21023", "=q1=Dirge's Kickin' Chimaerok Chops", "=ds="..AL["Quest"]..""};
		{ 17, "s966455", "100626", "=q1=Azerothian Schmorgus Boards", "=ds="..AL["Vendor"]..""};
		{ 18, "s966436", "100609", "=q1=Chilled Lava Eels", "=ds="..AL["Vendor"]..""};
		{ 19, "s966435", "100608", "=q1=Chillwind Flank Steaks", "=ds="..AL["Drop"]..""};
		{ 20, "s966434", "100607", "=q1=Hippogryph Steaks", "=ds="..AL["Quest"]..""};
		{ 21, "s966433", "100606", "=q1=Steamed Makrinni Claws", "=ds="..AL["Quest"]..""};
		{ 22, "s966432", "100605", "=q1=Rubbed Ravasaur Ribss", "=ds="..AL["Drop"]..""};
		{ 23, "s966431", "100604", "=q1=Hearty Stegodon Stews", "=ds="..AL["Drop"]..""};
		{ 24, "s966430", "100603", "=q1=Crispy Pterrordax Wings", "=ds="..AL["Drop"]..""};
		{ 25, "s966429", "100602", "=q1=Spicy Dino Jerkys", "=ds="..AL["Drop"]..""};
		{ 26, "s966428", "100601", "=q1=Dirge's Nevermelt Ice Creams", "=ds="..AL["Quest"]..""};
		{ 27, "s966427", "100599", "=q1=Silithid Snacks", "=ds="..AL["Quest"]..""};
		{ 28, "s966426", "100598", "=q1=Hydra Scale Soups", "=ds="..AL["Quest"]..""};
		{ 29, "s966425", "100597", "=q1=Ghostly Goulashs", "=ds="..AL["Quest"]..""};
		{ 30, "s966398", "100583", "=q1=Seared Cunning Carps", "=ds="..AL["Drop"]..""};
		Prev = "Cooking2";
		Next = "Cooking4";
		Back = "CRAFTINGMENU";
	};	
	
	AtlasLoot_Data["Cooking4"] = {	
		{ 1, "s43772", "33874", "=q1=Kibler's Bits", "=ds="..AL["Drop"]..""};
		{ 2, "s33284", "27655", "=q1=Ravager Dog", "=ds="..AL["Vendor"]..", "..BabbleZone["Hellfire Peninsula"]};
		{ 3, "s43758", "33866", "=q1=Stormchops", "=ds="..AL["Drop"]..""};
		{ 4, "s24801", "20452", "=q1=Smoked Desert Dumplings", "=ds="..AL["Quest"]..""};
		{ 5, "s18247", "13935", "=q1=Baked Salmon", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
		{ 6, "s18245", "13933", "=q1=Lobster Stew", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
		{ 7, "s18246", "13934", "=q1=Mightfish Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
		{ 8, "s22761", "18254", "=q1=Runn Tum Tuber Surprise", "=ds="..AL["Drop"]..""};
		{ 9, "s46684", "35563", "=q1=Charred Bear Kabobs", "=ds="..AL["Vendor"]..", "..BabbleZone["Felwood"]};
		{ 10, "s46688", "35565", "=q1=Juicy Bear Burger", "=ds="..AL["Vendor"]..", "..BabbleZone["Felwood"]};
		{ 11, "s18243", "13931", "=q1=Nightfin Soup", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 12, "s18244", "13932", "=q1=Poached Sunscale Salmon", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 13, "s18240", "13928", "=q1=Grilled Squid", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 14, "s18242", "13929", "=q1=Hot Smoked Bass", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
		{ 15, "s64054", "INV_Misc_Shell_03", "=q1=Clamlette Magnifique", "=ds="..AL["Quest"]..""};
		{ 16, "s18239", "13927", "=q1=Cooked Glossy Mightfish", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
		{ 17, "s18241", "13930", "=q1=Filet of Redgill", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
		{ 18, "s15933", "12218", "=q1=Monster Omelet", "=ds="..AL["Vendor"]..""};
		{ 19, "s15915", "12216", "=q1=Spiced Chili Crab", "=ds="..AL["Vendor"]..""};
		{ 20, "s18238", "6887", "=q1=Spotted Yellowtail", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 21, "s22480", "18045", "=q1=Tender Wolf Steak", "=ds="..AL["Vendor"]..""};
		{ 22, "s20626", "16766", "=q1=Undermine Clam Chowder", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 23, "s15906", "12217", "=q1=Dragonbreath Chili", "=ds="..AL["Vendor"]..""};
		{ 24, "s15910", "12215", "=q1=Heavy Kodo Stew", "=ds="..AL["Vendor"]..", "..BabbleZone["Desolace"]};
		{ 25, "s21175", "17222", "=q1=Spider Sausage", "=ds="..AL["Trainer"]};
		{ 26, "s4094", "4457", "=q1=Barbecued Buzzard Wing", "=ds="};
		{ 27, "s15863", "12213", "=q1=Carrion Surprise", "=ds="..AL["Vendor"]..""};
		{ 28, "s7213", "6038", "=q1=Giant Clam Scorcho", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
		{ 29, "s13028", "10841", "=q1=Goldthorn Tea", "=ds="};
		{ 30, "s15856", "13851", "=q1=Hot Wolf Ribs", "=ds="..AL["Vendor"]..""};
		Prev = "Cooking3";
		Next = "Cooking5";
		Back = "CRAFTINGMENU";
	};	
	
	AtlasLoot_Data["Cooking5"] = {	
		{ 1, "s15861", "12212", "=q1=Jungle Stew", "=ds="..AL["Vendor"]..""};
		{ 2, "s20916", "8364", "=q1=Mithril Head Trout", "=ds="..AL["Vendor"]..""};
		{ 3, "s15865", "12214", "=q1=Mystery Stew", "=ds="..AL["Vendor"]..""};
		{ 4, "s15855", "12210", "=q1=Roast Raptor", "=ds="..AL["Vendor"]..""};
		{ 5, "s7828", "4594", "=q1=Rockscale Cod", "=ds="..AL["Vendor"]..""};
		{ 6, "s25954", "21217", "=q1=Sagefish Delight", "=ds="..AL["Vendor"]..""};
		{ 7, "s3400", "3729", "=q1=Soothing Turtle Bisque", "=ds="..AL["Quest"]..""};
		{ 8, "s24418", "20074", "=q1=Heavy Crocolisk Stew", "=ds="..AL["Vendor"]..", "..BabbleZone["Dustwallow Marsh"]};
		{ 9, "s3399", "3728", "=q1=Tasty Lion Steak", "=ds="..AL["Quest"]..""};
		{ 10, "s3376", "3665", "=q1=Curiously Tasty Omelet", "=ds="};
		{ 11, "s6500", "5527", "=q1=Goblin Deviled Clams", "=ds="..AL["Trainer"]};
		{ 12, "s3398", "3727", "=q1=Hot Lion Chops", "=ds="};
		{ 13, "s15853", "12209", "=q1=Lean Wolf Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Desolace"]};
		{ 14, "s3373", "3664", "=q1=Crocolisk Gumbo", "=ds="};
		{ 15, "s3397", "3726", "=q1=Big Bear Steak", "=ds="};
		{ 16, "s3377", "3666", "=q1=Gooey Spider Cake", "=ds="};
		{ 17, "s6419", "5480", "=q1=Lean Venison", "=ds="..AL["Vendor"]..""};
		{ 18, "s2548", "2685", "=q1=Succulent Pork Ribs", "=ds="};
		{ 19, "s7755", "4593", "=q1=Bristle Whisker Catfish", "=ds="..AL["Vendor"]..""};
		{ 20, "s45695", "34832", "=q1=Captain Rumsey's Lager", "=ds="..AL["Drop"]..""};
		{ 21, "s6418", "5479", "=q1=Crispy Lizard Tail", "=ds="..AL["Vendor"]..""};
		{ 22, "s2547", "1082", "=q1=Redridge Goulash", "=ds="};
		{ 23, "s2549", "1017", "=q1=Seasoned Wolf Kabob", "=ds="};
		{ 24, "s6501", "5526", "=q1=Clam Chowder", "=ds="..AL["Vendor"]..""};
		{ 25, "s6417", "5478", "=q1=Dig Rat Stew", "=ds="..AL["Quest"]..""};
		{ 26, "s3372", "3663", "=q1=Murloc Fin Soup", "=ds="};
		{ 27, "s2545", "2682", "=q1=Cooked Crab Claw", "=ds="};
		{ 28, "s8238", "6657", "=q1=Savory Deviate Delight", "=ds="..AL["Drop"]..""};
		{ 29, "s3370", "3662", "=q1=Crocolisk Steak", "=ds="};
		{ 30, "s8607", "6890", "=q1=Smoked Bear Meat", "=ds="..AL["Vendor"]..""};
		Prev = "Cooking4";
		Next = "Cooking6";
		Back = "CRAFTINGMENU";
	};	
	
	AtlasLoot_Data["Cooking6"] = {	
		{ 1, "s2546", "2687", "=q1=Dry Pork Ribs", "=ds="..AL["Trainer"]};
		{ 2, "s25704", "21072", "=q1=Smoked Sagefish", "=ds="..AL["Vendor"]..""};
		{ 3, "s2544", "2683", "=q1=Crab Cake", "=ds="..AL["Trainer"]};
		{ 4, "s62050", "44837", "=q1=Cornbread Stuffing", "=ds="};
		{ 5, "s2543", "733", "=q1=Westfall Stew", "=ds="};
		{ 6, "s3371", "3220", "=q1=Blood Sausage", "=ds="};
		{ 7, "s28267", "22645", "=q1=Crunchy Spider Surprise", "=ds="};
		{ 8, "s9513", "7676", "=q1=Thistle Tea", "=ds="};
		{ 9, "s33278", "27636", "=q1=Bat Bites", "=ds="..AL["Vendor"]..""};
		{ 10, "s6499", "5525", "=q1=Boiled Clams", "=ds="..AL["Trainer"]};
		{ 11, "s2541", "2684", "=q1=Coyote Steak", "=ds="..AL["Trainer"]};
		{ 12, "s6415", "5476", "=q1=Fillet of Frenzy", "=ds="..AL["Vendor"]..""};
		{ 13, "s2542", "724", "=q1=Goretusk Liver Pie", "=ds="};
		{ 14, "s7754", "6316", "=q1=Loch Frenzy Delight", "=ds="..AL["Vendor"]..""};
		{ 15, "s7753", "4592", "=q1=Longjaw Mud Snapper", "=ds="..AL["Vendor"]..""};
		{ 16, "s7827", "5095", "=q1=Rainbow Fin Albacore", "=ds="..AL["Vendor"]..""};
		{ 17, "s62045", "34112", "=q1=Roasted Turkey", "=ds="};
		{ 18, "s6416", "5477", "=q1=Strider Stew", "=ds="};
		{ 19, "s62044", "1645", "=q1=Tasty Cranberries", "=ds="};
		{ 20, "s62051", "44839", "=q1=Candied Yam", "=ds="};
		{ 21, "s21144", "17198", "=q1=Egg Nog", "=ds="..AL["Vendor"]..""};
		{ 22, "s6414", "5474", "=q1=Roasted Kodo Meat", "=ds="..AL["Vendor"]..""};
		{ 23, "s62049", "44840", "=q1=Cranberry Chutney", "=ds="};
		{ 24, "s6413", "5473", "=q1=Scorpid Surprise", "=ds="..AL["Vendor"]..""};
		{ 25, "s2795", "2888", "=q1=Beer Basted Boar Ribs", "=ds="};
		{ 26, "s6412", "5472", "=q1=Kaldorei Spider Kabob", "=ds="..AL["Quest"]..""};
		{ 27, "s2539", "2680", "=q1=Spiced Wolf Meat", "=ds="..AL["Trainer"]};
		{ 28, "s7751", "6290", "=q1=Brilliant Smallfish", "=ds="..AL["Vendor"]..""};
		{ 29, "s2538", "2679", "=q1=Charred Wolf Meat", "=ds="};
		{ 30, "s33276", "27635", "=q1=Lynx Steak", "=ds="..AL["Vendor"]..""};
		Prev = "Cooking5";
		Next = "Cooking7";
		Back = "CRAFTINGMENU";
	};	
	
	AtlasLoot_Data["Cooking7"] = {	
		{ 1, "s15935", "12224", "=q1=Crispy Bat Wing", "=ds="..AL["Vendor"]..""};
		{ 2, "s43779", "33924", "=q1=Delicious Chocolate Cake", "=ds="..AL["Drop"]..""};
		{ 3, "s21143", "17197", "=q1=Gingerbread Cookie", "=ds="..AL["Vendor"]..""};
		{ 4, "s8604", "6888", "=q1=Herb Baked Egg", "=ds="};
		{ 5, "s2540", "2681", "=q1=Roasted Boar Meat", "=ds="};
		{ 6, "s33277", "24105", "=q1=Roasted Moongraze Tenderloin", "=ds="..AL["Quest"]..""};
		{ 7, "s7752", "787", "=q1=Slitherskin Mackerel", "=ds="..AL["Vendor"]..""};
		{ 8, "s37836", "30816", "=q1=Spice Bread", "=ds="..AL["Trainer"]};
		{ 9, "s65454", "46691", "=q1=Bread of the Dead", "=ds="..AL["Vendor"]};
		Prev = "Cooking6";
		Back = "CRAFTINGMENU";
	};	

		------------------
		--- Enchanting ---
		------------------

	AtlasLoot_Data["EnchantingBootsWRATH"] = {
		{ 1, "s60763", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Assault", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 2, "s47901", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Tuskarr's Vitality", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s44589", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Superior Agility", "=ds="..AL["Trainer"]};
		{ 4, "s44508", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Spirit", "=ds="..AL["Trainer"]};
		{ 16, "s44584", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Vitality", "=ds="..AL["Trainer"]};
		{ 17, "s60606", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Assault", "=ds="..AL["Trainer"]};
		{ 18, "s44528", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Fortitude", "=ds="..AL["Trainer"]};
		{ 19, "s60623", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Icewalker", "=ds="..AL["Trainer"]};
		Next = "EnchantingBootsCLASSIC";
		Prev = "EnchantingBootsTBC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingBracerWRATH"] = {
		{ 1, "s62256", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Stamina", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 2, "s60767", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Spellpower", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s44575", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Assault", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 4, "s44593", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Spirit", "=ds="..AL["Trainer"]..""};
		{ 5, "s44598", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Expertise", "=ds="..AL["Trainer"]};
		{ 6, "s44616", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Stats", "=ds="..AL["Trainer"]};
		{ 7, "s44635", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Spellpower", "=ds="..AL["Trainer"]};
		{ 8, "s44555", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Exceptional Intellect", "=ds="..AL["Trainer"]};
		{ 9, "s60616", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Striking", "=ds="..AL["Trainer"]};
		Prev = "EnchantingBracerTBC";
		Next = "EnchantingBracerCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingChestWRATH"] = {
		{ 1, "s27958", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Mana", "=ds="..AL["Trainer"]..""};
		{ 2, "s44588", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Resilience", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s60692", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Powerful Stats", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 4, "s47900", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Super Health", "=ds="..AL["Trainer"]};
		{ 5, "s44509", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Mana Restoration", "=ds="..AL["Trainer"]};
		{ 6, "s47766", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Defense", "=ds="..AL["Trainer"]};
		{ 7, "s44492", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mighty Health", "=ds="..AL["Trainer"]};
		{ 8, "s44623", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Super Stats", "=ds="..AL["Trainer"]};
		Prev = "EnchantingChestTBC";
		Next = "EnchantingChestCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingCloakWRATH"] = {
		{ 1, "s60609", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Speed", "=ds="..AL["Trainer"]..""};
		{ 2, "s44631", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Shadow Armor", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s47899", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Wisdom", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 4, "s44591", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Titanweave", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 5, "s47898", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Speed", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 6, "s47672", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Mighty Armor", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 7, "s60663", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Major Agility", "=ds="..AL["Trainer"]};
		{ 8, "s44596", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Arcane Resistance", "=ds="..AL["Drop"]};
		{ 9, "s44556", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Fire Resistance", "=ds="..AL["Drop"]};
		{ 10, "s44483", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Frost Resistance", "=ds="..AL["Drop"]};
		{ 11, "s44494", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Nature Resistance", "=ds="..AL["Drop"]};
		{ 12, "s44590", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Shadow Resistance", "=ds="..AL["Drop"]};
		{ 13, "s44500", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Agility", "=ds="..AL["Trainer"]};
		{ 14, "s44582", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Spell Piercing", "=ds="..AL["Trainer"]};
		Prev = "EnchantingCloakTBC";
		Next = "EnchantingCloakCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingGlovesWRATH"] = {
        { 1, "s71692", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Angler", "=ds="..AL["Drop"]..""};
		{ 2, "s44625", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Armsman", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s60668", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Crusher", "=ds="..AL["Trainer"] };
		{ 4, "s44529", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Agility", "=ds="..AL["Trainer"]..""};
		{ 5, "s44488", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Precision", "=ds="..AL["Trainer"] };
		{ 6, "s44484", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Expertise", "=ds="..AL["Trainer"] };
		{ 7, "s44513", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Assault", "=ds="..AL["Trainer"] };
		{ 8, "s44506", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Gatherer", "=ds="..AL["Trainer"] };
		Prev = "EnchantingGlovesTBC";
		Next = "EnchantingGlovesCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingRing1"] = {
		{ 2, "s44645", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Assault", "=ds="..AL["Trainer"]};
		{ 3, "s44636", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Greater Spellpower", "=ds="..AL["Trainer"]};
		{ 4, "s59636", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Stamina", "=ds="..AL["Trainer"]};
		Back = "ENCHANTINGMENU";
		Submenu = "Disable";
	};

	AtlasLoot_Data["EnchantingShieldWRATH"] = {
		{ 1, "s44489", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Defense", "=ds="..AL["Trainer"]};
		{ 2, "s60653", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Intellect", "=ds="..AL["Trainer"]};
		Prev = "EnchantingShieldTBC";
		Next = "EnchantingShieldCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingTwoHWeaponWRATH"] = {
		{ 1, "s60691", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Massacre", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s44595", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Scourgebane", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s44630", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Greater Savagery", "=ds="..AL["Trainer"] };
		Prev = "EnchantingTwoHWeaponTBC";
		Next = "EnchantingTwoHWeaponCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingWeaponWRATH"] = {
		{ 1, "s64441", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Blade Ward", "=ds=#sr# 450"};
		{ 2, "s64579", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Blood Draining", "=ds=#sr# 450"};
		{ 3, "s59619", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Accuracy", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s59621", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Berserking", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s59625", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Black Magic", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s44576", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lifeward", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s60714", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Spellpower", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s60707", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Superior Potency", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s44621", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Giant Slayer", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s44524", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Icebreaker", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s44633", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Exceptional Agility", "=ds="..AL["Trainer"] };
		{ 12, "s44510", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Exceptional Spirit", "=ds="..AL["Trainer"] };
		{ 13, "s44629", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Exceptional Spellpower", "=ds="..AL["Trainer"] };
		{ 14, "s60621", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Potency", "=ds="..AL["Trainer"] };
		Prev = "EnchantingWeaponTBC";
		Next = "EnchantingWeaponCLASSIC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["EnchantingStaff1"] = {
		{ 1, "s62948", "Spell_Holy_GreaterHeal", "=ds=Enchant Staff - Greater Spellpower", "=ds="};
		{ 2, "s62959", "Spell_Holy_GreaterHeal", "=ds=Enchant Staff - Spellpower", "=ds="};
		Back = "ENCHANTINGMENU";
		Submenu = "Disable";
	};
	
	AtlasLoot_Data["EnchantingMiscWRATH"] = {
		{ 1, "s28028", "22459", "=q4=Void Sphere", "=ds=#sr# 350"};
		{ 2, "s60619", "44452", "=q3=Runed Titanium Rod", "=ds="..AL["Trainer"]};
		Next = "EnchantingMiscCLASSIC";
		Prev = "EnchantingMiscTBC";
		Back = "ENCHANTINGMENU";
		Submenu = "Expansion";
	};

		-------------------
		--- Engineering ---
		-------------------

	AtlasLoot_Data["EngineeringAmmo1"] = {
        { 1, "s72953", "52021", "=q4=Iceblade Arrow", "=ds=#p17#"};
        { 2, "s72952", "52020", "=q4=Shatter Rounds", "=ds=#p18#"};
		{ 3, "s56475", "41165", "=q1=Saronite Arrow Maker", "=ds=#sr# 415" };
		{ 4, "s56474", "41164", "=q1=Ultrasafe Bullet Machine", "=ds=#sr# 410" };
		{ 5, "s43676", "20475", "=q1=Adamantite Arrow Maker", "=ds=#sr# 335"};
		{ 6, "s30347", "34504", "=q1=Adamantite Shell Machine", "=ds=#sr# 335"};
		{ 7, "s30346", "23772", "=q2=Fel Iron Shells", "=ds=#sr# 310"};
		{ 8, "s19800", "15997", "=q2=Thorium Shells", "=ds=#sr# 285"};
		{ 9, "s12621", "10513", "=q2=Mithril Gyro-Shot", "=ds=#sr# 245"};
		{ 10, "s12596", "10512", "=q2=Hi-Impact Mithril Slugs", "=ds=#sr# 210"};
		{ 11, "s3947", "8069", "=q1=Crafted Solid Shot", "=ds=#sr# 125"};
		{ 12, "s3930", "8068", "=q1=Crafted Heavy Shot", "=ds=#sr# 75"};
		{ 13, "s3920", "8067", "=q1=Crafted Light Shot", "=ds=#sr# 1"};
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringArmor1"] = {
		{ 1, "s56480", "42549", "=q4=Armored Titanium Goggles", "=ds=#sr# 440"};
		{ 2, "s56483", "42552", "=q4=Charged Titanium Specs", "=ds=#sr# 440"};
		{ 3, "s56487", "42555", "=q4=Electroflux Sight Enhancers", "=ds=#sr# 440"};
		{ 4, "s56486", "42554", "=q4=Greensight Gogs", "=ds=#sr# 440"};
		{ 5, "s56574", "42551", "=q4=Truesight Ice Blinders", "=ds=#sr# 440"};
		{ 6, "s56484", "42553", "=q4=Visage Liquification Goggles", "=ds=#sr# 440"};
		{ 7, "s56481", "42550", "=q4=Weakness Spectralizers", "=ds=#sr# 440"};
		{ 8, "s62271", "44949", "=q4=Unbreakable Healing Amplifiers", "=ds=#sr# 440"};
		{ 9, "s46111", "34847", "=q4=Annihilator Holo-Gogs", "=ds=#sr# 375"};
		{ 10, "s30565", "23838", "=q4=Foreman's Enchanted Helmet", "=ds=#sr# 375"};
		{ 11, "s30566", "23839", "=q4=Foreman's Reinforced Helmet", "=ds=#sr# 375"};
		{ 12, "s30575", "23829", "=q4=Gnomish Battle Goggles", "=ds=#sr# 375"};
		{ 13, "s30574", "23828", "=q4=Gnomish Power Goggles", "=ds=#sr# 375"};
		{ 14, "s46115", "34357", "=q4=Hard Khorium Goggles", "=ds=#sr# 375"};
		{ 15, "s46109", "35182", "=q4=Hyper-Magnified Moon Specs", "=ds=#sr# 375"};
		{ 16, "s46107", "35185", "=q4=Justicebringer 3000 Specs", "=ds=#sr# 375"};
		{ 17, "s46112", "34355", "=q4=Lightning Etched Specs", "=ds=#sr# 375"};
		{ 18, "s46114", "34354", "=q4=Mayhem Projection Goggles", "=ds=#sr# 375"};
		{ 19, "s46108", "35181", "=q4=Powerheal 9000 Lens", "=ds=#sr# 375"};
		{ 20, "s46110", "35184", "=q4=Primal-Attuned Goggles", "=ds=#sr# 375"};
		{ 21, "s46116", "34353", "=q4=Quad Deathblow X44 Goggles", "=ds=#sr# 375"};
		{ 22, "s46113", "34356", "=q4=Surestrike Goggles v3.0", "=ds=#sr# 375"};
		{ 23, "s46106", "35183", "=q4=Wonderheal XT68 Shades", "=ds=#sr# 375"};
		{ 24, "s41317", "32478", "=q4=Deathblow X11 Goggles", "=ds=#sr# 350"};
		{ 25, "s41320", "32494", "=q4=Destruction Holo-gogs", "=ds=#sr# 350"};
		{ 26, "s40274", "32461", "=q4=Furious Gizmatic Goggles", "=ds=#sr# 350"};
		{ 27, "s41315", "32476", "=q4=Gadgetstorm Goggles", "=ds=#sr# 350"};
		{ 28, "s41311", "32472", "=q4=Justicebringer 2000 Specs", "=ds=#sr# 350"};
		{ 29, "s41316", "32475", "=q4=Living Replicator Specs", "=ds=#sr# 350"};
		{ 30, "s41319", "32480", "=q4=Magnified Moon Specs", "=ds=#sr# 350"};
		Next = "EngineeringArmor2";
		Back = "ENGINEERINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["EngineeringArmor2"] = {
		{ 1, "s41321", "32495", "=q4=Powerheal 4000 Lens", "=ds=#sr# 350"};
		{ 2, "s41314", "32474", "=q4=Surestrike Goggles v2.0", "=ds=#sr# 350"};
		{ 3, "s41312", "32473", "=q4=Tankatronic Goggles", "=ds=#sr# 350"};
		{ 4, "s41318", "32479", "=q4=Wonderheal XT40 Shades", "=ds=#sr# 350"};
		{ 5, "s22797", "18168", "=q4=Force Reactive Disk", "=ds=#sr# 300"};
		{ 6, "s56469", "41121", "=q3=Gnomish Lightning Generator", "=ds=#sr# 425" };
		{ 7, "s56473", "40895", "=q3=Gnomish X-Ray Specs", "=ds=#sr# 425" };
		{ 8, "s61483", "44742", "=q3=Mechanized Snow Goggles", "=ds=#sr# 420"};
		{ 9, "s56467", "40865", "=q3=Noise Machine", "=ds=#sr# 420"};
		{ 10, "s56466", "40767", "=q3=Sonic Booster", "=ds=#sr# 420"};
		{ 11, "s30325", "23763", "=q3=Hyper-Vision Goggles", "=ds=#sr# 360"};
		{ 12, "s30556", "23824", "=q3=Rocket Boots Xtreme", "=ds=#sr# 355"};
		{ 13, "s46697", "35581", "=q3=Rocket Boots Xtreme Lite", "=ds=#sr# 355"};
		{ 14, "s30563", "23836", "=q3=Goblin Rocket Launcher", "=ds=#sr# 350"};
		{ 15, "s30570", "23825", "=q3=Nigh-Invulnerability Belt", "=ds=#sr# 350"};
		{ 16, "s30318", "23762", "=q3=Ultra-Spectropic Detection Goggles", "=ds=#sr# 350"};
		{ 17, "s30316", "23758", "=q3=Cogspinner Goggles", "=ds=#sr# 340"};
		{ 18, "s30569", "23835", "=q3=Gnomish Poultryizer", "=ds=#sr# 340"};
		{ 19, "s30317", "23761", "=q3=Power Amplification Goggles", "=ds=#sr# 340"};
		{ 20, "s19830", "16022", "=q3=Arcanite Dragonling", "=ds=#sr# 300"};
		{ 21, "s24356", "19999", "=q3=Bloodvine Goggles", "=ds=#sr# 300"};
		{ 22, "s24357", "19998", "=q3=Bloodvine Lens", "=ds=#sr# 300"};
		{ 23, "s23082", "18639", "=q3=Ultra-Flash Shadow Reflector", "=ds=#sr# 300"};
		{ 24, "s23081", "18638", "=q3=Hyper-Radiant Flame Reflector", "=ds=#sr# 290"};
		{ 25, "s23077", "18634", "=q3=Gyrofreeze Ice Reflector", "=ds=#sr# 260"};
		{ 26, "s12622", "10504", "=q3=Green Lens", "=ds=#sr# 245"};
		{ 27, "s19825", "16008", "=q2=Master Engineer's Goggles", "=ds=#sr# 290"};
		{ 28, "s19819", "16009", "=q2=Voice Amplification Modulator", "=ds=#sr# 290"};
		{ 29, "s23079", "18637", "=q2=Major Recombobulator", "=ds=#sr# 275"};
		{ 30, "s19794", "15999", "=q2=Spellpower Goggles Xtreme Plus", "=ds=#sr# 270"};
		Next = "EngineeringArmor3";
		Prev = "EngineeringArmor1";
		Back = "ENGINEERINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["EngineeringArmor3"] = {
		{ 1, "s23486", "18984", "=q2=Dimensional Ripper - Everlook", "=ds=#sr# 260"};
		{ 2, "s23489", "18986", "=q2=Ultrasafe Transporter - Gadgetzan", "=ds=#sr# 260"};
		{ 3, "s12624", "10576", "=q2=Mithril Mechanical Dragonling", "=ds=#sr# 250"};
		{ 4, "s12758", "10588", "=q2=Goblin Rocket Helmet", "=ds=#sr# 245"};
		{ 5, "s12907", "10726", "=q2=Gnomish Mind Control Cap", "=ds=#sr# 235"};
		{ 6, "s12617", "10506", "=q2=Deepdive Helmet", "=ds=#sr# 230"};
		{ 7, "s12618", "10503", "=q2=Rose Colored Goggles", "=ds=#sr# 230"};
		{ 8, "s12905", "10724", "=q2=Gnomish Rocket Boots", "=ds=#sr# 225"};
		{ 9, "s8895", "7189", "=q2=Goblin Rocket Boots", "=ds=#sr# 225"};
		{ 10, "s12616", "10518", "=q2=Parachute Cloak", "=ds=#sr# 225"};
		{ 11, "s12615", "10502", "=q2=Spellpower Goggles Xtreme", "=ds=#sr# 225"};
		{ 12, "s12607", "10501", "=q2=Catseye Ultra Goggles", "=ds=#sr# 220"};
		{ 13, "s12903", "10721", "=q2=Gnomish Harm Prevention Belt", "=ds=#sr# 215"};
		{ 14, "s12897", "10545", "=q2=Gnomish Goggles", "=ds=#sr# 210"};
		{ 15, "s12594", "10500", "=q2=Fire Goggles", "=ds=#sr# 205"};
		{ 16, "s12718", "10543", "=q2=Goblin Construction Helmet", "=ds=#sr# 205"};
		{ 17, "s12717", "10542", "=q2=Goblin Mining Helmet", "=ds=#sr# 205"};
		{ 18, "s3966", "4393", "=q2=Craftsman's Monocle", "=ds=#sr# 185"};
		{ 19, "s12587", "10499", "=q2=Bright-Eye Goggles", "=ds=#sr# 175"};
		{ 20, "s3956", "4385", "=q2=Green Tinted Goggles", "=ds=#sr# 150"};
		{ 21, "s3952", "4381", "=q2=Minor Recombobulator", "=ds=#sr# 140"};
		{ 22, "s9269", "7506", "=q2=Gnomish Universal Remote", "=ds=#sr# 125"};
		{ 23, "s3940", "4373", "=q2=Shadow Goggles", "=ds=#sr# 120"};
		{ 24, "s3934", "4368", "=q2=Flying Tiger Goggles", "=ds=#sr# 100"};
		{ 25, "s12759", "10645", "=q1=Gnomish Death Ray", "=ds=#sr# 240"};
		{ 26, "s12908", "10727", "=q1=Goblin Dragon Gun", "=ds=#sr# 240"};
		{ 27, "s12906", "10725", "=q1=Gnomish Battle Chicken", "=ds=#sr# 230"};
		{ 28, "s12755", "10587", "=q1=Goblin Bomb Dispenser", "=ds=#sr# 230"};
		{ 29, "s12899", "10716", "=q1=Gnomish Shrink Ray", "=ds=#sr# 205"};
		{ 30, "s3971", "4397", "=q1=Gnomish Cloaking Device", "=ds=#sr# 200"};
		Prev = "EngineeringArmor2";
		Next = "EngineeringArmor4";
		Back = "ENGINEERINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["EngineeringArmor4"] = {
		{ 1, "s3969", "4396", "=q1=Mechanical Dragonling", "=ds=#sr# 200"};
		Prev = "EngineeringArmor3";
		Back = "ENGINEERINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["EngineeringExplosives1"] = {
		{ 1, "s56514", "42641", "=q1=Global Thermal Sapper Charge", "=ds=#sr# 425"};
		{ 2, "s56468", "44951", "=q1=Box of Bombs", "=ds=#sr# 405" };
		{ 3, "s56463", "40536", "=q1=Explosive Decoy", "=ds=#sr# 375"};
		{ 4, "s56460", "40771", "=q1=Cobalt Frag Bomb", "=ds=#sr# 350"};
		{ 5, "s30547", "23819", "=q1=Elemental Seaforium Charge", "=ds=#sr# 350"};
		{ 6, "s30560", "23827", "=q1=Super Sapper Charge", "=ds=#sr# 340"};
		{ 7, "s39973", "32413", "=q1=Frost Grenades", "=ds=#sr# 335"};
		{ 8, "s30311", "23737", "=q1=Adamantite Grenade", "=ds=#sr# 325"};
		{ 9, "s30558", "23826", "=q1=The Bigger One", "=ds=#sr# 325"};
		{ 10, "s19831", "16040", "=q1=Arcane Bomb", "=ds=#sr# 300"};
		{ 11, "s30310", "23736", "=q1=Fel Iron Bomb", "=ds=#sr# 300"};
		{ 12, "s19799", "16005", "=q1=Dark Iron Bomb", "=ds=#sr# 285"};
		{ 13, "s23080", "18594", "=q1=Powerful Seaforium Charge", "=ds=#sr# 275"};
		{ 14, "s19790", "15993", "=q1=Thorium Grenade", "=ds=#sr# 260"};
		{ 15, "s23070", "18641", "=q1=Dense Dynamite", "=ds=#sr# 250"};
		{ 16, "s12619", "10562", "=q1=Hi-Explosive Bomb", "=ds=#sr# 235"};
		{ 17, "s12754", "10586", "=q1=The Big One", "=ds=#sr# 235"};
		{ 18, "s12603", "10514", "=q1=Mithril Frag Bomb", "=ds=#sr# 215"};
		{ 19, "s12716", "10577", "=q1=Goblin Mortar", "=ds=#sr# 205"};
		{ 20, "s12760", "10646", "=q1=Goblin Sapper Charge", "=ds=#sr# 205"};
		{ 21, "s13240", "10577", "=q1=The Mortar: Reloaded", "=ds=#sr# 205"};
		{ 22, "s23069", "18588", "=q1=EZ-Thro Dynamite II", "=ds=#sr# 200"};
		{ 23, "s3972", "4398", "=q1=Large Seaforium Charge", "=ds=#sr# 200"};
		{ 24, "s3968", "4395", "=q1=Goblin Land Mine", "=ds=#sr# 195"};
		{ 25, "s3967", "4394", "=q1=Big Iron Bomb", "=ds=#sr# 190"};
		{ 26, "s3962", "4390", "=q1=Iron Grenade", "=ds=#sr# 175"};
		{ 27, "s12586", "10507", "=q1=Solid Dynamite", "=ds=#sr# 175"};
		{ 28, "s3960", "4403", "=q1=Portable Bronze Mortar", "=ds=#sr# 165"};
		{ 29, "s3950", "4380", "=q1=Big Bronze Bomb", "=ds=#sr# 140"};
		{ 30, "s3946", "4378", "=q1=Heavy Dynamite", "=ds=#sr# 125"};
		Next = "EngineeringExplosives2";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringExplosives2"] = {
		{ 1, "s3941", "4374", "=q1=Small Bronze Bomb", "=ds=#sr# 120"};
		{ 2, "s3937", "4370", "=q1=Large Copper Bomb", "=ds=#sr# 105"};
		{ 3, "s8339", "6714", "=q1=EZ-Thro Dynamite", "=ds=#sr# 100"};
		{ 4, "s3933", "4367", "=q1=Small Seaforium Charge", "=ds=#sr# 100"};
		{ 5, "s3931", "4365", "=q1=Coarse Dynamite", "=ds=#sr# 75"};
		{ 6, "s3923", "4360", "=q1=Rough Copper Bomb", "=ds=#sr# 30"};
		{ 7, "s3919", "4358", "=q1=Rough Dynamite", "=ds=#sr# 1"};
		Prev = "EngineeringExplosives1";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringItemEnhancements1"] = {
		{ 1, "s56478", "41167", "=q3=Heartseeker Scope", "=ds=#sr# 430" };
		{ 2, "s56470", "41146", "=q3=Sun Scope", "=ds=#sr# 425" };
		{ 3, "s61471", "44739", "=q1=Diamond-cut Refractor Scope", "=ds=#sr# 390" };
		{ 4, "s30334", "23766", "=q3=Stabilized Eternium Scope", "=ds=#sr# 375"};
		{ 5, "s30332", "23765", "=q3=Khorium Scope", "=ds=#sr# 360"};
		{ 6, "s30329", "23764", "=q2=Adamantite Scope", "=ds=#sr# 335"};
		{ 7, "s22793", "18283", "=q3=Biznicks 247x128 Accurascope", "=ds=#sr# 300"};
		{ 8, "s12620", "10548", "=q1=Sniper Scope", "=ds=#sr# 240"};
		{ 9, "s12597", "10546", "=q1=Deadly Scope", "=ds=#sr# 210"};
		{ 10, "s3979", "4407", "=q2=Accurate Scope", "=ds=#sr# 180"};
		{ 11, "s3978", "4406", "=q1=Standard Scope", "=ds=#sr# 110"};
		{ 12, "s3977", "4405", "=q1=Crude Scope", "=ds=#sr# 60"};
		{ 16, "s55016", "Trade_Engineering", "=ds=Nitro Boosts", "=ds=#sr# 405"};
		{ 17, "s54998", "Trade_Engineering", "=ds=Hand-Mounted Pyro Rocket", "=ds=#sr# 400"};
		{ 18, "s54999", "Trade_Engineering", "=ds=Hyperspeed Accelerators", "=ds=#sr# 400"};
		{ 19, "s63770", "Trade_Engineering", "=ds=Reticulated Armor Webbing", "=ds=#sr# 400"};
		{ 20, "s54736", "Trade_Engineering", "=ds=Personal Electromagnetic Pulse Generator", "=ds=#sr# 390"};
		{ 21, "s54793", "Trade_Engineering", "=ds=Belt-Clipped Spynoculars", "=ds=#sr# 380"};
		{ 22, "s55002", "Trade_Engineering", "=ds=Flexweave Underlay", "=ds=#sr# 380"};
		{ 23, "s63765", "Trade_Engineering", "=ds=Springy Arachnoweave", "=ds=#sr# 380"};
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringMisc1"] = {
		{ 1, "s68067", "49040", "=q4=Jeeves", "=ds=#sr# 450"};
		{ 2, "s60866", "41508", "=q4=Mechano-hog", "=ds=#sr# 450" };
		{ 3, "s60867", "44413", "=q4=Mekgineer's Chopper", "=ds=#sr# 450" };
		{ 4, "s44157", "34061", "=q4=Turbo-Charged Flying Machine", "=ds=#sr# 375"};
		{ 5, "s56472", "40768", "=q3=MOLL-E", "=ds=#sr# 425" };
		{ 6, "s67920", "48933", "=q3=Wormhole Generator: Northrend", "=ds=#sr# 415"};
		{ 7, "s30349", "23775", "=q3=Titanium Toolbox", "=ds=#sr# 405" };
		{ 8, "s44155", "34060", "=q3=Flying Machine", "=ds=#sr# 350"};
		{ 9, "s63750", "45631", "=q3=High-powered Flashlight", "=ds="};
		{ 10, "s36954", "30542", "=q2=Dimensional Ripper - Area 52", "=ds=#sr# 350"};
		{ 11, "s36955", "30544", "=q2=Ultrasafe Transporter - Toshley's Station", "=ds=#sr# 350"};
		{ 12, "s30348", "23774", "=q2=Fel Iron Toolbox", "=ds=#sr# 325"};
		{ 13, "s30337", "23767", "=q2=Crashin' Thrashin' Robot", "=ds=#sr# 325"};
		{ 14, "s23129", "18660", "=q2=World Enlarger", "=ds=#sr# 260"};
		{ 15, "s56462", "40772", "=q1=Gnomish Army Knife", "=ds=#sr# 435" };
		{ 16, "s56477", "42546", "=q1=Mana Injector Kit", "=ds=#sr# 415" };
		{ 17, "s55252", "40769", "=q1=Scrapbot Construction Kit", "=ds=#sr# 415" };
		{ 18, "s56476", "37567", "=q1=Healing Injector Kit", "=ds=#sr# 410" };
		{ 19, "s67326", "47828", "=q1=Goblin Beam Welder", "=ds=#sr# 400"};
		{ 20, "s56461", "40893", "=q1=Bladed Pickaxe", "=ds=#sr# 375" };
		{ 21, "s56459", "40892", "=q1=Hammer Pick", "=ds=#sr# 375" };
		{ 22, "s44391", "34113", "=q1=Field Repair Bot 110G", "=ds=#sr# 360"};
		{ 23, "s30552", "33093", "=q1=Mana Potion Injector", "=ds=#sr# 345"};
		{ 24, "s30344", "23771", "=q1=Green Smoke Flare", "=ds=#sr# 335"};
		{ 25, "s32814", "25886", "=q1=Purple Smoke Flare", "=ds=#sr# 335"};
		{ 26, "s30341", "23768", "=q1=White Smoke Flare", "=ds=#sr# 335"};
		{ 27, "s30551", "33092", "=q1=Healing Potion Injector", "=ds=#sr# 330"};
		{ 28, "s30568", "23841", "=q1=Gnomish Flame Turret", "=ds=#sr# 325"};
		{ 29, "s30548", "23821", "=q1=Zapthrottle Mote Extractor", "=ds=#sr# 305"};
		{ 30, "s22704", "18232", "=q1=Field Repair Bot 74A", "=ds=#sr# 300"};
		Next = "EngineeringMisc2";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringMisc2"] = {
		{ 1, "s30573", "23832", "=q1=Gnomish Tonk Controller", "=ds=#sr# 295"};
		{ 2, "s30561", "23831", "=q1=Goblin Tonk Controller", "=ds=#sr# 295"};
		{ 3, "s26443", "21570", "=q1=Firework Cluster Launcher", "=ds=#sr# 275"};
		{ 4, "s19814", "16023", "=q1=Masterwork Target Dummy", "=ds=#sr# 275"};
		{ 5, "s26426", "21714", "=q1=Large Blue Rocket Cluster", "=ds=#sr# 275"};
		{ 6, "s26427", "21716", "=q1=Large Green Rocket Cluster", "=ds=#sr# 275"};
		{ 7, "s26428", "21718", "=q1=Large Red Rocket Cluster", "=ds=#sr# 275"};
		{ 8, "s23096", "18645", "=q1=Alarm-O-Bot", "=ds=#sr# 265"};
		{ 9, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "=ds=#sr# 265"};
		{ 10, "s19793", "15996", "=q1=Lifelike Mechanical Toad", "=ds=#sr# 265"};
		{ 11, "s19567", "15846", "=q1=Salt Shaker", "=ds=#sr# 250"};
		{ 12, "s26011", "21277", "=q1=Tranquil Mechanical Yeti", "=ds=#sr# 250"};
		{ 13, "s23507", "19026", "=q1=Snake Burst Firework", "=ds=#sr# 250"};
		{ 14, "s26442", "21569", "=q1=Firework Launcher", "=ds=#sr# 225"};
		{ 15, "s26423", "21571", "=q1=Blue Rocket Cluster", "=ds=#sr# 225"};
		{ 16, "s26424", "21574", "=q1=Green Rocket Cluster", "=ds=#sr# 225"};
		{ 17, "s26425", "21576", "=q1=Red Rocket Cluster", "=ds=#sr# 225"};
		{ 18, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# 210"};
		{ 19, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# 205"};
		{ 20, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# 205"};
		{ 21, "s15633", "11826", "=q1=Lil' Smoky", "=ds=#sr# 205"};
		{ 22, "s15628", "11825", "=q1=Pet Bombling", "=ds=#sr# 205"};
		{ 23, "s15255", "11590", "=q1=Mechanical Repair Kit", "=ds=#sr# 200"};
		{ 24, "s21940", "17716", "=q1=Snowmaster 9000", "=ds=#sr# 190"};
		{ 25, "s3965", "4392", "=q1=Advanced Target Dummy", "=ds=#sr# 185"};
		{ 26, "s8243", "4852", "=q1=Flash Bomb", "=ds=#sr# 185"};
		{ 27, "s26420", "21589", "=q1=Large Blue Rocket", "=ds=#sr# 175"};
		{ 28, "s26421", "21590", "=q1=Large Green Rocket", "=ds=#sr# 175"};
		{ 29, "s26422", "21592", "=q1=Large Red Rocket", "=ds=#sr# 175"};
		{ 30, "s3963", "4391", "=q1=Compact Harvest Reaper Kit", "=ds=#sr# 175"};
		Next = "EngineeringMisc3";
		Prev = "EngineeringMisc1";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringMisc3"] = {
		{ 1, "s9273", "7148", "=q1=Goblin Jumper Cables", "=ds=#sr# 165"};
		{ 2, "s3959", "4388", "=q1=Discombobulator Ray", "=ds=#sr# 160"};
		{ 3, "s3957", "4386", "=q1=Ice Deflector", "=ds=#sr# 155"};
		{ 4, "s3955", "4384", "=q1=Explosive Sheep", "=ds=#sr# 150"};
		{ 5, "s9271", "6533", "=q1=Aquadynamic Fish Attractor", "=ds=#sr# 150"};
		{ 6, "s23067", "9312", "=q1=Blue Firework", "=ds=#sr# 150"};
		{ 7, "s23068", "9313", "=q1=Green Firework", "=ds=#sr# 150"};
		{ 8, "s23066", "9318", "=q1=Red Firework", "=ds=#sr# 150"};
		{ 9, "s6458", "5507", "=q1=Ornate Spyglass", "=ds=#sr# 135"};
		{ 10, "s26416", "21558", "=q1=Small Blue Rocket", "=ds=#sr# 125"};
		{ 11, "s26417", "21559", "=q1=Small Green Rocket", "=ds=#sr# 125"};
		{ 12, "s26418", "21557", "=q1=Small Red Rocket", "=ds=#sr# 125"};
		{ 13, "s3944", "4376", "=q1=Flame Deflector", "=ds=#sr# 125"};
		{ 14, "s8334", "6712", "=q1=Practice Lock", "=ds=#sr# 100"};
		{ 15, "s3932", "4366", "=q1=Target Dummy", "=ds=#sr# 85"};
		{ 16, "s3928", "4401", "=q1=Mechanical Squirrel", "=ds=#sr# 75"};
		Prev = "EngineeringMisc2";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringReagents1"] = {
		{ 1, "s56349", "39681", "=q1=Handful of Cobalt Bolts", "=ds="..AL["Trainer"]..""};
		{ 2, "s56471", "39683", "=q1=Froststeel Tube", "=ds=#sr# 390" };
		{ 3, "s56464", "39682", "=q1=Overcharged Capacitor", "=ds=#sr# 375"};
		{ 4, "s53281", "39690", "=q1=Volatile Blasting Trigger", "=ds="..AL["Trainer"]..""};
		{ 5, "s30309", "23787", "=q1=Felsteel Stabilizer", "=ds=#sr# 340"};
		{ 6, "s30307", "23785", "=q1=Hardened Adamantite Tube", "=ds=#sr# 340"};
		{ 7, "s30308", "23786", "=q1=Khorium Power Core", "=ds=#sr# 340"};
		{ 8, "s39971", "32423", "=q1=Icy Blasting Primers", "=ds=#sr# 335"};
		{ 9, "s30306", "23784", "=q1=Adamantite Frame", "=ds=#sr# 325"};
		{ 10, "s30305", "23783", "=q1=Handful of Fel Iron Bolts", "=ds=#sr# 300"};
		{ 11, "s30303", "23781", "=q1=Elemental Blasting Powder", "=ds=#sr# 300"};
		{ 12, "s30304", "23782", "=q1=Fel Iron Casing", "=ds=#sr# 300"};
		{ 13, "s19815", "16006", "=q1=Delicate Arcanite Converter", "=ds=#sr# 285"};
		{ 14, "s19795", "16000", "=q1=Thorium Tube", "=ds=#sr# 275"};
		{ 15, "s39895", "7191", "=q1=Fused Wiring", "=ds=#sr# 275"};
		{ 16, "s19791", "15994", "=q1=Thorium Widget", "=ds=#sr# 260"};
		{ 17, "s23071", "18631", "=q1=Truesilver Transformer", "=ds=#sr# 260"};
		{ 18, "s19788", "15992", "=q1=Dense Blasting Powder", "=ds=#sr# 250"};
		{ 19, "s12599", "10561", "=q1=Mithril Casing", "=ds=#sr# 215"};
		{ 20, "s12591", "10560", "=q1=Unstable Trigger", "=ds=#sr# 200"};
		{ 21, "s12589", "10559", "=q1=Mithril Tube", "=ds=#sr# 195"};
		{ 22, "s12590", "10498", "=q1=Gyromatic Micro-Adjustor", "=ds=#sr# 175"};
		{ 23, "s12585", "10505", "=q1=Solid Blasting Powder", "=ds=#sr# 175"};
		{ 24, "s3961", "4389", "=q1=Gyrochronatom", "=ds=#sr# 170"};
		{ 25, "s3958", "4387", "=q1=Iron Strut", "=ds=#sr# 160"};
		{ 26, "s12584", "10558", "=q1=Gold Power Core", "=ds=#sr# 150"};
		{ 27, "s3953", "4382", "=q1=Bronze Framework", "=ds=#sr# 145"};
		{ 28, "s3942", "4375", "=q1=Whirring Bronze Gizmo", "=ds=#sr# 125"};
		{ 29, "s3945", "4377", "=q1=Heavy Blasting Powder", "=ds=#sr# 125"};
		{ 30, "s3938", "4371", "=q1=Bronze Tube", "=ds=#sr# 105"};
		Next = "EngineeringReagents2";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringReagents2"] = {
		{ 1, "s3973", "4404", "=q1=Silver Contact", "=ds=#sr# 90"};
		{ 2, "s3929", "4364", "=q1=Coarse Blasting Powder", "=ds=#sr# 75"};
		{ 3, "s3926", "4363", "=q1=Copper Modulator", "=ds=#sr# 65"};
		{ 4, "s3924", "4361", "=q1=Copper Tube", "=ds=#sr# 50"};
		{ 5, "s3922", "4359", "=q1=Handful of Copper Bolts", "=ds=#sr# 30"};
		{ 6, "s3918", "4357", "=q1=Rough Blasting Powder", "=ds=#sr# 1"};
		Prev = "EngineeringReagents1";
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["EngineeringWeapon1"] = {
		{ 1, "s56479", "41168", "=q4=Armor Plated Combat Shotgun", "=ds=#sr# 450" };
		{ 2, "s60874", "44504", "=q4=Nesingwary 4000", "=ds=#sr# 450" };
		{ 3, "s54353", "39688", "=q3=Mark \"S\" Boomstick", "=ds=#sr# 400" };
		{ 4, "s41307", "32756", "=q4=Gyro-balanced Khorium Destroyer", "=ds=#sr# 375"};
		{ 5, "s30315", "23748", "=q3=Ornate Khorium Rifle", "=ds=#sr# 375"};
		{ 6, "s30314", "23747", "=q3=Felsteel Boomstick", "=ds=#sr# 360"};
		{ 7, "s30313", "23746", "=q2=Adamantite Rifle", "=ds=#sr# 350"};
		{ 8, "s30312", "23742", "=q2=Fel Iron Musket", "=ds=#sr# 320"};
		{ 9, "s22795", "18282", "=q4=Core Marksman Rifle", "=ds=#sr# 300"};
		{ 10, "s19833", "16007", "=q3=Flawless Arcanite Rifle", "=ds=#sr# 300"};
		{ 11, "s19796", "16004", "=q3=Dark Iron Rifle", "=ds=#sr# 275"};
		{ 12, "s19792", "15995", "=q2=Thorium Rifle", "=ds=#sr# 260"};
		{ 13, "s12614", "10510", "=q2=Mithril Heavy-bore Rifle", "=ds=#sr# 220"};
		{ 14, "s12595", "10508", "=q2=Mithril Blunderbuss", "=ds=#sr# 205"};
		{ 15, "s3954", "4383", "=q2=Moonsight Rifle", "=ds=#sr# 145"};
		{ 16, "s3949", "4379", "=q2=Silver-plated Shotgun", "=ds=#sr# 130"};
		{ 17, "s3939", "4372", "=q2=Lovingly Crafted Boomstick", "=ds=#sr# 120"};
		{ 18, "s3936", "4369", "=q2=Deadly Blunderbuss", "=ds=#sr# 105"};
		{ 19, "s3925", "4362", "=q2=Rough Boomstick", "=ds=#sr# 50"};
		{ 20, "s7430", "6219", "=q1=Arclight Spanner", "=ds=#sr# 50"};
		Back = "ENGINEERINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Gnomish1"] = {
        { 1, "s72953", "52021", "=q4=Iceblade Arrow", "=ds=#sr# 450"};
		{ 2, "s30575", "23829", "=q4=Gnomish Battle Goggles", "=ds=#sr# 375"};
		{ 3, "s30574", "23828", "=q4=Gnomish Power Goggles", "=ds=#sr# 375"};
		{ 4, "s56473", "40895", "=q3=Gnomish X-Ray Specs", "=ds=#sr# 425" };
		{ 5, "s30570", "23825", "=q3=Nigh-Invulnerability Belt", "=ds=#sr# 350"};
		{ 6, "s30569", "23835", "=q3=Gnomish Poultryizer", "=ds=#sr# 340"};
		{ 7, "s36955", "30544", "=q2=Ultrasafe Transporter - Toshley's Station", "=ds=#sr# 350"};
		{ 8, "s23489", "18986", "=q2=Ultrasafe Transporter - Gadgetzan", "=ds=#sr# 260"};
		{ 9, "s23129", "18660", "=q2=World Enlarger", "=ds=#sr# 260"};
		{ 10, "s12907", "10726", "=q2=Gnomish Mind Control Cap", "=ds=#sr# 235"};
		{ 11, "s12905", "10724", "=q2=Gnomish Rocket Boots", "=ds=#sr# 225"};
		{ 12, "s12903", "10721", "=q2=Gnomish Harm Prevention Belt", "=ds=#sr# 215"};
		{ 13, "s12897", "10545", "=q2=Gnomish Goggles", "=ds=#sr# 210"};
		{ 14, "s30568", "23841", "=q1=Gnomish Flame Turret", "=ds=#sr# 325"};
		{ 15, "s23096", "18645", "=q1=Alarm-O-Bot", "=ds=#sr# 265"};
		{ 16, "s12759", "10645", "=q1=Gnomish Death Ray", "=ds=#sr# 240"};
		{ 17, "s12906", "10725", "=q1=Gnomish Battle Chicken", "=ds=#sr# 230"};
		{ 18, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# 210"};
		{ 19, "s12899", "10716", "=q1=Gnomish Shrink Ray", "=ds=#sr# 205"};
		{ 20, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# 205"};
		Back = "ENGINEERINGMENU";
	};

	AtlasLoot_Data["Goblin1"] = {
        { 1, "s72952", "52020", "=q4=Shatter Rounds", "=ds=#sr# 450"};
		{ 2, "s30565", "23838", "=q4=Foreman's Enchanted Helmet", "=ds=#sr# 375"};
		{ 3, "s30566", "23839", "=q4=Foreman's Reinforced Helmet", "=ds=#sr# 375"};
		{ 4, "s30563", "23836", "=q3=Goblin Rocket Launcher", "=ds=#sr# 350"};
		{ 5, "s36954", "30542", "=q2=Dimensional Ripper - Area 52", "=ds=#sr# 350"};
		{ 6, "s23486", "18984", "=q2=Dimensional Ripper - Everlook", "=ds=#sr# 260"};
		{ 7, "s12758", "10588", "=q2=Goblin Rocket Helmet", "=ds=#sr# 245"};
		{ 8, "s8895", "7189", "=q2=Goblin Rocket Boots", "=ds=#sr# 225"};
		{ 9, "s12718", "10543", "=q2=Goblin Construction Helmet", "=ds=#sr# 205"};
		{ 10, "s12717", "10542", "=q2=Goblin Mining Helmet", "=ds=#sr# 205"};
		{ 11, "s56514", "42641", "=q1=Global Thermal Sapper Charge", "=ds=#sr# 425" };
		{ 12, "s30560", "23827", "=q1=Super Sapper Charge", "=ds=#sr# 340"};
		{ 13, "s30558", "23826", "=q1=The Bigger One", "=ds=#sr# 325"};
		{ 14, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "=ds=#sr# 265"};
		{ 15, "s12908", "10727", "=q1=Goblin Dragon Gun", "=ds=#sr# 240"};
		{ 16, "s12754", "10586", "=q1=The Big One", "=ds=#sr# 235"};
		{ 17, "s12755", "10587", "=q1=Goblin Bomb Dispenser", "=ds=#sr# 230"};
		{ 18, "s12716", "10577", "=q1=Goblin Mortar", "=ds=#sr# 205"};
		{ 19, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# 205"};
		{ 20, "s12760", "10646", "=q1=Goblin Sapper Charge", "=ds=#sr# 205"};
		{ 21, "s13240", "10577", "=q1=The Mortar: Reloaded", "=ds=#sr# 205"};
		Back = "ENGINEERINGMENU";
	};

		---------------------
		--- Jewelcrafting ---
		---------------------


	AtlasLoot_Data["JewelRedWRATH"] ={
		{ 1, "s66447", "40111", "=q4=Bold Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66449", "40114", "=q4=Bright Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66448", "40112", "=q4=Delicate Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66453", "40116", "=q4=Flashing Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s66451", "40117", "=q4=Fractured Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s66450", "40118", "=q4=Precise Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s66446", "40113", "=q4=Runed Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s66452", "40115", "=q4=Subtle Cardinal Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s53830", "39996", "=q3=Bold Scarlet Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s53947", "39999", "=q3=Bright Scarlet Ruby", "=ds="..AL["Trainer"] };
		{ 11, "s53945", "39997", "=q3=Delicate Scarlet Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 12, "s53949", "40001", "=q3=Flashing Scarlet Ruby", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s53950", "40002", "=q3=Fractured Scarlet Ruby","=ds="..AL["Drop"].." - "..BabbleZone["The Storm Peaks"] };
		{ 14, "s53951", "40003", "=q3=Precise Scarlet Ruby", "=ds="..BabbleBoss["Herald Volazj"].." ("..AL["Heroic"]..")" };
		{ 15, "s53946", "39998", "=q3=Runed Scarlet Ruby", "=ds="..BabbleFaction["Kirin Tor"]..": "..BabbleFaction["Exalted"] };
		{ 16, "s53843", "39907", "=q2=Subtle Bloodstone", "=ds="..AL["Trainer"] };
		{ 17, "s53831", "39900", "=q2=Bold Bloodstone", "=ds="..AL["Trainer"] };
		{ 18, "s53835", "39906", "=q2=Bright Bloodstone", "=ds="..AL["Trainer"] };
		{ 19, "s53832", "39905", "=q2=Delicate Bloodstone", "=ds="..AL["Trainer"] };
		{ 20, "s53844", "39908", "=q2=Flashing Bloodstone", "=ds="..AL["Trainer"] };
		{ 21, "s53845", "39909", "=q2=Fractured Bloodstone", "=ds="..AL["Trainer"] };
		{ 22, "s54017", "39910", "=q2=Precise Bloodstone", "=ds="..AL["Trainer"] };
		{ 23, "s53834", "39911", "=q2=Runed Bloodstone", "=ds="..AL["Trainer"] };
		Prev = "JewelRedTBC";
		Next = "JewelRedTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelBlueWRATH"] = {
		{ 1, "s66500", "40121", "=q4=Lustrous Majestic Zircon", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66497", "40119", "=q4=Solid Majestic Zircon", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66498", "40120", "=q4=Sparkling Majestic Zircon", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66499", "40122", "=q4=Stormy Majestic Zircon", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s53954", "40010", "=q3=Lustrous Sky Sapphire", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s53952", "40008", "=q3=Solid Sky Sapphire", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s53953", "40009", "=q3=Sparkling Sky Sapphire", "=ds="..AL["Trainer"] };
		{ 8, "s53955", "40011", "=q3=Stormy Sky Sapphire", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 9, "s53941", "39927", "=q2=Lustrous Chalcedony", "=ds="..AL["Trainer"] };
		{ 10, "s53934", "39919", "=q2=Solid Chalcedony", "=ds="..AL["Trainer"] };
		{ 11, "s53940", "39920", "=q2=Sparkling Chalcedony", "=ds="..AL["Trainer"] };
		{ 12, "s53943", "39932", "=q2=Stormy Chalcedony", "=ds=1250 #faction#" };
		Prev = "JewelBlueTBC";
		Next = "JewelBlueTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelYellowWRATH"] = {
		{ 1, "s66503", "40123", "=q4=Brilliant King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66505", "40127", "=q4=Mystic King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66506", "40128", "=q4=Quick King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66501", "40125", "=q4=Rigid King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s66502", "40124", "=q4=Smooth King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s66504", "40126", "=q4=Thick King's Amber", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s53956", "40012", "=q3=Brilliant Autumn's Glow", "=ds="..AL["Trainer"] };
		{ 8, "s53960", "40016", "=q3=Mystic Autumn's Glow", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 9, "s53961", "40017", "=q3=Quick Autumn's Glow", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s53958", "40014", "=q3=Rigid Autumn's Glow", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s53957", "40013", "=q3=Smooth Autumn's Glow", "=ds="..BabbleFaction["The Sons of Hodir"]..": "..BabbleFaction["Exalted"] };
		{ 12, "s53959", "40015", "=q3=Thick Autumn's Glow", "=ds="..BabbleBoss["Cyanigosa"].." ("..AL["Heroic"]..")" };
		{ 16, "s53852", "39912", "=q2=Brilliant Sun Crystal", "=ds="..AL["Trainer"] };
		{ 17, "s53857", "39917", "=q2=Mystic Sun Crystal", "=ds=1250 #faction#" };
		{ 18, "s53856", "39918", "=q2=Quick Sun Crystal", "=ds="..AL["Trainer"] };
		{ 19, "s53854", "39915", "=q2=Rigid Sun Crystal", "=ds="..AL["Trainer"] };
		{ 20, "s53853", "39914", "=q2=Smooth Sun Crystal", "=ds="..AL["Trainer"] };
		{ 21, "s53855", "39916", "=q2=Thick Sun Crystal", "=ds="..AL["Trainer"] };
		Prev = "JewelYellowTBC";
		Next = "JewelYellowTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelGreenWRATH"] = {
		{ 1, "s66430", "40175", "=q4=Dazzling Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66338", "40167", "=q4=Enduring Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66442", "40179", "=q4=Energized Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66434", "40169", "=q4=Forceful Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s66440", "40174", "=q4=Intricate Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s66431", "40165", "=q4=Jagged Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s66439", "40177", "=q4=Lambent Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s66435", "40171", "=q4=Misty Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s66444", "40178", "=q4=Opaque Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s66441", "40180", "=q4=Radiant Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s66433", "40170", "=q4=Seer's Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 12, "s66443", "40182", "=q4=Shattered Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s66437", "40172", "=q4=Shining Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 14, "s66428", "40168", "=q4=Steady Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 15, "s66436", "40176", "=q4=Sundered Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 16, "s66438", "40181", "=q4=Tense Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 17, "s66432", "40164", "=q4=Timeless Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 18, "s66445", "40173", "=q4=Turbid Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 19, "s66429", "40166", "=q4=Vivid Eye of Zul", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 20, "s54007", "40094", "=q3=Dazzling Forest Emerald", "=ds="..AL["Trainer"] };
		{ 21, "s53998", "40089", "=q3=Enduring Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 22, "s54011", "40105", "=q3=Energized Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 23, "s54001", "40091", "=q3=Forceful Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 24, "s54006", "40104", "=q3=Intricate Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 25, "s53996", "40086", "=q3=Jagged Forest Emerald", "=ds="..BabbleFaction["Frenzyheart Tribe"]..": "..BabbleFaction["Revered"] };
		{ 26, "s54009", "40100", "=q3=Lambent Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 27, "s54003", "40095", "=q3=Misty Forest Emerald", "=ds="..AL["Drop"]..""};
		{ 28, "s54010", "40103", "=q3=Opaque Forest Emerald", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 29, "s54012", "40098", "=q3=Radiant Forest Emerald", "=ds="..AL["Drop"].." - "..BabbleZone["The Storm Peaks"] };
		{ 30, "s54002", "40092", "=q3=Seer's Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		Prev = "JewelGreenTBC";
		Next = "JewelGreen2WRATH";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};
	AtlasLoot_Data["JewelGreen2WRATH"] = {
		{ 1, "s54014", "40106", "=q3=Shattered Forest Emerald", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 2, "s54004", "40099", "=q3=Shining Forest Emerald", "=ds="..AL["Drop"]..""};
		{ 3, "s54000", "40090", "=q3=Steady Forest Emerald", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 4, "s54008", "40096", "=q3=Sundered Forest Emerald", "=ds="..BabbleFaction["The Oracles"]..": "..BabbleFaction["Revered"] };
		{ 5, "s54013", "40101", "=q3=Tense Forest Emerald","=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 6, "s53995", "40085", "=q3=Timeless Forest Emerald", "=ds="..BabbleBoss["The Prophet Tharon'ja"].." ("..AL["Heroic"]..")" };
		{ 7, "s54005", "40102", "=q3=Turbid Forest Emerald", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 8, "s53997", "40088", "=q3=Vivid Forest Emerald", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s53926", "39984", "=q2=Dazzling Dark Jade", "=ds="..AL["Trainer"] };
		{ 10, "s53918", "39976", "=q2=Enduring Dark Jade", "=ds="..AL["Trainer"] };
		{ 11, "s53930", "39989", "=q2=Energized Dark Jade", "=ds="..AL["Trainer"] };
		{ 12, "s53920", "39978", "=q2=Forceful Dark Jade", "=ds="..AL["Trainer"] };
		{ 13, "s53925", "39983", "=q2=Intricate Dark Jade", "=ds="..AL["Trainer"] };
		{ 14, "s53916", "39974", "=q2=Jagged Dark Jade", "=ds="..AL["Trainer"] };
		{ 15, "s53928", "39986", "=q2=Lambent Dark Jade", "=ds="..AL["Trainer"] };
		{ 16, "s53922", "39980", "=q2=Misty Dark Jade", "=ds="..AL["Trainer"] };
		{ 17, "s53929", "39988", "=q2=Opaque Dark Jade", "=ds=1250 #faction#" };
		{ 18, "s53931", "39990", "=q2=Radiant Dark Jade", "=ds="..AL["Trainer"] };
		{ 19, "s53921", "39979", "=q2=Seer's Dark Jade", "=ds="..BabbleFaction["The Kalu'ak"]..": "..BabbleFaction["Friendly"] };
		{ 20, "s53933", "39992", "=q2=Shattered Dark Jade", "=ds=1250 #faction#" };
		{ 21, "s53923", "39981", "=q2=Shining Dark Jade", "=ds="..AL["Trainer"] };
		{ 22, "s53919", "39977", "=q2=Steady Dark Jade", "=ds=1250 #faction#" };
		{ 23, "s53927", "39985", "=q2=Sundered Dark Jade", "=ds="..AL["Trainer"] };
		{ 24, "s53932", "39991", "=q2=Tense Dark Jade", "=ds=1250 #faction#" };
		{ 25, "s53894", "39968", "=q2=Timeless Dark Jade", "=ds="..AL["Trainer"] };
		{ 26, "s53924", "39982", "=q2=Turbid Dark Jade", "=ds=1250 #faction#" };
		{ 27, "s53917", "39975", "=q2=Vivid Dark Jade", "=ds="..AL["Trainer"] };
		Prev = "JewelGreenWRATH";
		Next = "JewelGreenTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};
	
	AtlasLoot_Data["JewelOrangeWRATH"] = {
		{ 1, "s66576", "40162", "=q4=Accurate Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66579", "40144", "=q4=Champion's Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66568", "40147", "=q4=Deadly Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66584", "40150", "=q4=Deft Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s66571", "40154", "=q4=Durable Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s66580", "40158", "=q4=Empowered Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s66572", "40143", "=q4=Etched Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s66583", "40146", "=q4=Fierce Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s66578", "40161", "=q4=Glimmering Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s66575", "40148", "=q4=Glinting Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s66567", "40142", "=q4=Inscribed Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 12, "s66585", "40149", "=q4=Lucent Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s66566", "40151", "=q4=Luminous Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 14, "s66569", "40152", "=q4=Potent Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 15, "s66573", "40157", "=q4=Pristine Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 16, "s66574", "40155", "=q4=Reckless Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 17, "s66586", "40163", "=q4=Resolute Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 18, "s66582", "40145", "=q4=Resplendent Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 19, "s66581", "40160", "=q4=Stalwart Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 20, "s66587", "40159", "=q4=Stark Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 21, "s66570", "40153", "=q4=Veiled Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 22, "s66577", "40156", "=q4=Wicked Ametrine", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		Prev = "JewelOrangeTBC";
		Next = "JewelOrange2WRATH";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelOrange2WRATH"] = {
		{ 1, "s53994", "40058", "=q3=Accurate Monarch Topaz", "=ds="..AL["Drop"] };
		{ 2, "s53977", "40039", "=q3=Champion's Monarch Topaz", "=ds="..AL["Drop"]..""};
		{ 3, "s53979", "40043", "=q3=Deadly Monarch Topaz", "=ds="..BabbleBoss["Keristrasza"].." ("..AL["Heroic"]..")" };
		{ 4, "s53982", "40046", "=q3=Deft Monarch Topaz", "=ds="..BabbleBoss["Sjonnir The Ironshaper"].." ("..AL["Heroic"]..")" };
		{ 5, "s53986", "40050", "=q3=Durable Monarch Topaz", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 6, "s53990", "40054", "=q3=Empowered Monarch Topaz", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 7, "s53976", "40038", "=q3=Etched Monarch Topaz", "=ds="..AL["Drop"]..""};
		{ 8, "s54019", "40041", "=q3=Fierce Monarch Topaz", "=ds="..BabbleBoss["Ingvar the Plunderer"].." ("..AL["Heroic"]..")" };
		{ 9, "s53993", "40057", "=q3=Glimmering Monarch Topaz", "=ds="..BabbleFaction["The Wyrmrest Accord"]..": "..BabbleFaction["Exalted"] };
		{ 10, "s53980", "40044", "=q3=Glinting Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s53975", "40037", "=q3=Inscribed Monarch Topaz", "=ds="..AL["Drop"]..""};
		{ 12, "s53981", "40045", "=q3=Lucent Monarch Topaz", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 13, "s53983", "40047", "=q3=Luminous Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 14, "s53984", "40048", "=q3=Potent Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 15, "s53989", "40053", "=q3=Pristine Monarch Topaz", "=ds="..AL["Trainer"] };
		{ 16, "s53987", "40051", "=q3=Reckless Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 17, "s54023", "40059", "=q3=Resolute Monarch Topaz", "=ds="..AL["Drop"]..""};
		{ 18, "s53978", "40040", "=q3=Resplendent Monarch Topaz", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 19, "s53992", "40056", "=q3=Stalwart Monarch Topaz", "=ds="..AL["Drop"]..""};
		{ 20, "s53991", "40055", "=q3=Stark Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 21, "s53985", "40049", "=q3=Veiled Monarch Topaz", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 22, "s53988", "40052", "=q3=Wicked Monarch Topaz", "=ds="..BabbleFaction["Knights of the Ebon Blade"]..": "..BabbleFaction["Revered"] };
		Prev = "JewelOrangeWRATH";
		Next = "JewelOrange3WRATH";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelOrange3WRATH"] = {
		{ 1, "s53891", "39965", "=q2=Glimmering Huge Citrine", "=ds="..AL["Trainer"] };
		{ 2, "s53892", "39966", "=q2=Accurate Huge Citrine", "=ds="..AL["Trainer"] };
		{ 3, "s53874", "39949", "=q2=Champion's Huge Citrine", "=ds="..AL["Trainer"] };
		{ 4, "s53877", "39952", "=q2=Deadly Huge Citrine", "=ds="..BabbleFaction["Knights of the Ebon Blade"]..": "..BabbleFaction["Friendly"] };
		{ 5, "s53880", "39955", "=q2=Deft Huge Citrine", "=ds="..AL["Trainer"] };
		{ 6, "s53884", "39958", "=q2=Durable Huge Citrine", "=ds=1250 #faction#" };
		{ 7, "s53888", "39962", "=q2=Empowered Huge Citrine", "=ds=1250 #faction#" };
		{ 8, "s53873", "39948", "=q2=Etched Huge Citrine", "=ds="..AL["Trainer"] };
		{ 9, "s53876", "39951", "=q2=Fierce Huge Citrine", "=ds="..AL["Trainer"] };
		{ 10, "s53878", "39953", "=q2=Glinting Huge Citrine", "=ds="..AL["Trainer"] };
		{ 11, "s53872", "39947", "=q2=Inscribed Huge Citrine", "=ds="..AL["Trainer"] };
		{ 12, "s53879", "39954", "=q2=Lucent Huge Citrine", "=ds=1250 #faction#" };
		{ 13, "s53881", "39946", "=q2=Luminous Huge Citrine", "=ds="..AL["Trainer"] };
		{ 14, "s53882", "39956", "=q2=Potent Huge Citrine", "=ds="..AL["Trainer"] };
		{ 15, "s53887", "39961", "=q2=Pristine Huge Citrine", "=ds="..AL["Trainer"] };
		{ 16, "s53885", "39959", "=q2=Reckless Huge Citrine", "=ds="..BabbleFaction["Frenzyheart Tribe"]..": "..BabbleFaction["Friendly"] };
		{ 17, "s53893", "39967", "=q2=Resolute Huge Citrine", "=ds="..AL["Trainer"] };
		{ 18, "s53875", "39950", "=q2=Resplendent Huge Citrine", "=ds=1250 #faction#" };
		{ 19, "s53890", "39964", "=q2=Stalwart Huge Citrine", "=ds="..AL["Trainer"] };
		{ 20, "s53889", "39963", "=q2=Stark Huge Citrine", "=ds="..AL["Trainer"] };
		{ 21, "s53883", "39957", "=q2=Veiled Huge Citrine", "=ds="..AL["Trainer"] };
		{ 22, "s53886", "39960", "=q2=Wicked Huge Citrine", "=ds="..AL["Trainer"] };
		Prev = "JewelOrange2WRATH";
		Next = "JewelOrangeTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};
	

	AtlasLoot_Data["JewelPurpleWRATH"] = {
		{ 1, "s66553", "40136", "=q4=Balanced Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s66560", "40139", "=q4=Defender's Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s66555", "40132", "=q4=Glowing Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s66561", "40141", "=q4=Guardian's Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s66564", "40137", "=q4=Infused Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s66562", "40135", "=q4=Mysterious Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s66563", "40140", "=q4=Puissant Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s66556", "40133", "=q4=Purified Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s66559", "40138", "=q4=Regal Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s66558", "40134", "=q4=Royal Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s66557", "40130", "=q4=Shifting Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 12, "s66554", "40129", "=q4=Sovereign Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s66565", "40131", "=q4=Tenuous Dreadstone", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 27, "s53969", "40029", "=q3=Balanced Twilight Opal", "=ds="..AL["Trainer"] };
		{ 28, "s53972", "40032", "=q3=Defender's Twilight Opal", "=ds="..AL["Drop"].." - "..BabbleZone["The Storm Peaks"] };
		{ 16, "s53965", "40025", "=q3=Glowing Twilight Opal", "=ds="..BabbleFaction["Knights of the Ebon Blade"]..": "..BabbleFaction["Exalted"] };
		{ 17, "s53974", "40034", "=q3=Guardian's Twilight Opal", "=ds="..BabbleFaction["Argent Crusade"]..": "..BabbleFaction["Revered"] };
		{ 18, "s53970", "40030", "=q3=Infused Twilight Opal", "=ds="..BabbleBoss["Anub'arak"].." ("..AL["Heroic"]..")" };
		{ 19, "s53968", "40028", "=q3=Mysterious Twilight Opal", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 20, "s53973", "40033", "=q3=Puissant Twilight Opal", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 21, "s53966", "40026", "=q3=Purified Twilight Opal", "=ds="..AL["Drop"]..""};
		{ 22, "s53971", "40031", "=q3=Regal Twilight Opal", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 23, "s53967", "40027", "=q3=Royal Twilight Opal", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 24, "s53963", "40023", "=q3=Shifting Twilight Opal", "=ds="..AL["Drop"]};
		{ 25, "s53962", "40022", "=q3=Sovereign Twilight Opal", "=ds="..AL["Drop"]};
		{ 26, "s53964", "40024", "=q3=Tenuous Twilight Opal", "=ds="..AL["Drop"]..""};
		Prev = "JewelPurpleTBC";
		Next = "JewelPurple2WRATH";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelPurple2WRATH"] = {
		{ 1, "s53871", "39940", "=q2=Guardian's Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 2, "s53867", "39944", "=q2=Infused Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 3, "s53865", "39945", "=q2=Mysterious Shadow Crystal", "=ds=1250 #faction#" };
		{ 4, "s53870", "39933", "=q2=Puissant Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 5, "s53863", "39941", "=q2=Purified Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 6, "s53864", "39943", "=q2=Royal Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 7, "s53860", "39935", "=q2=Shifting Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 8, "s53859", "39934", "=q2=Sovereign Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 9, "s53861", "39942", "=q2=Tenuous Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 10, "s53868", "39938", "=q2=Regal Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 11, "s53866", "39937", "=q2=Balanced Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 12, "s53869", "39939", "=q2=Defender's Shadow Crystal", "=ds="..BabbleFaction["The Kalu'ak"]..": "..BabbleFaction["Honored"] };
		{ 13, "s53862", "39936", "=q2=Glowing Shadow Crystal", "=ds="..AL["Trainer"] };
		{ 14, "s41420", "32833", "=q2=Purified Jaggal Pearl", "=ds=#sr# 325"};
		Prev = "JewelPurpleWRATH";
		Next = "JewelPurpleTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};
	

	AtlasLoot_Data["JewelMetaWRATH"] = {
		{ 1, "s55389", "41285", "=q3=Chaotic Skyflare Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s55390", "41307", "=q3=Destructive Skyflare Diamond", "=ds="..AL["Drop"]..""};
		{ 3, "s55384", "41377", "=q3=Effulgent Skyflare Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s55392", "41333", "=q3=Ember Skyflare Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s55393", "41335", "=q3=Enigmatic Skyflare Diamond", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 6, "s55387", "41378", "=q3=Forlorn Skyflare Diamond", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 7, "s55388", "41379", "=q3=Impassive Skyflare Diamond", "=ds="..BabbleZone["Wintergrasp"].." 12 #wintergrasp#" };
		{ 8, "s55394", "41339", "=q3=Swift Skyflare Diamond", "=ds="..AL["Trainer"] };
		{ 9, "s55395", "41400", "=q3=Thundering Skyflare Diamond", "=ds="..AL["Drop"]..""};
		{ 10, "s55386", "41375", "=q3=Tireless Skyflare Diamond", "=ds="..AL["Trainer"] };
		{ 16, "s55401", "41380", "=q3=Austere Earthsiege Diamond", "=ds="..BabbleBoss["King Ymiron"] };
		{ 17, "s55405", "41389", "=q3=Beaming Earthsiege Diamond", "=ds="..AL["Drop"]..""};
		{ 18, "s55397", "41395", "=q3=Bracing Earthsiege Diamond", "=ds="..BabbleBoss["Ley-Guardian Eregos"] };
		{ 19, "s55398", "41396", "=q3=Eternal Earthsiege Diamond", "=ds="..BabbleBoss["Loken"] };
		{ 20, "s55396", "41401", "=q3=Insightful Earthsiege Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 21, "s55404", "41385", "=q3=Invigorating Earthsiege Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 22, "s55402", "41381", "=q3=Persistant Earthsiege Diamond", "=ds="..AL["Trainer"] };
		{ 23, "s55399", "41397", "=q3=Powerful Earthsiege Diamond", "=ds="..AL["Trainer"] };
		{ 24, "s55400", "41398", "=q3=Relentless Earthsiege Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 25, "s55403", "41382", "=q3=Trenchant Earthsiege Diamond", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		Prev = "JewelMetaTBC";
		Next = "JewelMetaTBC";
		Back = "JEWELCRAFTINGMENU";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["JewelPrismatic1"] = {
		{ 1, "s68253", "49110", "=q4=Nightmare Tear", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s28028", "22459", "=q4=Void Sphere", "=ds="..GetSpellInfo(7411) };
		{ 3, "s56531", "42702", "=q3=Enchanted Tear", "=ds="..AL["Trainer"] };
		{ 4, "s28027", "22460", "=q3=Prismatic Sphere", "=ds="..GetSpellInfo(7411) };
		{ 5, "s56530", "42701", "=q2=Enchanted Pearl", "=ds="..AL["Trainer"] };
		{ 6, "s62941", "42701", "=q2=Prismatic Black Diamond", "=ds="..AL["Trainer"] };
		Back = "JEWELCRAFTINGMENU";
	};

	AtlasLoot_Data["JewelDragonsEye1"] = {
		{ 1, "s56049", "42142", "=q4=Bold Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s56054", "36766", "=q4=Bright Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s56074", "42148", "=q4=Brilliant Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s56052", "42143", "=q4=Delicate Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s56056", "42152", "=q4=Flashing Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 6, "s56076", "42153", "=q4=Fractured Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 7, "s56077", "42146", "=q4=Lustrous Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 8, "s56079", "42158", "=q4=Mystic Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 9, "s56081", "42154", "=q4=Precise Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 10, "s56083", "42150", "=q4=Quick Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 11, "s56084", "42156", "=q4=Rigid Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 12, "s56053", "42144", "=q4=Runed Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s56085", "42149", "=q4=Smooth Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 14, "s56086", "36767", "=q4=Solid Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 15, "s56087", "42145", "=q4=Sparkling Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 16, "s56088", "42155", "=q4=Stormy Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 17, "s56055", "42151", "=q4=Subtle Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 18, "s56089", "42157", "=q4=Thick Dragon's Eye", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 20, 42225, "", "=q3=Dragon's Eye", "=ds=#e8#"};
		Back = "JEWELCRAFTINGMENU";
	};

	AtlasLoot_Data["JewelTrinket1"] = {
		{ 1, "s46777", "35700", "=q4=Figurine - Crimson Serpent", "=ds=#sr# 375"};
		{ 2, "s46775", "35693", "=q4=Figurine - Empyrean Tortoise", "=ds=#sr# 375"};
		{ 3, "s46776", "35694", "=q4=Figurine - Khorium Boar", "=ds=#sr# 375"};
		{ 4, "s46779", "35703", "=q4=Figurine - Seaspray Albatross", "=ds=#sr# 375"};
		{ 5, "s46778", "35702", "=q4=Figurine - Shadowsong Panther", "=ds=#sr# 375"};
		{ 6, "s56203", "42418", "=q3=Figurine - Emerald Boar", "=ds="..AL["Trainer"] };
		{ 7, "s59759", "44063", "=q3=Figurine - Monarch Crab", "=ds="..AL["Trainer"] };
		{ 8, "s56199", "42341", "=q3=Figurine - Ruby Hare", "=ds="..AL["Trainer"] };
		{ 9, "s56202", "42413", "=q3=Figurine - Sapphire Owl", "=ds="..AL["Trainer"] };
		{ 10, "s56201", "42395", "=q3=Figurine - Twilight Serpent", "=ds="..AL["Trainer"] };
		{ 11, "s31080", "24125", "=q3=Figurine - Dawnstone Crab", "=ds=#sr# 370"};
		{ 12, "s31079", "24124", "=q3=Figurine - Felsteel Boar", "=ds=#sr# 370"};
		{ 13, "s31081", "24126", "=q3=Figurine - Living Ruby Serpent", "=ds=#sr# 370"};
		{ 14, "s31083", "24128", "=q3=Figurine - Nightseye Panther", "=ds=#sr# 370"};
		{ 15, "s31082", "24127", "=q3=Figurine - Talasite Owl", "=ds=#sr# 370"};
		{ 16, "s26912", "21784", "=q3=Figurine - Black Diamond Crab", "=ds=#sr# 300"};
		{ 17, "s26914", "21789", "=q3=Figurine - Dark Iron Scorpid", "=ds=#sr# 300"};
		{ 18, "s26909", "21777", "=q2=Figurine - Emerald Owl", "=ds=#sr# 285"};
		{ 19, "s26900", "21769", "=q2=Figurine - Ruby Serpent", "=ds=#sr# 260"};
		{ 20, "s26882", "21763", "=q2=Figurine - Truesilver Boar", "=ds=#sr# 235"};
		{ 21, "s26881", "21760", "=q2=Figurine - Truesilver Crab", "=ds=#sr# 225"};
		{ 22, "s26873", "21756", "=q2=Figurine - Golden Hare", "=ds=#sr# 200"};
		{ 23, "s26872", "21748", "=q2=Figurine - Jade Owl", "=ds=#sr# 200"};
		{ 24, "s26875", "21758", "=q2=Figurine - Black Pearl Panther", "=ds=#sr# 215"};
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelRing1"] = {
		{ 1, "s56497", "42643", "=q4=Titanium Earthguard Ring", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s56496", "42642", "=q4=Titanium Impact Band", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s56498", "42644", "=q4=Titanium Spellshock Ring", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s58954", "43582", "=q4=Titanium Frostguard Ring", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 5, "s38503", "31398", "=q4=The Frozen Eye", "=ds=#sr# 375"};
		{ 6, "s38504", "31399", "=q4=The Natural Ward", "=ds=#sr# 375"};
		{ 7, "s46124", "34361", "=q4=Hard Khorium Band", "=ds=#sr# 365"};
		{ 8, "s46122", "34362", "=q4=Loop of Forged Power", "=ds=#sr# 365"};
		{ 9, "s46123", "34363", "=q4=Ring of Flowing Life", "=ds=#sr# 365"};
		{ 10, "s64727", "45808", "=q3=Runed Mana Band", "=ds="};
		{ 11, "s64728", "45809", "=q3=Scarlet Signet", "=ds="};
		{ 12, "s58147", "43250", "=q3=Ring of Earthern Might", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 13, "s58150", "43253", "=q3=Ring of Northern Tears", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 14, "s58148", "43251", "=q3=Ring of Scarlet Shadows", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 15, "s58507", "43498", "=q3=Savage Titanium Band", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 16, "s58492", "43482", "=q3=Savage Titanium Ring", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 17, "s58149", "43252", "=q3=Windfire Band", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 18, "s56197", "42340", "=q3=Dream Signet", "=ds="..AL["Trainer"] };
		{ 19, "s58143", "43246", "=q3=Earthshadow Ring", "=ds="..AL["Trainer"] };
		{ 20, "s58144", "43247", "=q3=Jade Ring of Slaying", "=ds="..AL["Trainer"] };
		{ 21, "s31057", "24086", "=q3=Arcane Khorium Band", "=ds=#sr# 365"};
		{ 22, "s31061", "24089", "=q3=Blazing Eternium Band", "=ds=#sr# 365"};
		{ 23, "s31056", "24085", "=q3=Khorium Band of Leaves", "=ds=#sr# 360"};
		{ 24, "s37855", "30825", "=q3=Ring of Arcane Shielding", "=ds=#sr# 360"};
		{ 25, "s31060", "24088", "=q3=Delicate Eternium Ring", "=ds=#sr# 355"};
		{ 26, "s31054", "24080", "=q3=Khorium Band of Frost", "=ds=#sr# 355"};
		{ 27, "s31055", "24082", "=q3=Khorium Inferno Band", "=ds=#sr# 355"};
		{ 28, "s31053", "24079", "=q3=Khorium Band of Shadows", "=ds=#sr# 350"};
		{ 29, "s31058", "24087", "=q3=Heavy Felsteel Ring", "=ds=#sr# 345"};
		{ 30, "s41415", "32774", "=q3=The Black Pearl", "=ds=#sr# 330"};
		Next = "JewelRing2";
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelRing2"] = {
		{ 1, "s41414", "32772", "=q3=Brilliant Pearl Band", "=ds=#sr# 325"};
		{ 2, "s26916", "21779", "=q3=Band of Natural Fire", "=ds=#sr# 310"};
		{ 3, "s26903", "21768", "=q3=Sapphire Signet", "=ds=#sr# 275"};
		{ 4, "s26896", "21753", "=q3=Gem Studded Band", "=ds=#sr# 250"};
		{ 5, "s26874", "20964", "=q3=Aquamarine Signet", "=ds=#sr# 210"};
		{ 6, "s34959", "29158", "=q3=Truesilver Commander's Ring", "=ds=#sr# 200"};
		{ 7, "s34955", "29157", "=q3=Golden Ring of Power", "=ds=#sr# 180"};
		{ 8, "s37818", "30804", "=q3=Bronze Band of Force", "=ds=#sr# 65"};
		{ 9, "s25305", "20826", "=q3=Heavy Silver Ring", "=ds=#sr# 90"};
		{ 10, "s58146", "43249", "=q2=Shadowmight Ring", "=ds="..AL["Trainer"] };
		{ 11, "s58145", "43248", "=q2=Stoneguard Band", "=ds="..AL["Trainer"] };
		{ 12, "s56193", "42336", "=q2=Bloodstone Band", "=ds="..AL["Trainer"] };
		{ 13, "s56194", "42337", "=q2=Sun Rock Ring", "=ds="..AL["Trainer"] };
		{ 14, "s31052", "24078", "=q2=Heavy Adamantite Ring", "=ds=#sr# 335"};
		{ 15, "s31050", "24076", "=q2=Azure Moonstone Ring", "=ds=#sr# 320"};
		{ 16, "s31048", "24074", "=q2=Fel Iron Blood Ring", "=ds=#sr# 310"};
		{ 17, "s31049", "24075", "=q2=Golden Draenite Ring", "=ds=#sr# 310"};
		{ 18, "s34961", "29160", "=q2=Emerald Lion Ring", "=ds=#sr# 290"};
		{ 19, "s26910", "21778", "=q2=Ring of Bitter Shadows", "=ds=#sr# 285"};
		{ 20, "s34960", "29159", "=q2=Glowing Thorium Band", "=ds=#sr# 280"};
		{ 21, "s26907", "21775", "=q2=Onslaught Ring", "=ds=#sr# 280"};
		{ 22, "s36526", "30422", "=q2=Diamond Focus Ring", "=ds=#sr# 265"};
		{ 23, "s26902", "21767", "=q2=Simple Opal Ring", "=ds=#sr# 260"};
		{ 24, "s26887", "21754", "=q2=The Aquamarine Ward", "=ds=#sr# 245"};
		{ 25, "s26885", "21765", "=q2=Truesilver Healing Ring", "=ds=#sr# 240"};
		{ 26, "s36525", "30421", "=q2=Red Ring of Destruction", "=ds=#sr# 230"};
		{ 27, "s25621", "20961", "=q2=Citrine Ring of Rapid Healing", "=ds=#sr# 180"};
		{ 28, "s25620", "20960", "=q2=Engraved Truesilver Ring", "=ds=#sr# 170"};
		{ 29, "s25619", "20959", "=q2=The Jade Eye", "=ds=#sr# 170"};
		{ 30, "s25617", "20958", "=q2=Blazing Citrine Ring", "=ds=#sr# 150"};
		Prev = "JewelRing1";
		Next = "JewelRing3";
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelRing3"] = {
		{ 1, "s25613", "20955", "=q2=Golden Dragon Ring", "=ds=#sr# 135"};
		{ 2, "s25323", "20833", "=q2=Wicked Moonstone Ring", "=ds=#sr# 125"};
		{ 3, "s36524", "30420", "=q2=Heavy Jade Ring", "=ds=#sr# 105"};		
		{ 4, "s25318", "20828", "=q2=Ring of Twilight Shadows", "=ds=#sr# 100"};
		{ 5, "s25317", "20827", "=q2=Ring of Silver Might", "=ds=#sr# 80"};
		{ 6, "s25287", "20823", "=q2=Gloom Band", "=ds=#sr# 70"};
		{ 7, "s25284", "20820", "=q2=Simple Pearl Ring", "=ds=#sr# 60"};
		{ 8, "s25490", "20907", "=q2=Solid Bronze Ring", "=ds=#sr# 50"};
		{ 9, "s25280", "20818", "=q2=Elegant Silver Ring", "=ds=#sr# 50"};
		{ 10, "s25283", "20821", "=q2=Inlaid Malachite Ring", "=ds=#sr# 30"};
		{ 11, "s32179", "25439", "=q2=Tigerseye Band", "=ds=#sr# 20"};
		{ 12, "s26926", "21932", "=q2=Heavy Copper Ring", "=ds=#sr# 5"};
		{ 13, "s25493", "20906", "=q2=Braided Copper Ring", "=ds=#sr# 1"};
		{ 14, "s26925", "21931", "=q2=Woven Copper Ring", "=ds=#sr# 1"};
		Prev = "JewelRing2";
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelNeck1"] = {
		{ 1, "s56500", "42646", "=q4=Titanium Earthguard Chain", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 2, "s56499", "42645", "=q4=Titanium Impact Choker", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 3, "s56501", "42647", "=q4=Titanium Spellshock Necklace", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"] };
		{ 4, "s46126", "34360", "=q4=Amulet of Flowing Life", "=ds=#sr# 365"};
		{ 5, "s46127", "34358", "=q4=Hard Khorium Choker", "=ds=#sr# 365"};
		{ 6, "s46125", "34359", "=q4=Pendant of Sunfire", "=ds=#sr# 365"};
		{ 7, "s64725", "45812", "=q3=Emerald Choker", "=ds="};
		{ 8, "s64726", "45813", "=q3=Sky Sapphire Amulet", "=ds="};
		{ 9, "s56196", "42339", "=q3=Blood Sun Necklace", "=ds="..AL["Trainer"] };
		{ 10, "s56195", "42338", "=q3=Jade Dagger Pendant", "=ds="..AL["Trainer"] };
		{ 11, "s31076", "24121", "=q3=Chain of the Twilight Owl", "=ds=#sr# 365"};
		{ 12, "s31072", "24117", "=q3=Embrace of the Dawn", "=ds=#sr# 365"};
		{ 13, "s31070", "24114", "=q3=Braided Eternium Chain", "=ds=#sr# 360"};
		{ 14, "s31071", "24116", "=q3=Eye of the Night", "=ds=#sr# 360"};
		{ 15, "s31062", "24092", "=q3=Pendant of Frozen Flame", "=ds=#sr# 360"};
		{ 16, "s31065", "24097", "=q3=Pendant of Shadow's End", "=ds=#sr# 360"};
		{ 17, "s31063", "24093", "=q3=Pendant of Thawing", "=ds=#sr# 360"};
		{ 18, "s31066", "24098", "=q3=Pendant of the Null Rune", "=ds=#sr# 360"};
		{ 19, "s31064", "24095", "=q3=Pendant of Withering", "=ds=#sr# 360"};
		{ 20, "s31068", "24110", "=q3=Living Ruby Pendant", "=ds=#sr# 355"};
		{ 21, "s31067", "24106", "=q3=Thick Felsteel Necklace", "=ds=#sr# 355"};
		{ 22, "s40514", "32508", "=q3=Necklace of the Deep", "=ds=#sr# 340"};
		{ 23, "s26915", "21792", "=q3=Necklace of the Diamond Tower", "=ds=#sr# 305"};
		{ 24, "s26911", "21791", "=q3=Living Emerald Pendant", "=ds=#sr# 290"};
		{ 25, "s26897", "21766", "=q3=Opal Necklace of Impact", "=ds=#sr# 250"};
		{ 26, "s63743", "45627", "=q3=Amulet of Truesight", "=ds="};
		{ 27, "s58142", "43245", "=q2=Crystal Chalcedony Amulet", "=ds="..AL["Trainer"] };
		{ 28, "s58141", "43244", "=q2=Crystal Citrine Necklace", "=ds="..AL["Trainer"] };
		{ 29, "s31051", "24077", "=q2=Thick Adamantite Necklace", "=ds=#sr# 335"};
		{ 30, "s26908", "21790", "=q2=Sapphire Pendant of Winter Night", "=ds=#sr# 280"};
		Next = "JewelNeck2";
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelNeck2"] = {
		{ 1, "s26883", "21764", "=q2=Ruby Pendant of Fire", "=ds=#sr# 235"};
		{ 2, "s26876", "21755", "=q2=Aquamarine Pendant of the Warrior", "=ds=#sr# 220"};
		{ 3, "s25622", "20967", "=q2=Citrine Pendant of Golden Healing", "=ds=#sr# 190"};
		{ 4, "s25618", "20966", "=q2=Jade Pendant of Blasting", "=ds=#sr# 160"};
		{ 5, "s25320", "20831", "=q2=Heavy Golden Necklace of Battle", "=ds=#sr# 150"};
		{ 6, "s25610", "20950", "=q2=Pendant of the Agate Shield", "=ds=#sr# 120"};
		{ 7, "s25339", "20830", "=q2=Amulet of the Moon", "=ds=#sr# 110"};
		{ 8, "s25498", "20909", "=q2=Barbaric Iron Collar", "=ds=#sr# 110"};
		{ 9, "s38175", "31154", "=q2=Bronze Torc", "=ds=#sr# 80"};
		{ 10, "s36523", "30419", "=q2=Brilliant Necklace", "=ds=#sr# 75"};
		{ 11, "s26927", "21933", "=q2=Thick Bronze Necklace", "=ds=#sr# 50"};
		{ 12, "s26928", "21934", "=q2=Ornate Tigerseye Necklace", "=ds=#sr# 30"};
		{ 13, "s32178", "25438", "=q2=Malachite Pendant", "=ds=#sr# 20"};
		Prev = "JewelNeck1";
		Back = "JEWELCRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["JewelMisc1"] = {
		{ 1, "s31078", "24123", "=q4=Circlet of Arcane Might", "=ds=#sr# 370"};
		{ 2, "s31077", "24122", "=q4=Coronet of the Verdant Flame", "=ds=#sr# 370"};
		{ 3, "s62242", "44943", "=q3=Icy Prism", "=ds="..AL["Trainer"]};
		{ 4, "s41418", "32776", "=q3=Crown of the Sea Witch", "=ds=#sr# 365"};
		{ 5, "s47280", "35945", "=q3=Brilliant Glass", "=ds=#sr# 350"};
		{ 6, "s38068", "31079", "=q3=Mercurial Adamantite", "=ds=#sr# 325"};
		{ 7, "s26906", "21774", "=q3=Emerald Crown of Destruction", "=ds=#sr# 275"};
		{ 8, "s26878", "20969", "=q3=Ruby Crown of Restoration", "=ds=#sr# 225"};
		{ 9, "s25321", "20832", "=q3=Moonsoul Crown", "=ds=#sr# 120"};
		{ 10, "s56208", "42421", "=q2=Shadow Jade Focusing Lens", "=ds="..AL["Trainer"] };
		{ 11, "s56206", "42420", "=q2=Shadow Crystal Focusing Lens", "=ds="..AL["Trainer"] };
		{ 12, "s56205", "41367", "=q2=Dark Jade Focusing Lens", "=ds="..AL["Trainer"] };
		{ 13, "s25612", "20954", "=q2=Heavy Iron Knuckles", "=ds=#sr# 125"};
		{ 14, "s26880", "21752", "=q1=Thorium Setting", "=ds=#sr# 225"};
		{ 15, "s32809", "25883", "=q1=Dense Stone Statue", "=ds=#sr# 225"};
		{ 16, "s32808", "25882", "=q1=Solid Stone Statue", "=ds=#sr# 175"};
		{ 17, "s25615", "20963", "=q1=Mithril Filigree", "=ds=#sr# 150"};
		{ 18, "s32807", "25881", "=q1=Heavy Stone Statue", "=ds=#sr# 110"};
		{ 19, "s25278", "20817", "=q1=Bronze Setting", "=ds=#sr# 50"};
		{ 20, "s32801", "25880", "=q1=Coarse Stone Statue", "=ds=#sr# 50"};
		{ 21, "s25255", "20816", "=q1=Delicate Copper Wire", "=ds=#sr# 1"};
		{ 22, "s32259", "25498", "=q1=Rough Stone Statue", "=ds=#sr# 1"};
		Back = "JEWELCRAFTINGMENU";
	};

		----------------------
		--- Leatherworking ---
		----------------------

	AtlasLoot_Data["LeatherLeatherArmorWRATH"] = {
        { 1, "s70556", "49899", "=q4=Bladeborn Leggings", "=ds="..AL["Vendor"]..""};
        { 2, "s70555", "49894", "=q4=Blessed Cenarion Boots", "=ds="..AL["Vendor"]..""};
        { 3, "s70557", "49895", "=q4=Footpads of Impending Death", "=ds="..AL["Vendor"]..""};
        { 4, "s70554", "49898", "=q4=Legwraps of Unleashed Nature", "=ds="..AL["Vendor"]..""};
		{ 5, "s67142", "47600", "=q4=Knightbane Carapace", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 6, "s67086", "47599", "=q4=Knightbane Carapace", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 7, "s67084", "47602", "=q4=Lunar Eclipse Chestguard", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 8, "s67140", "47601", "=q4=Lunar Eclipse Chestguard", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 9, "s67087", "47581", "=q4=Bracers of Swift Death", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 10, "s67139", "47582", "=q4=Bracers of Swift Death", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 11, "s67085", "47583", "=q4=Moonshadow Armguards", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 12, "s67141", "47584", "=q4=Moonshadow Armguards", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 13, "s63200", "45556", "=q4=Belt of Arctic Life", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 14, "s63201", "45565", "=q4=Boots of Wintry Endurance", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 15, "s63198", "45555", "=q4=Death-warmed Belt", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 16, "s63199", "45564", "=q4=Footpads of Silence", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 17, "s60760", "43495", "=q4=Earthgiving Legguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 18, "s60761", "43502", "=q4=Earthgiving Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 19, "s60758", "43481", "=q4=Trollwoven Spaulders", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 20, "s60759", "43484", "=q4=Trollwoven Girdle", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 21, "s60996", "43590", "=q4=Polar Vest", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 22, "s60997", "43591", "=q4=Polar Cord", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 23, "s60998", "43592", "=q4=Polar Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 24, "s62176", "44930", "=q4=Windripper Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 25, "s62177", "44931", "=q4=Windripper Leggings", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 26, "s60697", "43260", "=q3=Eviscerator's Facemask", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 27, "s60702", "43433", "=q3=Eviscerator's Shoulderpads", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 28, "s60703", "43434", "=q3=Eviscerator's Chestguard", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 29, "s60704", "43435", "=q3=Eviscerator's Bindings", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 30, "s60705", "43436", "=q3=Eviscerator's Gauntlets", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		Next = "LeatherLeatherArmorWRATH2";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["LeatherLeatherArmorWRATH2"] = {
        { 1, "s60706", "43437", "=q3=Eviscerator's Waistguard", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 2, "s60711", "43438", "=q3=Eviscerator's Legguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s60712", "43439", "=q3=Eviscerator's Treads", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 4, "s60715", "43261", "=q3=Overcast Headguard", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 5, "s60716", "43262", "=q3=Overcast Spaulders", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 6, "s60718", "43263", "=q3=Overcast Chestguard", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 7, "s60720", "43264", "=q3=Overcast Bracers", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 8, "s60721", "43265", "=q3=Overcast Handwraps", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 9, "s60723", "43266", "=q3=Overcast Belt", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 10, "s60725", "43271", "=q3=Overcast Leggings", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 11, "s60727", "43273", "=q3=Overcast Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 12, "s60669", "43257", "=q3=Wildscale Breastplate", "=ds="..AL["Trainer"]};
		{ 13, "s60660", "42731", "=q3=Leggings of Visceral Strikes", "=ds="..AL["Trainer"]};
		{ 14, "s60671", "43258", "=q3=Purehorn Spaulders", "=ds="..AL["Trainer"]};
		{ 15, "s60665", "43255", "=q3=Seafoam Gauntlets", "=ds="..AL["Trainer"]};
		{ 16, "s60666", "43256", "=q3=Jormscale Footpads", "=ds="..AL["Trainer"]};
		{ 17, "s51568", "38590", "=q3=Black Chitinguard Boots", "=ds="..AL["Trainer"]};
		{ 18, "s60620", "44442", "=q3=Bugsquashers", "=ds="..AL["Trainer"]};
		{ 19, "s51570", "38592", "=q3=Dark Arctic Chestpiece", "=ds="..AL["Trainer"]};
		{ 20, "s51569", "38591", "=q3=Dark Arctic Leggings", "=ds="..AL["Trainer"]};
		{ 21, "s60613", "44441", "=q3=Dark Iceborne Chestguard", "=ds="..AL["Trainer"]};
		{ 22, "s60611", "44440", "=q3=Dark Iceborne Leggings", "=ds="..AL["Trainer"]};
		{ 23, "s51572", "38437", "=q2=Arctic Helm", "=ds="..AL["Trainer"]};
		{ 24, "s50946", "38402", "=q2=Arctic Shoulderpads", "=ds="..AL["Trainer"]};
		{ 25, "s50944", "38400", "=q2=Arctic Chestpiece", "=ds="..AL["Trainer"]};
		{ 26, "s51571", "38433", "=q2=Arctic Wristguards", "=ds="..AL["Trainer"]};
		{ 27, "s50947", "38403", "=q2=Arctic Gloves", "=ds="..AL["Trainer"]};
		{ 28, "s50949", "38405", "=q2=Arctic Belt", "=ds="..AL["Trainer"]};
		{ 29, "s50945", "38401", "=q2=Arctic Leggings", "=ds="..AL["Trainer"]};
		{ 30, "s50948", "38404", "=q2=Arctic Boots", "=ds="..AL["Trainer"]};
		Prev = "LeatherLeatherArmorWRATH";
		Next = "LeatherLeatherArmorWRATH3";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["LeatherLeatherArmorWRATH3"] = {
        { 1, "s60608", "38438", "=q2=Iceborne Helm", "=ds="..AL["Trainer"]};
		{ 2, "s50940", "38411", "=q2=Iceborne Shoulderpads", "=ds="..AL["Trainer"]};
		{ 3, "s50938", "38408", "=q2=Iceborne Chestguard", "=ds="..AL["Trainer"]};
		{ 4, "s60607", "38434", "=q2=Iceborne Wristguards", "=ds="..AL["Trainer"]};
		{ 5, "s50941", "38409", "=q2=Iceborne Gloves", "=ds="..AL["Trainer"]};
		{ 6, "s50943", "38406", "=q2=Iceborne Belt", "=ds="..AL["Trainer"]};
		{ 7, "s50939", "38410", "=q2=Iceborne Leggings", "=ds="..AL["Trainer"]};
		{ 8, "s50942", "38407", "=q2=Iceborne Boots", "=ds="..AL["Trainer"]};
		Prev = "LeatherLeatherArmorWRATH2";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};



	AtlasLoot_Data["LeatherMailArmorWRATH"] = {
        { 1, "s70560", "49901", "=q4=Draconic Bonesplinter Legguards", "=ds="..AL["Vendor"]..""};
        { 2, "s70559", "49896", "=q4=Earthsoul Boots", "=ds="..AL["Vendor"]..""};
        { 3, "s70558", "49900", "=q4=Lightning-Infused Leggings", "=ds="..AL["Vendor"]..""};
        { 4, "s70561", "49897", "=q4=Rock-Steady Treads", "=ds="..AL["Vendor"]..""};
		{ 5, "s67138", "47596", "=q4=Crusader's Dragonscale Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 6, "s67082", "47595", "=q4=Crusader's Dragonscale Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 7, "s67080", "47597", "=q4=Ensorcelled Nerubian Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 8, "s67136", "47598", "=q4=Ensorcelled Nerubian Breastplate", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 9, "s67137", "47580", "=q4=Black Chitin Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 10, "s67081", "47579", "=q4=Black Chitin Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 11, "s67083", "47576", "=q4=Crusader's Dragonscale Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 12, "s67143", "47577", "=q4=Crusader's Dragonscale Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 13, "s63194", "45553", "=q4=Belt of Dragons", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 14, "s63196", "45554", "=q4=Blue Belt of Chaos", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 15, "s63195", "45562", "=q4=Boots of Living Scale", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 16, "s63197", "45563", "=q4=Lightning Grounded Boots", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 17, "s60755", "43459", "=q4=Giantmaim Bracers", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 18, "s60754", "43458", "=q4=Giantmaim Legguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 19, "s60756", "43461", "=q4=Revenant's Breastplate", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 20, "s60757", "43469", "=q4=Revenant's Treads", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 21, "s60999", "43593", "=q4=Icy Scale Chestguard", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 22, "s61000", "43594", "=q4=Icy Scale Belt", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 23, "s61002", "43595", "=q4=Icy Scale Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 24, "s60728", "43447", "=q3=Swiftarrow Helm", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 25, "s60729", "43449", "=q3=Swiftarrow Shoulderguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 26, "s60730", "43445", "=q3=Swiftarrow Hauberk", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 27, "s60731", "43444", "=q3=Swiftarrow Bracers", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 28, "s60732", "43446", "=q3=Swiftarrow Gauntlets", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 29, "s60734", "43442", "=q3=Swiftarrow Belt", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 30, "s60735", "43448", "=q3=Swiftarrow Leggings", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		Next = "LeatherMailArmorWRATH2";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["LeatherMailArmorWRATH2"] = {
        { 1, "s60737", "43443", "=q3=Swiftarrow Boots", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 2, "s60743", "43455", "=q3=Stormhide Crown", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 3, "s60746", "43457", "=q3=Stormhide Shoulders", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 4, "s60747", "43453", "=q3=Stormhide Hauberk", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 5, "s60748", "43452", "=q3=Stormhide Wristguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 6, "s60749", "43454", "=q3=Stormhide Grips", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 7, "s60750", "43450", "=q3=Stormhide Belt", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 8, "s60751", "43456", "=q3=Stormhide Legguards", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 9, "s60752", "43451", "=q3=Stormhide Stompers", "=ds="..AL["Vendor"]..", "..BabbleZone["Dalaran"]};
		{ 10, "s60649", "43129", "=q3=Razorstrike Breastplate", "=ds="..AL["Trainer"]};
		{ 11, "s60655", "43132", "=q3=Nightshock Hood", "=ds="..AL["Trainer"]};
		{ 12, "s60651", "43130", "=q3=Virulent Spaulders", "=ds="..AL["Trainer"]};
		{ 13, "s60658", "43133", "=q3=Nightshock Girdle", "=ds="..AL["Trainer"]};
		{ 14, "s60652", "43131", "=q3=Eaglebane Bracers", "=ds="..AL["Trainer"]};
		{ 15, "s60605", "44438", "=q3=Dragonstompers", "=ds="..AL["Trainer"]};
		{ 16, "s60630", "44445", "=q3=Scaled Icewalkers", "=ds="..AL["Trainer"]};
		{ 17, "s60604", "44437", "=q3=Dark Frostscale Breastplate", "=ds="..AL["Trainer"]};
		{ 18, "s60601", "44436", "=q3=Dark Frostscale Leggings", "=ds="..AL["Trainer"]};
		{ 19, "s60629", "44444", "=q3=Dark Nerubian Chestpiece", "=ds="..AL["Trainer"]};
		{ 20, "s60627", "44443", "=q3=Dark Nerubian Leggings", "=ds="..AL["Trainer"]};
		{ 21, "s60600", "38440", "=q2=Frostscale Helm", "=ds="..AL["Trainer"]};
		{ 22, "s50952", "38424", "=q2=Frostscale Shoulders", "=ds="..AL["Trainer"]};
		{ 23, "s50950", "38414", "=q2=Frostscale Chestguard", "=ds="..AL["Trainer"]};
		{ 24, "s60599", "38436", "=q2=Frostscale Bracers", "=ds="..AL["Trainer"]};
		{ 25, "s50953", "38415", "=q2=Frostscale Gloves", "=ds="..AL["Trainer"]};
		{ 26, "s50955", "38412", "=q2=Frostscale Belt", "=ds="..AL["Trainer"]};
		{ 27, "s50951", "38416", "=q2=Frostscale Leggings", "=ds="..AL["Trainer"]};
		{ 28, "s50954", "38413", "=q2=Frostscale Boots", "=ds="..AL["Trainer"]};
		{ 29, "s60624", "38439", "=q2=Nerubian Helm", "=ds="..AL["Trainer"]};
		{ 30, "s50958", "38417", "=q2=Nerubian Shoulders", "=ds="..AL["Trainer"]};
		Prev = "LeatherMailArmorWRATH";
		Next = "LeatherMailArmorWRATH3";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["LeatherMailArmorWRATH3"] = {
        { 1, "s50956", "38420", "=q2=Nerubian Chestguard", "=ds="..AL["Trainer"]};
		{ 2, "s60622", "38435", "=q2=Nerubian Bracers", "=ds="..AL["Trainer"]};
		{ 3, "s50959", "38421", "=q2=Nerubian Gloves", "=ds="..AL["Trainer"]};
		{ 4, "s50961", "38418", "=q2=Nerubian Belt", "=ds="..AL["Trainer"]};
		{ 5, "s50957", "38422", "=q2=Nerubian Legguards", "=ds="..AL["Trainer"]};
		{ 6, "s50960", "38419", "=q2=Nerubian Boots", "=ds="..AL["Trainer"]};
		Prev = "LeatherMailArmorWRATH2";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["LeatherCloaks1"] = {
		{ 1, "s60640", "43565", "=q4=Durable Nerubhide Cape", "=ds="..AL["Trainer"]};
		{ 2, "s60637", "43566", "=q4=Ice Striker's Cloak", "=ds="..AL["Trainer"]};
		{ 3, "s42546", "33122", "=q4=Cloak of Darkness", "=ds=#sr# 360"};
		{ 4, "s22926", "18509", "=q4=Chromatic Cloak", "=ds=#sr# 300"};
		{ 5, "s22928", "18511", "=q4=Shifting Cloak", "=ds=#sr# 300"};
		{ 6, "s55199", "41238", "=q3=Cloak of Tormented Skies", "=ds="..AL["Trainer"]};
		{ 7, "s60631", "38441", "=q3=Cloak of Harsh Winds", "=ds="..AL["Trainer"]};
		{ 8, "s19093", "15138", "=q3=Onyxia Scale Cloak", "=ds=#sr# 300"};
		{ 9, "s10574", "8215", "=q2=Wild Leather Cloak", "=ds=#sr# 250"};
		{ 10, "s10562", "8216", "=q2=Big Voodoo Cloak", "=ds=#sr# 240"};
		{ 11, "s7153", "5965", "=q2=Guardian Cloak", "=ds=#sr# 185"};
		{ 12, "s9198", "7377", "=q2=Frost Leather Cloak", "=ds=#sr# 180"};
		{ 13, "s9070", "7283", "=q2=Black Whelp Cloak", "=ds=#sr# 100"};
		{ 14, "s7953", "6466", "=q2=Deviate Scale Cloak", "=ds=#sr# 90"};
		{ 15, "s2159", "2308", "=q2=Fine Leather Cloak", "=ds=#sr# 85"};
		{ 16, "s3760", "3719", "=q1=Hillman's Cloak", "=ds=#sr# 150"};
		{ 17, "s2168", "2316", "=q1=Dark Leather Cloak", "=ds=#sr# 110"};
		{ 18, "s2162", "2310", "=q1=Embossed Leather Cloak", "=ds=#sr# 60"};
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherItemEnhancement1"] = {
		{ 1, "s57683", "Trade_LeatherWorking", "=ds=Fur Lining - Attack Power", "=ds="..AL["Trainer"]};
		{ 2, "s57701", "Trade_LeatherWorking", "=ds=Fur Lining - Arcane Resist", "=ds="..AL["Drop"]};
		{ 3, "s57692", "Trade_LeatherWorking", "=ds=Fur Lining - Fire Resist", "=ds="..AL["Drop"]};
		{ 4, "s57694", "Trade_LeatherWorking", "=ds=Fur Lining - Frost Resist", "=ds="..AL["Drop"]};
		{ 5, "s57699", "Trade_LeatherWorking", "=ds=Fur Lining - Nature Resist", "=ds="..AL["Drop"]};
		{ 6, "s57696", "Trade_LeatherWorking", "=ds=Fur Lining - Shadow Resist", "=ds="..AL["Drop"]};
		{ 7, "s57691", "Trade_LeatherWorking", "=ds=Fur Lining - Spell Power", "=ds="..AL["Trainer"]};
		{ 8, "s57690", "Trade_LeatherWorking", "=ds=Fur Lining - Stamina", "=ds="..AL["Trainer"]};
		{ 9, "s60583", "Trade_LeatherWorking", "=ds=Jormungar Leg Reinforcements", "=ds="..AL["Trainer"]};
		{ 10, "s60584", "Trade_LeatherWorking", "=ds=Nerubian Leg Reinforcements", "=ds="..AL["Trainer"]};
		{ 11, "s62448", "44963", "=q4=Earthen Leg Armor", "=ds="..AL["Trainer"]};
		{ 12, "s50965", "38373", "=q4=Frosthide Leg Armor", "=ds="..AL["Trainer"]};
		{ 13, "s50967", "38374", "=q4=Icescale Leg Armor", "=ds="..AL["Trainer"]};
		{ 14, "s35557", "29536", "=q4=Nethercleft Leg Armor", "=ds=#sr# 365"};
		{ 15, "s35554", "29535", "=q4=Nethercobra Leg Armor", "=ds=#sr# 365"};
		{ 16, "s50964", "38371", "=q3=Jormungar Leg Armor", "=ds="..AL["Trainer"]};
		{ 17, "s50966", "38372", "=q3=Nerubian Leg Armor", "=ds="..AL["Trainer"]};
		{ 18, "s35555", "29534", "=q3=Clefthide Leg Armor", "=ds=#sr# 335"};
		{ 19, "s35549", "29533", "=q3=Cobrahide Leg Armor", "=ds=#sr# 335"};
		{ 20, "s22727", "18251", "=q3=Core Armor Kit", "=ds=#sr# 300"};
		{ 21, "s50963", "38376", "=q2=Heavy Borean Armor Kit", "=ds="..AL["Trainer"]};
		{ 22, "s44770", "34207", "=q2=Glove Reinforcements", "=ds=#sr# 350"};
		{ 23, "s35524", "29488", "=q2=Arcane Armor Kit", "=ds=#sr# 340"};
		{ 24, "s35521", "29485", "=q2=Flame Armor Kit", "=ds=#sr# 340"};
		{ 25, "s35522", "29486", "=q2=Frost Armor Kit", "=ds=#sr# 340"};
		{ 26, "s35523", "29487", "=q2=Nature Armor Kit", "=ds=#sr# 340"};
		{ 27, "s35520", "29483", "=q2=Shadow Armor Kit", "=ds=#sr# 340"};
		{ 28, "s50962", "38375", "=q1=Borean Armor Kit", "=ds="..AL["Trainer"]};
		{ 29, "s44970", "34330", "=q1=Heavy Knothide Armor Kit", "=ds=#sr# 350"};
		{ 30, "s32458", "25652", "=q1=Magister's Armor Kit", "=ds=#sr# 325"};
		Next = "LeatherItemEnhancement2";
		Back = "LEATHERWORKINGMENU";
	};

	AtlasLoot_Data["LeatherItemEnhancement2"] = {
		{ 1, "s32457", "25651", "=q1=Vindicator's Armor Kit", "=ds=#sr# 325"};
		{ 2, "s32456", "25650", "=q1=Knothide Armor Kit", "=ds=#sr# 300"};
		{ 3, "s32482", "25679", "=q1=Comfortable Insoles", "=ds=#sr# 300"};
		{ 4, "s19058", "15564", "=q1=Rugged Armor Kit", "=ds=#sr# 250"};
		{ 5, "s10487", "8173", "=q1=Thick Armor Kit", "=ds=#sr# 200"};
		{ 6, "s3780", "4265", "=q1=Heavy Armor Kit", "=ds=#sr# 150"};
		{ 7, "s2165", "2313", "=q1=Medium Armor Kit", "=ds=#sr# 100"};
		{ 8, "s2152", "2304", "=q1=Light Armor Kit", "=ds=#sr# 1"};
		Prev = "LeatherItemEnhancement1";
		Back = "LEATHERWORKINGMENU";
	};

	AtlasLoot_Data["LeatherQuiversPouches1"] = {
		{ 1, "s60645", "44447", "=q3=Dragonscale Ammo Pouch", "=ds="..BabbleFaction["The Kalu'ak"]..": "..BabbleFaction["Honored"]};
		{ 2, "s60647", "44448", "=q3=Nerubian Reinforced Quiver", "=ds="..BabbleFaction["Knights of the Ebon Blade"]..": "..BabbleFaction["Honored"]};
		{ 3, "s44768", "34106", "=q3=Netherscale Ammo Pouch", "=ds=#sr# 350"};
		{ 4, "s44359", "34105", "=q3=Quiver of a Thousand Feathers", "=ds=#sr# 350"};
		{ 5, "s44343", "34099", "=q2=Knothide Ammo Pouch", "=ds=#sr# 315"};
		{ 6, "s44344", "34100", "=q2=Knothide Quiver", "=ds=#sr# 315"};
		{ 7, "s14930", "8217", "=q2=Quickdraw Quiver", "=ds=#sr# 225"};
		{ 8, "s14932", "8218", "=q2=Thick Leather Ammo Pouch", "=ds=#sr# 225"};
		{ 9, "s9194", "7372", "=q2=Heavy Leather Ammo Pouch", "=ds=#sr# 150"};
		{ 10, "s9193", "7371", "=q2=Heavy Quiver", "=ds=#sr# 150"};
		{ 11, "s9060", "7278", "=q1=Light Leather Quiver", "=ds=#sr# 30"};
		{ 12, "s9062", "7279", "=q1=Small Leather Ammo Pouch", "=ds=#sr# 30"};
		Back = "LEATHERWORKINGMENU";
	};

	AtlasLoot_Data["LeatherDrumsBagsMisc1"] = {
		{ 1, "s60643", "44446", "=q3=Pack of Endless Pockets", "=ds="..AL["Trainer"]};
		{ 2, "s50970", "38399", "=q3=Trapper's Traveling Pack", "=ds="..BabbleFaction["The Kalu'ak"]..": "..BabbleFaction["Revered"]};
		{ 3, "s50971", "38347", "=q3=Mammoth Mining Bag", "=ds="..BabbleFaction["The Sons of Hodir"]..": "..BabbleFaction["Honored"]};
		{ 4, "s35543", "29529", "=q3=Drums of Battle", "=ds=#sr# 365"};
		{ 5, "s45117", "34490", "=q3=Bag of Many Hides", "=ds=#sr# 360"};
		{ 6, "s32461", "25653", "=q3=Riding Crop", "=ds=#sr# 350"};
		{ 7, "s35538", "29532", "=q2=Drums of Panic", "=ds=#sr# 370"};
		{ 8, "s35539", "29531", "=q2=Drums of Restoration", "=ds=#sr# 350"};
		{ 9, "s35544", "29530", "=q2=Drums of Speed", "=ds=#sr# 345"};
		{ 10, "s35540", "29528", "=q2=Drums of War", "=ds=#sr# 340"};
		{ 11, "s35530", "29540", "=q2=Reinforced Mining Bag", "=ds=#sr# 325"};
		{ 12, "s45100", "34482", "=q2=Leatherworker's Satchel", "=ds=#sr# 300"};
		{ 13, "s22815", "18258", "=q2=Gordok Ogre Suit", "=ds=#sr# 275"};
		{ 14, "s69386", "49633", "=q1=Drums of Forgotten Kings", "=ds=#sr# 450" };
		{ 15, "s69388", "49634", "=q1=Drums of the Wild", "=ds=#sr# 450" };
		{ 16, "s23190", "18662", "=q1=Heavy Leather Ball", "=ds=#sr# 150"};
		{ 17, "s5244", "5081", "=q1=Kodo Hide Bag", "=ds=#sr# 40"};
		Back = "LEATHERWORKINGMENU";
	};

	AtlasLoot_Data["LeatherLeather1"] = {
		{ 1, "s50936", "38425", "=q1=Heavy Borean Leather", "=ds="..AL["Trainer"]};
		{ 2, "s64661", "33568", "=q1=Borean Leather", "=ds="..AL["Trainer"]};
		{ 3, "s32455", "23793", "=q1=Heavy Knothide Leather", "=ds=#sr# 325"};
		{ 4, "s32454", "21887", "=q1=Knothide Leather", "=ds=#sr# 300"};
		{ 5, "s22331", "8170", "=q1=Rugged Leather", "=ds=#sr# 250"};
		{ 6, "s19047", "15407", "=q1=Cured Rugged Hide", "=ds=#sr# 250"};
		{ 7, "s20650", "4304", "=q1=Thick Leather", "=ds=#sr# 200"};
		{ 8, "s10482", "8172", "=q1=Cured Thick Hide", "=ds=#sr# 200"};
		{ 9, "s20649", "4234", "=q1=Heavy Leather", "=ds=#sr# 150"};
		{ 10, "s3818", "4236", "=q1=Cured Heavy Hide", "=ds=#sr# 150"};
		{ 11, "s20648", "2319", "=q1=Medium Leather", "=ds=#sr# 100"};
		{ 12, "s3817", "4233", "=q1=Cured Medium Hide", "=ds=#sr# 100"};
		{ 13, "s3816", "4231", "=q1=Cured Light Hide", "=ds=#sr# 35"};
		{ 14, "s2881", "2318", "=q1=Light Leather", "=ds=#sr# 1"};
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Dragonscale1"] = {
		{ 1, "s10619", "8347", "=q3=Dragonscale Gauntlets", "=ds=#sr# 225"};
		{ 2, "s10650", "8367", "=q3=Dragonscale Breastplate", "=ds=#sr# 255"};
		{ 3, "s36076", "29971", "=q3=Dragonstrike Leggings", "=ds=#sr# 260"};
		{ 4, "s24655", "20296", "=q3=Green Dragonscale Gauntlets", "=ds=#sr# 280"};
		{ 5, "s24654", "20295", "=q3=Blue Dragonscale Leggings", "=ds=#sr# 300"};
		{ 6, "s36079", "29975", "=q3=Golden Dragonstrike Breastplate", "=ds=#sr# 330"};
		{ 7, "s35576", "29516", "=q4=Ebon Netherscale Belt", "=ds=#sr# 375"};
		{ 8, "s35577", "29517", "=q4=Ebon Netherscale Bracers", "=ds=#sr# 375"};
		{ 9, "s35575", "29515", "=q4=Ebon Netherscale Breastplate", "=ds=#sr# 375"};
		{ 10, "s35582", "29520", "=q4=Netherstrike Belt", "=ds=#sr# 375"};
		{ 11, "s35584", "29521", "=q4=Netherstrike Bracers", "=ds=#sr# 375"};
		{ 12, "s35580", "29519", "=q4=Netherstrike Breastplate", "=ds=#sr# 375"};
		Next = "Elemental1";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Elemental1"] = {
		{ 1, "s10630", "8346", "=q3=Gauntlets of the Sea", "=ds=#sr# 230"};
		{ 2, "s10632", "8348", "=q3=Helm of Fire", "=ds=#sr# 250"};
		{ 3, "s36074", "29964", "=q3=Blackstorm Leggings", "=ds=#sr# 260"};
		{ 4, "s36077", "29973", "=q3=Primalstorm Breastplate", "=ds=#sr# 330"};
		{ 5, "s35590", "29526", "=q4=Primalstrike Belt", "=ds=#sr# 375"};
		{ 6, "s35591", "29527", "=q4=Primalstrike Bracers", "=ds=#sr# 375"};
		{ 7, "s35589", "29525", "=q4=Primalstrike Vest", "=ds=#sr# 375"};
		Next = "Tribal1";
		Prev = "Dragonscale1";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Tribal1"] = {
		{ 1, "s10621", "8345", "=q3=Wolfshead Helm", "=ds=#sr# 225"};
		{ 2, "s10647", "8349", "=q3=Feathered Breastplate", "=ds=#sr# 250"};
		{ 3, "s36075", "29970", "=q3=Wildfeather Leggings", "=ds=#sr# 260"};
		{ 4, "s36078", "29974", "=q3=Living Crystal Breastplate", "=ds=#sr# 330"};
		{ 5, "s35587", "29524", "=q4=Windhawk Belt", "=ds=#sr# 375"};
		{ 6, "s35588", "29523", "=q4=Windhawk Bracers", "=ds=#sr# 375"};
		{ 7, "s35585", "29522", "=q4=Windhawk Hauberk", "=ds=#sr# 375"};
		Prev = "Elemental1";
		Back = "LEATHERWORKINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["MiningWRATH"] = {
		Name = MINING;
				{
		Name = MINING;
		{ 1, "s55208", "37663", "=q2=Smelt Titansteel", "=ds=#sr# 450"};
		{ 2, "s55211", "41163", "=q2=Smelt Titanium", "=ds=#sr# 450"};
		{ 3, "s49258", "36913", "=q1=Smelt Saronite", "=ds=#sr# 400"};
		{ 4, "s49252", "36916", "=q1=Smelt Cobalt", "=ds=#sr# 350"};
	};
};

	AtlasLoot_Data["FirstAidWRATH"] = {
			Name = FIRSTAID;
		{
			Name = FIRSTAID;
			{ 1, "s45546", "34722", "=q1=Heavy Frostweave Bandage", "=ds=#sr# 400"};
			{ 2, "s45545", "34721", "=q1=Frostweave Bandage", "=ds=#sr# 375"};
		};
	};
		-----------------
		--- Tailoring ---
		-----------------

	AtlasLoot_Data["TailoringArmorCLASSIC"] = {
		{ 1, "s22866", "18405", "=q4=Belt of the Archmage", "=ds=#sr# 300"};
		{ 2, "s20849", "16979", "=q4=Flarecore Gloves", "=ds=#sr# 300"};
		{ 3, "s23667", "19165", "=q4=Flarecore Leggings", "=ds=#sr# 300"};
		{ 4, "s20848", "16980", "=q4=Flarecore Mantle", "=ds=#sr# 300"};
		{ 5, "s23666", "19156", "=q4=Flarecore Robe", "=ds=#sr# 300"};
		{ 6, "s22759", "18263", "=q4=Flarecore Wraps", "=ds=#sr# 300"};
		{ 7, "s28208", "22658", "=q4=Glacial Cloak", "=ds=#sr# 300"};
		{ 8, "s28205", "22654", "=q4=Glacial Gloves", "=ds=#sr# 300"};
		{ 9, "s28207", "22652", "=q4=Glacial Vest", "=ds=#sr# 300"};
		{ 10, "s28209", "22655", "=q4=Glacial Wrists", "=ds=#sr# 300"};
		{ 11, "s18454", "14146", "=q4=Gloves of Spell Mastery", "=ds=#sr# 300"};
		{ 12, "s18457", "14152", "=q4=Robe of the Archmage", "=ds=#sr# 300"};
		{ 13, "s18458", "14153", "=q4=Robe of the Void", "=ds=#sr# 300"};
		{ 14, "s18456", "14154", "=q4=Truefaith Vestments", "=ds=#sr# 300"};
		{ 15, "s23665", "19059", "=q3=Argent Shoulders", "=ds=#sr# 300"};
		{ 16, "s24093", "19684", "=q3=Bloodvine Boots", "=ds=#sr# 300"};
		{ 17, "s24092", "19683", "=q3=Bloodvine Leggings", "=ds=#sr# 300"};
		{ 18, "s24091", "19682", "=q3=Bloodvine Vest", "=ds=#sr# 300"};
		{ 19, "s22870", "18413", "=q3=Cloak of Warding", "=ds=#sr# 300"};
		{ 20, "s22867", "18407", "=q3=Felcloth Gloves", "=ds=#sr# 300"};
		{ 21, "s28210", "22660", "=q3=Gaea's Embrace", "=ds=#sr# 300"};
		{ 22, "s22868", "18408", "=q3=Inferno Gloves", "=ds=#sr# 300"};
		{ 23, "s23663", "19050", "=q3=Mantle of the Timbermaw", "=ds=#sr# 300"};
		{ 24, "s18452", "14140", "=q3=Mooncloth Circlet", "=ds=#sr# 300"};
		{ 25, "s22869", "18409", "=q3=Mooncloth Gloves", "=ds=#sr# 300"};
		{ 26, "s22902", "18486", "=q3=Mooncloth Robe", "=ds=#sr# 300"};
		{ 27, "s18448", "14139", "=q3=Mooncloth Shoulders", "=ds=#sr# 300"};
		{ 28, "s18447", "14138", "=q3=Mooncloth Vest", "=ds=#sr# 300"};
		{ 29, "s24902", "20539", "=q3=Runed Stygian Belt", "=ds=#sr# 300"};
		{ 30, "s24903", "20537", "=q3=Runed Stygian Boots", "=ds=#sr# 300"};
		Next = "TailoringArmorCLASSIC2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC2"] = {
		{ 1, "s24901", "20538", "=q3=Runed Stygian Leggings", "=ds=#sr# 300"};
		{ 2, "s28481", "22757", "=q3=Sylvan Crown", "=ds=#sr# 300"};
		{ 3, "s28482", "22758", "=q3=Sylvan Shoulders", "=ds=#sr# 300"};
		{ 4, "s28480", "22756", "=q3=Sylvan Vest", "=ds=#sr# 300"};
		{ 5, "s19435", "15802", "=q3=Mooncloth Boots", "=ds=#sr# 290"};
		{ 6, "s23664", "19056", "=q3=Argent Boots", "=ds=#sr# 290"};
		{ 7, "s18440", "14137", "=q3=Mooncloth Leggings", "=ds=#sr# 290"};
		{ 8, "s23662", "19047", "=q3=Wisdom of the Timbermaw", "=ds=#sr# 290"};
		{ 9, "s18436", "14136", "=q3=Robe of Winter Night", "=ds=#sr# 285"};
		{ 10, "s18422", "14134", "=q3=Cloak of Fire", "=ds=#sr# 275"};
		{ 11, "s12092", "10041", "=q3=Dreamweave Circlet", "=ds=#sr# 250"};
		{ 12, "s12067", "10019", "=q3=Dreamweave Gloves", "=ds=#sr# 225"};
		{ 13, "s12070", "10021", "=q3=Dreamweave Vest", "=ds=#sr# 225"};
		{ 14, "s3862", "4327", "=q3=Icy Cloak", "=ds=#sr# 200"};
		{ 15, "s8770", "7054", "=q3=Robe of Power", "=ds=#sr# 190"};
		{ 16, "s63742", "45626", "=q3=Spidersilk Drape", "=ds=#sr# 125"};
		{ 17, "s3855", "4320", "=q3=Spidersilk Boots", "=ds=#sr# 125"};
		{ 18, "s18451", "14106", "=q2=Felcloth Robe", "=ds=#sr# 300"};
		{ 19, "s18453", "14112", "=q2=Felcloth Shoulders", "=ds=#sr# 300"};
		{ 20, "s18449", "13867", "=q2=Runecloth Shoulders", "=ds=#sr# 300"};
		{ 21, "s18446", "14128", "=q2=Wizardweave Robe", "=ds=#sr# 300"};
		{ 22, "s18450", "14130", "=q2=Wizardweave Turban", "=ds=#sr# 300"};
		{ 23, "s18439", "14104", "=q2=Brightcloth Pants", "=ds=#sr# 290"};
		{ 24, "s18442", "14111", "=q2=Felcloth Hood", "=ds=#sr# 290"};
		{ 25, "s18441", "14144", "=q2=Ghostweave Pants", "=ds=#sr# 290"};
		{ 26, "s18444", "13866", "=q2=Runecloth Headband", "=ds=#sr# 295"};
		{ 27, "s18437", "14108", "=q2=Felcloth Boots", "=ds=#sr# 285"};
		{ 28, "s18438", "13865", "=q2=Runecloth Pants", "=ds=#sr# 285"};
		{ 29, "s18434", "14045", "=q2=Cindercloth Pants", "=ds=#sr# 280"};
		{ 30, "s18424", "13871", "=q2=Frostweave Pants", "=ds=#sr# 280"};
		Next = "TailoringArmorCLASSIC3";
		Prev = "TailoringArmorCLASSIC";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC3"] = {
		{ 1, "s18423", "13864", "=q2=Runecloth Boots", "=ds=#sr# 280"};
		{ 2, "s18420", "14103", "=q2=Brightcloth Cloak", "=ds=#sr# 275"};
		{ 3, "s18418", "14044", "=q2=Cindercloth Cloak", "=ds=#sr# 275"};
		{ 4, "s18419", "14107", "=q2=Felcloth Pants", "=ds=#sr# 275"};
		{ 5, "s18416", "14141", "=q2=Ghostweave Vest", "=ds=#sr# 275"};
		{ 6, "s22813", "18258", "=q2=Gordok Ogre Suit", "=ds=#sr# 275"};
		{ 7, "s18417", "13863", "=q2=Runecloth Gloves", "=ds=#sr# 275"};
		{ 8, "s18421", "14132", "=q2=Wizardweave Leggings", "=ds=#sr# 275"};
		{ 9, "s18415", "14101", "=q2=Brightcloth Gloves", "=ds=#sr# 270"};
		{ 10, "s18414", "14100", "=q2=Brightcloth Robe", "=ds=#sr# 270"};
		{ 11, "s18412", "14043", "=q2=Cindercloth Gloves", "=ds=#sr# 270"};
		{ 12, "s18413", "14142", "=q2=Ghostweave Gloves", "=ds=#sr# 270"};
		{ 13, "s18411", "13870", "=q2=Frostweave Gloves", "=ds=#sr# 265"};
		{ 14, "s18410", "14143", "=q2=Ghostweave Belt", "=ds=#sr# 265"};
		{ 15, "s18409", "13860", "=q2=Runecloth Cloak", "=ds=#sr# 265"};
		{ 16, "s18408", "14042", "=q2=Cindercloth Vest", "=ds=#sr# 260"};
		{ 17, "s18406", "13858", "=q2=Runecloth Robe", "=ds=#sr# 260"};
		{ 18, "s18407", "13857", "=q2=Runecloth Tunic", "=ds=#sr# 260"};
		{ 19, "s18404", "13868", "=q2=Frostweave Robe", "=ds=#sr# 255"};
		{ 20, "s18403", "13869", "=q2=Frostweave Tunic", "=ds=#sr# 255"};
		{ 21, "s18402", "13856", "=q2=Runecloth Belt", "=ds=#sr# 255"};
		{ 22, "s12088", "10044", "=q2=Cindercloth Boots", "=ds=#sr# 245"};
		{ 23, "s12086", "10025", "=q2=Shadoweave Mask", "=ds=#sr# 245"};
		{ 24, "s12081", "10030", "=q2=Admiral's Hat", "=ds=#sr# 240"};
		{ 25, "s12084", "10033", "=q2=Red Mageweave Headband", "=ds=#sr# 240"};
		{ 26, "s12082", "10031", "=q2=Shadoweave Boots", "=ds=#sr# 240"};
		{ 27, "s12078", "10029", "=q2=Red Mageweave Shoulders", "=ds=#sr# 235"};
		{ 28, "s12076", "10028", "=q2=Shadoweave Shoulders", "=ds=#sr# 235"};
		{ 29, "s12073", "10026", "=q2=Black Mageweave Boots", "=ds=#sr# 230"};
		{ 30, "s12072", "10024", "=q2=Black Mageweave Headband", "=ds=#sr# 230"};
		Next = "TailoringArmorCLASSIC4";
		Prev = "TailoringArmorCLASSIC2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC4"] = {
		{ 1, "s12074", "10027", "=q2=Black Mageweave Shoulders", "=ds=#sr# 230"};
		{ 2, "s12069", "10042", "=q2=Cindercloth Robe", "=ds=#sr# 225"};
		{ 3, "s12066", "10018", "=q2=Red Mageweave Gloves", "=ds=#sr# 225"};
		{ 4, "s12071", "10023", "=q2=Shadoweave Gloves", "=ds=#sr# 225"};
		{ 5, "s12059", "10008", "=q2=White Bandit Mask", "=ds=#sr# 215"};
		{ 6, "s12053", "10003", "=q2=Black Mageweave Gloves", "=ds=#sr# 215"};
		{ 7, "s12060", "10009", "=q2=Red Mageweave Pants", "=ds=#sr# 215"};
		{ 8, "s12056", "10007", "=q2=Red Mageweave Vest", "=ds=#sr# 215"};
		{ 9, "s12055", "10004", "=q2=Shadoweave Robe", "=ds=#sr# 215"};
		{ 10, "s12050", "10001", "=q2=Black Mageweave Robe", "=ds=#sr# 210"};
		{ 11, "s8804", "7064", "=q2=Crimson Silk Gloves", "=ds=#sr# 210"};
		{ 12, "s12052", "10002", "=q2=Shadoweave Pants", "=ds=#sr# 210"};
		{ 13, "s12049", "9999", "=q2=Black Mageweave Leggings", "=ds=#sr# 205"};
		{ 14, "s12048", "9998", "=q2=Black Mageweave Vest", "=ds=#sr# 205"};
		{ 15, "s8802", "7063", "=q2=Crimson Silk Robe", "=ds=#sr# 205"};
		{ 16, "s3864", "4329", "=q2=Star Belt", "=ds=#sr# 200"};
		{ 17, "s8797", "7061", "=q2=Earthen Silk Belt", "=ds=#sr# 195"};
		{ 18, "s8795", "7060", "=q2=Azure Shoulders", "=ds=#sr# 190"};
		{ 19, "s8793", "7059", "=q2=Crimson Silk Shoulders", "=ds=#sr# 190"};
		{ 20, "s3861", "4326", "=q2=Long Silken Cloak", "=ds=#sr# 185"};
		{ 21, "s3863", "4328", "=q2=Spider Belt", "=ds=#sr# 180"};
		{ 22, "s8789", "7056", "=q2=Crimson Silk Cloak", "=ds=#sr# 180"};
		{ 23, "s8774", "7057", "=q2=Green Silken Shoulders", "=ds=#sr# 180"};
		{ 24, "s8766", "7052", "=q2=Azure Silk Belt", "=ds=#sr# 175"};
		{ 25, "s8786", "7053", "=q2=Azure Silk Cloak", "=ds=#sr# 175"};
		{ 26, "s3860", "4325", "=q2=Boots of the Enchanter", "=ds=#sr# 175"};
		{ 27, "s8772", "7055", "=q2=Crimson Silk Belt", "=ds=#sr# 175"};
		{ 28, "s8764", "7051", "=q2=Earthen Vest", "=ds=#sr# 170"};
		{ 29, "s3858", "4323", "=q2=Shadow Hood", "=ds=#sr# 170"};
		{ 30, "s3857", "4322", "=q2=Enchanter's Cowl", "=ds=#sr# 165"};
		Next = "TailoringArmorCLASSIC5";
		Prev = "TailoringArmorCLASSIC3";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC5"] = {
		{ 1, "s8784", "7065", "=q2=Green Silk Armor", "=ds=#sr# 165"};
		{ 2, "s3859", "4324", "=q2=Azure Silk Vest", "=ds=#sr# 150"};
		{ 3, "s6692", "5770", "=q2=Robes of Arcana", "=ds=#sr# 150"};
		{ 4, "s8782", "7049", "=q2=Truefaith Gloves", "=ds=#sr# 150"};
		{ 5, "s3854", "4319", "=q2=Azure Silk Gloves", "=ds=#sr# 145"};
		{ 6, "s8780", "7047", "=q2=Hands of Darkness", "=ds=#sr# 145"};
		{ 7, "s8758", "7046", "=q2=Azure Silk Pants", "=ds=#sr# 140"};
		{ 8, "s3856", "4321", "=q2=Spider Silk Slippers", "=ds=#sr# 140"};
		{ 9, "s6690", "5766", "=q2=Lesser Wizard's Robe", "=ds=#sr# 135"};
		{ 10, "s3852", "4318", "=q2=Gloves of Meditation", "=ds=#sr# 130"};
		{ 11, "s3868", "4331", "=q2=Phoenix Gloves", "=ds=#sr# 125"};
		{ 12, "s3851", "4317", "=q2=Phoenix Pants", "=ds=#sr# 125"};
		{ 13, "s12047", "10048", "=q2=Colorful Kilt", "=ds=#sr# 120"};
		{ 14, "s7643", "6264", "=q2=Greater Adept's Robe", "=ds=#sr# 115"};
		{ 15, "s3850", "4316", "=q2=Heavy Woolen Pants", "=ds=#sr# 110"};
		{ 16, "s2403", "2585", "=q2=Gray Woolen Robe", "=ds=#sr# 105"};
		{ 17, "s7639", "6263", "=q2=Blue Overalls", "=ds=#sr# 100"};
		{ 18, "s3844", "4311", "=q2=Heavy Woolen Cloak", "=ds=#sr# 100"};
		{ 19, "s3847", "4313", "=q2=Red Woolen Boots", "=ds=#sr# 95"};
		{ 20, "s2401", "2583", "=q2=Woolen Boots", "=ds=#sr# 95"};
		{ 21, "s6521", "5542", "=q2=Pearl-clasped Cloak", "=ds=#sr# 90"};
		{ 22, "s3843", "4310", "=q2=Heavy Woolen Gloves", "=ds=#sr# 85"};
		{ 23, "s3845", "4312", "=q2=Soft-soled Linen Boots", "=ds=#sr# 80"};
		{ 24, "s2395", "2578", "=q2=Barbaric Linen Vest", "=ds=#sr# 70"};
		{ 25, "s7633", "6242", "=q2=Blue Linen Robe", "=ds=#sr# 70"};
		{ 26, "s3842", "4309", "=q2=Handstitched Linen Britches", "=ds=#sr# 70"};
		{ 27, "s7630", "6240", "=q2=Blue Linen Vest", "=ds=#sr# 55"};
		{ 28, "s7629", "6239", "=q2=Red Linen Vest", "=ds=#sr# 55"};
		{ 29, "s2389", "2572", "=q2=Red Linen Robe", "=ds=#sr# 40"};
		{ 30, "s7623", "6238", "=q2=Brown Linen Robe", "=ds=#sr# 30"};
		Next = "TailoringArmorCLASSIC6";
		Prev = "TailoringArmorCLASSIC4";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC6"] = {
		{ 1, "s7624", "6241", "=q2=White Linen Robe", "=ds=#sr# 30"};
		{ 2, "s49677", "6836", "=q1=Dress Shoes", "=ds="..AL["Vendor"]..""};
		{ 3, "s50644", "38277", "=q1=Haliscan Jacket", "=ds="..AL["Vendor"]..""};
		{ 4, "s50647", "38278", "=q1=Haliscan Pantaloons", "=ds="..AL["Vendor"]..""};
		{ 5, "s26403", "21154", "=q1=Festival Dress", "=ds=#sr# 250"};
		{ 6, "s26407", "21542", "=q1=Festive Red Pant Suit", "=ds=#sr# 250"};
		{ 7, "s12093", "10036", "=q1=Tuxedo Jacket", "=ds=#sr# 250"};
		{ 8, "s44950", "34087", "=q1=Green Winter Clothes", "=ds=#sr# 250"};
		{ 9, "s44958", "34085", "=q1=Red Winter Clothes", "=ds=#sr# 250"};
		{ 10, "s12091", "10040", "=q1=White Wedding Dress", "=ds=#sr# 250"};
		{ 11, "s12089", "10035", "=q1=Tuxedo Pants", "=ds=#sr# 245"};
		{ 12, "s12077", "10053", "=q1=Simple Black Dress", "=ds=#sr# 235"};
		{ 13, "s8799", "7062", "=q1=Crimson Silk Pantaloons", "=ds=#sr# 195"};
		{ 14, "s8791", "7058", "=q1=Crimson Silk Vest", "=ds=#sr# 185"};
		{ 15, "s8762", "7050", "=q1=Silk Headband", "=ds=#sr# 160"};
		{ 16, "s8760", "7048", "=q1=Azure Silk Hood", "=ds=#sr# 145"};
		{ 17, "s3849", "4315", "=q1=Reinforced Woolen Shoulders", "=ds=#sr# 120"};
		{ 18, "s3848", "4314", "=q1=Double-stitched Woolen Shoulders", "=ds=#sr# 110"};
		{ 19, "s8467", "6787", "=q1=White Woolen Dress", "=ds=#sr# 110"};
		{ 20, "s2399", "2582", "=q1=Green Woolen Vest", "=ds=#sr# 85"};
		{ 21, "s12046", "10047", "=q1=Simple Kilt", "=ds=#sr# 75"};
		{ 22, "s2402", "2584", "=q1=Woolen Cape", "=ds=#sr# 75"};
		{ 23, "s2386", "2569", "=q1=Linen Boots", "=ds=#sr# 65"};
		{ 24, "s3841", "4308", "=q1=Green Linen Bracers", "=ds=#sr# 60"};
		{ 25, "s2397", "2580", "=q1=Reinforced Linen Cape", "=ds=#sr# 60"};
		{ 26, "s8465", "6786", "=q1=Simple Dress", "=ds=#sr# 40"};
		{ 27, "s3840", "4307", "=q1=Heavy Linen Gloves", "=ds=#sr# 35"};
		{ 28, "s3914", "4343", "=q1=Brown Linen Pants", "=ds=#sr# 30"};
		{ 29, "s12045", "10046", "=q1=Simple Linen Boots", "=ds=#sr# 20"};
		{ 30, "s8776", "7026", "=q1=Linen Belt", "=ds=#sr# 15"};
		Prev = "TailoringArmorCLASSIC5";
		Next = "TailoringArmorCLASSIC7";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorCLASSIC7"] = {
		{ 1, "s2385", "2568", "=q1=Brown Linen Vest", "=ds=#sr# 10"};
		{ 2, "s2387", "2570", "=q1=Linen Cloak", "=ds=#sr# 1"};
		{ 3, "s12044", "10045", "=q1=Simple Linen Pants", "=ds=#sr# 1"};
		Prev = "TailoringArmorCLASSIC6";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorTBC"] = {
		{ 1, "s31456", "24267", "=q4=Battlecast Hood", "=ds=#sr# 375"};
		{ 2, "s31453", "24263", "=q4=Battlecast Pants", "=ds=#sr# 375"};
		{ 3, "s36315", "30038", "=q4=Belt of Blasting", "=ds=#sr# 375"};
		{ 4, "s36316", "30036", "=q4=Belt of the Long Road", "=ds=#sr# 375"};
		{ 5, "s36317", "30037", "=q4=Boots of Blasting", "=ds=#sr# 375"};
		{ 6, "s36318", "30035", "=q4=Boots of the Long Road", "=ds=#sr# 375"};
		{ 7, "s41205", "32586", "=q4=Bracers of Nimble Thought", "=ds=#sr# 375"};
		{ 8, "s26758", "21871", "=q4=Frozen Shadoweave Robe", "=ds=#sr# 375"};
		{ 9, "s41206", "32587", "=q4=Mantle of Nimble Thought", "=ds=#sr# 375"};
		{ 10, "s40060", "32420", "=q4=Night's End", "=ds=#sr# 375"};
		{ 11, "s26762", "21875", "=q4=Primal Mooncloth Robe", "=ds=#sr# 375"};
		{ 12, "s26781", "21865", "=q4=Soulcloth Vest", "=ds=#sr# 375"};
		{ 13, "s40021", "32392", "=q4=Soulguard Bracers", "=ds=#sr# 375"};
		{ 14, "s40024", "32390", "=q4=Soulguard Girdle", "=ds=#sr# 375"};
		{ 15, "s40023", "32389", "=q4=Soulguard Leggings", "=ds=#sr# 375"};
		{ 16, "s40020", "32391", "=q4=Soulguard Slippers", "=ds=#sr# 375"};
		{ 17, "s26754", "21848", "=q4=Spellfire Robe", "=ds=#sr# 375"};
		{ 18, "s31455", "24266", "=q4=Spellstrike Hood", "=ds=#sr# 375"};
		{ 19, "s31452", "24262", "=q4=Spellstrike Pants", "=ds=#sr# 375"};
		{ 20, "s41208", "32585", "=q4=Swiftheal Mantle", "=ds=#sr# 375"};
		{ 21, "s41207", "32584", "=q4=Swiftheal Wraps", "=ds=#sr# 375"};
		{ 22, "s31454", "24264", "=q4=Whitemend Hood", "=ds=#sr# 375"};
		{ 23, "s31451", "24261", "=q4=Whitemend Pants", "=ds=#sr# 375"};
		{ 24, "s31444", "24257", "=q4=Black Belt of Knowledge", "=ds=#sr# 365"};
		{ 25, "s26757", "21870", "=q4=Frozen Shadoweave Boots", "=ds=#sr# 365"};
		{ 26, "s31443", "24256", "=q4=Girdle of Ruination", "=ds=#sr# 365"};
		{ 27, "s46129", "34367", "=q4=Hands of Eternal Light", "=ds=#sr# 365"};
		{ 28, "s31450", "24260", "=q4=Manaweave Cloak", "=ds=#sr# 365"};
		{ 29, "s26761", "21874", "=q4=Primal Mooncloth Shoulders", "=ds=#sr# 365"};
		{ 30, "s31448", "24258", "=q4=Resolute Cape", "=ds=#sr# 365"};
		Next = "TailoringArmorTBC2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorTBC2"] = {
		{ 1, "s46131", "34365", "=q4=Robe of Eternal Light", "=ds=#sr# 365"};
		{ 2, "s26780", "21864", "=q4=Soulcloth Shoulders", "=ds=#sr# 365"};
		{ 3, "s26753", "21847", "=q4=Spellfire Gloves", "=ds=#sr# 365"};
		{ 4, "s46128", "34366", "=q4=Sunfire Handwraps", "=ds=#sr# 365"};
		{ 5, "s46130", "34364", "=q4=Sunfire Robe", "=ds=#sr# 365"};
		{ 6, "s31442", "24255", "=q4=Unyielding Girdle", "=ds=#sr# 365"};
		{ 7, "s31449", "24259", "=q4=Vengeance Wrap", "=ds=#sr# 365"};
		{ 8, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders", "=ds=#sr# 355"};
		{ 9, "s26760", "21873", "=q4=Primal Mooncloth Belt", "=ds=#sr# 355"};
		{ 10, "s26779", "21863", "=q4=Soulcloth Gloves", "=ds=#sr# 355"};
		{ 11, "s26752", "21846", "=q4=Spellfire Belt", "=ds=#sr# 355"};
		{ 12, "s26784", "21868", "=q3=Arcanoweave Robe", "=ds=#sr# 370"};
		{ 13, "s37884", "30839", "=q3=Flameheart Vest", "=ds=#sr# 370"};
		{ 14, "s26783", "21867", "=q3=Arcanoweave Boots", "=ds=#sr# 360"};
		{ 15, "s37883", "30838", "=q3=Flameheart Gloves", "=ds=#sr# 360"};
		{ 16, "s26777", "21861", "=q3=Imbued Netherweave Robe", "=ds=#sr# 360"};
		{ 17, "s26778", "21862", "=q3=Imbued Netherweave Tunic", "=ds=#sr# 360"};
		{ 18, "s26782", "21866", "=q3=Arcanoweave Bracers", "=ds=#sr# 350"};
		{ 19, "s31437", "24251", "=q3=Blackstrike Bracers", "=ds=#sr# 350"};
		{ 20, "s31435", "24250", "=q3=Bracers of Havok", "=ds=#sr# 350"};
		{ 21, "s37873", "30831", "=q3=Cloak of Arcane Evasion", "=ds=#sr# 350"};
		{ 22, "s31440", "24253", "=q3=Cloak of Eternity", "=ds=#sr# 350"};
		{ 23, "s31438", "24252", "=q3=Cloak of the Black Void", "=ds=#sr# 350"};
		{ 24, "s37882", "30837", "=q3=Flameheart Bracers", "=ds=#sr# 350"};
		{ 25, "s26776", "21860", "=q3=Imbued Netherweave Boots", "=ds=#sr# 350"};
		{ 26, "s31434", "24249", "=q3=Unyielding Bracers", "=ds=#sr# 350"};
		{ 27, "s31441", "24254", "=q3=White Remedy Cape", "=ds=#sr# 350"};
		{ 28, "s26775", "21859", "=q3=Imbued Netherweave Pants", "=ds=#sr# 340"};
		{ 29, "s26774", "21855", "=q2=Netherweave Tunic", "=ds=#sr# 345"};
		{ 30, "s26773", "21854", "=q2=Netherweave Robe", "=ds=#sr# 340"};
		Prev = "TailoringArmorTBC";
		Next = "TailoringArmorTBC3";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorTBC3"] = {
		{ 1, "s26772", "21853", "=q2=Netherweave Boots", "=ds=#sr# 335"};
		{ 2, "s26771", "21852", "=q2=Netherweave Pants", "=ds=#sr# 325"};
		{ 3, "s26770", "21851", "=q2=Netherweave Gloves", "=ds=#sr# 320"};
		{ 4, "s26765", "21850", "=q2=Netherweave Belt", "=ds=#sr# 310"};
		{ 5, "s26764", "21849", "=q2=Netherweave Bracers", "=ds=#sr# 310"};
		Prev = "TailoringArmorTBC2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorWRATH"] = {
        { 1, "s70551", "49890", "=q4=Deathfrost Boots", "=ds="..AL["Vendor"]..""};
        { 2, "s70550", "49891", "=q4=Leggings of Woven Death", "=ds="..AL["Vendor"]..""};
        { 3, "s70552", "49892", "=q4=Lightweave Leggings", "=ds="..AL["Vendor"]..""};
        { 4, "s70553", "49893", "=q4=Sandals of Consecration", "=ds="..AL["Vendor"]..""};
		{ 5, "s67066", "47603", "=q4=Merlin's Robe", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 6, "s67146", "47604", "=q4=Merlin's Robe", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 7, "s67064", "47605", "=q4=Royal Moonshroud Robe", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 8, "s67144", "47606", "=q4=Royal Moonshroud Robe", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 9, "s67145", "47586", "=q4=Bejeweled Wizard's Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 10, "s67079", "47585", "=q4=Bejeweled Wizard's Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 11, "s67065", "47587", "=q4=Royal Moonshroud Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 12, "s67147", "47588", "=q4=Royal Moonshroud Bracers", "=ds="..AL["Drop"]..", "..BabbleZone["Trial of the Crusader"]};
		{ 13, "s63205", "45558", "=q4=Cord of the White Dawn", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 14, "s63203", "45557", "=q4=Sash of Ancient Power", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 15, "s63206", "45567", "=q4=Savior's Slippers", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 16, "s63204", "45566", "=q4=Spellslinger's Slippers", "=ds="..AL["Drop"]..", "..BabbleZone["Ulduar"]};
		{ 17, "s56017", "41610", "=q4=Deathchill Cloak", "=ds="..AL["Achievement"] };
		{ 18, "s56016", "41609", "=q4=Wispcloak", "=ds="..AL["Achievement"] };
		{ 19, "s56026", "42101", "=q4=Ebonweave Robe", "=ds="..AL["Trainer"] };
		{ 20, "s56024", "42100", "=q4=Moonshroud Robe", "=ds="..AL["Trainer"] };
		{ 21, "s56028", "42102", "=q4=Spellweave Robe", "=ds="..AL["Trainer"] };
		{ 22, "s56027", "42111", "=q4=Ebonweave Gloves", "=ds="..AL["Trainer"] };
		{ 23, "s56025", "42103", "=q4=Moonshroud Gloves", "=ds="..AL["Trainer"] };
		{ 24, "s56029", "42113", "=q4=Spellweave Gloves", "=ds="..AL["Trainer"] };
		{ 25, "s60993", "43583", "=q4=Glacial Robe", "=ds="..AL["Trainer"] };
		{ 26, "s60994", "43585", "=q4=Glacial Slippers", "=ds="..AL["Trainer"] };
		{ 27, "s60990", "43584", "=q4=Glacial Waistband", "=ds="..AL["Trainer"] };
		{ 28, "s56021", "42093", "=q3=Frostmoon Pants", "=ds="..AL["Trainer"] };
		{ 29, "s56018", "41984", "=q3=Hat of Wintry Doom", "=ds="..AL["Trainer"] };
		{ 30, "s56023", "42096", "=q3=Aurora Slippers", "=ds="..AL["Trainer"] };
		Next = "TailoringArmorWRATH2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorWRATH2"] = {
        { 1, "s56020", "41986", "=q3=Deep Frozen Cord", "=ds="..AL["Trainer"] };
		{ 2, "s59585", "43970", "=q3=Frostsavage Boots", "=ds="..AL["Trainer"] };
		{ 3, "s59589", "43971", "=q3=Frostsavage Cowl", "=ds="..AL["Trainer"] };
		{ 4, "s59586", "41516", "=q3=Frostsavage Gloves", "=ds="..AL["Trainer"] };
		{ 5, "s59588", "43975", "=q3=Frostsavage Leggings", "=ds="..AL["Trainer"] };
		{ 6, "s59587", "43972", "=q3=Frostsavage Robe", "=ds="..AL["Trainer"] };
		{ 7, "s59584", "43973", "=q3=Frostsavage Shoulders", "=ds="..AL["Trainer"] };
		{ 8, "s56022", "42095", "=q3=Light Blessed Mittens", "=ds="..AL["Trainer"] };
		{ 9, "s56019", "41985", "=q3=Silky Iceshard Boots", "=ds="..AL["Trainer"] };
		{ 10, "s55941", "41554", "=q3=Black Duskweave Robe", "=ds="..AL["Trainer"] };
		{ 11, "s55925", "41553", "=q3=Black Duskweave Leggings", "=ds="..AL["Trainer"] };
		{ 12, "s55943", "41555", "=q3=Black Duskweave Wristwraps", "=ds="..AL["Trainer"] };
		{ 13, "s64730", "45810", "=q3=Cloak of Crimson Snow", "=ds="};
		{ 14, "s64729", "45811", "=q3=Frostguard Drape", "=ds="};
		{ 15, "s59582", "43969", "=q3=Frostsavage Belt", "=ds="..AL["Trainer"] };
		{ 16, "s59583", "43974", "=q3=Frostsavage Bracers", "=ds="..AL["Trainer"] };
		{ 17, "s56015", "41608", "=q3=Cloak of Frozen Spirits", "=ds="..AL["Trainer"] };
		{ 18, "s56014", "41607", "=q3=Cloak of the Moon", "=ds="..AL["Trainer"] };
		{ 19, "s55911", "41525", "=q3=Mystic Frostwoven Robe", "=ds="..AL["Trainer"] };
		{ 20, "s55910", "41523", "=q3=Mystic Frostwoven Shoulders", "=ds="..AL["Trainer"] };
		{ 21, "s55913", "41528", "=q3=Mystic Frostwoven Wriststraps", "=ds="..AL["Trainer"] };
		{ 22, "s55923", "41550", "=q2=Duskweave Shoulders", "=ds="..AL["Trainer"] };
		{ 23, "s55924", "41544", "=q2=Duskweave Boots", "=ds="..AL["Trainer"] };
		{ 24, "s55921", "41549", "=q2=Duskweave Robe", "=ds="..AL["Trainer"] };
		{ 25, "s55922", "41545", "=q2=Duskweave Gloves", "=ds="..AL["Trainer"] };
		{ 26, "s55920", "41551", "=q2=Duskweave Wriststraps", "=ds="..AL["Trainer"] };
		{ 27, "s55914", "41543", "=q2=Duskweave Belt", "=ds="..AL["Trainer"] };
		{ 28, "s55919", "41546", "=q2=Duskweave Cowl", "=ds="..AL["Trainer"] };
		{ 29, "s55901", "41548", "=q2=Duskweave Leggings", "=ds="..AL["Trainer"] };
		{ 30, "s55907", "41521", "=q2=Frostwoven Cowl", "=ds="..AL["Trainer"] };
		Prev = "TailoringArmorWRATH";
		Next = "TailoringArmorWRATH3";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringArmorWRATH3"] = {
        { 1, "s56030", "41519", "=q2=Frostwoven Leggings", "=ds="..AL["Trainer"] };
		{ 2, "s55906", "41520", "=q2=Frostwoven Boots", "=ds="..AL["Trainer"] };
		{ 3, "s55908", "41522", "=q2=Frostwoven Belt", "=ds="..AL["Trainer"] };
		{ 4, "s55904", "44211", "=q2=Frostwoven Gloves", "=ds="..AL["Trainer"] };
		{ 5, "s55903", "41515", "=q2=Frostwoven Robe", "=ds="..AL["Trainer"] };
		{ 6, "s55902", "41513", "=q2=Frostwoven Shoulders", "=ds="..AL["Trainer"] };
		{ 7, "s56031", "41512", "=q2=Frostwoven Wriststraps", "=ds="..AL["Trainer"] };
		Prev = "TailoringArmorWRATH2";
		Back = "TAILORINGMENU";
		Type = "Crafting";
		Submenu = "Expansion";
	};

	AtlasLoot_Data["TailoringBags1"] = {
		{ 1, "s26087", "21342", "=q4=Core Felcloth Bag", "=ds=#sr# 300"};
		{ 2, "s56005", "41600", "=q3=Glacial Bag", "=ds="..BabbleFaction["The Sons of Hodir"]..": "..BabbleFaction["Exalted"] };
		{ 3, "s56006", "41598", "=q3=Mysterious Bag", "=ds="..BabbleFaction["The Wyrmrest Accord"]..": "..BabbleFaction["Revered"] };
		{ 4, "s56004", "41597", "=q3=Abyssal Bag", "=ds="..BabbleFaction["Knights of the Ebon Blade"]..": "..BabbleFaction["Revered"] };
		{ 5, "s63924", "45773", "=q3=Emerald Bag", "=ds="};
		{ 6, "s26759", "21872", "=q3=Ebon Shadowbag", "=ds=#sr# 375"};
		{ 7, "s50194", "38225", "=q3=Mycah's Botanical Bag", "=ds=#sr# 375"};
		{ 8, "s26763", "21876", "=q3=Primal Mooncloth Bag", "=ds=#sr# 375"};
		{ 9, "s26755", "21858", "=q3=Spellfire Bag", "=ds=#sr# 375"};
		{ 10, "s18455", "14156", "=q3=Bottomless Bag", "=ds=#sr# 300"};
		{ 11, "s26086", "21341", "=q3=Felcloth Bag", "=ds=#sr# 280"};
		{ 12, "s56007", "41599", "=q2=Frostweave Bag", "=ds="..AL["Trainer"] };
		{ 13, "s31459", "24270", "=q2=Bag of Jewels", "=ds=#sr# 340"};
		{ 14, "s26749", "21843", "=q2=Imbued Netherweave Bag", "=ds=#sr# 340"};
		{ 15, "s26746", "21841", "=q2=Netherweave Bag", "=ds=#sr# 315"};
		{ 16, "s27660", "22249", "=q2=Big Bag of Enchantment", "=ds=#sr# 300"};
		{ 17, "s18445", "14155", "=q2=Mooncloth Bag", "=ds=#sr# 300"};
		{ 18, "s27725", "22252", "=q2=Satchel of Cenarius", "=ds=#sr# 300"};
		{ 19, "s27659", "22248", "=q2=Enchanted Runecloth Bag", "=ds=#sr# 275"};
		{ 20, "s27724", "22251", "=q2=Cenarion Herb Bag", "=ds=#sr# 275"};
		{ 21, "s26085", "21340", "=q2=Soul Pouch", "=ds=#sr# 260"};
		{ 22, "s27658", "22246", "=q2=Enchanted Mageweave Pouch", "=ds=#sr# 225"};
		{ 23, "s18405", "14046", "=q1=Runecloth Bag", "=ds=#sr# 260"};
		{ 24, "s12079", "10051", "=q1=Red Mageweave Bag", "=ds=#sr# 235"};
		{ 25, "s12065", "10050", "=q1=Mageweave Bag", "=ds=#sr# 225"};
		{ 26, "s6695", "5765", "=q1=Black Silk Pack", "=ds=#sr# 185"};
		{ 27, "s6693", "5764", "=q1=Green Silk Pack", "=ds=#sr# 175"};
		{ 28, "s3813", "4245", "=q1=Small Silk Pack", "=ds=#sr# 150"};
		{ 29, "s6688", "5763", "=q1=Red Woolen Bag", "=ds=#sr# 115"};
		{ 30, "s3758", "4241", "=q1=Green Woolen Bag", "=ds=#sr# 95"};
		Next = "TailoringBags2";
		Back = "TAILORINGMENU";
	};

	AtlasLoot_Data["TailoringBags2"] = {
		{ 1, "s3757", "4240", "=q1=Woolen Bag", "=ds=#sr# 80"};
		{ 2, "s6686", "5762", "=q1=Red Linen Bag", "=ds=#sr# 70"};
		{ 3, "s3755", "4238", "=q1=Linen Bag", "=ds=#sr# 45"};
		Prev = "TailoringBags1";
		Back = "TAILORINGMENU";
	};

	AtlasLoot_Data["TailoringMisc1"] = {
		{ 1, "s55769", "INV_Misc_Thread_01", "=ds=Darkglow Embroidery", "=ds="..AL["Trainer"] };
		{ 2, "s55642", "INV_Misc_Thread_01", "=ds=Lightweave Embroidery", "=ds="..AL["Trainer"] };
		{ 3, "s55777", "INV_Misc_Thread_01", "=ds=Swordguard Embroidery", "=ds="..AL["Trainer"] };
		{ 4, "s56034", "Spell_Nature_AstralRecalGroup", "=ds=Master's Spellthread", "=ds="..AL["Trainer"] };
		{ 5, "s56039", "Spell_Nature_AstralRecalGroup", "=ds=Sanctified Spellthread", "=ds="..AL["Trainer"] };
		{ 6, "s56009", "41602", "=q4=Brilliant Spellthread", "=ds="..BabbleFaction["Argent Crusade"]..": "..BabbleFaction["Exalted"] };
		{ 7, "s56011", "41604", "=q4=Sapphire Spellthread", "=ds="..BabbleFaction["Kirin Tor"]..": "..BabbleFaction["Exalted"] };
		{ 8, "s75597", "54797", "=q4=Frosty Flying Carpet", "=ds=" };
		{ 9, "s60971", "44558", "=q4=Magnificent Flying Carpet", "=ds="..AL["Trainer"] };
		{ 10, "s31433", "24276", "=q4=Golden Spellthread", "=ds=#sr# 375"};
		{ 11, "s31432", "24274", "=q4=Runic Spellthread", "=ds=#sr# 375"};
		{ 12, "s56002", "41593", "=q3=Ebonweave", "=ds="..AL["Trainer"] };
		{ 13, "s56001", "41594", "=q3=Moonshroud", "=ds="..AL["Trainer"] };
		{ 14, "s56003", "41595", "=q3=Spellweave", "=ds="..AL["Trainer"] };
		{ 15, "s60969", "44554", "=q3=Flying Carpet", "=ds="..AL["Trainer"] };
		{ 16, "s56010", "41603", "=q3=Azure Spellthread", "=ds="..AL["Trainer"] };
		{ 17, "s56008", "41601", "=q3=Shining Spellthread", "=ds="..AL["Trainer"] };
		{ 18, "s26751", "21845", "=q3=Primal Mooncloth", "=ds=#sr# 350"};
		{ 19, "s36686", "24272", "=q3=Shadowcloth", "=ds=#sr# 350"};
		{ 20, "s31373", "24271", "=q3=Spellcloth", "=ds=#sr# 350"};
		{ 21, "s31430", "24273", "=q3=Mystic Spellthread", "=ds=#sr# 335"};
		{ 22, "s31431", "24275", "=q3=Silver Spellthread", "=ds=#sr# 335"};
		{ 23, "s55900", "41511", "=q2=Bolt of Imbued Frostweave", "=ds="..AL["Trainer"] };
		{ 24, "s26747", "21842", "=q2=Bolt of Imbued Netherweave", "=ds=#sr# 325"};
		{ 25, "s55898", "41509", "=q1=Frostweave Net", "=ds="..AL["Trainer"] };
		{ 26, "s55899", "41510", "=q1=Bolt of Frostweave", "=ds="..AL["Trainer"] };
		{ 27, "s26750", "21844", "=q1=Bolt of Soulcloth", "=ds=#sr# 345"};
		{ 28, "s26745", "21840", "=q1=Bolt of Netherweave", "=ds=#sr# 300"};
		{ 29, "s31460", "24268", "=q1=Netherweave Net", "=ds=#sr# 300"};
		{ 30, "s18401", "14048", "=q1=Bolt of Runecloth", "=ds=#sr# 250"};
		Next = "TailoringMisc2";
		Back = "TAILORINGMENU";
	};

	AtlasLoot_Data["TailoringMisc2"] = {
		{ 1, "s18560", "14342", "=q1=Mooncloth", "=ds=#sr# 250"};
		{ 2, "s3865", "4339", "=q1=Bolt of Mageweave", "=ds=#sr# 175"};
		{ 3, "s3839", "4305", "=q1=Bolt of Silk Cloth", "=ds=#sr# 125"};
		{ 4, "s2964", "2997", "=q1=Bolt of Woolen Cloth", "=ds=#sr# 75"};
		{ 5, "s2963", "2996", "=q1=Bolt of Linen Cloth", "=ds=#sr# 1"};
		Prev = "TailoringMisc1";
		Back = "TAILORINGMENU";
	};

	AtlasLoot_Data["TailoringShirts1"] = {
		{ 1, "s55994", "41249", "=q1=Blue Lumberjack Shirt", "=ds="..AL["Drop"] };
		{ 2, "s55998", "41253", "=q1=Blue Workman's Shirt", "=ds="..AL["Drop"] };
		{ 3, "s55996", "41250", "=q1=Green Lumberjack Shirt", "=ds="..AL["Drop"] };
		{ 4, "s56000", "41255", "=q1=Green Workman's Shirt", "=ds="..AL["Trainer"] };
		{ 5, "s55993", "41248", "=q1=Red Lumberjack Shirt", "=ds="..AL["Drop"] };
		{ 6, "s55997", "41252", "=q1=Red Workman's Shirt", "=ds="..AL["Drop"] };
		{ 7, "s55999", "41254", "=q1=Rustic Workman's Shirt", "=ds="..AL["Drop"] };
		{ 8, "s55995", "41251", "=q1=Yellow Lumberjack Shirt", "=ds="..AL["Trainer"] };
		{ 9, "s12085", "10034", "=q1=Tuxedo Shirt", "=ds=#sr# 240"};
		{ 10, "s12080", "10055", "=q1=Pink Mageweave Shirt", "=ds=#sr# 235"};
		{ 11, "s12075", "10054", "=q1=Lavender Mageweave Shirt", "=ds=#sr# 230"};
		{ 12, "s12064", "10052", "=q1=Orange Martial Shirt", "=ds=#sr# 220"};
		{ 13, "s12061", "10056", "=q1=Orange Mageweave Shirt", "=ds=#sr# 215"};
		{ 14, "s3873", "4336", "=q1=Black Swashbuckler's Shirt", "=ds=#sr# 200"};
		{ 15, "s21945", "17723", "=q1=Green Holiday Shirt", "=ds=#sr# 190"};
		{ 16, "s3872", "4335", "=q1=Rich Purple Silk Shirt", "=ds=#sr# 185"};
		{ 17, "s8489", "6796", "=q1=Red Swashbuckler's Shirt", "=ds=#sr# 175"};
		{ 18, "s3871", "4334", "=q1=Formal White Shirt", "=ds=#sr# 170"};
		{ 19, "s8483", "6795", "=q1=White Swashbuckler's Shirt", "=ds=#sr# 160"};
		{ 20, "s3870", "4333", "=q1=Dark Silk Shirt", "=ds=#sr# 155"};
		{ 21, "s3869", "4332", "=q1=Bright Yellow Shirt", "=ds=#sr# 135"};
		{ 22, "s7892", "6384", "=q1=Stylish Blue Shirt", "=ds=#sr# 120"};
		{ 23, "s7893", "6385", "=q1=Stylish Green Shirt", "=ds=#sr# 120"};
		{ 24, "s3866", "4330", "=q1=Stylish Red Shirt", "=ds=#sr# 110"};
		{ 25, "s2406", "2587", "=q1=Gray Woolen Shirt", "=ds=#sr# 100"};
		{ 26, "s2396", "2579", "=q1=Green Linen Shirt", "=ds=#sr# 70"};
		{ 27, "s2394", "2577", "=q1=Blue Linen Shirt", "=ds=#sr# 40"};
		{ 28, "s2392", "2575", "=q1=Red Linen Shirt", "=ds=#sr# 40"};
		{ 29, "s2393", "2576", "=q1=White Linen Shirt", "=ds=#sr# 1"};
		{ 30, "s3915", "4344", "=q1=Brown Linen Shirt", "=ds=#sr# 1"};
		Back = "TAILORINGMENU";
	};

	AtlasLoot_Data["Mooncloth1"] = {
		{ 1, "s26760", "21873", "=q4=Primal Mooncloth Belt", "=ds=#sr# 355"};
		{ 2, "s26761", "21874", "=q4=Primal Mooncloth Shoulders", "=ds=#sr# 365"};
		{ 3, "s26762", "21875", "=q4=Primal Mooncloth Robe", "=ds=#sr# 375"};
		Next = "Shadoweave1";
		Back = "TAILORINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Shadoweave1"] = {
		{ 1, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders", "=ds=#sr# 355"};
		{ 2, "s26757", "21870", "=q4=Frozen Shadoweave Boots", "=ds=#sr# 365"};
		{ 3, "s26758", "21871", "=q4=Frozen Shadoweave Robe", "=ds=#sr# 375"};
		Next = "Spellfire1";
		Prev = "Mooncloth1";
		Back = "TAILORINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["Spellfire1"] = {
		{ 1, "s26752", "21846", "=q4=Spellfire Belt", "=ds=#sr# 355"};
		{ 2, "s26753", "21847", "=q4=Spellfire Gloves", "=ds=#sr# 365"};
		{ 3, "s26754", "21848", "=q4=Spellfire Robe", "=ds=#sr# 375"};
		Prev = "Shadoweave1";
		Back = "TAILORINGMENU";
		Type = "Crafting";
	};

	-----------------------
	--- Profession Sets ---
	-----------------------

		-------------------------------
		--- Blacksmithing Mail Sets ---
		-------------------------------

	AtlasLoot_Data["BlacksmithingMailBloodsoulEmbrace"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbm1#", ""};
		{ 2, 19691, "", "=q3=Bloodsoul Shoulders", "=ds=#s3#, #a3#"};
		{ 3, 19690, "", "=q3=Bloodsoul Breastplate", "=ds=#s5#, #a3#"};
		{ 4, 19692, "", "=q3=Bloodsoul Gauntlets", "=ds=#s9#, #a3#"};
		Next = "BlacksmithingMailFelIronChain";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingMailFelIronChain"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbm2#", ""};
		{ 2, 23493, "", "=q2=Fel Iron Chain Coif", "=ds=#s1#, #a3#"};
		{ 3, 23490, "", "=q2=Fel Iron Chain Tunic", "=ds=#s5#, #a3#"};
		{ 4, 23494, "", "=q2=Fel Iron Chain Bracers", "=ds=#s8#, #a3#"};
		{ 5, 23491, "", "=q2=Fel Iron Chain Gloves", "=ds=#s9#, #a3#"};
		Prev = "BlacksmithingMailBloodsoulEmbrace";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

		--------------------------------
		--- Blacksmithing Plate Sets ---
		--------------------------------

	AtlasLoot_Data["BlacksmithingPlateImperialPlate"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp1#", ""};
		{ 2, 12427, "", "=q2=Imperial Plate Helm", "=ds=#s1#, #a4#"};
		{ 3, 12428, "", "=q2=Imperial Plate Shoulders", "=ds=#s3#, #a4#"};
		{ 4, 12422, "", "=q2=Imperial Plate Chest", "=ds=#s5#, #a4#"};
		{ 5, 12425, "", "=q2=Imperial Plate Bracers", "=ds=#s8#, #a4#"};
		{ 6, 12424, "", "=q2=Imperial Plate Belt", "=ds=#s10#, #a4#"};
		{ 7, 12429, "", "=q2=Imperial Plate Leggings", "=ds=#s11#, #a4#"};
		{ 8, 12426, "", "=q2=Imperial Plate Boots", "=ds=#s12#, #a4#"};
		Next = "BlacksmithingPlateTheDarksoul";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateTheDarksoul"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp2#", ""};
		{ 2, 19695, "", "=q3=Darksoul Shoulders", "=ds=#s3#, #a4#"};
		{ 3, 19693, "", "=q3=Darksoul Breastplate", "=ds=#s5#, #a4#"};
		{ 4, 19694, "", "=q3=Darksoul Leggings", "=ds=#s11#, #a4#"};
		Prev = "BlacksmithingPlateImperialPlate";
		Next = "BlacksmithingPlateFelIronPlate";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateFelIronPlate"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp3#", ""};
		{ 2, 23489, "", "=q2=Fel Iron Breastplate", "=ds=#s5#, #a4#"};
		{ 3, 23482, "", "=q2=Fel Iron Plate Gloves", "=ds=#s9#, #a4#"};
		{ 4, 23484, "", "=q2=Fel Iron Plate Belt", "=ds=#s10#, #a4#"};
		{ 5, 23488, "", "=q2=Fel Iron Plate Pants", "=ds=#s11#, #a4#"};
		{ 6, 23487, "", "=q2=Fel Iron Plate Boots", "=ds=#s12#, #a4#"};
		Prev = "BlacksmithingPlateTheDarksoul";
		Next = "BlacksmithingPlateAdamantiteB";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateAdamantiteB"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp4#", ""};
		{ 2, 23507, "", "=q3=Adamantite Breastplate", "=ds=#s5#, #a4#"};
		{ 3, 23506, "", "=q3=Adamantite Plate Bracers", "=ds=#s8#, #a4#"};
		{ 4, 23508, "", "=q3=Adamantite Plate Gloves", "=ds=#s9#, #a4#"};
		Prev = "BlacksmithingPlateFelIronPlate";
		Next = "BlacksmithingPlateFlameG";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateFlameG"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp5#", "=q1=#j11#"};
		{ 2, 23516, "", "=q3=Flamebane Helm", "=ds=#s1#, #a4#"};
		{ 3, 23513, "", "=q3=Flamebane Breastplate", "=ds=#s5#, #a4#"};
		{ 4, 23515, "", "=q3=Flamebane Bracers", "=ds=#s8#, #a4#"};
		{ 5, 23514, "", "=q3=Flamebane Gloves", "=ds=#s9#, #a4#"};
		Prev = "BlacksmithingPlateAdamantiteB";
		Next = "BlacksmithingPlateEnchantedAdaman";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateEnchantedAdaman"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp6#", "=q1=#j12#"};
		{ 2, 23509, "", "=q3=Enchanted Adamantite Breastplate", "=ds=#s5#, #a4#"};
		{ 3, 23510, "", "=q3=Enchanted Adamantite Belt", "=ds=#s10#, #a4#"};
		{ 4, 23512, "", "=q3=Enchanted Adamantite Leggings", "=ds=#s11#, #a4#"};
		{ 5, 23511, "", "=q3=Enchanted Adamantite Boots", "=ds=#s12#, #a4#"};
		Prev = "BlacksmithingPlateFlameG";
		Next = "BlacksmithingPlateKhoriumWard";
		Back = "CRAFTSET1";
	};

	AtlasLoot_Data["BlacksmithingPlateKhoriumWard"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp7#", ""};
		{ 2, 23524, "", "=q3=Khorium Belt", "=ds=#s10#, #a4#"};
		{ 3, 23523, "", "=q3=Khorium Pants", "=ds=#s11#, #a4#"};
		{ 4, 23525, "", "=q3=Khorium Boots", "=ds=#s12#, #a4#"};
		Prev = "BlacksmithingPlateEnchantedAdaman";
		Next = "BlacksmithingPlateFaithFelsteel";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateFaithFelsteel"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp8#", ""};
		{ 2, 23519, "", "=q3=Felsteel Helm", "=ds=#s1#, #a4#"};
		{ 3, 23517, "", "=q3=Felsteel Gloves", "=ds=#s9#, #a4#"};
		{ 4, 23518, "", "=q3=Felsteel Leggings", "=ds=#s11#, #a4#"};
		Prev = "BlacksmithingPlateKhoriumWard";
		Next = "BlacksmithingPlateBurningRage";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateBurningRage"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp9#", ""};
		{ 2, 23521, "", "=q3=Ragesteel Helm", "=ds=#s1#, #a4#"};
		{ 3, 33173, "", "=q3=Ragesteel Shoulders", "=ds=#s3#, #a4#"};
		{ 4, 23522, "", "=q3=Ragesteel Breastplate", "=ds=#s5#, #a4#"};
		{ 5, 23520, "", "=q3=Ragesteel Gloves", "=ds=#s9#, #a4#"};
		Prev = "BlacksmithingPlateFaithFelsteel";
		Next = "BlacksmithingPlateOrnateSaroniteBattlegear";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateOrnateSaroniteBattlegear"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp10#", ""};
		{ 2, 42728, "", "=q3=Ornate Saronite Skullshield", "=ds=#s1#, #a4#"};
		{ 3, 42727, "", "=q3=Ornate Saronite Pauldrons", "=ds=#s3#, #a4#"};
		{ 4, 42725, "", "=q3=Ornate Saronite Hauberk", "=ds=#s5#, #a4#"};
		{ 5, 42723, "", "=q3=Ornate Saronite Bracers", "=ds=#s8#, #a4#"};
		{ 6, 42724, "", "=q3=Ornate Saronite Gauntlets", "=ds=#s9#, #a4#"};
		{ 7, 42729, "", "=q3=Ornate Saronite Waistguard", "=ds=#s10#, #a4#"};
		{ 8, 42726, "", "=q3=Ornate Saronite Legplates", "=ds=#s11#, #a4#"};
		{ 9, 42730, "", "=q3=Ornate Saronite Walkers", "=ds=#s12#, #a4#"};
		Prev = "BlacksmithingPlateBurningRage";
		Next = "BlacksmithingPlateSavageSaroniteBattlegear";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

	AtlasLoot_Data["BlacksmithingPlateSavageSaroniteBattlegear"] = {
		{ 1, 0, "INV_Hammer_20", "=q6=#craftbp11#", ""};
		{ 2, 41350, "", "=q3=Savage Saronite Skullshield", "=ds=#s1#, #a4#"};
		{ 3, 41351, "", "=q3=Savage Saronite Pauldrons", "=ds=#s3#, #a4#"};
		{ 4, 41353, "", "=q3=Savage Saronite Hauberk", "=ds=#s5#, #a4#"};
		{ 5, 41354, "", "=q3=Savage Saronite Bracers", "=ds=#s8#, #a4#"};
		{ 6, 41349, "", "=q3=Savage Saronite Gauntlets", "=ds=#s9#, #a4#"};
		{ 7, 41352, "", "=q3=Savage Saronite Waistguard", "=ds=#s10#, #a4#"};
		{ 8, 41347, "", "=q3=Savage Saronite Legplates", "=ds=#s11#, #a4#"};
		{ 9, 41348, "", "=q3=Savage Saronite Walkers", "=ds=#s12#, #a4#"};
		Prev = "BlacksmithingPlateOrnateSaroniteBattlegear";
		Back = "CRAFTSET1";
		Type = "Crafting";
	};

		-----------------------------------
		--- Leatherworking Leather Sets ---
		-----------------------------------

	AtlasLoot_Data["LeatherworkingLeatherVolcanicArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl1#", "=q1=#j11#"};
		{ 2, 15055, "", "=q2=Volcanic Shoulders", "=ds=#s3#, #a2#"};
		{ 3, 15053, "", "=q2=Volcanic Breastplate", "=ds=#s5#, #a2#"};
		{ 4, 15054, "", "=q2=Volcanic Leggings", "=ds=#s11#, #a2#"};
		Next = "LeatherworkingLeatherIronfeatherArmor";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherIronfeatherArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl2#", ""};
		{ 2, 15067, "", "=q3=Ironfeather Shoulders", "=ds=#s3#, #a2#"};
		{ 3, 15066, "", "=q3=Ironfeather Breastplate", "=ds=#s5#, #a2#"};
		Prev = "LeatherworkingLeatherVolcanicArmor";
		Next = "LeatherworkingLeatherStormshroudArmor";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherStormshroudArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl3#", ""};
		{ 2, 15058, "", "=q3=Stormshroud Shoulders", "=ds=#s3#, #a2#"};
		{ 3, 15056, "", "=q3=Stormshroud Armor", "=ds=#s5#, #a2#"};
		{ 4, 21278, "", "=q3=Stormshroud Gloves", "=ds=#s9#, #a2#"};
		{ 5, 15057, "", "=q3=Stormshroud Pants", "=ds=#s11#, #a2#"};
		Prev = "LeatherworkingLeatherIronfeatherArmor";
		Next = "LeatherworkingLeatherDevilsaurArmor";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherDevilsaurArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl4#", ""};
		{ 2, 15063, "", "=q3=Devilsaur Gauntlets", "=ds=#s9#, #a2#"};
		{ 3, 15062, "", "=q3=Devilsaur Leggings", "=ds=#s11#, #a2#"};
		Prev = "LeatherworkingLeatherStormshroudArmor";
		Next = "LeatherworkingLeatherBloodTigerH";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherBloodTigerH"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl5#", ""};
		{ 2, 19689, "", "=q3=Blood Tiger Shoulders", "=ds=#s3#, #a2#"};
		{ 3, 19688, "", "=q3=Blood Tiger Breastplate", "=ds=#s5#, #a2#"};
		Prev = "LeatherworkingLeatherDevilsaurArmor";
		Next = "LeatherworkingLeatherPrimalBatskin";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherPrimalBatskin"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl6#", ""};
		{ 2, 19685, "", "=q3=Primal Batskin Jerkin", "=ds=#s5#, #a2#"};
		{ 3, 19687, "", "=q3=Primal Batskin Bracers", "=ds=#s8#, #a2#"};
		{ 4, 19686, "", "=q3=Primal Batskin Gloves", "=ds=#s9#, #a2#"};
		Prev = "LeatherworkingLeatherBloodTigerH";
		Next = "LeatherworkingLeatherWildDraenishA";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherWildDraenishA"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl7#", ""};
		{ 2, 25676, "", "=q2=Wild Draenish Vest", "=ds=#s5#, #a2#"};
		{ 3, 25674, "", "=q2=Wild Draenish Gloves", "=ds=#s9#, #a2#"};
		{ 4, 25675, "", "=q2=Wild Draenish Leggings", "=ds=#s11#, #a2#"};
		{ 5, 25673, "", "=q2=Wild Draenish Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherPrimalBatskin";
		Next = "LeatherworkingLeatherThickDraenicA";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherThickDraenicA"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl8#", ""};
		{ 2, 25671, "", "=q2=Thick Draenic Vest", "=ds=#s5#, #a2#"};
		{ 3, 25669, "", "=q2=Thick Draenic Gloves", "=ds=#s9#, #a2#"};
		{ 4, 25670, "", "=q2=Thick Draenic Pants", "=ds=#s11#, #a2#"};
		{ 5, 25668, "", "=q2=Thick Draenic Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherWildDraenishA";
		Next = "LeatherworkingLeatherFelSkin";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherFelSkin"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl9#", ""};
		{ 2, 25685, "", "=q3=Fel Leather Gloves", "=ds=#s9#, #a2#"};
		{ 3, 25687, "", "=q3=Fel Leather Leggings", "=ds=#s11#, #a2#"};
		{ 4, 25686, "", "=q3=Fel Leather Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherThickDraenicA";
		Next = "LeatherworkingLeatherSClefthoof";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherSClefthoof"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl10#", ""};
		{ 2, 25689, "", "=q3=Heavy Clefthoof Vest", "=ds=#s5#, #a2#"};
		{ 3, 25690, "", "=q3=Heavy Clefthoof Leggings", "=ds=#s11#, #a2#"};
		{ 4, 25691, "", "=q3=Heavy Clefthoof Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherFelSkin";
		Next = "LeatherworkingLeatherPrimalIntent";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherPrimalIntent"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwe1#", "=q1=#p11#"};
		{ 2, 29525, "", "=q4=Primalstrike Vest", "=ds=#s5#, #a2#"};
		{ 3, 29527, "", "=q4=Primalstrike Bracers", "=ds=#s8#, #a2#"};
		{ 4, 29526, "", "=q4=Primalstrike Belt", "=ds=#s10#, #a2#"};
		Prev = "LeatherworkingLeatherSClefthoof";
		Next = "LeatherworkingLeatherWindhawkArmor";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherWindhawkArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwt1#", "=q1=#p10#"};
		{ 2, 29522, "", "=q4=Windhawk Hauberk", "=ds=#s5#, #a2#"};
		{ 3, 29523, "", "=q4=Windhawk Bracers", "=ds=#s8#, #a2#"};
		{ 4, 29524, "", "=q4=Windhawk Belt", "=ds=#s10#, #a2#"};
		Prev = "LeatherworkingLeatherPrimalIntent";
		Next = "LeatherworkingLeatherBoreanEmbrace";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherBoreanEmbrace"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl11#", ""};
		{ 2, 38437, "", "=q2=Arctic Helm", "=ds=#s1#, #a2#"};
		{ 3, 38402, "", "=q2=Arctic Shoulderpads", "=ds=#s3#, #a2#"};
		{ 4, 38400, "", "=q2=Arctic Chestpiece", "=ds=#s5#, #a2#"};
		{ 5, 38433, "", "=q2=Arctic Wristguards", "=ds=#s8#, #a2#"};
		{ 6, 38403, "", "=q2=Arctic Gloves", "=ds=#s9#, #a2#"};
		{ 7, 38405, "", "=q2=Arctic Belt", "=ds=#s10#, #a2#"};
		{ 8, 38401, "", "=q2=Arctic Leggings", "=ds=#s11#, #a2#"};
		{ 9, 38404, "", "=q2=Arctic Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherWindhawkArmor";
		Next = "LeatherworkingLeatherIceborneEmbrace";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherIceborneEmbrace"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl12#", ""};
		{ 2, 38438, "", "=q2=Iceborne Helm", "=ds=#s1#, #a2#"};
		{ 3, 38411, "", "=q2=Iceborne Shoulderpads", "=ds=#s3#, #a2#"};
		{ 4, 38408, "", "=q2=Iceborne Chestguard", "=ds=#s5#, #a2#"};
		{ 5, 38434, "", "=q2=Iceborne Wristguards", "=ds=#s8#, #a2#"};
		{ 6, 38409, "", "=q2=Iceborne Gloves", "=ds=#s9#, #a2#"};
		{ 7, 38406, "", "=q2=Iceborne Belt", "=ds=#s10#, #a2#"};
		{ 8, 38410, "", "=q2=Iceborne Leggings", "=ds=#s11#, #a2#"};
		{ 9, 38407, "", "=q2=Iceborne Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherBoreanEmbrace";
		Next = "LeatherworkingLeatherEvisceratorBattlegear";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherEvisceratorBattlegear"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl13#", ""};
		{ 2, 43260, "", "=q3=Eviscerator's Facemask", "=ds=#s1#, #a2#"};
		{ 3, 43433, "", "=q3=Eviscerator's Shoulderpads", "=ds=#s3#, #a2#"};
		{ 4, 43434, "", "=q3=Eviscerator's Chestguard", "=ds=#s5#, #a2#"};
		{ 5, 43435, "", "=q3=Eviscerator's Bindings", "=ds=#s8#, #a2#"};
		{ 6, 43436, "", "=q3=Eviscerator's Gauntlets", "=ds=#s9#, #a2#"};
		{ 7, 43437, "", "=q3=Eviscerator's Waistguard", "=ds=#s10#, #a2#"};
		{ 8, 43438, "", "=q3=Eviscerator's Legguards", "=ds=#s11#, #a2#"};
		{ 9, 43439, "", "=q3=Eviscerator's Treads", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherIceborneEmbrace";
		Next = "LeatherworkingLeatherOvercasterBattlegear";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingLeatherOvercasterBattlegear"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwl14#", ""};
		{ 2, 43261, "", "=q3=Overcast Headguard", "=ds=#s1#, #a2#"};
		{ 3, 43262, "", "=q3=Overcast Spaulders", "=ds=#s3#, #a2#"};
		{ 4, 43263, "", "=q3=Overcast Chestguard", "=ds=#s5#, #a2#"};
		{ 5, 43264, "", "=q3=Overcast Bracers", "=ds=#s8#, #a2#"};
		{ 6, 43265, "", "=q3=Overcast Handwraps", "=ds=#s9#, #a2#"};
		{ 7, 43266, "", "=q3=Overcast Belt", "=ds=#s10#, #a2#"};
		{ 8, 43271, "", "=q3=Overcast Leggings", "=ds=#s11#, #a2#"};
		{ 9, 43273, "", "=q3=Overcast Boots", "=ds=#s12#, #a2#"};
		Prev = "LeatherworkingLeatherEvisceratorBattlegear";
		Back = "CRAFTSET2";
		Type = "Crafting";
	};

		--------------------------------
		--- Leatherworking Mail Sets ---
		--------------------------------

	AtlasLoot_Data["LeatherworkingMailGreenDragonM"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm1#", "=q1=#j13#"};
		{ 2, 15045, "", "=q3=Green Dragonscale Breastplate", "=ds=#s5#, #a3#"};
		{ 3, 20296, "", "=q3=Green Dragonscale Gauntlets", "=ds=#s9#, #a3#"};
		{ 4, 15046, "", "=q3=Green Dragonscale Leggings", "=ds=#s11#, #a3#"};
		Next = "LeatherworkingMailBlueDragonM";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailBlueDragonM"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm2#", "=q1=#j12#"};
		{ 2, 15049, "", "=q3=Blue Dragonscale Shoulders", "=ds=#s3#, #a3#"};
		{ 3, 15048, "", "=q3=Blue Dragonscale Breastplate", "=ds=#s5#, #a3#"};
		{ 4, 20295, "", "=q3=Blue Dragonscale Leggings", "=ds=#s11#, #a3#"};
		Prev = "LeatherworkingMailGreenDragonM";
		Next = "LeatherworkingMailBlackDragonM";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailBlackDragonM"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm3#", "=q1=#j11#"};
		{ 2, 15051, "", "=q3=Black Dragonscale Shoulders", "=ds=#s3#, #a3#"};
		{ 3, 15050, "", "=q3=Black Dragonscale Breastplate", "=ds=#s5#, #a3#"};
		{ 4, 15052, "", "=q3=Black Dragonscale Leggings", "=ds=#s11#, #a3#"};
		{ 5, 16984, "", "=q4=Black Dragonscale Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailBlueDragonM";
		Next = "LeatherworkingMailScaledDraenicA";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailScaledDraenicA"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm4#", ""};
		{ 2, 25660, "", "=q2=Scaled Draenic Vest", "=ds=#s5#, #a3#"};
		{ 3, 25661, "", "=q2=Scaled Draenic Gloves", "=ds=#s9#, #a3#"};
		{ 4, 25662, "", "=q2=Scaled Draenic Pants", "=ds=#s11#, #a3#"};
		{ 5, 25659, "", "=q2=Scaled Draenic Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailBlackDragonM";
		Next = "LeatherworkingMailFelscaleArmor";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailFelscaleArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm5#", ""};
		{ 2, 25657, "", "=q2=Felscale Breastplate", "=ds=#s5#, #a3#"};
		{ 3, 25654, "", "=q2=Felscale Gloves", "=ds=#s9#, #a3#"};
		{ 4, 25656, "", "=q2=Felscale Pants", "=ds=#s11#, #a3#"};
		{ 5, 25655, "", "=q2=Felscale Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailScaledDraenicA";
		Next = "LeatherworkingMailFelstalkerArmor";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailFelstalkerArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm6#", ""};
		{ 2, 25696, "", "=q3=Felstalker Breastplate", "=ds=#s5#, #a3#"};
		{ 3, 25697, "", "=q3=Felstalker Bracers", "=ds=#s8#, #a3#"};
		{ 4, 25695, "", "=q3=Felstalker Belt", "=ds=#s10#, #a3#"};
		Prev = "LeatherworkingMailFelscaleArmor";
		Next = "LeatherworkingMailNetherFury";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailNetherFury"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm7#", ""};
		{ 2, 25694, "", "=q3=Netherfury Belt", "=ds=#s10#, #a3#"};
		{ 3, 25692, "", "=q3=Netherfury Leggings", "=ds=#s11#, #a3#"};
		{ 4, 25693, "", "=q3=Netherfury Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailFelstalkerArmor";
		Next = "LeatherworkingMailNetherscaleArmor";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailNetherscaleArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwd1#", "=q1=#p9#"};
		{ 2, 29515, "", "=q4=Ebon Netherscale Breastplate", "=ds=#s5#, #a3#"};
		{ 3, 29517, "", "=q4=Ebon Netherscale Bracers", "=ds=#s8#, #a3#"};
		{ 4, 29516, "", "=q4=Ebon Netherscale Belt", "=ds=#s10#, #a3#"};
		Prev = "LeatherworkingMailNetherFury";
		Next = "LeatherworkingMailNetherstrikeArmor";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailNetherstrikeArmor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwd2#", "=q1=#p9#"};
		{ 2, 29519, "", "=q4=Netherstrike Breastplate", "=ds=#s5#, #a3#"};
		{ 3, 29521, "", "=q4=Netherstrike Bracers", "=ds=#s8#, #a3#"};
		{ 4, 29520, "", "=q4=Netherstrike Belt", "=ds=#s10#, #a3#"};
		Prev = "LeatherworkingMailNetherscaleArmor";
		Next = "LeatherworkingMailFrostscaleBinding";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailFrostscaleBinding"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm8#", ""};
		{ 2, 38440, "", "=q2=Frostscale Helm", "=ds=#s1#, #a3#"};
		{ 3, 38424, "", "=q2=Frostscale Shoulders", "=ds=#s3#, #a3#"};
		{ 4, 38414, "", "=q2=Frostscale Chestguard", "=ds=#s5#, #a3#"};
		{ 5, 38436, "", "=q2=Frostscale Bracers", "=ds=#s8#, #a3#"};
		{ 6, 38415, "", "=q2=Frostscale Gloves", "=ds=#s9#, #a3#"};
		{ 7, 38412, "", "=q2=Frostscale Belt", "=ds=#s10#, #a3#"};
		{ 8, 38416, "", "=q2=Frostscale Leggings", "=ds=#s11#, #a3#"};
		{ 9, 38413, "", "=q2=Frostscale Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailNetherstrikeArmor";
		Next = "LeatherworkingMailNerubianHive";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailNerubianHive"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm9#", ""};
		{ 2, 38439, "", "=q2=Nerubian Helm", "=ds=#s1#, #a3#"};
		{ 3, 38417, "", "=q2=Nerubian Shoulders", "=ds=#s3#, #a3#"};
		{ 4, 38420, "", "=q2=Nerubian Chestguard", "=ds=#s5#, #a3#"};
		{ 5, 38435, "", "=q2=Nerubian Bracers", "=ds=#s8#, #a3#"};
		{ 6, 38421, "", "=q2=Nerubian Gloves", "=ds=#s9#, #a3#"};
		{ 7, 38418, "", "=q2=Nerubian Belt", "=ds=#s10#, #a3#"};
		{ 8, 38422, "", "=q2=Nerubian Legguards", "=ds=#s11#, #a3#"};
		{ 9, 38419, "", "=q2=Nerubian Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailFrostscaleBinding";
		Next = "LeatherworkingMailStormhideBattlegear";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailStormhideBattlegear"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm10#", ""};
		{ 2, 43455, "", "=q3=Stormhide Crown", "=ds=#s1#, #a3#"};
		{ 3, 43457, "", "=q3=Stormhide Shoulders", "=ds=#s3#, #a3#"};
		{ 4, 43453, "", "=q3=Stormhide Hauberk", "=ds=#s5#, #a3#"};
		{ 5, 43452, "", "=q3=Stormhide Wristguards", "=ds=#s8#, #a3#"};
		{ 6, 43454, "", "=q3=Stormhide Grips", "=ds=#s9#, #a3#"};
		{ 7, 43450, "", "=q3=Stormhide Belt", "=ds=#s10#, #a3#"};
		{ 8, 43456, "", "=q3=Stormhide Legguards", "=ds=#s11#, #a3#"};
		{ 9, 43451, "", "=q3=Stormhide Stompers", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailNerubianHive";
		Next = "LeatherworkingMailSwiftarrowBattlefear";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

	AtlasLoot_Data["LeatherworkingMailSwiftarrowBattlefear"] = {
		{ 1, 0, "INV_Box_01", "=q6=#craftlwm11#", ""};
		{ 2, 43447, "", "=q3=Swiftarrow Helm", "=ds=#s1#, #a3#"};
		{ 3, 43449, "", "=q3=Swiftarrow Shoulderguards", "=ds=#s3#, #a3#"};
		{ 4, 43445, "", "=q3=Swiftarrow Hauberk", "=ds=#s5#, #a3#"};
		{ 5, 43444, "", "=q3=Swiftarrow Bracers", "=ds=#s8#, #a3#"};
		{ 6, 43446, "", "=q3=Swiftarrow Gauntlets", "=ds=#s9#, #a3#"};
		{ 7, 43442, "", "=q3=Swiftarrow Belt", "=ds=#s10#, #a3#"};
		{ 8, 43448, "", "=q3=Swiftarrow Leggings", "=ds=#s11#, #a3#"};
		{ 9, 43443, "", "=q3=Swiftarrow Boots", "=ds=#s12#, #a3#"};
		Prev = "LeatherworkingMailStormhideBattlegear";
		Back = "CRAFTSET3";
		Type = "Crafting";
	};

		----------------------
		--- Tailoring Sets ---
		----------------------

	AtlasLoot_Data["TailoringBloodvineG"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt1#", ""};
		{ 2, 19682, "", "=q3=Bloodvine Vest", "=ds=#s5#, #a1#"};
		{ 3, 19683, "", "=q3=Bloodvine Leggings", "=ds=#s11#, #a1#"};
		{ 4, 19684, "", "=q3=Bloodvine Boots", "=ds=#s12#, #a1#"};
		Next = "TailoringNeatherVest";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringNeatherVest"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt2#", ""};
		{ 2, 21855, "", "=q2=Netherweave Tunic", "=ds=#s5#, #a1#"};
		{ 3, 21854, "", "=q2=Netherweave Robe", "=ds=#s5#, #a1#"};
		{ 4, 21849, "", "=q2=Netherweave Bracers", "=ds=#s8#, #a1#"};
		{ 5, 21851, "", "=q2=Netherweave Gloves", "=ds=#s9#, #a1##"};
		{ 6, 21850, "", "=q2=Netherweave Belt", "=ds=#s10#, #a1#"};
		{ 7, 21852, "", "=q2=Netherweave Pants", "=ds=#s11#, #a1#"};
		{ 8, 21853, "", "=q2=Netherweave Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringBloodvineG";
		Next = "TailoringImbuedNeather";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringImbuedNeather"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt3#", ""};
		{ 2, 21862, "", "=q3=Imbued Netherweave Tunic", "=ds=#s5#, #a1#"};
		{ 3, 21861, "", "=q3=Imbued Netherweave Robe", "=ds=#s5#, #a1#"};
		{ 4, 21859, "", "=q3=Imbued Netherweave Pants", "=ds=#s11#, #a1#"};
		{ 5, 21860, "", "=q3=Imbued Netherweave Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringNeatherVest";
		Next = "TailoringArcanoVest";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringArcanoVest"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt4#", "=q1=#j12#"};
		{ 2, 21868, "", "=q3=Arcanoweave Robe", "=ds=#s5#, #a1#"};
		{ 3, 21866, "", "=q3=Arcanoweave Bracers", "=ds=#s8#, #a1#"};
		{ 4, 21867, "", "=q3=Arcanoweave Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringImbuedNeather";
		Next = "TailoringTheUnyielding";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringTheUnyielding"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt5#", ""};
		{ 2, 24249, "", "=q3=Unyielding Bracers", "=ds=#s8#, #a1#"};
		{ 3, 24255, "", "=q4=Unyielding Girdle", "=ds=#s10#, #a1#"};
		Prev = "TailoringArcanoVest";
		Next = "TailoringWhitemendWis";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringWhitemendWis"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt6#", ""};
		{ 2, 24264, "", "=q4=Whitemend Hood", "=ds=#s1#, #a1#"};
		{ 3, 24261, "", "=q4=Whitemend Pants", "=ds=#s11#, #a1#"};
		Prev = "TailoringTheUnyielding";
		Next = "TailoringSpellstrikeInfu";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringSpellstrikeInfu"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt7#", ""};
		{ 2, 24266, "", "=q4=Spellstrike Hood", "=ds=#s1#, #a1#"};
		{ 3, 24262, "", "=q4=Spellstrike Pants", "=ds=#s11#, #a1#"};
		Prev = "TailoringWhitemendWis";
		Next = "TailoringBattlecastG";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringBattlecastG"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt8#", ""};
		{ 2, 24267, "", "=q4=Battlecast Hood", "=ds=#s1#, #a1#"};
		{ 3, 24263, "", "=q4=Battlecast Pants", "=ds=#s11#, #a1#"};
		Prev = "TailoringSpellstrikeInfu";
		Next = "TailoringSoulclothEm";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringSoulclothEm"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt9#", "=q1=#j12#"};
		{ 2, 21864, "", "=q4=Soulcloth Shoulders", "=ds=#s3#, #a1#"};
		{ 3, 21865, "", "=q4=Soulcloth Vest", "=ds=#s5#, #a1#"};
		{ 4, 21863, "", "=q4=Soulcloth Gloves", "=ds=#s9#, #a1#"};
		Prev = "TailoringBattlecastG";
		Next = "TailoringPrimalMoon";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringPrimalMoon"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#crafttm1#", "=q1=#p19#"};
		{ 2, 21874, "", "=q4=Primal Mooncloth Shoulders", "=ds=#s3#, #a1#"};
		{ 3, 21875, "", "=q4=Primal Mooncloth Robe", "=ds=#s5#, #a1#"};
		{ 4, 21873, "", "=q4=Primal Mooncloth Belt", "=ds=#s10#, #a1#"};
		Prev = "TailoringSoulclothEm";
		Next = "TailoringShadowEmbrace";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringShadowEmbrace"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#crafttsh1#", "=q1=#p20#"};
		{ 2, 21869, "", "=q4=Frozen Shadoweave Shoulders", "=ds=#s3#, #a1#"};
		{ 3, 21871, "", "=q4=Frozen Shadoweave Vest", "=ds=#s5#, #a1#"};
		{ 4, 21870, "", "=q4=Frozen Shadoweave Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringPrimalMoon";
		Next = "TailoringSpellfireWRATH";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringSpellfireWRATH"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#crafttsf1#", "=q1=#p21#"};
		{ 2, 21848, "", "=q4=Spellfire Robe", "=ds=#s5#, #a1#"};
		{ 3, 21847, "", "=q4=Spellfire Gloves", "=ds=#s9#, #a1#"};
		{ 4, 21846, "", "=q4=Spellfire Belt", "=ds=#s10#, #a1#"};
		Prev = "TailoringShadowEmbrace";
		Next = "TailoringFrostwovenPower";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringFrostwovenPower"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt10#", ""};
		{ 2, 41521, "", "=q2=Frostwoven Cowl", "=ds=#s1#, #a1#"};
		{ 3, 41513, "", "=q2=Frostwoven Shoulders", "=ds=#s3#, #a1#"};
		{ 4, 41515, "", "=q2=Frostwoven Robe", "=ds=#s5#, #a1#"};
		{ 5, 41512, "", "=q2=Frostwoven Wristwraps", "=ds=#s8#, #a1#"};
		{ 6, 44211, "", "=q2=Frostwoven Gloves", "=ds=#s9#, #a1#"};
		{ 7, 41522, "", "=q2=Frostwoven Belt", "=ds=#s10#, #a1#"};
		{ 8, 41519, "", "=q2=Frostwoven Leggings", "=ds=#s11#, #a1#"};
		{ 9, 41520, "", "=q2=Frostwoven Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringSpellfireWRATH";
		Next = "TailoringDuskweaver";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringDuskweaver"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt11#", ""};
		{ 2, 41546, "", "=q2=Duskweave Cowl", "=ds=#s1#, #a1#"};
		{ 3, 41550, "", "=q2=Duskweave Shoulders", "=ds=#s3#, #a1#"};
		{ 4, 41549, "", "=q2=Duskweave Robe", "=ds=#s5#, #a1#"};
		{ 5, 41551, "", "=q2=Duskweave Wristwraps", "=ds=#s8#, #a1#"};
		{ 6, 41545, "", "=q2=Duskweave Gloves", "=ds=#s9#, #a1#"};
		{ 7, 41543, "", "=q2=Duskweave Belt", "=ds=#s10#, #a1#"};
		{ 8, 41548, "", "=q2=Duskweave Leggings", "=ds=#s11#, #a1#"};
		{ 9, 41544, "", "=q2=Duskweave Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringFrostwovenPower";
		Next = "TailoringFrostsavageBattlegear";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	AtlasLoot_Data["TailoringFrostsavageBattlegear"] = {
		{ 1, 0, "INV_Fabric_Linen_02", "=q6=#craftt12#", ""};
		{ 2, 43971, "", "=q3=Frostsavage Cowl", "=ds=#s1#, #a1#"};
		{ 3, 43973, "", "=q3=Frostsavage Shoulders", "=ds=#s3#, #a1#"};
		{ 4, 43972, "", "=q3=Frostsavage Robe", "=ds=#s5#, #a1#"};
		{ 5, 43974, "", "=q3=Frostsavage Bracers", "=ds=#s8#, #a1#"};
		{ 6, 41516, "", "=q3=Frostsavage Gloves", "=ds=#s9#, #a1#"};
		{ 7, 43969, "", "=q3=Frostsavage Belt", "=ds=#s10#, #a1#"};
		{ 8, 43975, "", "=q3=Frostsavage Leggings", "=ds=#s11#, #a1#"};
		{ 9, 43970, "", "=q3=Frostsavage Boots", "=ds=#s12#, #a1#"};
		Prev = "TailoringDuskweaver";
		Back = "CRAFTSET4";
		Type = "Crafting";
	};

	-------------
	--- Other ---
	-------------

		----------------------------
		--- Crafted Epic Weapons ---
		----------------------------

	AtlasLoot_Data["CraftedWeapons1"] = {
		{ 1, 49888, "", "=q4=Shadow's Edge", "=ds=#h2#, #w1#"};
		{ 3, 0, "INV_Box_01", "=q6=#p2#", "=q1=#j54#"};
		{ 4, 45085, "", "=q4=Titansteel Spellblade", "=ds=#h3#, #w4#"};
		{ 5, 42435, "", "=q4=Titansteel Shanker", "=ds=#h1#, #w4#"};
		{ 6, 41383, "", "=q4=Titansteel Bonecrusher", "=ds=#h3#, #w6#"};
		{ 7, 41384, "", "=q4=Titansteel Guardian", "=ds=#h3#, #w6#"};
		{ 8, 41257, "", "=q4=Titansteel Destroyer", "=ds=#h2#, #w6#"};
		{ 9, 42508, "", "=q4=Titansteel Shield Wall", "=ds=#w8#"};
		{ 11, 0, "INV_Box_01", "=q6=#p5#", "=q1=#j54#"};
		{ 12, 41168, "", "=q4=Armor Plated Combat Shotgun", "=ds=#w5#"};
		{ 13, 44504, "", "=q4=Nesingwary 4000", "=ds=#w5#"};
		{ 16, 0, "INV_Box_01", "=q6=#p2#", "=q1=#j10#"};
		{ 17, 23554, "", "=q4=Eternium Runed Blade", "=ds=#h3#, #w4#"};
		{ 18, 23555, "", "=q4=Dirge", "=ds=#h1#, #w4#"};
		{ 19, 23540, "", "=q4=Felsteel Longblade", "=ds=#h1#, #w10#"};
		{ 20, 23541, "", "=q4=Khorium Champion", "=ds=#h2#, #w10#"};
		{ 21, 23542, "", "=q4=Fel Edged Battleaxe", "=ds=#h1#, #w1#"};
		{ 22, 23543, "", "=q4=Felsteel Reaper", "=ds=#h2#, #w1#"};
		{ 23, 23556, "", "=q4=Hand of Eternity", "=ds=#h3#, #w6#"};
		{ 24, 23544, "", "=q4=Runic Hammer", "=ds=#h1#, #w6#"};
		{ 25, 23546, "", "=q4=Fel Hardened Maul", "=ds=#h2#, #w6#"};
		{ 26, 32854, "", "=q4=Hammer of Righteous Might", "=ds=#h2#, #w6#"};
		{ 28, 0, "INV_Box_01", "=q6=#p5#", "=q1=#j10#"};
		{ 29, 32756, "", "=q4=Gyro-balanced Khorium Destroyer", "=ds=#w5#"};
		Next = "CraftedWeapons2";
		Back = "CRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["CraftedWeapons2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#p2#", "=q1=#j9#"};
		{ 2, 19166, "", "=q4=Black Amnesty", "=ds=#h1#, #w4#"};
		{ 3, 22383, "", "=q4=Sageblade", "=ds=#h3#, #w10#"};
		{ 4, 19168, "", "=q4=Blackguard", "=ds=#h1#, #w10#"};
		{ 5, 19169, "", "=q4=Nightfall", "=ds=#h2#, #w1#"};
		{ 6, 19170, "", "=q4=Ebon Hand", "=ds=#h1#, #w6#"};
		{ 7, 22384, "", "=q4=Persuader", "=ds=#h1#, #w6#"};
		{ 8, 17193, "", "=q4=Sulfuron Hammer", "=ds=#h2#, #w6#"};
		{ 9, 19167, "", "=q4=Blackfury", "=ds=#w7#"};
		{ 10, 22198, "", "=q4=Jagged Obsidian Shield", "=ds=#w8#"};
		{ 12, 0, "INV_Box_01", "=q6=#p5#", "=q1=#j9#"};
		{ 13, 18282, "", "=q4=Core Marksman Rifle", "=ds=#w5#"};
		{ 14, 18168, "", "=q4=Force Reactive Disk", "=ds=#w8#"};
		Prev = "CraftedWeapons1";
		Next = "CraftedWeapons3";
		Back = "CRAFTINGMENU";
		Type = "Crafting";
	};

	AtlasLoot_Data["CraftedWeapons3"] = {
		{ 1, 0, "INV_Box_01", "=q6=#p15#", ""};
		{ 2, 28425, "", "=q4=Fireguard", "=ds=#h1#, #w10#"};
		{ 3, 28426, "", "=q4=Blazeguard", "=ds=#h1#, #w10#"};
		{ 4, 28427, "", "=q4=Blazefury", "=ds=#h1#, #w10#"};
		{ 5, 28428, "", "=q4=Lionheart Blade", "=ds=#h2#, #w10#"};
		{ 6, 28429, "", "=q4=Lionheart Champion", "=ds=#h2#, #w10#"};
		{ 7, 28430, "", "=q4=Lionheart Executioner", "=ds=#h2#, #w10#"};
		{ 9, 0, "INV_Box_01", "=q6=#p14#", ""};
		{ 10, 28431, "", "=q4=The Planar Edge", "=ds=#h3#, #w1#"};
		{ 11, 28432, "", "=q4=Black Planar Edge", "=ds=#h3#, #w1#"};
		{ 12, 28433, "", "=q4=Wicked Edge of the Planes", "=ds=#h3#, #w1#"};
		{ 13, 28434, "", "=q4=Lunar Crescent", "=ds=#h2#, #w1#"};
		{ 14, 28435, "", "=q4=Mooncleaver", "=ds=#h2#, #w1#"};
		{ 15, 28436, "", "=q4=Bloodmoon", "=ds=#h2#, #w1#"};
		{ 16, 0, "INV_Box_01", "=q6=#p22#", ""};
		{ 17, 28437, "", "=q4=Drakefist Hammer", "=ds=#h3#, #w6#"};
		{ 18, 28438, "", "=q4=Dragonmaw", "=ds=#h3#, #w6#"};
		{ 19, 28439, "", "=q4=Dragonstrike", "=ds=#h3#, #w6#"};
		{ 20, 28440, "", "=q4=Thunder", "=ds=#h2#, #w6#"};
		{ 21, 28441, "", "=q4=Deep Thunder", "=ds=#h2#, #w6#"};
		{ 22, 28442, "", "=q4=Stormherald", "=ds=#h2#, #w6#"};
		Prev = "CraftedWeapons2";
		Back = "CRAFTINGMENU";
		Type = "Crafting";
	};

	--------------------------------
	--- Daily Profession Rewards ---
	--------------------------------

		---------------
		--- Cooking ---
		---------------

	AtlasLoot_Data["CookingDaily1"] = {
		{ 1, 33925, "", "=q3=Recipe: Delicious Chocolate Cake", "=ds=#p3# (1)", "", ""};
		{ 2, 33871, "", "=q3=Recipe: Stormchops", "=ds=#p3# (300)", "", ""};
		{ 3, 33869, "", "=q3=Recipe: Broiled Bloodfin", "=ds=#p3# (300)", "", ""};
		{ 4, 33875, "", "=q2=Recipe: Kibler's Bits", "=ds=#p3# (300)", "", ""};
		{ 5, 33870, "", "=q2=Recipe: Skullfish Soup", "=ds=#p3# (325)", "", ""};
		{ 6, 33873, "", "=q2=Recipe: Spicy Hot Talbuk", "=ds=#p3# (300)", "", ""};
		Next = "CookingDaily2";
		Back = "COOKINGDAILYMENU";
	};

	AtlasLoot_Data["CookingDaily2"] = {
		{ 1, 43035, "", "=q2=Recipe: Blackened Dragonfin", "=ds=#p3# (400)"};
		{ 2, 43032, "", "=q2=Recipe: Blackened Worg Steak", "=ds=#p3# (400)"};
		{ 3, 43029, "", "=q2=Recipe: Critter Bites", "=ds=#p3# (400)"};
		{ 4, 43033, "", "=q2=Recipe: Cuttlesteak", "=ds=#p3# (400)"};
		{ 5, 43036, "", "=q2=Recipe: Dragonfin Filet", "=ds=#p3# (400)"};
		{ 6, 43024, "", "=q2=Recipe: Firecracker Salmon", "=ds=#p3# (400)"};
		{ 7, 43030, "", "=q2=Recipe: Hearty Rhino", "=ds=#p3# (400)"};
		{ 8, 43026, "", "=q2=Recipe: Imperial Manta Steak", "=ds=#p3# (400)"};
		{ 9, 43018, "", "=q2=Recipe: Mega Mammoth Meal", "=ds=#p3# (400)"};
		{ 10, 43022, "", "=q2=Recipe: Mighty Rhino Dogs", "=ds=#p3# (400)"};
		{ 11, 43023, "", "=q2=Recipe: Poached Northern Sculpin", "=ds=#p3# (400)"};
		{ 12, 43028, "", "=q2=Recipe: Rhinolicious Wyrmsteak", "=ds=#p3# (400)"};
		{ 13, 43031, "", "=q2=Recipe: Snapper Extreme", "=ds=#p3# (400)"};
		{ 14, 43034, "", "=q2=Recipe: Spiced Mammoth Treats", "=ds=#p3# (400)"};
		{ 15, 43020, "", "=q2=Recipe: Spiced Wyrm Burger", "=ds=#p3# (400)"};
		{ 16, 43025, "", "=q2=Recipe: Spicy Blue Nettlefish", "=ds=#p3# (400)"};
		{ 17, 43027, "", "=q2=Recipe: Spicy Fried Herring", "=ds=#p3# (400)"};
		{ 18, 43019, "", "=q2=Recipe: Tender Shoveltusk Steak", "=ds=#p3# (400)"};
		{ 19, 43037, "", "=q2=Recipe: Tracker Snacks", "=ds=#p3# (400)"};
		{ 20, 43021, "", "=q2=Recipe: Very Burnt Worg", "=ds=#p3# (400)"};
		{ 22, 46349, "", "=q3=Chef's Hat", "=ds=#s1#"};
		{ 23, 43007, "", "=q1=Northern Spices", "=ds=#e8#"};
		{ 25, 0, "inv_misc_bag_11", "=q6="..AL["Small Spice Bag"], ""};
		{ 26, 33925, "", "=q3=Recipe: Delicious Chocolate Cake", "=ds=#p3# (1)", "", ""};
		{ 27, 33871, "", "=q3=Recipe: Stormchops", "=ds=#p3# (300)", "", ""};
		{ 28, 44228, "", "=q1=Baby Spice", "=ds=", "", ""};
		{ 29, 44114, "", "=q1=Old Spices", "=ds=", "", ""};
		Prev = "CookingDaily1";
		Back = "COOKINGDAILYMENU";
	};

		---------------
		--- Fishing ---
		---------------

	AtlasLoot_Data["FishingDaily1"] = {
		{ 1, 34837, "", "=q4=The 2 Ring", "=ds=#s13#", "", ""};
		{ 2, 33820, "", "=q3=Weather-Beaten Fishing Hat", "=ds=#s1#, #a1#", "", ""};
		{ 3, 35350, "", "=q3=Chuck's Bucket", "=ds=#e13#", "", ""};
		{ 4, 33818, "", "=q3=Muckbreath's Bucket", "=ds=#e13#", "", ""};
		{ 5, 35349, "", "=q3=Snarly's Bucket", "=ds=#e13#", "", ""};
		{ 6, 33816, "", "=q3=Toothy's Bucket", "=ds=#e13#", "", ""};
		{ 7, 34831, "", "=q3=Eye of the Sea", "=ds=#e7#", "", ""};
		{ 8, 34834, "", "=q2=Recipe: Captain Rumsey's Lager", "=ds=#p3# (100)", "", ""};
		{ 9, 34836, "", "=q2=Spun Truesilver Fishing Line", "=ds=#p24# #e17#", "", ""};
		{ 16, 34827, "", "=q1=Noble's Monocle", "=ds=#s1#", "", ""};
		{ 17, 34828, "", "=q1=Antique Silver Cufflinks", "=ds=#s8#", "", ""};
		{ 18, 34826, "", "=q1=Gold Wedding Band", "=ds=#s13#", "", ""};
		{ 19, 34829, "", "=q1=Ornate Drinking Stein", "=ds=#s15#", "", ""};
		{ 20, 34859, "", "=q1=Razor Sharp Fillet Knife", "=ds=#h1#, #w4#", "", ""};
		{ 21, 34109, "", "=q1=Weather-Beaten Journal", "=ds=#e10#", "", ""};
		{ 22, 8827, "", "=q1=Elixir of Water Walking", "=ds=#e2#", "", ""};
		{ 23, 34861, "", "=q1=Sharpened Fish Hook", "=ds=#e24#", "", ""};
		Next = "FishingDaily2";
		Back = "FISHINGDAILYMENU";
	};

	AtlasLoot_Data["FishingDaily2"] = {
		{ 1, 45862, "", "=q4=Bold Stormjewel", "=ds=#e7#", "", ""};
		{ 2, 45882, "", "=q4=Brilliant Stormjewel", "=ds=#e7#", "", ""};
		{ 3, 45879, "", "=q4=Delicate Stormjewel", "=ds=#e7#", "", ""};
		{ 4, 45987, "", "=q4=Rigid Stormjewel", "=ds=#e7#", "", ""};
		{ 5, 45883, "", "=q4=Runed Stormjewel", "=ds=#e7#", "", ""};
		{ 6, 45880, "", "=q4=Solid Stormjewel", "=ds=#e7#", "", ""};
		{ 7, 45881, "", "=q4=Sparkling Stormjewel", "=ds=#e7#", "", ""};
		{ 8, 33820, "", "=q3=Weather-Beaten Fishing Hat", "=ds=#s1#, #a1#", "", ""};
		{ 9, 45991, "", "=q3=Bone Fishing Pole", "=ds=#e20#", "", ""};
		{ 10, 45992, "", "=q3=Jeweled Fishing Pole", "=ds=#e20#", "", ""};
		{ 11, 44983, "", "=q3=Strand Crawler", "=ds=#e13#", "", ""};
		{ 12, 36784, "", "=q3=Siren's Tear", "=ds=#e7#", "", ""};
		{ 13, 45986, "", "=q3=Titanium Lockbox", "=ds=", "", ""};
		{ 14, 34834, "", "=q2=Recipe: Captain Rumsey's Lager", "=ds=#p3# (100)", "", ""};
		{ 15, 19971, "", "=q2=High Test Eternium Fishing Line", "=ds=#p24# #e17#", "", ""};
		{ 16, 45998, "", "=q1=Battered Jungle Hat", "=ds=#s1#", "", ""};
		{ 17, 45861, "", "=q1=Diamond-tipped Cane", "=ds=#h2#", "", ""};
		{ 18, 46006, "", "=q1=Glow Worm", "=ds=#e24#", "", ""};
		{ 19, 45984, "", "=q1=Unusual Compass", "=ds=", "", ""};
		{ 20, 40195, "", "=q1=Pygmy Oil", "=ds=#e2#", "", ""};
		{ 21, 8827, "", "=q1=Elixir of Water Walking", "=ds=#e2#", "", ""};
		{ 22, 46004, "", "=q1=Sealed Vial of Poison", "=ds=#m2#", "", ""};
		{ 23, 48679, "", "=q1=Waterlogged Recipe", "=ds=#m2# #p3# (350)", "", ""};
		Prev = "FishingDaily1";
		Back = "FISHINGDAILYMENU";
	};

		---------------------
		--- Jewelcrafting ---
		---------------------

	AtlasLoot_Data["JewelcraftingDaily1"] = {
		{ 1, 46917, "", "=q3=Design: Bold Cardinal Ruby", "=ds=#p12# (450)"};
		{ 2, 46919, "", "=q3=Design: Bright Cardinal Ruby", "=ds=#p12# (450)"};
		{ 3, 46918, "", "=q3=Design: Delicate Cardinal Ruby", "=ds=#p12# (450)"};
		{ 4, 46923, "", "=q3=Design: Flashing Cardinal Ruby", "=ds=#p12# (450)"};
		{ 5, 46921, "", "=q3=Design: Fractured Cardinal Ruby", "=ds=#p12# (450)"};
		{ 6, 46920, "", "=q3=Design: Precise Cardinal Ruby", "=ds=#p12# (450)"};
		{ 7, 46916, "", "=q3=Design: Runed Cardinal Ruby", "=ds=#p12# (450)"};
		{ 8, 46922, "", "=q3=Design: Subtle Cardinal Ruby", "=ds=#p12# (450)"};
		{ 9, 41576, "", "=q3=Design: Bold Scarlet Ruby", "=ds=#p12# (390)"};
		{ 10, 41577, "", "=q3=Design: Delicate Scarlet Ruby", "=ds=#p12# (390)"};
		{ 11, 41578, "", "=q3=Design: Flashing Scarlet Ruby", "=ds=#p12# (390)"};
		{ 16, 46930, "", "=q3=Design: Brilliant King's Amber", "=ds=#p12# (450)"};
		{ 17, 46932, "", "=q3=Design: Mystic King's Amber", "=ds=#p12# (450)"};
		{ 18, 46933, "", "=q3=Design: Quick King's Amber", "=ds=#p12# (450)"};
		{ 19, 46928, "", "=q3=Design: Rigid King's Amber", "=ds=#p12# (450)"};
		{ 20, 46929, "", "=q3=Design: Smooth King's Amber", "=ds=#p12# (450)"};
		{ 21, 46931, "", "=q3=Design: Thick King's Amber", "=ds=#p12# (450)"};
		{ 22, 41579, "", "=q3=Design: Quick Autumn's Glow", "=ds=#p12# (390)"};
		{ 23, 41580, "", "=q3=Design: Rigid Autumn's Glow", "=ds=#p12# (390)"};
		Next = "JewelcraftingDaily2";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

	AtlasLoot_Data["JewelcraftingDaily2"] = {
		{ 1, 47010, "", "=q3=Design: Accurate Ametrine", "=ds=#p12# (450)"};
		{ 2, 47015, "", "=q3=Design: Champion's Ametrine", "=ds=#p12# (450)"};
		{ 3, 46949, "", "=q3=Design: Deadly Ametrine", "=ds=#p12# (450)"};
		{ 4, 47020, "", "=q3=Design: Deft Ametrine", "=ds=#p12# (450)"};
		{ 5, 46952, "", "=q3=Design: Durable Ametrine", "=ds=#p12# (450)"};
		{ 6, 47016, "", "=q3=Design: Empowered Ametrine", "=ds=#p12# (450)"};
		{ 7, 46953, "", "=q3=Design: Etched Ametrine", "=ds=#p12# (450)"};
		{ 8, 47019, "", "=q3=Design: Fierce Ametrine", "=ds=#p12# (450)"};
		{ 9, 47012, "", "=q3=Design: Glimmering Ametrine", "=ds=#p12# (450)"};
		{ 10, 47008, "", "=q3=Design: Glinting Ametrine", "=ds=#p12# (450)"};
		{ 11, 46948, "", "=q3=Design: Inscribed Ametrine", "=ds=#p12# (450)"};
		{ 12, 47021, "", "=q3=Design: Lucent Ametrine", "=ds=#p12# (450)"};
		{ 13, 46947, "", "=q3=Design: Luminous Ametrine", "=ds=#p12# (450)"};
		{ 14, 46950, "", "=q3=Design: Potent Ametrine", "=ds=#p12# (450)"};
		{ 15, 46956, "", "=q3=Design: Pristine Ametrine", "=ds=#p12# (450)"};
		{ 16, 47007, "", "=q3=Design: Reckless Ametrine", "=ds=#p12# (450)"};
		{ 17, 47022, "", "=q3=Design: Resolute Ametrine", "=ds=#p12# (450)"};
		{ 18, 47018, "", "=q3=Design: Resplendent Ametrine", "=ds=#p12# (450)"};
		{ 19, 47017, "", "=q3=Design: Stalwart Ametrine", "=ds=#p12# (450)"};
		{ 20, 47023, "", "=q3=Design: Stark Ametrine", "=ds=#p12# (450)"};
		{ 21, 46951, "", "=q3=Design: Veiled Ametrine", "=ds=#p12# (450)"};
		{ 22, 47011, "", "=q3=Design: Wicked Ametrine", "=ds=#p12# (450)"};
		{ 23, 41582, "", "=q3=Design: Glinting Monarch Topaz", "=ds=#p12# (390)"};
		{ 24, 41689, "", "=q3=Design: Luminous Monarch Topaz", "=ds=#p12# (390)"};
		{ 25, 41686, "", "=q3=Design: Potent Monarch Topaz", "=ds=#p12# (390)"};
		{ 26, 41690, "", "=q3=Design: Reckless Monarch Topaz", "=ds=#p12# (390)"};
		{ 27, 41687, "", "=q3=Design: Stark Monarch Topaz", "=ds=#p12# (390)"};
		{ 28, 41688, "", "=q3=Design: Veiled Monarch Topaz", "=ds=#p12# (390)"};
		Prev = "JewelcraftingDaily1";
		Next = "JewelcraftingDaily3";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

	AtlasLoot_Data["JewelcraftingDaily3"] = {
		{ 1, 46900, "", "=q3=Design: Dazzling Eye of Zul", "=ds=#p12# (450)"};
		{ 2, 46897, "", "=q3=Design: Enduring Eye of Zul", "=ds=#p12# (450)"};
		{ 3, 46912, "", "=q3=Design: Energized Eye of Zul", "=ds=#p12# (450)"};
		{ 4, 46904, "", "=q3=Design: Forceful Eye of Zul", "=ds=#p12# (450)"};
		{ 5, 46910, "", "=q3=Design: Intricate Eye of Zul", "=ds=#p12# (450)"};
		{ 6, 46901, "", "=q3=Design: Jagged Eye of Zul", "=ds=#p12# (450)"};
		{ 7, 46909, "", "=q3=Design: Lambent Eye of Zul", "=ds=#p12# (450)"};
		{ 8, 46905, "", "=q3=Design: Misty Eye of Zul", "=ds=#p12# (450)"};
		{ 9, 46914, "", "=q3=Design: Opaque Eye of Zul", "=ds=#p12# (450)"};
		{ 10, 46911, "", "=q3=Design: Radiant Eye of Zul", "=ds=#p12# (450)"};
		{ 11, 46903, "", "=q3=Design: Seer's Eye of Zul", "=ds=#p12# (450)"};
		{ 12, 46913, "", "=q3=Design: Shattered Eye of Zul", "=ds=#p12# (450)"};
		{ 13, 46907, "", "=q3=Design: Shining Eye of Zul", "=ds=#p12# (450)"};
		{ 14, 46898, "", "=q3=Design: Steady Eye of Zul", "=ds=#p12# (450)"};
		{ 15, 46906, "", "=q3=Design: Sundered Eye of Zul", "=ds=#p12# (450)"};
		{ 16, 46908, "", "=q3=Design: Tense Eye of Zul", "=ds=#p12# (450)"};
		{ 17, 46902, "", "=q3=Design: Timeless Eye of Zul", "=ds=#p12# (450)"};
		{ 18, 46915, "", "=q3=Design: Turbid Eye of Zul", "=ds=#p12# (450)"};
		{ 19, 46899, "", "=q3=Design: Vivid Eye of Zul", "=ds=#p12# (450)"};
		{ 20, 41697, "", "=q3=Design: Enduring Forest Emerald", "=ds=#p12# (390)"};
		{ 21, 41692, "", "=q3=Design: Energized Forest Emerald", "=ds=#p12# (390)"};
		{ 22, 41693, "", "=q3=Design: Forceful Forest Emerald", "=ds=#p12# (390)"};
		{ 23, 41694, "", "=q3=Design: Intricate Forest Emerald", "=ds=#p12# (390)"};
		{ 24, 41696, "", "=q3=Design: Lambent Forest Emerald", "=ds=#p12# (390)"};
		{ 25, 41699, "", "=q3=Design: Seer's Forest Emerald", "=ds=#p12# (390)"};
		{ 26, 41698, "", "=q3=Design: Vivid Forest Emerald", "=ds=#p12# (390)"};
		Prev = "JewelcraftingDaily2";
		Next = "JewelcraftingDaily4";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

	AtlasLoot_Data["JewelcraftingDaily4"] = {
		{ 1, 46934, "", "=q3=Design: Balanced Dreadstone", "=ds=#p12# (450)"};
		{ 2, 46941, "", "=q3=Design: Defender's Dreadstone", "=ds=#p12# (450)"};
		{ 3, 46936, "", "=q3=Design: Glowing Dreadstone", "=ds=#p12# (450)"};
		{ 4, 46942, "", "=q3=Design: Guardian's Dreadstone", "=ds=#p12# (450)"};
		{ 5, 46945, "", "=q3=Design: Infused Dreadstone", "=ds=#p12# (450)"};
		{ 6, 46943, "", "=q3=Design: Mysterious Dreadstone", "=ds=#p12# (450)"};
		{ 7, 46944, "", "=q3=Design: Puissant Dreadstone", "=ds=#p12# (450)"};
		{ 8, 46937, "", "=q3=Design: Purified Dreadstone", "=ds=#p12# (450)"};
		{ 9, 46940, "", "=q3=Design: Regal Dreadstone", "=ds=#p12# (450)"};
		{ 10, 46939, "", "=q3=Design: Royal Dreadstone", "=ds=#p12# (450)"};
		{ 11, 46938, "", "=q3=Design: Shifting Dreadstone", "=ds=#p12# (450)"};
		{ 12, 46935, "", "=q3=Design: Sovereign Dreadstone", "=ds=#p12# (450)"};
		{ 13, 46946, "", "=q3=Design: Tenuous Dreadstone", "=ds=#p12# (450)"};
		{ 14, 41702, "", "=q3=Design: Puissant Twilight Opal", "=ds=#p12# (390)"};
		{ 15, 41703, "", "=q3=Design: Regal Twilight Opal", "=ds=#p12# (390)"};
		{ 16, 41701, "", "=q3=Design: Royal Twilight Opal", "=ds=#p12# (390)"};
		Prev = "JewelcraftingDaily3";
		Next = "JewelcraftingDaily5";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

	AtlasLoot_Data["JewelcraftingDaily5"] = {
		{ 1, 46927, "", "=q3=Design: Lustrous Majestic Zircon", "=ds=#p12# (450)"};
		{ 2, 46924, "", "=q3=Design: Solid Majestic Zircon", "=ds=#p12# (450)"};
		{ 3, 46925, "", "=q3=Design: Sparkling Majestic Zircon", "=ds=#p12# (450)"};
		{ 4, 46926, "", "=q3=Design: Stormy Majestic Zircon", "=ds=#p12# (450)"};
		{ 5, 41581, "", "=q3=Design: Lustrous Sky Sapphire", "=ds=#p12# (390)"};
		{ 6, 42138, "", "=q3=Design: Solid Sky Sapphire", "=ds=#p12# (390)"};
		{ 16, 41704, "", "=q3=Design: Chaotic Skyflare Diamond", "=ds=#p12# (420)"};
		{ 17, 41705, "", "=q3=Design: Effulgent Skyflare Diamond", "=ds=#p12# (420)"};
		{ 18, 41706, "", "=q3=Design: Ember Skyflare Diamond", "=ds=#p12# (420)"};
		{ 19, 41708, "", "=q3=Design: Insightful Earthsiege Diamond", "=ds=#p12# (420)"};
		{ 20, 41709, "", "=q3=Design: Invigorating Earthsiege Diamond", "=ds=#p12# (420)"};
		{ 21, 41710, "", "=q3=Design: Relentless Earthsiege Diamond", "=ds=#p12# (420)"};
		{ 22, 41707, "", "=q3=Design: Revitalizing Skyflare Diamond", "=ds=#p12# (420)"};
		{ 23, 41711, "", "=q3=Design: Trenchant Earthsiege Diamond", "=ds=#p12# (420)"};
		Prev = "JewelcraftingDaily4";
		Next = "JewelcraftingDaily6";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

	AtlasLoot_Data["JewelcraftingDaily6"] = {
		{ 1, 42298, "", "=q3=Design: Bold Dragon's Eye", "=ds=#p12# (370)"};
		{ 2, 42299, "", "=q3=Design: Bright Dragon's Eye", "=ds=#p12# (370)"};
		{ 3, 42300, "", "=q3=Design: Brilliant Dragon's Eye", "=ds=#p12# (370)"};
		{ 4, 42301, "", "=q3=Design: Delicate Dragon's Eye", "=ds=#p12# (370)"};
		{ 5, 42302, "", "=q3=Design: Flashing Dragon's Eye", "=ds=#p12# (370)"};
		{ 6, 42303, "", "=q3=Design: Fractured Dragon's Eye", "=ds=#p12# (370)"};
		{ 7, 42304, "", "=q3=Design: Lustrous Dragon's Eye", "=ds=#p12# (370)"};
		{ 8, 42305, "", "=q3=Design: Mystic Dragon's Eye", "=ds=#p12# (370)"};
		{ 9, 42306, "", "=q3=Design: Precise Dragon's Eye", "=ds=#p12# (370)"};
		{ 10, 42307, "", "=q3=Design: Quick Dragon's Eye", "=ds=#p12# (370)"};
		{ 11, 42308, "", "=q3=Design: Rigid Dragon's Eye", "=ds=#p12# (370)"};
		{ 12, 42309, "", "=q3=Design: Runed Dragon's Eye", "=ds=#p12# (370)"};
		{ 13, 42310, "", "=q3=Design: Smooth Dragon's Eye", "=ds=#p12# (370)"};
		{ 14, 42311, "", "=q3=Design: Solid Dragon's Eye", "=ds=#p12# (370)"};
		{ 15, 42312, "", "=q3=Design: Sparkling Dragon's Eye", "=ds=#p12# (370)"};
		{ 16, 42313, "", "=q3=Design: Stormy Dragon's Eye", "=ds=#p12# (370)"};
		{ 17, 42314, "", "=q3=Design: Subtle Dragon's Eye", "=ds=#p12# (370)"};
		{ 18, 42315, "", "=q3=Design: Thick Dragon's Eye", "=ds=#p12# (370)"};
		{ 20, 42652, "", "=q4=Design: Titanium Earthguard Chain", "=ds=#p12# (420)"};
		{ 21, 42649, "", "=q4=Design: Titanium Earthguard Ring", "=ds=#p12# (420)"};
		{ 22, 42648, "", "=q4=Design: Titanium Impact Band", "=ds=#p12# (420)"};
		{ 23, 42651, "", "=q4=Design: Titanium Impact Choker", "=ds=#p12# (420)"};
		{ 24, 42653, "", "=q4=Design: Titanium Spellshock Necklace", "=ds=#p12# (420)"};
		{ 25, 42650, "", "=q4=Design: Titanium Spellshock Ring", "=ds=#p12# (420)"};
		Prev = "JewelcraftingDaily5";
		Back = "JEWELCRAFTINGDAILYMENU";
	};

