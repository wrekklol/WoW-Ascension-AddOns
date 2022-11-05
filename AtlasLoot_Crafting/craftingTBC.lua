local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")


local APPRENTICE = select(2, GetSpellInfo(2259));
local JOURNEYMAN = select(2, GetSpellInfo(3101));
local EXPERT = select(2, GetSpellInfo(3464));
local ARTISAN = select(2, GetSpellInfo(11611));
local MASTER = select(2, GetSpellInfo(28596));

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
		AtlasLoot_Data["AlchemyTBC"] = {
			Name = ALCHEMY;
			Type = "Crafting";
				{
			Name = AL["Battle Elixirs"];
		{ 1, "s28558", "22835", "=q1=Elixir of Major Shadow Power", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["Lower City"]};
		{ 2, "s28556", "22833", "=q1=Elixir of Major Firepower", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["The Scryers"]};
		{ 3, "s38960", "31679", "=q1=Fel Strength Elixir", "=ds="..BabbleZone["Shadowmoon Valley"]};
		{ 4, "s28553", "22831", "=q1=Elixir of Major Agility", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Thrallmar"].."/"..BabbleFaction["Honor Hold"]};
		{ 5, "s28549", "22827", "=q1=Elixir of Major Frost Power", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
		{ 6, "s33741", "28104", "=q1=Elixir of Mastery", "=ds="..AL["Trainer"]};
		{ 7, "s28545", "22825", "=q1=Elixir of Healing Power", "=ds="..AL["Trainer"]};
		{ 8, "s28544", "22824", "=q1=Elixir of Major Strength", "=ds="..AL["Trainer"]};
		{ 9, "s33740", "28103", "=q1=Adept's Elixir", "=ds="..AL["Trainer"]};
		{ 10, "s33738", "28102", "=q1=Onslaught Elixir", "=ds="..AL["Trainer"]};
	};
	{
		Name = AL["Guardian Elixirs"];
		{ 1, "s28578", "22848", "=q1=Elixir of Empowerment", "=ds="..AL["World Drop"]};
		{ 2, "s28570", "22840", "=q1=Elixir of Major Mageblood", "=ds="..AL["World Drop"]};
		{ 3, "s28557", "22834", "=q1=Elixir of Major Defense", "=ds="..AL["Vendor"]};
		{ 4, "s39639", "32068", "=q1=Elixir of Ironskin", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
		{ 5, "s39637", "32063", "=q1=Earthen Elixir", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Cenarion Expedition"]};
		{ 6, "s39638", "32067", "=q1=Elixir of Draenic Wisdom", "=ds="..AL["Trainer"]};
		{ 7, "s39636", "32062", "=q1=Elixir of Major Fortitude", "=ds="..AL["Trainer"]};
	};
	{
			Name = AL["Potions"];
		{ 1, "s28586", "22850", "=q1=Super Rejuvenation Potion", "=ds="..AL["Discovery"]};
		{ 2, "s38961", "31677", "=q1=Fel Mana Potion", "=ds="..BabbleZone["Shadowmoon Valley"]};
		{ 3, "s28579", "22849", "=q1=Ironshield Potion", "=ds="..BabbleBoss["Captain Skarloc"]..": "..BabbleZone["Old Hillsbrad Foothills"]};
		{ 4, "s28575", "22845", "=q1=Major Arcane Protection Potion", "=ds="..BabbleZone["Nagrand"]};
		{ 5, "s28571", "22841", "=q1=Major Fire Protection Potion", "=ds="..BabbleZone["The Mechanar"]};
		{ 6, "s28572", "22842", "=q1=Major Frost Protection Potion", "=ds="..BabbleBoss["Nexus-Prince Shaffar"]..": "..BabbleZone["Mana-Tombs"]};
		{ 7, "s28577", "22847", "=q1=Major Holy Protection Potion", "=ds="..BabbleZone["Blade's Edge Mountains"]};
		{ 8, "s28573", "22844", "=q1=Major Nature Protection Potion", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Cenarion Expedition"]};
		{ 9, "s28576", "22846", "=q1=Major Shadow Protection Potion", "=ds="..BabbleZone["Shadowmoon Valley"]};
		{ 10, "s28565", "22839", "=q1=Destruction Potion", "=ds="..AL["World Drop"]};
		{ 11, "s28564", "22838", "=q1=Haste Potion", "=ds="..AL["World Drop"]};
		{ 12, "s28563", "22837", "=q1=Heroic Potion", "=ds="..AL["World Drop"]};
		{ 13, "s28562", "22836", "=q1=Major Dreamless Sleep Potion", "=ds="..AL["Vendor"]};
		{ 14, "s38962", "31676", "=q1=Fel Regeneration Potion", "=ds="..BabbleZone["Shadowmoon Valley"]};
		{ 15, "s28555", "22832", "=q1=Super Mana Potion", "=ds="..AL["Vendor"]};
		{ 16, "s28554", "22871", "=q1=Shrouding Potion", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Sporeggar"]};
		{ 17, "s45061", "34440", "=q1=Mad Alchemist's Potion", "=ds="..AL["Trainer"]};
		{ 18, "s28551", "22829", "=q1=Super Healing Potion", "=ds="..AL["Trainer"]};
		{ 19, "s28550", "22828", "=q1=Insane Strength Potion", "=ds="..AL["World Drop"]};
		{ 20, "s28546", "22826", "=q1=Sneaking Potion", "=ds="..AL["Vendor"]};
		{ 21, "s33733", "28101", "=q1=Unstable Mana Potion", "=ds="..AL["Trainer"]};
		{ 22, "s33732", "28100", "=q1=Volatile Healing Potion", "=ds="..AL["Trainer"]};
	};
	{
		Name = AL["Flasks"];
		{ 1, "s42736", "33208", "=q1=Flask of Chromatic Wonder", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["The Violet Eye"]};
		{ 2, "s28590", "22861", "=q1=Flask of Blinding Light", "=ds="..AL["Discovery"]};
		{ 3, "s28587", "22851", "=q1=Flask of Fortification", "=ds="..AL["Discovery"]};
		{ 4, "s28588", "22853", "=q1=Flask of Mighty Restoration", "=ds="..AL["Discovery"]};
		{ 5, "s28591", "22866", "=q1=Flask of Pure Death", "=ds="..AL["Discovery"]};
		{ 6, "s28589", "22854", "=q1=Flask of Relentless Assault", "=ds="..AL["Discovery"]};
	};
	{
		Name = AL["Transmutes"];
		{ 1, "s29688", "23571", "=q3=Transmute: Primal Might", "=ds="..AL["Vendor"]};
		{ 2, "s32765", "25867", "=q3=Transmute: Earthstorm Diamond", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Cenarion Expedition"]};
		{ 3, "s32766", "25868", "=q3=Transmute: Skyfire Diamond", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Thrallmar"].."/"..BabbleFaction["Honor Hold"]};
		{ 4, "s28585", "21886", "=q2=Transmute: Primal Earth to Life", "=ds="..AL["Discovery"]};
		{ 5, "s28583", "22457", "=q2=Transmute: Primal Fire to Mana", "=ds="..AL["Discovery"]};
		{ 6, "s28584", "22452", "=q2=Transmute: Primal Life to Earth", "=ds="..AL["Discovery"]};
		{ 7, "s28582", "21884", "=q2=Transmute: Primal Mana to Fire", "=ds="..AL["Discovery"]};
		{ 8, "s28580", "21885", "=q2=Transmute: Primal Shadow to Water", "=ds="..AL["Discovery"]};
		{ 9, "s28581", "22456", "=q2=Transmute: Primal Water to Shadow", "=ds="..AL["Discovery"]};
		{ 10, "s28566", "21884", "=q2=Transmute: Primal Air to Fire", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["The Sha'tar"]};
		{ 11, "s28567", "21885", "=q2=Transmute: Primal Earth to Water", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["Sporeggar"]};
		{ 12, "s28568", "22452", "=q2=Transmute: Primal Fire to Earth", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["The Mag'har"].."/"..BabbleFaction["Kurenai"]};
		{ 13, "s28569", "22451", "=q2=Transmute: Primal Water to Air", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["Cenarion Expedition"]};
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s24266", "19931", "=q3=Gurubashi Mojo Madness", "=ds="..BabbleZone["Zul'Gurub"]};
		{ 2, "s11460", "9154", "=q1=Elixir of Detect Undead", "=ds="..AL["Trainer"]};
		{ 3, "s22808", "18294", "=q1=Elixir of Greater Water Breathing", "=ds="..AL["Trainer"]};
		{ 4, "s11456", "9061", "=q1=Goblin Rocket Fuel", "=ds="..AL["Crafted"]..": "..GetSpellInfo(4036)};
		{ 5, "s11451", "8956", "=q1=Oil of Immolation", "=ds="..AL["Trainer"]};
		{ 6, "s12609", "10592", "=q1=Catseye Elixir", "=ds="..AL["Trainer"]};
		{ 7, "s3454", "3829", "=q1=Frost Oil", "=ds="..AL["Vendor"]..", "..BabbleZone["Alterac Mountains"]};
		{ 8, "s11459", "9149", "=q1=Philosopher's Stone", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
		{ 9, "s3453", "3828", "=q1=Elixir of Detect Lesser Invisibility", "=ds="..AL["World Drop"]};
		{ 10, "s3449", "3824", "=q1=Shadow Oil", "=ds="..AL["Vendor"]};
		{ 11, "s7837", "6371", "=q1=Fire Oil", "=ds="..AL["Trainer"]};
		{ 12, "s7179", "5996", "=q1=Elixir of Water Breathing", "=ds="..AL["Trainer"]};
		{ 13, "s7836", "6370", "=q1=Blackmouth Oil", "=ds="..AL["Trainer"]};
	};
};



		---------------------
		--- Blacksmithing ---
		---------------------

		AtlasLoot_Data["SmithingTBC"] = {
			Name = BLACKSMITHING;
			Type = "Crafting";
					{
			Name = BabbleInventory["Armor"].." - Chest";
			{ 1, "s34534", "28484", "=q4=Bulwark of Kings", "=ds=#sr# 375"};
			{ 2, "s36257", "28485", "=q4=Bulwark of the Ancient Kings", "=ds=#sr# 375"};
			{ 3, "s36256", "23565", "=q4=Embrace of the Twisting Nether", "=ds=#sr# 375"};
			{ 4, "s38477", "31369", "=q4=Iceguard Breastplate", "=ds=#sr# 375"};
			{ 5, "s34530", "23564", "=q4=Twisting Nether Chain Shirt", "=ds=#sr# 375"};
			{ 6, "s38473", "31364", "=q4=Wildguard Breastplate", "=ds=#sr# 375"};
			{ 7, "s46144", "34377", "=q4=Hard Khorium Battleplate", "=ds=#sr# 365"};
			{ 8, "s46142", "34379", "=q4=Sunblessed Breastplate", "=ds=#sr# 365"};
			{ 9, "s29649", "23527", "=q3=Earthpeace Breastplate", "=ds=#sr# 370"};
			{ 10, "s29645", "23522", "=q3=Ragesteel Breastplate", "=ds=#sr# 370"};
			{ 11, "s29617", "23513", "=q3=Flamebane Breastplate", "=ds=#sr# 365"};
			{ 12, "s29610", "23509", "=q3=Enchanted Adamantite Breastplate", "=ds=#sr# 360"};
			{ 13, "s34533", "28483", "=q4=Breastplate of Kings", "=ds=#sr# 350"};
			{ 14, "s34529", "23563", "=q4=Nether Chain Shirt", "=ds=#sr# 350"};
			{ 15, "s29606", "23507", "=q3=Adamantite Breastplate", "=ds=#sr# 340"};
			{ 16, "s36129", "30074", "=q3=Heavy Earthforged Breastplate", "=ds=#sr# 330"};
			{ 17, "s36130", "30076", "=q3=Stormforged Hauberk", "=ds=#sr# 330"};
			{ 18, "s29550", "23489", "=q2=Fel Iron Breastplate", "=ds=#sr# 325"};
			{ 19, "s29556", "23490", "=q2=Fel Iron Chain Tunic", "=ds=#sr# 320"};
		};
		{	Name = BabbleInventory["Armor"].." - Feet";
			{ 1, "s36391", "30033", "=q4=Boots of the Protector", "=ds=#sr# 375"};
			{ 2, "s36392", "30031", "=q4=Red Havoc Boots", "=ds=#sr# 375"};
			{ 3, "s40033", "32402", "=q4=Shadesteel Sabots", "=ds=#sr# 375"};
			{ 4, "s29630", "23525", "=q3=Khorium Boots", "=ds=#sr# 365"};
			{ 5, "s29611", "23511", "=q3=Enchanted Adamantite Boots", "=ds=#sr# 355"};
			{ 6, "s29548", "23487", "=q2=Fel Iron Plate Boots", "=ds=#sr# 315"};
		};
		{
			Name = BabbleInventory["Armor"].." - Hands";
			{ 1, "s29648", "23526", "=q3=Swiftsteel Gloves", "=ds=#sr# 370"};
			{ 2, "s29658", "23531", "=q4=Felfury Gauntlets", "=ds=#sr# 365"};
			{ 3, "s29622", "23532", "=q4=Gauntlets of the Iron Tower", "=ds=#sr# 365"};
			{ 4, "s29662", "23533", "=q4=Steelgrip Gauntlets", "=ds=#sr# 365"};
			{ 5, "s46140", "34380", "=q4=Sunblessed Gauntlets", "=ds=#sr# 365"};
			{ 6, "s46141", "34378", "=q4=Hard Khorium Battlefists", "=ds=#sr# 365"};
			{ 7, "s29642", "23520", "=q3=Ragesteel Gloves", "=ds=#sr# 365"};
			{ 8, "s29619", "23517", "=q3=Felsteel Gloves", "=ds=#sr# 360"};
			{ 9, "s29616", "23514", "=q3=Flamebane Gloves", "=ds=#sr# 360"};
			{ 10, "s29605", "23508", "=q3=Adamantite Plate Gloves", "=ds=#sr# 335"};
			{ 11, "s29552", "23491", "=q2=Fel Iron Chain Gloves", "=ds=#sr# 310"};
			{ 12, "s29545", "23482", "=q2=Fel Iron Plate Gloves", "=ds=#sr# 300"};
		};
		{
			Name = BabbleInventory["Armor"].." - Head";
			{ 1, "s38479", "31371", "=q4=Iceguard Helm", "=ds=#sr# 375"};
			{ 2, "s38476", "31368", "=q4=Wildguard Helm", "=ds=#sr# 375"};
			{ 3, "s29664", "23535", "=q4=Helm of the Stalwart Defender", "=ds=#sr# 365"};
			{ 4, "s29668", "23536", "=q4=Oathkeeper's Helm", "=ds=#sr# 365"};
			{ 5, "s29663", "23534", "=q4=Storm Helm", "=ds=#sr# 365"};
			{ 6, "s29621", "23519", "=q3=Felsteel Helm", "=ds=#sr# 365"};
			{ 7, "s29643", "23521", "=q3=Ragesteel Helm", "=ds=#sr# 365"};
			{ 8, "s29615", "23516", "=q3=Flamebane Helm", "=ds=#sr# 355"};
			{ 9, "s29551", "23493", "=q2=Fel Iron Chain Coif", "=ds=#sr# 300"};

		};
		{
			Name = BabbleInventory["Armor"].." - Legs";
			{ 1, "s38478", "31370", "=q4=Iceguard Leggings", "=ds=#sr# 375"};
			{ 2, "s40035", "32404", "=q4=Shadesteel Greaves", "=ds=#sr# 375"};
			{ 3, "s38475", "31367", "=q4=Wildguard Leggings", "=ds=#sr# 375"};
			{ 4, "s29613", "23512", "=q3=Enchanted Adamantite Leggings", "=ds=#sr# 365"};
			{ 5, "s29620", "23518", "=q3=Felsteel Leggings", "=ds=#sr# 360"};
			{ 6, "s29629", "23523", "=q3=Khorium Pants", "=ds=#sr# 360"};
			{ 7, "s29549", "23488", "=q2=Fel Iron Plate Pants", "=ds=#sr# 315"};
		};
		{
			Name = BabbleInventory["Armor"].." - Shoulder";
			{ 1, "s41135", "32573", "=q4=Dawnsteel Shoulders", "=ds=#sr# 375"};
			{ 2, "s42662", "33173", "=q3=Ragesteel Shoulders", "=ds=#sr# 365"};
			{ 3, "s41133", "32570", "=q4=Swiftsteel Shoulders", "=ds=#sr# 375"};

		};
		{
			Name = BabbleInventory["Armor"].." - Waist";
			{ 1, "s36389", "30034", "=q4=Belt of the Guardian", "=ds=#sr# 375"};
			{ 2, "s36390", "30032", "=q4=Red Belt of Battle", "=ds=#sr# 375"};
			{ 3, "s40036", "32401", "=q4=Shadesteel Girdle", "=ds=#sr# 375"};
			{ 4, "s29628", "23524", "=q3=Khorium Belt", "=ds=#sr# 360"};
			{ 5, "s29608", "23510", "=q3=Enchanted Adamantite Belt", "=ds=#sr# 355"};
			{ 6, "s29547", "23484", "=q2=Fel Iron Plate Belt", "=ds=#sr# 305"};
		};
		{
			Name = BabbleInventory["Armor"].." - Wrist";
			{ 1, "s41134", "32571", "=q4=Dawnsteel Bracers", "=ds=#sr# 375"};
			{ 2, "s40034", "32403", "=q4=Shadesteel Bracers", "=ds=#sr# 375"};
			{ 3, "s41132", "32568", "=q4=Swiftsteel Bracers", "=ds=#sr# 375"};
			{ 4, "s29669", "23537", "=q4=Black Felsteel Bracers", "=ds=#sr# 365"};
			{ 5, "s29672", "23539", "=q4=Blessed Bracers", "=ds=#sr# 365"};
			{ 6, "s29671", "23538", "=q4=Bracers of the Green Fortress", "=ds=#sr# 365"};
			{ 7, "s29614", "23515", "=q3=Flamebane Bracers", "=ds=#sr# 350"};
			{ 8, "s29603", "23506", "=q3=Adamantite Plate Bracers", "=ds=#sr# 335"};
			{ 9, "s29553", "23494", "=q2=Fel Iron Chain Bracers", "=ds=#sr# 315"};
		};
		{
			Name = "Weapon - OneHanded";
			{ 1, "s34542", "28432", "=q4=Black Planar Edge", "=ds=#sr# 375"};
			{ 2, "s36258", "28427", "=q4=Blazefury", "=ds=#sr# 375"};
			{ 3, "s34537", "28426", "=q4=Blazeguard", "=ds=#sr# 375"};
			{ 4, "s34546", "28438", "=q4=Dragonmaw", "=ds=#sr# 375"};
			{ 5, "s36262", "28439", "=q4=Dragonstrike", "=ds=#sr# 375"};
			{ 6, "s36260", "28433", "=q4=Wicked Edge of the Planes", "=ds=#sr# 375"};
			{ 7, "s29699", "23555", "=q4=Dirge", "=ds=#sr# 365"};
			{ 8, "s29698", "23554", "=q4=Eternium Runed Blade", "=ds=#sr# 365"};
			{ 9, "s29694", "23542", "=q4=Fel Edged Battleaxe", "=ds=#sr# 365"};
			{ 10, "s29692", "23540", "=q4=Felsteel Longblade", "=ds=#sr# 365"};
			{ 11, "s29700", "23556", "=q4=Hand of Eternity", "=ds=#sr# 365"};
			{ 12, "s29696", "23544", "=q4=Runic Hammer", "=ds=#sr# 365"};
			{ 13, "s34545", "28437", "=q4=Drakefist Hammer", "=ds=#sr# 350"};
			{ 14, "s34535", "28425", "=q4=Fireguard", "=ds=#sr# 350"};
			{ 15, "s34541", "28431", "=q4=The Planar Edge", "=ds=#sr# 350"};
			{ 16, "s34983", "29204", "=q3=Felsteel Whisper Knives", "=ds=#sr# 350"};
			{ 17, "s36136", "30089", "=q3=Lavaforged Warhammer", "=ds=#sr# 330"};
			{ 18, "s36134", "30087", "=q3=Stormforged Axe", "=ds=#sr# 330"};
			{ 19, "s36131", "30077", "=q3=Windforged Rapier", "=ds=#sr# 330"};
			{ 20, "s29571", "23505", "=q2=Adamantite Rapier", "=ds=#sr# 335"};
			{ 21, "s29569", "23504", "=q2=Adamantite Dagger", "=ds=#sr# 330"};
			{ 22, "s29558", "23498", "=q2=Fel Iron Hammer", "=ds=#sr# 315"};
			{ 23, "s29557", "23497", "=q2=Fel Iron Hatchet", "=ds=#sr# 310"};
		};
		{
			Name = "Weapon - Twohanded";
			{ 1, "s36261", "28436", "=q4=Bloodmoon", "=ds=#sr# 375"};
			{ 2, "s34548", "28441", "=q4=Deep Thunder", "=ds=#sr# 375"};
			{ 3, "s34540", "28429", "=q4=Lionheart Champion", "=ds=#sr# 375"};
			{ 4, "s36259", "28430", "=q4=Lionheart Executioner", "=ds=#sr# 375"};
			{ 5, "s34544", "28435", "=q4=Mooncleaver", "=ds=#sr# 375"};
			{ 6, "s36263", "28442", "=q4=Stormherald", "=ds=#sr# 375"};
			{ 7, "s29697", "23546", "=q4=Fel Hardened Maul", "=ds=#sr# 365"};
			{ 8, "s29695", "23543", "=q4=Felsteel Reaper", "=ds=#sr# 365"};
			{ 9, "s43846", "32854", "=q4=Hammer of Righteous Might", "=ds=#sr# 365"};
			{ 10, "s29693", "23541", "=q4=Khorium Champion", "=ds=#sr# 365"};
			{ 11, "s34538", "28428", "=q4=Lionheart Blade", "=ds=#sr# 350"};
			{ 12, "s34543", "28434", "=q4=Lunar Crescent", "=ds=#sr# 350"};
			{ 13, "s34547", "28440", "=q4=Thunder", "=ds=#sr# 350"};
			{ 14, "s36137", "30093", "=q3=Great Earthforged Hammer", "=ds=#sr# 330"};
			{ 15, "s36135", "30088", "=q3=Skyforged Great Axe", "=ds=#sr# 330"};
			{ 16, "s36133", "30086", "=q3=Stoneforged Claymore", "=ds=#sr# 330"};
			{ 17, "s29568", "23503", "=q2=Adamantite Cleaver", "=ds=#sr# 330"};
			{ 18, "s29566", "23502", "=q2=Adamantite Maul", "=ds=#sr# 325"};
			{ 19, "s29565", "23499", "=q2=Fel Iron Greatsword", "=ds=#sr# 320"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s29657", "23530", "=q2=Felsteel Shield Spike", "=ds=#sr# 360"};
			{ 2, "s29656", "23529", "=q2=Adamantite Sharpening Stone", "=ds=#sr# 350"};
			{ 3, "s34608", "28421", "=q2=Adamantite Weightstone", "=ds=#sr# 350"};
			{ 4, "s42688", "33185", "=q2=Adamantite Weapon Chain", "=ds=#sr# 335"};
			{ 5, "s22757", "18262", "=q2=Elemental Sharpening Stone", "=ds=#sr# 300"};
			{ 6, "s16651", "12645", "=q2=Thorium Shield Spike", "=ds=#sr# 275"};
			{ 7, "s9964", "7969", "=q2=Mithril Spurs", "=ds=#sr# 235"};
			{ 8, "s9939", "7967", "=q2=Mithril Shield Spike", "=ds=#sr# 215"};
			{ 9, "s29729", "23576", "=q1=Greater Ward of Shielding", "=ds=#sr# 375"};
			{ 10, "s32285", "25521", "=q1=Greater Rune of Warding", "=ds=#sr# 350"};
			{ 11, "s29728", "23575", "=q1=Lesser Ward of Shielding", "=ds=#sr# 340"};
			{ 12, "s32284", "23559", "=q1=Lesser Rune of Warding", "=ds=#sr# 325"};
			{ 13, "s29654", "23528", "=q1=Fel Sharpening Stone", "=ds=#sr# 300"};
			{ 14, "s34607", "28420", "=q1=Fel Weightstone", "=ds=#sr# 300"};
		};
		{
			Name = AL["Miscellaneous"];
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
		};
		{
			Name = ARMORSMITH;
			{ 8, "s36129", "30074", "=q3=Heavy Earthforged Breastplate", "=ds=#sr# 330"};
			{ 7, "s36130", "30076", "=q3=Stormforged Hauberk", "=ds=#sr# 330"};
			{ 6, "s34533", "28483", "=q4=Breastplate of Kings", "=ds=#sr# 350"};
			{ 5, "s34529", "23563", "=q4=Nether Chain Shirt", "=ds=#sr# 350"};
			{ 4, "s34534", "28484", "=q4=Bulwark of Kings", "=ds=#sr# 375"};
			{ 3, "s36257", "28485", "=q4=Bulwark of the Ancient Kings", "=ds=#sr# 375"};
			{ 2, "s36256", "23565", "=q4=Embrace of the Twisting Nether", "=ds=#sr# 375"};
			{ 1, "s34530", "23564", "=q4=Twisting Nether Chain Shirt", "=ds=#sr# 375"};
		};
		{
			Name = WEAPONSMITH;
			{ 1, "s36125", "30071", "=q3=Light Earthforged Blade", "=ds=#sr# 260"};
			{ 2, "s36128", "30073", "=q3=Light Emberforged Hammer", "=ds=#sr# 260"};
			{ 3, "s36126", "30072", "=q3=Light Skyforged Axe", "=ds=#sr# 260"};
		};
		{
			Name = AXESMITH;
			{ 8, "s36135", "30088", "=q3=Skyforged Great Axe", "=ds=#sr# 330"};
			{ 7, "s36134", "30087", "=q3=Stormforged Axe", "=ds=#sr# 330"};
			{ 6, "s34543", "28434", "=q4=Lunar Crescent", "=ds=#sr# 350"};
			{ 5, "s34541", "28431", "=q4=The Planar Edge", "=ds=#sr# 350"};
			{ 4, "s34542", "28432", "=q4=Black Planar Edge", "=ds=#sr# 375"};
			{ 3, "s36261", "28436", "=q4=Bloodmoon", "=ds=#sr# 375"};
			{ 2, "s34544", "28435", "=q4=Mooncleaver", "=ds=#sr# 375"};
			{ 1, "s36260", "28433", "=q4=Wicked Edge of the Planes", "=ds=#sr# 375"};
		};
		{
			Name = HAMMERSMITH;
			{ 8, "s36137", "30093", "=q3=Great Earthforged Hammer", "=ds=#sr# 330"};
			{ 7, "s36136", "30089", "=q3=Lavaforged Warhammer", "=ds=#sr# 330"};
			{ 6, "s34545", "28437", "=q4=Drakefist Hammer", "=ds=#sr# 350"};
			{ 5, "s34547", "28440", "=q4=Thunder", "=ds=#sr# 350"};
			{ 4, "s34548", "28441", "=q4=Deep Thunder", "=ds=#sr# 375"};
			{ 3, "s34546", "28438", "=q4=Dragonmaw", "=ds=#sr# 375"};
			{ 2, "s36262", "28439", "=q4=Dragonstrike", "=ds=#sr# 375"};
			{ 1, "s36263", "28442", "=q4=Stormherald", "=ds=#sr# 375"};
		};
		{
			Name = SWORDSMITH;
			{ 8, "s36133", "30086", "=q3=Stoneforged Claymore", "=ds=#sr# 330"};
			{ 7, "s36131", "30077", "=q3=Windforged Rapier", "=ds=#sr# 330"};
			{ 6, "s34535", "28425", "=q4=Fireguard", "=ds=#sr# 350"};
			{ 5, "s34538", "28428", "=q4=Lionheart Blade", "=ds=#sr# 350"};
			{ 4, "s36258", "28427", "=q4=Blazefury", "=ds=#sr# 375"};
			{ 3, "s34537", "28426", "=q4=Blazeguard", "=ds=#sr# 375"};
			{ 2, "s34540", "28429", "=q4=Lionheart Champion", "=ds=#sr# 375"};
			{ 1, "s36259", "28430", "=q4=Lionheart Executioner", "=ds=#sr# 375"};
		};
	};

		---------------
		--- Cooking ---
		---------------

		AtlasLoot_Data["CookingTBC"] = {
			Name = COOKING;
		{
			Name = COOKING;
			{ 1, "s42302", "33052", "=q1=Fisherman's Feast", "=ds="..AL["Trainer"]};
			{ 2, "s45561", "34760", "=q1=Grilled Bonescale", "=ds="..AL["Trainer"]};
			{ 3, "s45563", "34762", "=q1=Grilled Sculpin", "=ds="..AL["Trainer"]};
			{ 4, "s58525", "43492", "=q1=Haunted Herring", "=ds="..AL["Drop"]..""};
			{ 5, "s42305", "33053", "=q1=Hot Buttered Trout", "=ds="..AL["Trainer"]};
			{ 6, "s58521", "43488", "=q1=Last Week's Mammoth", "=ds="..AL["Drop"]..""};
			{ 7, "s45549", "34748", "=q1=Mammoth Meal", "=ds="..AL["Trainer"]};
			{ 8, "s57421", "34747", "=q1=Northern Stew", "=ds="..AL["Quest"]..""};
			{ 9, "s45566", "34765", "=q1=Pickled Fangtooth", "=ds="..AL["Trainer"]};
			{ 10, "s45565", "34764", "=q1=Poached Nettlefish", "=ds="..AL["Trainer"]};
			{ 11, "s45553", "34752", "=q1=Rhino Dogs", "=ds="..AL["Trainer"]};
			{ 12, "s45552", "34751", "=q1=Roasted Worg", "=ds="..AL["Trainer"]};
			{ 13, "s45562", "34761", "=q1=Sauteed Goby", "=ds="..AL["Trainer"]};
			{ 14, "s45550", "34749", "=q1=Shoveltusk Steak", "=ds="..AL["Trainer"]};
			{ 15, "s45560", "34759", "=q1=Smoked Rockfin", "=ds="..AL["Trainer"]};
			{ 16, "s45564", "34763", "=q1=Smoked Salmon", "=ds="..AL["Trainer"]};
			{ 17, "s33296", "27667", "=q1=Spicy Crawdad", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
			{ 18, "s58512", "43490", "=q1=Tasty Cupcake", "=ds="..AL["Drop"]..""};
			{ 19, "s45551", "34750", "=q1=Wyrm Delight", "=ds="..AL["Trainer"]};
			{ 20, "s38868", "31673", "=q1=Crunchy Serpent", "=ds="..AL["Vendor"]..", "..BabbleZone["Blade's Edge Mountains"]};
			{ 21, "s38867", "31672", "=q1=Mok'Nathal Shortribs", "=ds="..AL["Vendor"]..", "..BabbleZone["Blade's Edge Mountains"]};
			{ 22, "s33295", "27666", "=q1=Golden Fish Sticks", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
			{ 23, "s45022", "34411", "=q1=Hot Apple Cider", "=ds="..AL["Vendor"]..""};
			{ 24, "s33287", "27658", "=q1=Roasted Clefthoof", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
			{ 25, "s43707", "33825", "=q1=Skullfish Soup", "=ds="..AL["Drop"]..""};
			{ 26, "s43765", "33872", "=q1=Spicy Hot Talbuk", "=ds="..AL["Drop"]..""};
			{ 27, "s33289", "27660", "=q1=Talbuk Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
			{ 28, "s33288", "27659", "=q1=Warp Burger", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
			{ 29, "s33293", "27664", "=q1=Grilled Mudfish", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};
			{ 30, "s33294", "27665", "=q1=Poached Bluefish", "=ds="..AL["Vendor"]..", "..BabbleZone["Nagrand"]};

		};
		{
			Name = COOKING;
			{ 1, "s42296", "33048", "=q1=Stewed Trout", "=ds="..AL["Trainer"]};
			{ 2, "s33286", "27657", "=q1=Blackened Basilisk", "=ds="..AL["Vendor"]..", "..BabbleZone["Terokkar Forest"]};
			{ 3, "s33292", "27663", "=q1=Blackened Sporefish", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
			{ 4, "s33285", "27656", "=q1=Sporeling Snack", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
			{ 5, "s33290", "27661", "=q1=Blackened Trout", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
			{ 6, "s43761", "33867", "=q1=Broiled Bloodfin", "=ds="..AL["Drop"]..""};
			{ 7, "s33279", "27651", "=q1=Buzzard Bites", "=ds="..AL["Quest"]..""};
			{ 8, "s36210", "30155", "=q1=Clam Bar", "=ds="..AL["Vendor"]..", "..BabbleZone["Zangarmarsh"]};
			{ 9, "s25659", "21023", "=q1=Dirge's Kickin' Chimaerok Chops", "=ds="..AL["Quest"]..""};
			{ 10, "s966455", "100626", "=q1=Azerothian Schmorgus Boards", "=ds="..AL["Vendor"]..""};
			{ 11, "s966436", "100609", "=q1=Chilled Lava Eels", "=ds="..AL["Vendor"]..""};
			{ 12, "s966435", "100608", "=q1=Chillwind Flank Steaks", "=ds="..AL["Drop"]..""};
			{ 13, "s966434", "100607", "=q1=Hippogryph Steaks", "=ds="..AL["Quest"]..""};
			{ 14, "s966433", "100606", "=q1=Steamed Makrinni Claws", "=ds="..AL["Quest"]..""};
			{ 15, "s966432", "100605", "=q1=Rubbed Ravasaur Ribss", "=ds="..AL["Drop"]..""};
			{ 16, "s966431", "100604", "=q1=Hearty Stegodon Stews", "=ds="..AL["Drop"]..""};
			{ 17, "s966430", "100603", "=q1=Crispy Pterrordax Wings", "=ds="..AL["Drop"]..""};
			{ 18, "s966429", "100602", "=q1=Spicy Dino Jerkys", "=ds="..AL["Drop"]..""};
			{ 19, "s966428", "100601", "=q1=Dirge's Nevermelt Ice Creams", "=ds="..AL["Quest"]..""};
			{ 20, "s966427", "100599", "=q1=Silithid Snacks", "=ds="..AL["Quest"]..""};
			{ 21, "s966426", "100598", "=q1=Hydra Scale Soups", "=ds="..AL["Quest"]..""};
			{ 22, "s966425", "100597", "=q1=Ghostly Goulashs", "=ds="..AL["Quest"]..""};
			{ 23, "s966398", "100583", "=q1=Seared Cunning Carps", "=ds="..AL["Drop"]..""};
			{ 24, "s43772", "33874", "=q1=Kibler's Bits", "=ds="..AL["Drop"]..""};
			{ 25, "s33284", "27655", "=q1=Ravager Dog", "=ds="..AL["Vendor"]..", "..BabbleZone["Hellfire Peninsula"]};
			{ 26, "s43758", "33866", "=q1=Stormchops", "=ds="..AL["Drop"]..""};
		};
	};

		------------------
		--- Enchanting ---
		------------------

		AtlasLoot_Data["EnchantingTBC"] = {
			Name = ENCHANTING;
					{
			Name = AL["Enchant Boots"];
			{ 1, "s27954", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Surefooted", "=ds=#sr# 370"};
			{ 2, "s34008", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Boar's Speed", "=ds=#sr# 360"};
			{ 3, "s34007", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Cat's Swiftness", "=ds=#sr# 360"};
			{ 4, "s27951", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Dexterity", "=ds=#sr# 340"};
			{ 5, "s27950", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Fortitude", "=ds=#sr# 320"};
			{ 6, "s27948", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Vitality", "=ds=#sr# 305"};
		};
		{
			Name = AL["Enchant Bracer"];
			{ 1, "s27917", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Spellpower", "=ds=#sr# 360"};
			{ 2, "s27914", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Fortitude", "=ds=#sr# 350"};
			{ 3, "s27913", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Restore Mana Prime", "=ds=#sr# 335"};
			{ 4, "s27911", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Healing", "=ds=#sr# 325"};
			{ 5, "s27906", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Defense", "=ds=#sr# 320"};
			{ 6, "s27905", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Stats", "=ds=#sr# 315"};
			{ 7, "s27899", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Brawn", "=ds=#sr# 305"};
			{ 8, "s34001", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Intellect", "=ds=#sr# 305"};
			{ 9, "s34002", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Assault", "=ds=#sr# 300"};
		};
		{
			Name = AL["Enchant Chest"];
			{ 1, "s46594", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Defense", "=ds=#sr# 360"};
			{ 2, "s27960", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Stats", "=ds=#sr# 345"};
			{ 3, "s33992", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Resilience", "=ds=#sr# 345"};
			{ 4, "s33990", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Spirit", "=ds=#sr# 320"};
			{ 5, "s27957", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Health", "=ds=#sr# 315"};
		};
		{
			Name = AL["Enchant Cloak"];
			{ 1, "s47051", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Steelweave", "=ds=#sr# 375"};
			{ 2, "s351501", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Crushing Wave", "=ds=#sr# 375"};
			{ 3, "s351530", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Phoenix Fire", "=ds=#sr# 375"};
			{ 4, "s34005", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Arcane Resistance", "=ds=#sr# 350"};
			{ 5, "s34006", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Shadow Resistance", "=ds=#sr# 350"};
			{ 6, "s27962", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Major Resistance", "=ds=#sr# 330"};
			{ 7, "s34003", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Spell Penetration", "=ds=#sr# 325"};
			{ 8, "s34004", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Agility", "=ds=#sr# 310"};
			{ 9, "s27961", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Major Armor", "=ds=#sr# 310"};
			{ 10, "s25082", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Nature Resistance", "=ds=#sr# 300"};
			{ 11, "s25083", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Stealth", "=ds=#sr# 300"};
			{ 12, "s25084", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Subtlety", "=ds=#sr# 300"};
			{ 13, "s25086", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Dodge", "=ds=#sr# 300"};
		};
		{
			Name = AL["Enchant Gloves"];
			{ 1, "s44592", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Exceptional Spellpower", "=ds="..AL["Trainer"] };
			{ 2, "s33997", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Spellpower", "=ds=#sr# 360"};
			{ 3, "s33994", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Spell Strike", "=ds=#sr# 360"};
			{ 4, "s33999", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Healing", "=ds=#sr# 350"};
			{ 5, "s33995", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Strength", "=ds=#sr# 340"};
			{ 6, "s33996", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Assault", "=ds=#sr# 310"};
			{ 7, "s33993", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Blasting", "=ds=#sr# 305"};
			{ 8, "s25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility", "=ds=#sr# 300"};
			{ 9, "s25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat", "=ds=#sr# 300"};
		};
		{
			Name = AL["Enchant Ring"];
			{ 1, "s27927", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Stats", "=ds=#sr# 375"};
			{ 2, "s27926", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Healing Power", "=ds=#sr# 370"};
			{ 3, "s27924", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Spellpower", "=ds=#sr# 360"};
			{ 4, "s27920", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Striking", "=ds=#sr# 360"};
		};
		{
			Name = AL["Enchant Shield"];
			{ 1, "s27947", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Resistance", "=ds=#sr# 360"};
			{ 2, "s27946", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Shield Block", "=ds=#sr# 340"};
			{ 3, "s44383", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Resilience", "=ds=#sr# 330"};
			{ 4, "s27945", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Intellect", "=ds=#sr# 325"};
			{ 5, "s34009", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Major Stamina", "=ds=#sr# 325"};
			{ 6, "s27944", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Tough Shield", "=ds=#sr# 310"};
		};
		{
			Name = AL["Enchant 2H Weapon"];
			{ 1, "s27977", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Agility", "=ds=#sr# 360"};
			{ 2, "s27971", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Savagery", "=ds=#sr# 350"};
		};
		{
			Name = AL["Enchant Weapon"];
			{ 1, "s42974", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Executioner", "=ds=#sr# 375"};
			{ 2, "s820034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Undaunted Might", "=ds=#sr# 375"};
			{ 3, "s359012", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Faith", "=ds=#sr# 375"};
			{ 4, "s27984", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mongoose", "=ds=#sr# 375"};
			{ 5, "s27982", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Soulfrost", "=ds=#sr# 375"};
			{ 6, "s27981", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Sunfire", "=ds=#sr# 375"};
			{ 7, "s28004", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Battlemaster", "=ds=#sr# 360"};
			{ 8, "s28003", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spellsurge", "=ds=#sr# 360"};
			{ 9, "s46578", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Deathfrost", "=ds=#sr# 350"};
			{ 10, "s34010", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Healing", "=ds=#sr# 350"};
			{ 11, "s27975", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Spellpower", "=ds=#sr# 350"};
			{ 12, "s27972", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Potency", "=ds=#sr# 350"};
			{ 13, "s42620", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Agility", "=ds=#sr# 350"};
			{ 14, "s27968", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Intellect", "=ds=#sr# 340"};
			{ 15, "s27967", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Striking", "=ds=#sr# 340"};
		};
		{
			Name = "Enchant Staff";
			{ 1, "s62948", "Spell_Holy_GreaterHeal", "=ds=Enchant Staff - Greater Spellpower", "=ds="};
			{ 2, "s62959", "Spell_Holy_GreaterHeal", "=ds=Enchant Staff - Spellpower", "=ds="};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s32667", "22463", "=q3=Runed Eternium Rod", "=ds=#sr# 375"};
			{ 2, "s45765", "22449", "=q3=Void Shatter", "=ds=#sr# 360"};
			{ 3, "s42615", "22448", "=q3=Small Prismatic Shard", "=ds=#sr# 335"};
			{ 4, "s28022", "22449", "=q3=Large Prismatic Shard", "=ds=#sr# 335"};
			{ 5, "s28027", "22460", "=q3=Prismatic Sphere", "=ds=#sr# 325"};
			{ 6, "s42613", "22448", "=q3=Nexus Transformation", "=ds=#sr# 300"};
			{ 7, "s15596", "11811", "=q3=Smoking Heart of the Mountain", "=ds=#sr# 265"};
			{ 8, "s32665", "22462", "=q2=Runed Adamantite Rod", "=ds=#sr# 350"};
			{ 9, "s28019", "22522", "=q1=Superior Wizard Oil", "=ds=#sr# 340"};
			{ 10, "s28016", "22521", "=q1=Superior Mana Oil", "=ds=#sr# 310"};
	};
};


		-------------------
		--- Engineering ---
		-------------------

		AtlasLoot_Data["EngineeringTBC"] = {
			Name = ENGINEERING;
			Type = "Crafting";
					{
			Name = AL["Ammunition"];
			{ 1, "s43676", "20475", "=q1=Adamantite Arrow Maker", "=ds=#sr# 335"};
			{ 2, "s30347", "34504", "=q1=Adamantite Shell Machine", "=ds=#sr# 335"};
			{ 3, "s30346", "23772", "=q2=Fel Iron Shells", "=ds=#sr# 310"};
		};
		{
			Name = BabbleInventory["Armor"];
			{ 1, "s46111", "34847", "=q4=Annihilator Holo-Gogs", "=ds=#sr# 375"};
			{ 2, "s30565", "23838", "=q4=Foreman's Enchanted Helmet", "=ds=#sr# 375"};
			{ 3, "s30566", "23839", "=q4=Foreman's Reinforced Helmet", "=ds=#sr# 375"};
			{ 4, "s30575", "23829", "=q4=Gnomish Battle Goggles", "=ds=#sr# 375"};
			{ 5, "s30574", "23828", "=q4=Gnomish Power Goggles", "=ds=#sr# 375"};
			{ 6, "s46115", "34357", "=q4=Hard Khorium Goggles", "=ds=#sr# 375"};
			{ 7, "s46109", "35182", "=q4=Hyper-Magnified Moon Specs", "=ds=#sr# 375"};
			{ 8, "s46107", "35185", "=q4=Justicebringer 3000 Specs", "=ds=#sr# 375"};
			{ 9, "s46112", "34355", "=q4=Lightning Etched Specs", "=ds=#sr# 375"};
			{ 10, "s46114", "34354", "=q4=Mayhem Projection Goggles", "=ds=#sr# 375"};
			{ 11, "s46108", "35181", "=q4=Powerheal 9000 Lens", "=ds=#sr# 375"};
			{ 12, "s46110", "35184", "=q4=Primal-Attuned Goggles", "=ds=#sr# 375"};
			{ 13, "s46116", "34353", "=q4=Quad Deathblow X44 Goggles", "=ds=#sr# 375"};
			{ 14, "s46113", "34356", "=q4=Surestrike Goggles v3.0", "=ds=#sr# 375"};
			{ 15, "s46106", "35183", "=q4=Wonderheal XT68 Shades", "=ds=#sr# 375"};
			{ 16, "s41317", "32478", "=q4=Deathblow X11 Goggles", "=ds=#sr# 350"};
			{ 17, "s41320", "32494", "=q4=Destruction Holo-gogs", "=ds=#sr# 350"};
			{ 18, "s40274", "32461", "=q4=Furious Gizmatic Goggles", "=ds=#sr# 350"};
			{ 19, "s41315", "32476", "=q4=Gadgetstorm Goggles", "=ds=#sr# 350"};
			{ 20, "s41311", "32472", "=q4=Justicebringer 2000 Specs", "=ds=#sr# 350"};
			{ 21, "s41316", "32475", "=q4=Living Replicator Specs", "=ds=#sr# 350"};
			{ 22, "s41319", "32480", "=q4=Magnified Moon Specs", "=ds=#sr# 350"};
		};
		{
			Name = BabbleInventory["Armor"];
			{ 1, "s30325", "23763", "=q3=Hyper-Vision Goggles", "=ds=#sr# 360"};
			{ 2, "s30556", "23824", "=q3=Rocket Boots Xtreme", "=ds=#sr# 355"};
			{ 3, "s46697", "35581", "=q3=Rocket Boots Xtreme Lite", "=ds=#sr# 355"};
			{ 4, "s30563", "23836", "=q3=Goblin Rocket Launcher", "=ds=#sr# 350"};
			{ 5, "s30570", "23825", "=q3=Nigh-Invulnerability Belt", "=ds=#sr# 350"};
			{ 6, "s30318", "23762", "=q3=Ultra-Spectropic Detection Goggles", "=ds=#sr# 350"};
			{ 7, "s30316", "23758", "=q3=Cogspinner Goggles", "=ds=#sr# 340"};
			{ 8, "s30569", "23835", "=q3=Gnomish Poultryizer", "=ds=#sr# 340"};
			{ 9, "s30317", "23761", "=q3=Power Amplification Goggles", "=ds=#sr# 340"};
		};
		{
			Name = AL["Explosives"];
			{ 1, "s30547", "23819", "=q1=Elemental Seaforium Charge", "=ds=#sr# 350"};
			{ 2, "s30560", "23827", "=q1=Super Sapper Charge", "=ds=#sr# 340"};
			{ 3, "s39973", "32413", "=q1=Frost Grenades", "=ds=#sr# 335"};
			{ 4, "s30311", "23737", "=q1=Adamantite Grenade", "=ds=#sr# 325"};
			{ 5, "s30558", "23826", "=q1=The Bigger One", "=ds=#sr# 325"};
			{ 6, "s30310", "23736", "=q1=Fel Iron Bomb", "=ds=#sr# 300"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s30334", "23766", "=q3=Stabilized Eternium Scope", "=ds=#sr# 375"};
			{ 2, "s30332", "23765", "=q3=Khorium Scope", "=ds=#sr# 360"};
			{ 3, "s30329", "23764", "=q2=Adamantite Scope", "=ds=#sr# 335"};
			{ 4, "s22793", "18283", "=q3=Biznicks 247x128 Accurascope", "=ds=#sr# 300"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s44157", "34061", "=q4=Turbo-Charged Flying Machine", "=ds=#sr# 375"};
			{ 2, "s44155", "34060", "=q3=Flying Machine", "=ds=#sr# 350"};
			{ 3, "s30348", "23774", "=q2=Fel Iron Toolbox", "=ds=#sr# 325"};
			{ 4, "s30337", "23767", "=q2=Crashin' Thrashin' Robot", "=ds=#sr# 325"};
			{ 5, "s56459", "40892", "=q1=Hammer Pick", "=ds=#sr# 375" };
			{ 6, "s44391", "34113", "=q1=Field Repair Bot 110G", "=ds=#sr# 360"};
			{ 7, "s30552", "33093", "=q1=Mana Potion Injector", "=ds=#sr# 345"};
			{ 8, "s30344", "23771", "=q1=Green Smoke Flare", "=ds=#sr# 335"};
			{ 9, "s32814", "25886", "=q1=Purple Smoke Flare", "=ds=#sr# 335"};
			{ 10, "s30341", "23768", "=q1=White Smoke Flare", "=ds=#sr# 335"};
			{ 11, "s30551", "33092", "=q1=Healing Potion Injector", "=ds=#sr# 330"};
			{ 12, "s30568", "23841", "=q1=Gnomish Flame Turret", "=ds=#sr# 325"};
			{ 13, "s30548", "23821", "=q1=Zapthrottle Mote Extractor", "=ds=#sr# 305"};
		};
		{
			Name = AL["Reagents"];
			{ 1, "s30309", "23787", "=q1=Felsteel Stabilizer", "=ds=#sr# 340"};
			{ 2, "s30307", "23785", "=q1=Hardened Adamantite Tube", "=ds=#sr# 340"};
			{ 3, "s30308", "23786", "=q1=Khorium Power Core", "=ds=#sr# 340"};
			{ 4, "s39971", "32423", "=q1=Icy Blasting Primers", "=ds=#sr# 335"};
			{ 5, "s30306", "23784", "=q1=Adamantite Frame", "=ds=#sr# 325"};
			{ 6, "s30305", "23783", "=q1=Handful of Fel Iron Bolts", "=ds=#sr# 300"};
			{ 7, "s30303", "23781", "=q1=Elemental Blasting Powder", "=ds=#sr# 300"};
			{ 8, "s30304", "23782", "=q1=Fel Iron Casing", "=ds=#sr# 300"};
		};
		{
			Name = BabbleInventory["Weapon"];
			{ 1, "s41307", "32756", "=q4=Gyro-balanced Khorium Destroyer", "=ds=#sr# 375"};
			{ 2, "s30315", "23748", "=q3=Ornate Khorium Rifle", "=ds=#sr# 375"};
			{ 3, "s30314", "23747", "=q3=Felsteel Boomstick", "=ds=#sr# 360"};
			{ 4, "s30313", "23746", "=q2=Adamantite Rifle", "=ds=#sr# 350"};
			{ 5, "s30312", "23742", "=q2=Fel Iron Musket", "=ds=#sr# 320"};
		};
		{
			Name = GNOMISH;
			{ 1, "s30570", "23825", "=q3=Nigh-Invulnerability Belt", "=ds=#sr# 350"};
			{ 2, "s30569", "23835", "=q3=Gnomish Poultryizer", "=ds=#sr# 340"};
			{ 3, "s36955", "30544", "=q2=Ultrasafe Transporter - Toshley's Station", "=ds=#sr# 350"};
		};
		{
			Name = GOBLIN;
			{ 1, "s30563", "23836", "=q3=Goblin Rocket Launcher", "=ds=#sr# 350"};
			{ 2, "s36954", "30542", "=q2=Dimensional Ripper - Area 52", "=ds=#sr# 350"};
		};
	};

			-----------------
			--- First Aid ---
			-----------------

	AtlasLoot_Data["FirstAid"] = {
			Name = FIRSTAID;
					{
			Name = FIRSTAID;
			{ 1, "s45546", "34722", "=q1=Heavy Frostweave Bandage", "=ds=#sr# 400"};
			{ 2, "s45545", "34721", "=q1=Frostweave Bandage", "=ds=#sr# 375"};
			{ 3, "s27033", "21991", "=q1=Heavy Netherweave Bandage", "=ds=#sr# 360"};
			{ 4, "s27032", "21990", "=q1=Netherweave Bandage", "=ds=#sr# 330"};
			{ 5, "s23787", "19440", "=q1=Powerful Anti-Venom", "=ds=#sr# 300"};
			{ 6, "s18630", "14530", "=q1=Heavy Runecloth Bandage", "=ds=#sr# 290"};
			{ 7, "s18629", "14529", "=q1=Runecloth Bandage", "=ds=#sr# 260"};
			{ 8, "s10841", "8545", "=q1=Heavy Mageweave Bandage", "=ds=#sr# 240"};
			{ 9, "s10840", "8544", "=q1=Mageweave Bandage", "=ds=#sr# 210"};
			{ 10, "s7929", "6451", "=q1=Heavy Silk Bandage", "=ds=#sr# 180"};
			{ 11, "s7928", "6450", "=q1=Silk Bandage", "=ds=#sr# 150"};
			{ 12, "s7935", "6453", "=q1=Strong Anti-Venom", "=ds=#sr# 130"};
			{ 13, "s3278", "3531", "=q1=Heavy Wool Bandage", "=ds=#sr# 115"};
			{ 14, "s3277", "3530", "=q1=Wool Bandage", "=ds=#sr# 80"};
			{ 15, "s7934", "6452", "=q1=Anti-Venom", "=ds=#sr# 80"};
			{ 16, "s3276", "2581", "=q1=Heavy Linen Bandage", "=ds=#sr# 40"};
			{ 17, "s3275", "1251", "=q1=Linen Bandage", "=ds=#sr# 1"};
		};
	};

			---------------------
			--- Jewelcrafting ---
			---------------------

		AtlasLoot_Data["JewelcraftingTBC"] = {
			Name = 	JEWELCRAFTING;
			Type = "Crafting";
		{
			Name = AL["Red Gems"];
			{ 1, "s39705", "32193", "=q4=Bold Crimson Spinel", "=ds=#sr# 375"};
			{ 2, "s39712", "32197", "=q4=Bright Crimson Spinel", "=ds=#sr# 375"};
			{ 3, "s39706", "32194", "=q4=Delicate Crimson Spinel", "=ds=#sr# 375"};
			{ 4, "s39714", "32199", "=q4=Flashing Crimson Spinel", "=ds=#sr# 375"};
			{ 5, "s39711", "32196", "=q4=Runed Crimson Spinel", "=ds=#sr# 375"};
			{ 6, "s39713", "32198", "=q4=Subtle Crimson Spinel", "=ds=#sr# 375"};
			{ 7, "s39710", "32195", "=q4=Teardrop Crimson Spinel", "=ds=#sr# 375"};
			{ 8, "s42589", "33131", "=q4=Crimson Sun", "=ds=#sr# 360"};
			{ 9, "s42558", "33133", "=q4=Don Julio's Heart", "=ds=#sr# 360"};
			{ 10, "s42588", "33134", "=q4=Kailee's Rose", "=ds=#sr# 360"};
			{ 16, "s31084", "24027", "=q3=Bold Living Ruby", "=ds=#sr# 350"};
			{ 17, "s31089", "24031", "=q3=Bright Living Ruby", "=ds=#sr# 350"};
			{ 18, "s31085", "24028", "=q3=Delicate Living Ruby", "=ds=#sr# 350"};
			{ 19, "s31091", "24036", "=q3=Flashing Living Ruby", "=ds=#sr# 350"};
			{ 20, "s31088", "24030", "=q3=Runed Living Ruby", "=ds=#sr# 350"};
			{ 21, "s31090", "24032", "=q3=Subtle Living Ruby", "=ds=#sr# 350"};
			{ 22, "s31087", "24029", "=q3=Teardrop Living Ruby", "=ds=#sr# 350"};
			{ 23, "s28907", "23097", "=q2=Delicate Blood Garnet", "=ds=#sr# 325"};
			{ 24, "s28906", "23096", "=q2=Runed Blood Garnet", "=ds=#sr# 315"};
			{ 25, "s28905", "23095", "=q2=Bold Blood Garnet", "=ds=#sr# 305"};
			{ 26, "s34590", "28595", "=q2=Bright Blood Garnet", "=ds=#sr# 305"};
			{ 27, "s28903", "23094", "=q2=Teardrop Blood Garnet", "=ds=#sr# 300"};
		};
		{
			Name = AL["Blue Gems"];
			{ 1, "s39717", "32202", "=q4=Lustrous Empyrean Sapphire", "=ds=#sr# 375"};
			{ 2, "s39715", "32200", "=q4=Solid Empyrean Sapphire", "=ds=#sr# 375"};
			{ 3, "s39716", "32201", "=q4=Sparkling Empyrean Sapphire", "=ds=#sr# 375"};
			{ 4, "s39718", "32203", "=q4=Stormy Empyrean Sapphire", "=ds=#sr# 375"};
			{ 5, "s42590", "33135", "=q4=Falling Star", "=ds=#sr# 360"};
			{ 6, "s31094", "24037", "=q3=Lustrous Star of Elune", "=ds=#sr# 350"};
			{ 7, "s31092", "24033", "=q3=Solid Star of Elune", "=ds=#sr# 350"};
			{ 8, "s31149", "24035", "=q3=Sparkling Star of Elune", "=ds=#sr# 350"};
			{ 9, "s31095", "24039", "=q3=Stormy Star of Elune", "=ds=#sr# 350"};
			{ 10, "s28957", "23121", "=q2=Lustrous Azure Moonstone", "=ds=#sr# 325"};
			{ 11, "s28955", "23120", "=q2=Stormy Azure Moonstone", "=ds=#sr# 315"};
			{ 12, "s28953", "23119", "=q2=Sparkling Azure Moonstone", "=ds=#sr# 305"};
			{ 13, "s28950", "23118", "=q2=Solid Azure Moonstone", "=ds=#sr# 300"};
		};
		{
			Name = AL["Yellow Gems"];
			{ 1, "s39719", "32204", "=q4=Brilliant Lionseye", "=ds=#sr# 375"};
			{ 2, "s39722", "32207", "=q4=Gleaming Lionseye", "=ds=#sr# 375"};
			{ 3, "s39725", "32210", "=q4=Great Lionseye", "=ds=#sr# 375"};
			{ 4, "s39724", "32209", "=q4=Mystic Lionseye", "=ds=#sr# 375"};
			{ 5, "s47056", "35761", "=q4=Quick Lionseye", "=ds=#sr# 375"};
			{ 6, "s39721", "32206", "=q4=Rigid Lionseye", "=ds=#sr# 375"};
			{ 7, "s39720", "32205", "=q4=Smooth Lionseye", "=ds=#sr# 375"};
			{ 8, "s39723", "32208", "=q4=Thick Lionseye", "=ds=#sr# 375"};
			{ 9, "s42592", "33140", "=q4=Blood of Amber", "=ds=#sr# 360"};
			{ 10, "s42593", "33144", "=q4=Facet of Eternity", "=ds=#sr# 360"};
			{ 11, "s42591", "33143", "=q4=Stone of Blades", "=ds=#sr# 360"};
			{ 16, "s31096", "24047", "=q3=Brilliant Dawnstone", "=ds=#sr# 350"};
			{ 17, "s31099", "24050", "=q3=Gleaming Dawnstone", "=ds=#sr# 350"};
			{ 18, "s39452", "31861", "=q3=Great Dawnstone", "=ds=#sr# 350"};
			{ 19, "s31101", "24053", "=q3=Mystic Dawnstone", "=ds=#sr# 350"};
			{ 20, "s46403", "35315", "=q3=Quick Dawnstone", "=ds=#sr# "..AL["Vendor"]};
			{ 21, "s31098", "24051", "=q3=Rigid Dawnstone", "=ds=#sr# 350"};
			{ 22, "s31097", "24048", "=q3=Smooth Dawnstone", "=ds=#sr# 350"};
			{ 23, "s31100", "24052", "=q3=Thick Dawnstone", "=ds=#sr# 350"};
			{ 24, "s39451", "31860", "=q2=Great Golden Draenite", "=ds=#sr# 325"};
			{ 25, "s28948", "23116", "=q2=Rigid Golden Draenite", "=ds=#sr# 325"};
			{ 26, "s34069", "28290", "=q2=Smooth Golden Draenite", "=ds=#sr# 325"};
			{ 27, "s28947", "23115", "=q2=Thick Golden Draenite", "=ds=#sr# 315"};
			{ 28, "s28944", "23114", "=q2=Gleaming Golden Draenite", "=ds=#sr# 305"};
			{ 29, "s28938", "23113", "=q2=Brilliant Golden Draenite", "=ds=#sr# 300"};
		};
		{
			Name = AL["Green Gems"];
			{ 1, "s39741", "32225", "=q4=Dazzling Seaspray Emerald", "=ds=#sr# 375"};
			{ 2, "s39739", "32223", "=q4=Enduring Seaspray Emerald", "=ds=#sr# 375"};
			{ 3, "s47053", "35759", "=q4=Forceful Seaspray Emerald", "=ds=#sr# 375"};
			{ 4, "s39742", "32226", "=q4=Jagged Seaspray Emerald", "=ds=#sr# 375"};
			{ 5, "s39740", "32224", "=q4=Radiant Seaspray Emerald", "=ds=#sr# 375"};
			{ 6, "s47054", "35758", "=q4=Steady Seaspray Emerald", "=ds=#sr# 375"};
			{ 7, "s31112", "24065", "=q3=Dazzling Talasite", "=ds=#sr# 350"};
			{ 8, "s31110", "24062", "=q3=Enduring Talasite", "=ds=#sr# 350"};
			{ 9, "s46405", "35318", "=q3=Forceful Talasite", "=ds=#sr# "..AL["Vendor"]};
			{ 10, "s31113", "24067", "=q3=Jagged Talasite", "=ds=#sr# 350"};
			{ 11, "s31111", "24066", "=q3=Radiant Talasite", "=ds=#sr# 350"};
			{ 12, "s43493", "33782", "=q3=Steady Talasite", "=ds=#sr# 350"};
			{ 16, "s28924", "23106", "=q2=Dazzling Deep Peridot", "=ds=#sr# 325"};
			{ 17, "s28918", "23105", "=q2=Enduring Deep Peridot", "=ds=#sr# 315"};
			{ 18, "s28917", "23104", "=q2=Jagged Deep Peridot", "=ds=#sr# 305"};
			{ 19, "s28916", "23103", "=q2=Radiant Deep Peridot", "=ds=#sr# 300"};
		};
		{
			Name = AL["Orange Gems"];
			{ 1, "s39736", "32220", "=q4=Glinting Pyrestone", "=ds=#sr# 375"};
			{ 2, "s39733", "32217", "=q4=Inscribed Pyrestone", "=ds=#sr# 375"};
			{ 3, "s39735", "32219", "=q4=Luminous Pyrestone", "=ds=#sr# 375"};
			{ 4, "s39734", "32218", "=q4=Potent Pyrestone", "=ds=#sr# 375"};
			{ 5, "s47055", "35760", "=q4=Reckless Pyrestone", "=ds=#sr# 375"};
			{ 6, "s39737", "32221", "=q4=Veiled Pyrestone", "=ds=#sr# 375"};
			{ 7, "s39738", "32222", "=q4=Wicked Pyrestone", "=ds=#sr# 375"};
			{ 8, "s31109", "24061", "=q3=Glinting Noble Topaz", "=ds=#sr# 350"};
			{ 9, "s31106", "24058", "=q3=Inscribed Noble Topaz", "=ds=#sr# 350"};
			{ 10, "s31108", "24060", "=q3=Luminous Noble Topaz", "=ds=#sr# 350"};
			{ 11, "s31107", "24059", "=q3=Potent Noble Topaz", "=ds=#sr# 350"};
			{ 12, "s46404", "35316", "=q3=Reckless Noble Topaz", "=ds=#sr# "..AL["Vendor"]};
			{ 13, "s39470", "31867", "=q3=Veiled Noble Topaz", "=ds=#sr# 350"};
			{ 14, "s39471", "31868", "=q3=Wicked Noble Topaz", "=ds=#sr# 350"};
			{ 21, "s28915", "23101", "=q2=Potent Flame Spessarite", "=ds=#sr# 325"};
			{ 16, "s39466", "31866", "=q2=Veiled Flame Spessarite", "=ds=#sr# 325"};
			{ 17, "s39467", "31869", "=q2=Wicked Flame Spessarite", "=ds=#sr# 325"};
			{ 18, "s28914", "23100", "=q2=Glinting Flame Spessarite", "=ds=#sr# 315"};
			{ 19, "s28912", "23099", "=q2=Luminous Flame Spessarite", "=ds=#sr# 305"};
			{ 20, "s28910", "23098", "=q2=Inscribed Flame Spessarite", "=ds=#sr# 300"};
		};
		{
			Name = AL["Purple Gems"];
			{ 1, "s39729", "32213", "=q4=Balanced Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 2, "s39731", "32215", "=q4=Glowing Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 3, "s39730", "32214", "=q4=Infused Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 4, "s48789", "37503", "=q4=Purified Shadowsong Amethyst", "=ds="..AL["Vendor"]..""};
			{ 5, "s39732", "32216", "=q4=Royal Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 6, "s39728", "32212", "=q4=Shifting Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 7, "s39727", "32211", "=q4=Sovereign Shadowsong Amethyst", "=ds=#sr# 375"};
			{ 8, "s39463", "31863", "=q3=Balanced Nightseye", "=ds=#sr# 350"};
			{ 9, "s31104", "24056", "=q3=Glowing Nightseye", "=ds=#sr# 350"};
			{ 10, "s39462", "31865", "=q3=Infused Nightseye", "=ds=#sr# 350"};
			{ 11, "s46803", "35707", "=q3=Regal Nightseye", "=ds=#sr# 350"};
			{ 12, "s31105", "24057", "=q3=Royal Nightseye", "=ds=#sr# 350"};
			{ 13, "s31103", "24055", "=q3=Shifting Nightseye", "=ds=#sr# 350"};
			{ 14, "s31102", "24054", "=q3=Sovereign Nightseye", "=ds=#sr# 350"};
			{ 15, "s41429", "32836", "=q3=Purified Shadow Pearl", "=ds=#sr# 350"};
			{ 16, "s39455", "31862", "=q2=Balanced Shadow Draenite", "=ds=#sr# 325"};
			{ 17, "s39458", "31864", "=q2=Infused Shadow Draenite", "=ds=#sr# 325"};
			{ 18, "s28936", "23111", "=q2=Sovereign Shadow Draenite", "=ds=#sr# 325"};
			{ 19, "s28933", "23110", "=q2=Shifting Shadow Draenite", "=ds=#sr# 315"};
			{ 20, "s28927", "23109", "=q2=Royal Shadow Draenite", "=ds=#sr# 305"};
			{ 21, "s28925", "23108", "=q2=Glowing Shadow Draenite", "=ds=#sr# 300"};
		};
		{
			Name = AL["Meta Gems"];
			{ 1, "s46601", "35503", "=q3=Ember Skyfire Diamond", "=ds=#sr# 370"};
			{ 2, "s44794", "34220", "=q3=Chaotic Skyfire Diamond", "=ds=#sr# 365"};
			{ 3, "s32871", "25890", "=q3=Destructive Skyfire Diamond", "=ds=#sr# 365"};
			{ 4, "s32874", "25895", "=q3=Enigmatic Skyfire Diamond", "=ds=#sr# 365"};
			{ 5, "s32872", "25893", "=q3=Mystical Skyfire Diamond", "=ds=#sr# 365"};
			{ 6, "s32873", "25894", "=q3=Swift Skyfire Diamond", "=ds=#sr# 365"};
			{ 7, "s39963", "32410", "=q3=Thundering Skyfire Diamond", "=ds=#sr# 365"};
			{ 16, "s46597", "35501", "=q3=Eternal Earthstorm Diamond", "=ds=#sr# 370"};
			{ 17, "s32867", "25897", "=q3=Bracing Earthstorm Diamond", "=ds=#sr# 365"};
			{ 18, "s32869", "25899", "=q3=Brutal Earthstorm Diamond", "=ds=#sr# 365"};
			{ 19, "s32870", "25901", "=q3=Insightful Earthstorm Diamond", "=ds=#sr# 365"};
			{ 20, "s32866", "25896", "=q3=Powerful Earthstorm Diamond", "=ds=#sr# 365"};
			{ 21, "s39961", "32409", "=q3=Relentless Earthstorm Diamond", "=ds=#sr# 365"};
			{ 22, "s32868", "25898", "=q3=Tenacious Earthstorm Diamond", "=ds=#sr# 365"};
		};
		{
			Name = AL["Prismatic Gems"];
			{ 1, "s28028", "22459", "=q4=Void Sphere", "=ds="..GetSpellInfo(7411) };
			{ 2, "s56531", "42702", "=q3=Enchanted Tear", "=ds="..AL["Trainer"] };
			{ 3, "s28027", "22460", "=q3=Prismatic Sphere", "=ds="..GetSpellInfo(7411) };
			{ 4, "s56530", "42701", "=q2=Enchanted Pearl", "=ds="..AL["Trainer"] };
			{ 5, "s62941", "42701", "=q2=Prismatic Black Diamond", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Trinkets"];
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
		};
		{
			Name = AL["Rings"];
			{ 1, "s31057", "24086", "=q3=Arcane Khorium Band", "=ds=#sr# 365"};
			{ 2, "s31061", "24089", "=q3=Blazing Eternium Band", "=ds=#sr# 365"};
			{ 3, "s31056", "24085", "=q3=Khorium Band of Leaves", "=ds=#sr# 360"};
			{ 4, "s37855", "30825", "=q3=Ring of Arcane Shielding", "=ds=#sr# 360"};
			{ 5, "s31060", "24088", "=q3=Delicate Eternium Ring", "=ds=#sr# 355"};
			{ 6, "s31054", "24080", "=q3=Khorium Band of Frost", "=ds=#sr# 355"};
			{ 7, "s31055", "24082", "=q3=Khorium Inferno Band", "=ds=#sr# 355"};
			{ 8, "s31053", "24079", "=q3=Khorium Band of Shadows", "=ds=#sr# 350"};
			{ 9, "s31058", "24087", "=q3=Heavy Felsteel Ring", "=ds=#sr# 345"};
			{ 10, "s41415", "32774", "=q3=The Black Pearl", "=ds=#sr# 330"};
			{ 11, "s41414", "32772", "=q3=Brilliant Pearl Band", "=ds=#sr# 325"};
			{ 12, "s26916", "21779", "=q3=Band of Natural Fire", "=ds=#sr# 310"};
			{ 13, "s26903", "21768", "=q3=Sapphire Signet", "=ds=#sr# 275"};
			{ 14, "s26896", "21753", "=q3=Gem Studded Band", "=ds=#sr# 250"};
			{ 15, "s26874", "20964", "=q3=Aquamarine Signet", "=ds=#sr# 210"};
			{ 16, "s34959", "29158", "=q3=Truesilver Commander's Ring", "=ds=#sr# 200"};
			{ 17, "s34955", "29157", "=q3=Golden Ring of Power", "=ds=#sr# 180"};
			{ 18, "s37818", "30804", "=q3=Bronze Band of Force", "=ds=#sr# 65"};
			{ 19, "s25305", "20826", "=q3=Heavy Silver Ring", "=ds=#sr# 90"};
			{ 20, "s58146", "43249", "=q2=Shadowmight Ring", "=ds="..AL["Trainer"] };
			{ 21, "s58145", "43248", "=q2=Stoneguard Band", "=ds="..AL["Trainer"] };
			{ 22, "s56193", "42336", "=q2=Bloodstone Band", "=ds="..AL["Trainer"] };
			{ 23, "s56194", "42337", "=q2=Sun Rock Ring", "=ds="..AL["Trainer"] };
			{ 24, "s31052", "24078", "=q2=Heavy Adamantite Ring", "=ds=#sr# 335"};
			{ 25, "s31050", "24076", "=q2=Azure Moonstone Ring", "=ds=#sr# 320"};
			{ 26, "s31048", "24074", "=q2=Fel Iron Blood Ring", "=ds=#sr# 310"};
			{ 27, "s31049", "24075", "=q2=Golden Draenite Ring", "=ds=#sr# 310"};
			{ 28, "s34961", "29160", "=q2=Emerald Lion Ring", "=ds=#sr# 290"};
			{ 29, "s26910", "21778", "=q2=Ring of Bitter Shadows", "=ds=#sr# 285"};
			{ 30, "s34960", "29159", "=q2=Glowing Thorium Band", "=ds=#sr# 280"};

		};
		{
			Name = AL["Rings"];
			{ 1, "s26907", "21775", "=q2=Onslaught Ring", "=ds=#sr# 280"};
			{ 2, "s36526", "30422", "=q2=Diamond Focus Ring", "=ds=#sr# 265"};
			{ 3, "s26902", "21767", "=q2=Simple Opal Ring", "=ds=#sr# 260"};
			{ 4, "s26887", "21754", "=q2=The Aquamarine Ward", "=ds=#sr# 245"};
			{ 5, "s26885", "21765", "=q2=Truesilver Healing Ring", "=ds=#sr# 240"};
			{ 6, "s36525", "30421", "=q2=Red Ring of Destruction", "=ds=#sr# 230"};
			{ 7, "s25621", "20961", "=q2=Citrine Ring of Rapid Healing", "=ds=#sr# 180"};
			{ 8, "s25620", "20960", "=q2=Engraved Truesilver Ring", "=ds=#sr# 170"};
			{ 9, "s25619", "20959", "=q2=The Jade Eye", "=ds=#sr# 170"};
			{ 10, "s25617", "20958", "=q2=Blazing Citrine Ring", "=ds=#sr# 150"};
			{ 11, "s25613", "20955", "=q2=Golden Dragon Ring", "=ds=#sr# 135"};
			{ 12, "s25323", "20833", "=q2=Wicked Moonstone Ring", "=ds=#sr# 125"};
			{ 13, "s36524", "30420", "=q2=Heavy Jade Ring", "=ds=#sr# 105"};		
			{ 14, "s25318", "20828", "=q2=Ring of Twilight Shadows", "=ds=#sr# 100"};
			{ 15, "s25317", "20827", "=q2=Ring of Silver Might", "=ds=#sr# 80"};
			{ 16, "s25287", "20823", "=q2=Gloom Band", "=ds=#sr# 70"};
			{ 17, "s25284", "20820", "=q2=Simple Pearl Ring", "=ds=#sr# 60"};
			{ 18, "s25490", "20907", "=q2=Solid Bronze Ring", "=ds=#sr# 50"};
			{ 19, "s25280", "20818", "=q2=Elegant Silver Ring", "=ds=#sr# 50"};
			{ 20, "s25283", "20821", "=q2=Inlaid Malachite Ring", "=ds=#sr# 30"};
			{ 21, "s32179", "25439", "=q2=Tigerseye Band", "=ds=#sr# 20"};
			{ 22, "s26926", "21932", "=q2=Heavy Copper Ring", "=ds=#sr# 5"};
			{ 23, "s25493", "20906", "=q2=Braided Copper Ring", "=ds=#sr# 1"};
			{ 24, "s26925", "21931", "=q2=Woven Copper Ring", "=ds=#sr# 1"};
		};
		{
			Name = AL["Necks"];
			{ 1, "s31072", "24117", "=q3=Embrace of the Dawn", "=ds=#sr# 365"};
			{ 2, "s31070", "24114", "=q3=Braided Eternium Chain", "=ds=#sr# 360"};
			{ 3, "s31071", "24116", "=q3=Eye of the Night", "=ds=#sr# 360"};
			{ 4, "s31062", "24092", "=q3=Pendant of Frozen Flame", "=ds=#sr# 360"};
			{ 5, "s31065", "24097", "=q3=Pendant of Shadow's End", "=ds=#sr# 360"};
			{ 6, "s31063", "24093", "=q3=Pendant of Thawing", "=ds=#sr# 360"};
			{ 7, "s31066", "24098", "=q3=Pendant of the Null Rune", "=ds=#sr# 360"};
			{ 8, "s31064", "24095", "=q3=Pendant of Withering", "=ds=#sr# 360"};
			{ 9, "s31068", "24110", "=q3=Living Ruby Pendant", "=ds=#sr# 355"};
			{ 10, "s31067", "24106", "=q3=Thick Felsteel Necklace", "=ds=#sr# 355"};
			{ 11, "s40514", "32508", "=q3=Necklace of the Deep", "=ds=#sr# 340"};
			{ 12, "s26915", "21792", "=q3=Necklace of the Diamond Tower", "=ds=#sr# 305"};
			{ 13, "s26911", "21791", "=q3=Living Emerald Pendant", "=ds=#sr# 290"};
			{ 14, "s26897", "21766", "=q3=Opal Necklace of Impact", "=ds=#sr# 250"};
			{ 15, "s63743", "45627", "=q3=Amulet of Truesight", "=ds="};
			{ 16, "s58142", "43245", "=q2=Crystal Chalcedony Amulet", "=ds="..AL["Trainer"] };
			{ 17, "s58141", "43244", "=q2=Crystal Citrine Necklace", "=ds="..AL["Trainer"] };
			{ 18, "s31051", "24077", "=q2=Thick Adamantite Necklace", "=ds=#sr# 335"};
			{ 19, "s26908", "21790", "=q2=Sapphire Pendant of Winter Night", "=ds=#sr# 280"};
		};
		{
			Name = AL["Necks"];
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
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s31078", "24123", "=q4=Circlet of Arcane Might", "=ds=#sr# 370"};
			{ 2, "s31077", "24122", "=q4=Coronet of the Verdant Flame", "=ds=#sr# 370"};
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
		};
	};

			----------------------
			--- Leatherworking ---
			----------------------
	AtlasLoot_Data["LeatherworkingTBC"] = {
			Name = LEATHERWORKING;
			Type = "Crafting";
		{
			Name = AL["Leather Armor"].." - Back";
			{ 1, "s42546", "33122", "=q4=Cloak of Darkness", "=ds=#sr# 360"};
		};
		{
			Name = AL["Leather Armor"].." - Chest";
			{ 1, "s35589", "29525", "=q4=Primalstrike Vest", "=ds=#sr# 375"};
			{ 2, "s35585", "29522", "=q4=Windhawk Hauberk", "=ds=#sr# 375"};
			{ 3, "s46138", "34369", "=q4=Carapace of Sun and Shadow", "=ds=#sr# 365"};
			{ 4, "s46136", "34371", "=q4=Leather Chestguard of the Sun", "=ds=#sr# 365"};
			{ 5, "s42731", "33204", "=q4=Shadowprowler's Chestguard", "=ds=#sr# 365"};
			{ 6, "s32495", "25689", "=q3=Heavy Clefthoof Vest", "=ds=#sr# 360"};
			{ 7, "s36078", "29974", "=q3=Living Crystal Breastplate", "=ds=#sr# 330"};
			{ 8, "s36077", "29973", "=q3=Primalstorm Breastplate", "=ds=#sr# 330"};
			{ 9, "s32473", "25671", "=q2=Thick Draenic Vest", "=ds=#sr# 330"};
			{ 10, "s32481", "25676", "=q2=Wild Draenish Vest", "=ds=#sr# 330"};

		};
		{
			Name = AL["Leather Armor"].." - Feet";
			{ 1, "s36355", "30041", "=q4=Boots of Natural Grace", "=ds=#sr# 375"};
			{ 2, "s36357", "30039", "=q4=Boots of Utter Darkness", "=ds=#sr# 375"};
			{ 3, "s40003", "32394", "=q4=Redeemed Soul Moccasins", "=ds=#sr# 375"};
			{ 4, "s40003", "32394", "=q4=Redeemed Soul Moccasins", "=ds=#sr# 375"};
			{ 5, "s32497", "25691", "=q3=Heavy Clefthoof Boots", "=ds=#sr# 355"};
			{ 6, "s35536", "29499", "=q3=Blastguard Boots", "=ds=#sr# 350"};
			{ 7, "s35534", "29497", "=q3=Enchanted Clefthoof Boots", "=ds=#sr# 350"};
			{ 8, "s32493", "25686", "=q3=Fel Leather Boots", "=ds=#sr# 350"};
			{ 9, "s32472", "25668", "=q2=Thick Draenic Boots", "=ds=#sr# 320"};
			{ 10, "s32478", "25673", "=q2=Wild Draenish Boots", "=ds=#sr# 300"};
		};
		{
			Name = AL["Leather Armor"].." - Hands";
			{ 1, "s35559", "29503", "=q4=Cobrascale Gloves", "=ds=#sr# 365"};
			{ 2, "s46134", "34370", "=q4=Gloves of Immortal Dusk", "=ds=#sr# 365"};
			{ 3, "s35562", "29506", "=q4=Gloves of the Living Touch", "=ds=#sr# 365"};
			{ 4, "s46132", "34372", "=q4=Leather Gauntlets of the Sun", "=ds=#sr# 365"};
			{ 5, "s35563", "29507", "=q4=Windslayer Wraps", "=ds=#sr# 365"};
			{ 6, "s35533", "29496", "=q3=Enchanted Clefthoof Gloves", "=ds=#sr# 350"};
			{ 7, "s32490", "25685", "=q3=Fel Leather Gloves", "=ds=#sr# 340"};
			{ 8, "s32479", "25674", "=q2=Wild Draenish Gloves", "=ds=#sr# 310"};
			{ 9, "s32470", "25669", "=q2=Thick Draenic Gloves", "=ds=#sr# 300"};
		};
		{
			Name = AL["Leather Armor"].." - Head";
			{ 1, "s35558", "29502", "=q4=Cobrascale Hood", "=ds=#sr# 365"};
			{ 2, "s35561", "29505", "=q4=Hood of Primal Life", "=ds=#sr# 365"};
			{ 3, "s35560", "29504", "=q4=Windscale Hood", "=ds=#sr# 365"};
			{ 4, "s32489", "25682", "=q3=Stylin' Jungle Hat", "=ds=#sr# 350"};
			{ 5, "s32485", "25680", "=q3=Stylin' Purple Hat", "=ds=#sr# 350"};

		};
		{
			Name = AL["Leather Armor"].." - Legs";
			{ 1, "s40005", "32396", "=q4=Redeemed Soul Legguards", "=ds=#sr# 375"};
			{ 2, "s32496", "25690", "=q3=Heavy Clefthoof Leggings", "=ds=#sr# 355"};
			{ 3, "s35535", "29498", "=q3=Blastguard Pants", "=ds=#sr# 350"};
			{ 4, "s35532", "29495", "=q3=Enchanted Clefthoof Leggings", "=ds=#sr# 350"};
			{ 5, "s32494", "25687", "=q3=Fel Leather Leggings", "=ds=#sr# 350"};
			{ 6, "s32480", "25675", "=q2=Wild Draenish Leggings", "=ds=#sr# 320"};
			{ 7, "s32471", "25670", "=q2=Thick Draenic Pants", "=ds=#sr# 315"};


		};
		{
			Name = AL["Leather Armor"].." - Shoulder";
			{ 1, "s41157", "32583", "=q4=Shoulderpads of Renewed Life", "=ds=#sr# 375"};
			{ 2, "s41160", "32581", "=q4=Swiftstrike Shoulders", "=ds=#sr# 375"};
		};
		{
			Name = AL["Leather Armor"].." - Waist";
			{ 1, "s36351", "30040", "=q4=Belt of Deep Shadow", "=ds=#sr# 375"};
			{ 2, "s36349", "30042", "=q4=Belt of Natural Power", "=ds=#sr# 375"};
			{ 3, "s35590", "29526", "=q4=Primalstrike Belt", "=ds=#sr# 375"};
			{ 4, "s40006", "32393", "=q4=Redeemed Soul Cinch", "=ds=#sr# 375"};
			{ 5, "s35587", "29524", "=q4=Windhawk Belt", "=ds=#sr# 375"};
		};
		{
			Name = AL["Leather Armor"].." - Wrist";
			{ 1, "s41156", "32582", "=q4=Bracers of Renewed Life", "=ds=#sr# 375"};
			{ 2, "s35591", "29527", "=q4=Primalstrike Bracers", "=ds=#sr# 375"};
			{ 3, "s40004", "32395", "=q4=Redeemed Soul Wristguards", "=ds=#sr# 375"};
			{ 4, "s41158", "32580", "=q4=Swiftstrike Bracers", "=ds=#sr# 375"};
			{ 5, "s35588", "29523", "=q4=Windhawk Bracers", "=ds=#sr# 375"};
		};
		{
			Name = AL["Mail Armor"].." - Chest";
			{ 1, "s35580", "29519", "=q4=Netherstrike Breastplate", "=ds=#sr# 375"};
			{ 2, "s35575", "29515", "=q4=Ebon Netherscale Breastplate", "=ds=#sr# 375"};
			{ 3, "s46137", "34373", "=q4=Embrace of the Phoenix", "=ds=#sr# 365"};
			{ 4, "s46139", "34375", "=q4=Sun-Drenched Scale Chestguard", "=ds=#sr# 365"};
			{ 5, "s35574", "29514", "=q4=Thick Netherscale Breastplate", "=ds=#sr# 365"};
			{ 6, "s32500", "25696", "=q3=Felstalker Breastplate", "=ds=#sr# 360"};
			{ 7, "s36079", "29975", "=q3=Golden Dragonstrike Breastplate", "=ds=#sr# 330"};
			{ 8, "s32465", "25657", "=q2=Felscale Breastplate", "=ds=#sr# 335"};
			{ 9, "s32468", "25660", "=q2=Scaled Draenic Vest", "=ds=#sr# 325"};
		};
		{
			Name = AL["Mail Armor"].." - Feet";
			{ 1, "s36359", "30043", "=q4=Hurricane Boots", "=ds=#sr# 375"};
			{ 2, "s39997", "32398", "=q4=Boots of Shackled Souls", "=ds=#sr# 375"};
			{ 3, "s36358", "30045", "=q4=Boots of the Crimson Hawk", "=ds=#sr# 375"};
			{ 4, "s35567", "29512", "=q4=Earthen Netherscale Boots", "=ds=#sr# 365"};
			{ 5, "s35528", "29493", "=q3=Flamescale Boots", "=ds=#sr# 350"};
			{ 6, "s32503", "25693", "=q3=Netherfury Boots", "=ds=#sr# 350"};
			{ 7, "s35527", "29491", "=q3=Enchanted Felscale Boots", "=ds=#sr# 350"};
			{ 8, "s32469", "25659", "=q2=Scaled Draenic Boots", "=ds=#sr# 335"};
			{ 9, "s32463", "25655", "=q2=Felscale Boots", "=ds=#sr# 310"};
		};
		{
			Name = AL["Mail Armor"].." - Hands";
			{ 1, "s46135", "34376", "=q4=Sun-Drenched Scale Gloves", "=ds=#sr# 365"};
			{ 2, "s46133", "34374", "=q4=Fletcher's Gloves of the Phoenix", "=ds=#sr# 365"};
			{ 3, "s35568", "29509", "=q4=Windstrike Gloves", "=ds=#sr# 365"};
			{ 4, "s35573", "29511", "=q4=Netherdrake Gloves", "=ds=#sr# 365"};
			{ 5, "s32467", "25661", "=q2=Scaled Draenic Gloves", "=ds=#sr# 310"};
			{ 6, "s32462", "25654", "=q2=Felscale Gloves", "=ds=#sr# 300"};
		};
		{
			Name = AL["Mail Armor"].." - Head";
			{ 1, "s35564", "29508", "=q4=Living Dragonscale Helm", "=ds=#sr# 365"};
			{ 2, "s35572", "29510", "=q4=Netherdrake Helm", "=ds=#sr# 365"};
			{ 3, "s32487", "25681", "=q3=Stylin' Adventure Hat", "=ds=#sr# 350"};
			{ 4, "s32488", "25683", "=q3=Stylin' Crimson Hat", "=ds=#sr# 350"};
			{ 5, "s35526", "29490", "=q3=Enchanted Felscale Gloves", "=ds=#sr# 350"};
		};
		{
			Name = AL["Mail Armor"].." - Legs";
			{ 1, "s40001", "32400", "=q4=Greaves of Shackled Souls", "=ds=#sr# 375"};
			{ 2, "s35529", "29492", "=q3=Flamescale Leggings", "=ds=#sr# 350"};
			{ 3, "s35525", "29489", "=q3=Enchanted Felscale Leggings", "=ds=#sr# 350"};
			{ 4, "s32502", "25692", "=q3=Netherfury Leggings", "=ds=#sr# 340"};
			{ 5, "s32464", "25656", "=q2=Felscale Pants", "=ds=#sr# 320"};
			{ 6, "s32466", "25662", "=q2=Scaled Draenic Pants", "=ds=#sr# 300"};
		};
		{
			Name = AL["Mail Armor"].." - Shoulder";
			{ 1, "s41162", "32575", "=q4=Shoulders of Lightning Reflexes", "=ds=#sr# 375"};
			{ 2, "s41164", "32579", "=q4=Living Earth Shoulders", "=ds=#sr# 375"};
		};
		{
			Name = AL["Mail Armor"].." - Waist";
			{ 1, "s40002", "32397", "=q4=Waistguard of Shackled Souls", "=ds=#sr# 375"};
			{ 2, "s35582", "29520", "=q4=Netherstrike Belt", "=ds=#sr# 375"};
			{ 3, "s36353", "30044", "=q4=Monsoon Belt", "=ds=#sr# 375"};
			{ 4, "s35576", "29516", "=q4=Ebon Netherscale Belt", "=ds=#sr# 375"};
			{ 5, "s36352", "30046", "=q4=Belt of the Black Eagle", "=ds=#sr# 375"};
			{ 6, "s32498", "25695", "=q3=Felstalker Belt", "=ds=#sr# 350"};
			{ 7, "s35531", "29494", "=q3=Flamescale Belt", "=ds=#sr# 350"};
			{ 8, "s35537", "29500", "=q3=Blastguard Belt", "=ds=#sr# 350"};
			{ 9, "s32501", "25694", "=q3=Netherfury Belt", "=ds=#sr# 340"};
		};
		{
			Name = AL["Mail Armor"].." - Wrist";
			{ 1, "s35584", "29521", "=q4=Netherstrike Bracers", "=ds=#sr# 375"};
			{ 2, "s52733", "32399", "=q4=Bracers of Shackled Souls", "=ds="..AL["Vendor"]..""};
			{ 3, "s35577", "29517", "=q4=Ebon Netherscale Bracers", "=ds=#sr# 375"};
			{ 4, "s41163", "32577", "=q4=Living Earth Bindings", "=ds=#sr# 375"};
			{ 5, "s41161", "32574", "=q4=Bindings of Lightning Reflexes", "=ds=#sr# 375"};
			{ 6, "s32499", "25697", "=q3=Felstalker Bracer", "=ds=#sr# 360"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s35557", "29536", "=q4=Nethercleft Leg Armor", "=ds=#sr# 365"};
			{ 2, "s35554", "29535", "=q4=Nethercobra Leg Armor", "=ds=#sr# 365"};
			{ 3, "s35555", "29534", "=q3=Clefthide Leg Armor", "=ds=#sr# 335"};
			{ 4, "s35549", "29533", "=q3=Cobrahide Leg Armor", "=ds=#sr# 335"};
			{ 5, "s22727", "18251", "=q3=Core Armor Kit", "=ds=#sr# 300"};
			{ 6, "s50963", "38376", "=q2=Heavy Borean Armor Kit", "=ds="..AL["Trainer"]};
			{ 7, "s44770", "34207", "=q2=Glove Reinforcements", "=ds=#sr# 350"};
			{ 8, "s35524", "29488", "=q2=Arcane Armor Kit", "=ds=#sr# 340"};
			{ 9, "s35521", "29485", "=q2=Flame Armor Kit", "=ds=#sr# 340"};
			{ 10, "s35522", "29486", "=q2=Frost Armor Kit", "=ds=#sr# 340"};
			{ 11, "s35523", "29487", "=q2=Nature Armor Kit", "=ds=#sr# 340"};
			{ 12, "s35520", "29483", "=q2=Shadow Armor Kit", "=ds=#sr# 340"};
			{ 13, "s50962", "38375", "=q1=Borean Armor Kit", "=ds="..AL["Trainer"]};
			{ 14, "s44970", "34330", "=q1=Heavy Knothide Armor Kit", "=ds=#sr# 350"};
			{ 15, "s32458", "25652", "=q1=Magister's Armor Kit", "=ds=#sr# 325"};
			{ 16, "s32457", "25651", "=q1=Vindicator's Armor Kit", "=ds=#sr# 325"};
			{ 17, "s32456", "25650", "=q1=Knothide Armor Kit", "=ds=#sr# 300"};
			{ 18, "s32482", "25679", "=q1=Comfortable Insoles", "=ds=#sr# 300"};
		};
		{
			Name = AL["Quivers and Ammo Pouches"];
			{ 1, "s44768", "34106", "=q3=Netherscale Ammo Pouch", "=ds=#sr# 350"};
			{ 2, "s44359", "34105", "=q3=Quiver of a Thousand Feathers", "=ds=#sr# 350"};
			{ 3, "s44343", "34099", "=q2=Knothide Ammo Pouch", "=ds=#sr# 315"};
			{ 4, "s44344", "34100", "=q2=Knothide Quiver", "=ds=#sr# 315"};
		};
		{
			Name = AL["Drums, Bags and Misc."];
			{ 1, "s35543", "29529", "=q3=Drums of Battle", "=ds=#sr# 365"};
			{ 2, "s45117", "34490", "=q3=Bag of Many Hides", "=ds=#sr# 360"};
			{ 3, "s32461", "25653", "=q3=Riding Crop", "=ds=#sr# 350"};
			{ 4, "s35538", "29532", "=q2=Drums of Panic", "=ds=#sr# 370"};
			{ 5, "s35539", "29531", "=q2=Drums of Restoration", "=ds=#sr# 350"};
			{ 6, "s35544", "29530", "=q2=Drums of Speed", "=ds=#sr# 345"};
			{ 7, "s35540", "29528", "=q2=Drums of War", "=ds=#sr# 340"};
			{ 8, "s35530", "29540", "=q2=Reinforced Mining Bag", "=ds=#sr# 325"};
			{ 9, "s45100", "34482", "=q2=Leatherworker's Satchel", "=ds=#sr# 300"};
		};
		{
			Name = BabbleInventory["Leather"];
			{ 1, "s32455", "23793", "=q1=Heavy Knothide Leather", "=ds=#sr# 325"};
			{ 2, "s32454", "21887", "=q1=Knothide Leather", "=ds=#sr# 300"};
		};
		{
			Name = DRAGONSCALE;
			{ 1, "s35576", "29516", "=q4=Ebon Netherscale Belt", "=ds=#sr# 375"};
			{ 2, "s35577", "29517", "=q4=Ebon Netherscale Bracers", "=ds=#sr# 375"};
			{ 3, "s35575", "29515", "=q4=Ebon Netherscale Breastplate", "=ds=#sr# 375"};
			{ 4, "s35582", "29520", "=q4=Netherstrike Belt", "=ds=#sr# 375"};
			{ 5, "s35584", "29521", "=q4=Netherstrike Bracers", "=ds=#sr# 375"};
			{ 6, "s35580", "29519", "=q4=Netherstrike Breastplate", "=ds=#sr# 375"};
			{ 7, "s36079", "29975", "=q3=Golden Dragonstrike Breastplate", "=ds=#sr# 330"};
		};
		{
			Name = ELEMENTAL;
			{ 1, "s35590", "29526", "=q4=Primalstrike Belt", "=ds=#sr# 375"};
			{ 2, "s35591", "29527", "=q4=Primalstrike Bracers", "=ds=#sr# 375"};
			{ 3, "s35589", "29525", "=q4=Primalstrike Vest", "=ds=#sr# 375"};
			{ 4, "s36077", "29973", "=q3=Primalstorm Breastplate", "=ds=#sr# 330"};
		};
		{
			Name = TRIBAL;
			{ 1, "s35587", "29524", "=q4=Windhawk Belt", "=ds=#sr# 375"};
			{ 2, "s35588", "29523", "=q4=Windhawk Bracers", "=ds=#sr# 375"};
			{ 3, "s35585", "29522", "=q4=Windhawk Hauberk", "=ds=#sr# 375"};
			{ 4, "s36078", "29974", "=q3=Living Crystal Breastplate", "=ds=#sr# 330"};
		};
	};

	AtlasLoot_Data["MiningTBC"] = {
		Name = MINING;
				{
		Name = MINING;
		{ 1, "s46353", "35128", "=q2=Smelt Hardened Khorium", "=ds=#sr# 375"};
		{ 2, "s29686", "23573", "=q1=Smelt Hardened Adamantite", "=ds=#sr# 375"};
		{ 3, "s29361", "23449", "=q2=Smelt Khorium", "=ds=#sr# 375"};
		{ 4, "s29360", "23448", "=q2=Smelt Felsteel", "=ds=#sr# 350"};
		{ 5, "s29359", "23447", "=q2=Smelt Eternium", "=ds=#sr# 350"};
		{ 6, "s29358", "23446", "=q1=Smelt Adamantite", "=ds=#sr# 325"};
		{ 7, "s29356", "23445", "=q1=Smelt Fel Iron", "=ds=#sr# 300"};
		{ 8, "s35751", "22574", "=q1=Fire Sunder", "=ds=#sr# 300"};
		{ 9, "s35750", "22573", "=q1=Earth Shatter", "=ds=#sr# 300"};
	};
};

	AtlasLoot_Data["FirstAidTBC"] = {
			Name = FIRSTAID;
		{
			Name = FIRSTAID;
			{ 1, "s27033", "21991", "=q1=Heavy Netherweave Bandage", "=ds=#sr# 360"};
			{ 2, "s27032", "21990", "=q1=Netherweave Bandage", "=ds=#sr# 330"};
		};
	};
			-----------------
			--- Tailoring ---
			-----------------

		

		AtlasLoot_Data["TailoringTBC"] = {
			Name = TAILORING;
			Type = "Crafting";
		{
			Name = AL["Cloth Armor"].." - Back";
			{ 1, "s40060", "32420", "=q4=Night's End", "=ds=#sr# 375"};
			{ 2, "s31450", "24260", "=q4=Manaweave Cloak", "=ds=#sr# 365"};
			{ 3, "s31449", "24259", "=q4=Vengeance Wrap", "=ds=#sr# 365"};
			{ 4, "s37873", "30831", "=q3=Cloak of Arcane Evasion", "=ds=#sr# 350"};
			{ 5, "s31440", "24253", "=q3=Cloak of Eternity", "=ds=#sr# 350"};
			{ 6, "s31438", "24252", "=q3=Cloak of the Black Void", "=ds=#sr# 350"};
		};
		{
			Name = AL["Cloth Armor"].." - Chest";
			{ 1, "s26758", "21871", "=q4=Frozen Shadoweave Robe", "=ds=#sr# 375"};
			{ 2, "s26762", "21875", "=q4=Primal Mooncloth Robe", "=ds=#sr# 375"};
			{ 3, "s26781", "21865", "=q4=Soulcloth Vest", "=ds=#sr# 375"};
			{ 4, "s26754", "21848", "=q4=Spellfire Robe", "=ds=#sr# 375"};
			{ 5, "s46131", "34365", "=q4=Robe of Eternal Light", "=ds=#sr# 365"};
			{ 6, "s46130", "34364", "=q4=Sunfire Robe", "=ds=#sr# 365"};
			{ 7, "s26784", "21868", "=q3=Arcanoweave Robe", "=ds=#sr# 370"};
			{ 8, "s37884", "30839", "=q3=Flameheart Vest", "=ds=#sr# 370"};
			{ 9, "s26777", "21861", "=q3=Imbued Netherweave Robe", "=ds=#sr# 360"};
			{ 10, "s26778", "21862", "=q3=Imbued Netherweave Tunic", "=ds=#sr# 360"};
			{ 11, "s26774", "21855", "=q2=Netherweave Tunic", "=ds=#sr# 345"};
			{ 12, "s26773", "21854", "=q2=Netherweave Robe", "=ds=#sr# 340"};
		};
		{
			Name = AL["Cloth Armor"].." - Feet";
			{ 1, "s36317", "30037", "=q4=Boots of Blasting", "=ds=#sr# 375"};
			{ 2, "s36318", "30035", "=q4=Boots of the Long Road", "=ds=#sr# 375"};
			{ 3, "s40020", "32391", "=q4=Soulguard Slippers", "=ds=#sr# 375"};
			{ 4, "s26757", "21870", "=q4=Frozen Shadoweave Boots", "=ds=#sr# 365"};
			{ 5, "s26783", "21867", "=q3=Arcanoweave Boots", "=ds=#sr# 360"};
			{ 6, "s26776", "21860", "=q3=Imbued Netherweave Boots", "=ds=#sr# 350"};
			{ 7, "s26772", "21853", "=q2=Netherweave Boots", "=ds=#sr# 335"};

		};
		{
			Name = AL["Cloth Armor"].." - Hands";
			{ 1, "s41207", "32584", "=q4=Swiftheal Wraps", "=ds=#sr# 375"};
			{ 2, "s46129", "34367", "=q4=Hands of Eternal Light", "=ds=#sr# 365"};
			{ 3, "s26753", "21847", "=q4=Spellfire Gloves", "=ds=#sr# 365"};
			{ 4, "s46128", "34366", "=q4=Sunfire Handwraps", "=ds=#sr# 365"};
			{ 5, "s26779", "21863", "=q4=Soulcloth Gloves", "=ds=#sr# 355"};
			{ 6, "s37883", "30838", "=q3=Flameheart Gloves", "=ds=#sr# 360"};
			{ 7, "s26770", "21851", "=q2=Netherweave Gloves", "=ds=#sr# 320"};
		};
		{
			Name = AL["Cloth Armor"].." - Head";
			{ 1, "s31456", "24267", "=q4=Battlecast Hood", "=ds=#sr# 375"};
			{ 2, "s31455", "24266", "=q4=Spellstrike Hood", "=ds=#sr# 375"};
			{ 3, "s31454", "24264", "=q4=Whitemend Hood", "=ds=#sr# 375"};
			{ 4, "s31448", "24258", "=q4=Resolute Cape", "=ds=#sr# 365"};
			{ 5, "s31441", "24254", "=q3=White Remedy Cape", "=ds=#sr# 350"};
		};
		{
			Name = AL["Cloth Armor"].." - Legs";
			{ 1, "s31453", "24263", "=q4=Battlecast Pants", "=ds=#sr# 375"};
			{ 2, "s40023", "32389", "=q4=Soulguard Leggings", "=ds=#sr# 375"};
			{ 3, "s31452", "24262", "=q4=Spellstrike Pants", "=ds=#sr# 375"};
			{ 4, "s31451", "24261", "=q4=Whitemend Pants", "=ds=#sr# 375"};
			{ 5, "s26775", "21859", "=q3=Imbued Netherweave Pants", "=ds=#sr# 340"};
			{ 6, "s26771", "21852", "=q2=Netherweave Pants", "=ds=#sr# 325"};

		};
		{
			Name = AL["Cloth Armor"].." - Shoulder";
			{ 1, "s41206", "32587", "=q4=Mantle of Nimble Thought", "=ds=#sr# 375"};
			{ 2, "s41208", "32585", "=q4=Swiftheal Mantle", "=ds=#sr# 375"};
			{ 3, "s26761", "21874", "=q4=Primal Mooncloth Shoulders", "=ds=#sr# 365"};
			{ 4, "s26780", "21864", "=q4=Soulcloth Shoulders", "=ds=#sr# 365"};
			{ 5, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders", "=ds=#sr# 355"};

		};
		{
			Name = AL["Cloth Armor"].." - Waist";
			{ 1, "s36315", "30038", "=q4=Belt of Blasting", "=ds=#sr# 375"};
			{ 2, "s36316", "30036", "=q4=Belt of the Long Road", "=ds=#sr# 375"};
			{ 3, "s40024", "32390", "=q4=Soulguard Girdle", "=ds=#sr# 375"};
			{ 4, "s31444", "24257", "=q4=Black Belt of Knowledge", "=ds=#sr# 365"};
			{ 5, "s31443", "24256", "=q4=Girdle of Ruination", "=ds=#sr# 365"};
			{ 6, "s31442", "24255", "=q4=Unyielding Girdle", "=ds=#sr# 365"};
			{ 7, "s26760", "21873", "=q4=Primal Mooncloth Belt", "=ds=#sr# 355"};
			{ 8, "s26752", "21846", "=q4=Spellfire Belt", "=ds=#sr# 355"};
			{ 9, "s26765", "21850", "=q2=Netherweave Belt", "=ds=#sr# 310"};
		};
		{
			Name = AL["Cloth Armor"].." - Wrist";
			{ 1, "s41205", "32586", "=q4=Bracers of Nimble Thought", "=ds=#sr# 375"};
			{ 2, "s40021", "32392", "=q4=Soulguard Bracers", "=ds=#sr# 375"};
			{ 3, "s26782", "21866", "=q3=Arcanoweave Bracers", "=ds=#sr# 350"};
			{ 4, "s31437", "24251", "=q3=Blackstrike Bracers", "=ds=#sr# 350"};
			{ 5, "s37882", "30837", "=q3=Flameheart Bracers", "=ds=#sr# 350"};
			{ 6, "s31434", "24249", "=q3=Unyielding Bracers", "=ds=#sr# 350"};
			{ 7, "s31435", "24250", "=q3=Bracers of Havok", "=ds=#sr# 350"};
			{ 8, "s26764", "21849", "=q2=Netherweave Bracers", "=ds=#sr# 310"};

		};
		{
			Name = AL["Bags"];
			{ 1, "s26759", "21872", "=q3=Ebon Shadowbag", "=ds=#sr# 375"};
			{ 2, "s50194", "38225", "=q3=Mycah's Botanical Bag", "=ds=#sr# 375"};
			{ 3, "s26763", "21876", "=q3=Primal Mooncloth Bag", "=ds=#sr# 375"};
			{ 4, "s26755", "21858", "=q3=Spellfire Bag", "=ds=#sr# 375"};
			{ 5, "s18455", "14156", "=q3=Bottomless Bag", "=ds=#sr# 300"};
			{ 6, "s26086", "21341", "=q3=Felcloth Bag", "=ds=#sr# 280"};
			{ 7, "s56007", "41599", "=q2=Frostweave Bag", "=ds="..AL["Trainer"] };
			{ 8, "s31459", "24270", "=q2=Bag of Jewels", "=ds=#sr# 340"};
			{ 9, "s26749", "21843", "=q2=Imbued Netherweave Bag", "=ds=#sr# 340"};
			{ 10, "s26746", "21841", "=q2=Netherweave Bag", "=ds=#sr# 315"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s31433", "24276", "=q4=Golden Spellthread", "=ds=#sr# 375"};
			{ 2, "s31432", "24274", "=q4=Runic Spellthread", "=ds=#sr# 375"};
			{ 3, "s26751", "21845", "=q3=Primal Mooncloth", "=ds=#sr# 350"};
			{ 4, "s36686", "24272", "=q3=Shadowcloth", "=ds=#sr# 350"};
			{ 5, "s31373", "24271", "=q3=Spellcloth", "=ds=#sr# 350"};
			{ 6, "s31430", "24273", "=q3=Mystic Spellthread", "=ds=#sr# 335"};
			{ 7, "s31431", "24275", "=q3=Silver Spellthread", "=ds=#sr# 335"};
			{ 8, "s26747", "21842", "=q2=Bolt of Imbued Netherweave", "=ds=#sr# 325"};
			{ 9, "s26750", "21844", "=q1=Bolt of Soulcloth", "=ds=#sr# 345"};
			{ 10, "s26745", "21840", "=q1=Bolt of Netherweave", "=ds=#sr# 300"};
			{ 11, "s31460", "24268", "=q1=Netherweave Net", "=ds=#sr# 300"};
		};
		{
			Name = MOONCLOTH;
			{ 1, "s26762", "21875", "=q4=Primal Mooncloth Robe", "=ds=#sr# 375"};
			{ 2, "s26761", "21874", "=q4=Primal Mooncloth Shoulders", "=ds=#sr# 365"};
			{ 3, "s26760", "21873", "=q4=Primal Mooncloth Belt", "=ds=#sr# 355"};
		};
		{
			Name = SHADOWEAVE;
			{ 1, "s26758", "21871", "=q4=Frozen Shadoweave Robe", "=ds=#sr# 375"};
			{ 2, "s26757", "21870", "=q4=Frozen Shadoweave Boots", "=ds=#sr# 365"};
			{ 3, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders", "=ds=#sr# 355"};
		};
		{
			Name = SPELLFIRE;
			{ 1, "s26754", "21848", "=q4=Spellfire Robe", "=ds=#sr# 375"};
			{ 2, "s26753", "21847", "=q4=Spellfire Gloves", "=ds=#sr# 365"};
			{ 3, "s26752", "21846", "=q4=Spellfire Belt", "=ds=#sr# 355"};
		};
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

			---------------------
			---   High Risk   ---
			---------------------

	AtlasLoot_Data["AlchemyHighRiskTBC"] = {
			Name = ALCHEMY.." High Risk";
					{
			Name = "Rare";
			{ 1, "s979362", "1203258",  "=q3=Impure Flask of Manifesting Power", 	"=ds=#sr# 300"};
			{ 2, "s979364", "1203260",  "=q3=Impure Flask of the Warsong", 			"=ds=#sr# 300"};
			{ 3, "s979366", "1203262",  "=q3=Impure Flask of the Kirin Tor", 		"=ds=#sr# 300"};
			{ 4, "s979368", "1203264", "=q3=Impure Flask of Butchery", 				"=ds=#sr# 300"};
			{ 5, "s979370", "1203266", "=q3=Impure Flask of the Unyielding", 		"=ds=#sr# 300"};
			{ 6, "s979372", "1203268", "=q3=Impure Flask of Unrelenting Power", 		"=ds=#sr# 300"};
			{ 7, "s979374", "1203270", "=q3=Impure Flask of Savage Assault", 		"=ds=#sr# 300"};
			{ 8, "s979376", "1203272", "=q3=Impure Flask of Shattering Thunder", 	"=ds=#sr# 300"};
			{ 9, "s979378", "1203274", "=q3=Impure Flask of the Executioner", 		"=ds=#sr# 300"};
			{ 10, "s979380", "1203276", "=q3=Impure Flask of Deep Meditation", 		"=ds=#sr# 300"};
			{ 11, "s979382", "1203278", "=q3=Impure Flask of Adept Striking", 		"=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s979363", "1203259",  "=q4=Pure Flask of Manifesting Power", 	"=ds=#sr# 300"};
			{ 2, "s979365", "1203261",  "=q4=Pure Flask of the Warsong", "=ds=#sr# 300"};
			{ 3, "s979367", "1203263",  "=q4=Pure Flask of the Kirin Tor", "=ds=#sr# 300"};
			{ 4, "s979369", "1203265", "=q4=Pure Flask of Butchery", "=ds=#sr# 300"};
			{ 5, "s979371", "1203267", "=q4=Pure Flask of the Unyielding", "=ds=#sr# 300"};
			{ 6, "s979373", "1203269", "=q4=Pure Flask of Unrelenting Power", "=ds=#sr# 300"};
			{ 7, "s979375", "1203271", "=q4=Pure Flask of Savage Assault", "=ds=#sr# 300"};
			{ 8, "s979377", "1203273", "=q4=Pure Flask of Shattering Thunder", "=ds=#sr# 300"};
			{ 9, "s979379", "1203275", "=q4=Pure Flask of the Executioner", "=ds=#sr# 300"};
			{ 10, "s979381", "1203277", "=q4=Pure Flask of Deep Meditation", "=ds=#sr# 300"};
			{ 11, "s979383", "1203279", "=q4=Pure Flask of Adept Striking", "=ds=#sr# 300"};
		};
	};

		AtlasLoot_Data["SmithingHighRiskTBC"] = {
			Name = BLACKSMITHING.." High Risk";
		{
			Name = "Rare";
			{ 1, "s979534", "1204033", "=q3=Hulking Belt Buckle", "=ds=#sr# 300"};
			{ 2, "s979536", "1204035", "=q3=Blade Master's Belt Buckle", "=ds=#sr# 300"};
			{ 3, "s979538", "1204037", "=q3=Agile Belt Buckle", "=ds=#sr# 300"};
			{ 4, "s979540", "1204039", "=q3=Eluding Belt Buckle", "=ds=#sr# 300"};
			{ 5, "s979542", "1204041", "=q3=Scholar's Belt Buckle", 	"=ds=#sr# 300"};
			{ 6, "s979544", "1204043", "=q3=Priestly Belt Buckle", "=ds=#sr# 300"};
			{ 7, "s979546", "1204045", "=q3=Champion\'s Belt Buckle", "=ds=#sr# 300"};
			{ 8, "s979548", "1204047", "=q3=Guarded Belt Buckle", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s979535", "1204034", "=q4=Mastercraft Hulking Belt Buckle", "=ds=#sr# 300"};
			{ 2, "s979537", "1204036", "=q4=Mastercraft Blade Master's Belt Buckle", "=ds=#sr# 300"};
			{ 3, "s979539", "1204038", "=q4=Mastercraft Agile Belt Buckle", "=ds=#sr# 300"};
			{ 4, "s979541", "1204040", "=q4=Mastercraft Eluding Belt Buckle", "=ds=#sr# 300"};
			{ 5, "s979543", "1204042", "=q4=Mastercraft Scholar's Belt Buckle", 	"=ds=#sr# 300"};
			{ 6, "s979545", "1204044", "=q4=Mastercraft Priestly Belt Buckle", "=ds=#sr# 300"};
			{ 7, "s979547", "1204046", "=q4=Mastercraft Champion\'s Belt Buckle", "=ds=#sr# 300"};
			{ 8, "s979549", "1204048", "=q4=Mastercraft Guarded Belt Buckle", "=ds=#sr# 300"};
		};
	};

	AtlasLoot_Data["LeatherworkingHighRiskTBC"] = {
			Name = LEATHERWORKING.." High Risk";
					{
			Name = "Rare";
			{ 1, "s979522", "1204021", "=q3=Cobra Strike Gambeson", "=ds=#sr# 300"};
			{ 2, "s979524", "1204023", "=q3=Fel Strike Gambeson", "=ds=#sr# 300"};
			{ 3, "s979526", "1204025", "=q3=Wind Gambeson", "=ds=#sr# 300"};
			{ 4, "s979528", "1204027", "=q3=True Strike Gambeson", "=ds=#sr# 300"};
			{ 5, "s979530", "1204029", "=q3=Clefthoof Gambeson", "=ds=#sr# 300"};
			{ 6, "s979532", "1204031", "=q3=Subtle Gambeson", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s979523", "1204022", "=q4=Mastercraft Cobra Strike Gambeson", "=ds=#sr# 300"};
			{ 2, "s979525", "1204024", "=q4=Mastercraft Fel Strike Gambeson", "=ds=#sr# 300"};
			{ 3, "s979527", "1204026", "=q4=Mastercraft Wind Gambeson", "=ds=#sr# 300"};
			{ 4, "s979529", "1204028", "=q4=Mastercraft True Strike Gambeson", "=ds=#sr# 300"};	
			{ 5, "s979531", "1204030", "=q4=Mastercraft Clefthoof Gambeson", "=ds=#sr# 300"};
			{ 6, "s979533", "1204032", "=q4=Mastercraft Subtle Gambeson", "=ds=#sr# 300"};
		};
	};

	AtlasLoot_Data["EngineeringHighRiskTBC"] = {
		Name = ENGINEERING.." High Risk";
			{
		Name = "Rare";
		{ 1, "s979550", "1204049", "=q3=Gnomish Magnification Polish", "=ds=#sr# 300"};
		{ 2, "s979552", "1204051", "=q3=Gnomish Sharpening Polish", "=ds=#sr# 300"};
		{ 3, "s979554", "1204053", "=q3=Gnomish Prismatic Polish", "=ds=#sr# 300"};
		{ 4, "s979556", "1204055", "=q3=Felfire Scope", "=ds=#sr# 300"};
		{ 5, "s979558", "1204057", "=q3=Sighted Scope", "=ds=#sr# 300"};
		{ 6, "s979560", "1204059", "=q3=Quickshot Scope", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s968044", "1204050", "=q4=Fine Gnomish Magnification Polish", "=ds=#sr# 300"};
		{ 2, "s968047", "1204052", "=q4=Fine Gnomish Sharpening Polish", "=ds=#sr# 300"};
		{ 3, "s968050", "1204054", "=q4=Fine Gnomish Prismatic Polish", "=ds=#sr# 300"};
		{ 4, "s968053", "1204056", "=q4=Focused Felfire Scope", "=ds=#sr# 300"};
		{ 5, "s968056", "1204058", "=q4=Focused Sighted Scope", "=ds=#sr# 300"};
		{ 6, "s968059", "1204060", "=q4=Focused Quickshot Scope", "=ds=#sr# 300"};
	};
};

	AtlasLoot_Data["EnchantingHighRiskTBC"] = {
		Name = ENCHANTING.." High Risk";
			{
		Name = "Rare";
		{ 1, "s1968677", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Assault", "=ds=#sr# 300"};
		{ 2, "s1968680", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Assault", "=ds=#sr# 300"};
		{ 3, "s1968683", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Evoker", "=ds=#sr# 300"};
		{ 4, "s1968686", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Assault", "=ds=#sr# 300"};
		{ 5, "s1968689", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Channeler", "=ds=#sr# 300"};
		{ 6, "s1968692", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Omen Strikes", "=ds=#sr# 300"};
		{ 7, "s1968695", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Flows", "=ds=#sr# 300"};
		{ 8, "s1968698", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Blasting", "=ds=#sr# 300"};
		{ 9, "s1968701", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Precision", "=ds=#sr# 300"};
		{ 10, "s1968770", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Crusader", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s1968678", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Assault", "=ds=#sr# 300"};
		{ 2, "s1968681", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Assault", "=ds=#sr# 300"};
		{ 3, "s1968684", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Evoker", "=ds=#sr# 300"};
		{ 4, "s1968687", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Assault", "=ds=#sr# 300"};
		{ 5, "s1968690", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Channeler", "=ds=#sr# 300"};
		{ 6, "s1968693", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Omen Strikes", "=ds=#sr# 300"};
		{ 7, "s1968696", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Flows", "=ds=#sr# 300"};
		{ 8, "s1968699", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Blasting", "=ds=#sr# 300"};
		{ 9, "s1968702", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Precision", "=ds=#sr# 300"};
		{ 10, "s1968771", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Crusader", "=ds=#sr# 300"};
	};
};

	AtlasLoot_Data["TailoringHighRiskTBC"] = {
		Name = TAILORING.." High Risk";
			{
		Name = "Rare";
		{ 1, "s979562", "1204061", "=q3=Armored Cloak Lining", "=ds=#sr# 300"};
		{ 2, "s979564", "1204063", "=q3=Chaneller\'s Cloak Lining", "=ds=#sr# 300"};
		{ 3, "s979566", "1204065", "=q3=Energizing Cloak Lining", "=ds=#sr# 300"};
		{ 4, "s979568", "1204067", "=q3=Rager\'s Cloak Lining", "=ds=#sr# 300"};
		{ 5, "s979570", "1204069", "=q3=Steadfast Cloak Lining", "=ds=#sr# 300"};
		{ 6, "s979572", "1204071", "=q3=Shifting Cloak Lining", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s979563", "1204062", "=q4=Fitted Armored Cloak Lining", "=ds=#sr# 300"};
		{ 2, "s979565", "1204064", "=q4=Fitted Chaneller\'s Cloak Lining", "=ds=#sr# 300"};
		{ 3, "s979567", "1204066", "=q4=Fitted Energizing Cloak Lining", "=ds=#sr# 300"};
		{ 4, "s979569", "1204068", "=q4=Fitted Rager\'s Cloak Lining", "=ds=#sr# 300"};
		{ 5, "s979571", "1204070", "=q4=Fitted Steadfast Cloak Lining", "=ds=#sr# 300"};
		{ 6, "s979573", "1204072", "=q4=Fitted Shifting Cloak Lining", "=ds=#sr# 300"};
	};
};

	AtlasLoot_Data["JewelcraftingHighRiskTBC"] = {
		Name = JEWELCRAFTING.." High Risk";
			{
		Name = "Rare";
		{ 1, "s979639", "1204165", "=q3=Deep Gold Twisted Pendant", "=ds=#sr# 300"};
		{ 2, "s979641", "1204167", "=q3=Bloodshadow Twisted Pendant", "=ds=#sr# 300"};
		{ 3, "s979643", "1204169", "=q3=Azureflame Twisted Pendant", "=ds=#sr# 300"};
		{ 4, "s979645", "1204171", "=q3=Shadowgold Dread Pendant", "=ds=#sr# 300"};
		{ 5, "s979647", "1204173", "=q3=Deep Azure Dread Pendant", 	"=ds=#sr# 300"};
		{ 6, "s979649", "1204175", "=q3=Bloodflame Dread Pendant", "=ds=#sr# 300"};
		{ 7, "s979651", "1204177", "=q3=Living Night Void Pendant", "=ds=#sr# 300"};
		{ 8, "s979653", "1204179", "=q3=Dawnstar Void Pendant", "=ds=#sr# 300"};
		{ 9, "s979655", "1204181", "=q3=Noble Talasite Void Pendant", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s979640", "1204166", "=q4=Engraved Deep Gold Twisted Pendant", "=ds=#sr# 300"};
		{ 2, "s979642", "1204168", "=q4=Engraved Bloodshadow Twisted Pendant", "=ds=#sr# 300"};
		{ 3, "s979644", "1204170", "=q4=Engraved Azureflame Twisted Pendant", "=ds=#sr# 300"};
		{ 4, "s979646", "1204172", "=q4=Engraved Shadowgold Dread Pendant", "=ds=#sr# 300"};
		{ 5, "s979648", "1204174", "=q4=Engraved Deep Azure Dread Pendant", "=ds=#sr# 300"};
		{ 6, "s979650", "1204176", "=q4=Engraved Bloodflame Dread Pendant", "=ds=#sr# 300"};
		{ 7, "s979652", "1204178", "=q4=Engraved Living Night Void Pendant", "=ds=#sr# 300"};
		{ 8, "s979654", "1204180", "=q4=Engraved Dawnstar Void Pendant", "=ds=#sr# 300"};
		{ 9, "s979656", "1204182", "=q4=Engraved Noble Talasite Void Pendant", "=ds=#sr# 300"};
	};
};

	AtlasLoot_Data["CookingHighRiskTBC"] = {
		Name = COOKING.." High Risk";
			{
		Name = "Rare";
		{ 1, "s979384",	"1203280", "=q3=Infused Living Soup", "=ds=#sr# 300"};
		{ 2, "s979386",	"1203282", "=q3=Infused Charred Steak", "=ds=#sr# 300"};
		{ 3, "s979388",	"1203284", "=q3=Infused Steamed Wontons", "=ds=#sr# 300"};
		{ 4, "s979390",	"1203286", "=q3=Infused Air Fried Chops", "=ds=#sr# 300"};
		{ 5, "s979392",	"1203288", "=q3=Infused Rock\'s Stew (Airsick lowlander flavor text)", "=ds=#sr# 300"};
		{ 6, "s979394",	"1203290", "=q3=Infused Clear-Cut Chops", "=ds=#sr# 300"};
		{ 7, "s979396",	"1203292", "=q3=Infused Clear-Cut Wontons", "=ds=#sr# 300"};
		{ 8, "s979398",	"1203294", "=q3=Infused Clear-Cut Steak", "=ds=#sr# 300"};
		{ 9, "s979463",	"1203358", "=q3=Infused Bold Simmered Stew", "=ds=#sr# 300"};
		{ 10, "s979465", "1203360", "=q3=Infused Bold Duck Stew", "=ds=#sr# 300"};
		{ 11, "s979447", "1203338", "=q3=Infused Subtle Chops", "=ds=#sr# 300"};
		{ 12, "s979445", "1203340", "=q3=Infused Subtle Steak", "=ds=#sr# 300"};
		{ 13, "s979447", "1203342", "=q3=Infused Subtle Wontons", "=ds=#sr# 300"};
		{ 14, "s979449", "1203344", "=q3=Infused Subtle Soup", "=ds=#sr# 300"};
		{ 15, "s979451", "1203346", "=q3=Infused Bold Stew", "=ds=#sr# 300"};
		{ 16, "s979400", "1203296", "=q3=Infused Piercing Chops", "=ds=#sr# 300"};
		{ 17, "s979402", "1203298", "=q3=Infused Piercing Steak", "=ds=#sr# 300"};
		{ 18, "s979404", "1203300", "=q3=Infused Seared Wontons", "=ds=#sr# 300"};
		{ 19, "s979406", "1203302", "=q3=Infused Seared Chops", "=ds=#sr# 300"};
		{ 20, "s979421", "1203316", "=q3=Infused Duck Stew", "=ds=#sr# 300"};
		{ 21, "s979423", "1203318", "=q3=Infused Chunky Stew", "=ds=#sr# 300"};
		{ 22, "s979425", "1203320", "=q3=Infused Simmered Stew", "=ds=#sr# 300"};
		{ 23, "s979427", "1203322", "=q3=Infused Wizard Wontons", "=ds=#sr# 300"};
		{ 24, "s979429", "1203324", "=q3=Infused Wizard Soup", "=ds=#sr# 300"};
		{ 25, "s979431", "1203326", "=q3=Infused Heightened Wontons", "=ds=#sr# 300"};
		{ 26, "s979441", "1203336", "=q3=Infused Vibrant Chops", "=ds=#sr# 300"};
		{ 27, "s979408", "1203304", "=q3=Infused Savory Stew", "=ds=#sr# 300"};
		{ 28, "s979410", "1203306", "=q3=Infused Savory Chops", "=ds=#sr# 300"};
	};
	{
		Name = "Rare";
		{ 1, "s979413",	"1203308", "=q3=Infused Savory Steak", "=ds=#sr# 300"};
		{ 2, "s979415",	"1203310", "=q3=Infused Savory Wontons", "=ds=#sr# 300"};
		{ 3, "s979417",	"1203312", "=q3=Infused Red-Hot Stew", "=ds=#sr# 300"};
		{ 4, "s979419",	"1203314", "=q3=Infused Blazing Stew", "=ds=#sr# 300"};
		{ 5, "s979433",	"1203328", "=q3=Infused Hearty Living Soup", "=ds=#sr# 300"};
		{ 6, "s979435",	"1203330", "=q3=Infused Hearty Air Fried Chops", "=ds=#sr# 300"};
		{ 7, "s979437",	"1203332", "=q3=Infused Hearty Charred Steak", "=ds=#sr# 300"};
		{ 8, "s979439",	"1203334", "=q3=Infused Hearty Steamed Wontons", "=ds=#sr# 300"};
		{ 9, "s979453",	"1203348", "=q3=Infused Mana Charged Roast", "=ds=#sr# 300"};
		{ 10, "s979455", "1203350", "=q3=Infused Sizzling Roast", "=ds=#sr# 300"};
		{ 11, "s979457", "1203352", "=q3=Infused Wild Roast", "=ds=#sr# 300"};
		{ 12, "s979459", "1203354", "=q3=Infused Winter Roast", "=ds=#sr# 300"};
		{ 13, "s979461", "1203356", "=q3=Infused Blackened Roast", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s979385",	"1203281", "=q4=Charged Living Soup", "=ds=#sr# 300"};
		{ 2, "s979387",	"1203283", "=q4=Charged Charred Steak", "=ds=#sr# 300"};
		{ 3, "s979389",	"1203285", "=q4=Charged Steamed Wontons", "=ds=#sr# 300"};
		{ 4, "s979391",	"1203287", "=q4=Charged Air Fried Chops", "=ds=#sr# 300"};
		{ 5, "s979393",	"1203289", "=q4=Charged Rock\'s Stew (Airsick lowlander flavor text)", "=ds=#sr# 300"};
		{ 6, "s979395",	"1203291", "=q4=Charged Clear-Cut Chops", "=ds=#sr# 300"};
		{ 7, "s979397",	"1203293", "=q4=Charged Clear-Cut Wontons", "=ds=#sr# 300"};
		{ 8, "s979399",	"1203295", "=q4=Charged Clear-Cut Steak", "=ds=#sr# 300"};
		{ 9, "s979464",	"1203359", "=q4=Charged Bold Simmered Stew", "=ds=#sr# 300"};
		{ 10, "s979466", "1203361", "=q4=Charged Bold Duck Stew", "=ds=#sr# 300"};
		{ 11, "s979444", "1203339", "=q4=Charged Subtle Chops", "=ds=#sr# 300"};
		{ 12, "s979446", "1203341", "=q4=Charged Subtle Steak", "=ds=#sr# 300"};
		{ 13, "s979448", "1203343", "=q4=Charged Subtle Wontons", "=ds=#sr# 300"};
		{ 14, "s979450", "1203345", "=q4=Charged Subtle Soup", "=ds=#sr# 300"};
		{ 15, "s979452", "1203347", "=q4=Charged Bold Stew", "=ds=#sr# 300"};
		{ 16, "s979401", "1203297", "=q4=Charged Piercing Chops", "=ds=#sr# 300"};
		{ 17, "s979403", "1203299", "=q4=Charged Piercing Steak", "=ds=#sr# 300"};
		{ 18, "s979405", "1203301", "=q4=Charged Seared Wontons", "=ds=#sr# 300"};
		{ 19, "s979407", "1203303", "=q4=Charged Seared Chops", "=ds=#sr# 300"};
		{ 20, "s979422", "1203317", "=q4=Charged Duck Stew", "=ds=#sr# 300"};
		{ 21, "s979424", "1203319", "=q4=Charged Chunky Stew", "=ds=#sr# 300"};
		{ 22, "s979426", "1203321", "=q4=Charged Simmered Stew", "=ds=#sr# 300"};
		{ 23, "s979428", "1203323", "=q4=Charged Wizard Wontons", "=ds=#sr# 300"};
		{ 24, "s979430", "1203325", "=q4=Charged Wizard Soup", "=ds=#sr# 300"};
		{ 25, "s979432", "1203327", "=q4=Charged Heightened Wontons", "=ds=#sr# 300"};
		{ 26, "s979442", "1203337", "=q4=Charged Vibrant Chops", "=ds=#sr# 300"};
		{ 27, "s979409", "1203305", "=q4=Charged Savory Stew", "=ds=#sr# 300"};
		{ 28, "s979412", "1203307", "=q4=Charged Savory Chops", "=ds=#sr# 300"};
	};
	{
		Name = "Epic";
		{ 1, "s979414",	"1203309", "=q4=Charged Savory Steak", "=ds=#sr# 300"};
		{ 2, "s979416",	"1203311", "=q4=Charged Savory Wontons", "=ds=#sr# 300"};
		{ 3, "s979418",	"1203313", "=q4=Charged Red-Hot Stew", "=ds=#sr# 300"};
		{ 4, "s979420",	"1203315", "=q4=Charged Blazing Stew", "=ds=#sr# 300"};
		{ 5, "s979434",	"1203329", "=q4=Charged Hearty Living Soup", "=ds=#sr# 300"};
		{ 6, "s979436",	"1203331", "=q4=Charged Hearty Air Fried Chops", "=ds=#sr# 300"};
		{ 7, "s979438",	"1203333", "=q4=Charged Hearty Charred Steak", "=ds=#sr# 300"};
		{ 8, "s979440",	"1203335", "=q4=Charged Hearty Steamed Wontons", "=ds=#sr# 300"};
		{ 9, "s979454",	"1203349", "=q4=Charged Mana Charged Roast", "=ds=#sr# 300"};
		{ 10, "s979456", "1203351", "=q4=Charged Sizzling Roast", "=ds=#sr# 300"};
		{ 11, "s979458", "1203353", "=q4=Charged Wild Roast", "=ds=#sr# 300"};
		{ 12, "s979460", "1203355", "=q4=Charged Winter Roast", "=ds=#sr# 300"};
		{ 13, "s979462", "1203357", "=q4=Charged Blackened Roast", "=ds=#sr# 300"};
	};
};