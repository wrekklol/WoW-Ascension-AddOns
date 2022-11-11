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
	AtlasLoot_Data["AlchemyCLASSIC"] = {
			Name = ALCHEMY;
			Type = "CraftingNoBF";
					{
			Name = AL["Battle Elixirs"];
			{ 1, "s17573", "13454", "=q1=Greater Arcane Elixir", "=ds="..AL["Trainer"]};
			{ 2, "s17571", "13452", "=q1=Elixir of the Mongoose", "=ds="..BabbleZone["Felwood"]};
			{ 3, "s17557", "13453", "=q1=Elixir of Brute Force", "=ds="..AL["Trainer"]};
			{ 4, "s11477", "9224", "=q1=Elixir of Demonslaying", "=ds="..AL["Vendor"]};
			{ 5, "s26277", "21546", "=q1=Elixir of Greater Firepower", "=ds="..BabbleZone["Searing Gorge"]};
			{ 6, "s11476", "9264", "=q1=Elixir of Shadow Power", "=ds="..AL["Vendor"]..", "..BabbleZone["Undercity"].."/"..BabbleZone["Stormwind City"]};
			{ 7, "s11472", "9206", "=q1=Elixir of Giants", "=ds="..AL["World Drop"]};
			{ 8, "s11467", "9187", "=q1=Elixir of Greater Agility", "=ds="..AL["Trainer"]};
			{ 9, "s11461", "9155", "=q1=Arcane Elixir", "=ds="..AL["Trainer"]};
			{ 10, "s21923", "17708", "=q1=Elixir of Frost Power", "=ds="..AL["Feast of Winter Veil"]};
			{ 11, "s11449", "8949", "=q1=Elixir of Agility", "=ds="..AL["Trainer"]};
			{ 12, "s63732", "45621", "=q1=Elixir of Minor Accuracy", "=ds="};
			{ 13, "s3188", "3391", "=q1=Elixir of Ogre's Strength", "=ds="..AL["World Drop"]};
			{ 14, "s2333", "3390", "=q1=Elixir of Lesser Agility", "=ds="..AL["World Drop"]};
			{ 15, "s7845", "6373", "=q1=Elixir of Firepower", "=ds="..AL["Trainer"]};
			{ 16, "s8240", "6662", "=q1=Elixir of Giant Growth", "=ds="..BabbleZone["The Barrens"]};
			{ 17, "s3230", "2457", "=q1=Elixir of Minor Agility", "=ds="..AL["World Drop"]};
			{ 18, "s2329", "2454", "=q1=Elixir of Lion's Strength", "=ds="..AL["Trainer"]};
		};
		{
			Name = AL["Guardian Elixirs"];
			{ 1, "s24368", "20004", "=q1=Major Troll's Blood Elixir", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Zandalar Tribe"]};
			{ 2, "s24365", "20007", "=q1=Mageblood Elixir", "=ds="..BabbleFaction["Revered"]..": "..BabbleFaction["Zandalar Tribe"]};
			{ 3, "s17554", "13445", "=q1=Elixir of Superior Defense", "=ds="..AL["Vendor"]..", "..BabbleZone["Orgrimmar"].."/"..BabbleZone["Ironforge"]};
			{ 4, "s17555", "13447", "=q1=Elixir of the Sages", "=ds="..AL["Trainer"]};
			{ 5, "s11466", "9088", "=q1=Gift of Arthas", "=ds="..BabbleZone["Western Plaguelands"]};
			{ 6, "s11465", "9179", "=q1=Elixir of Greater Intellect", "=ds="..AL["Trainer"]};
			{ 7, "s11450", "8951", "=q1=Elixir of Greater Defense", "=ds="..AL["Trainer"]};
			{ 8, "s3451", "3826", "=q1=Mighty Troll's Blood Elixir", "=ds="..AL["World Drop"]};
			{ 9, "s3450", "3825", "=q1=Elixir of Fortitude", "=ds="..AL["Trainer"]};
			{ 10, "s3177", "3389", "=q1=Elixir of Defense", "=ds="..AL["Trainer"]};
			{ 11, "s3176", "3388", "=q1=Strong Troll's Blood Potion", "=ds="..AL["Trainer"]};
			{ 12, "s3171", "3383", "=q1=Elixir of Wisdom", "=ds="..AL["Trainer"]};
			{ 13, "s2334", "2458", "=q1=Elixir of Minor Fortitude", "=ds="..AL["Trainer"]};
			{ 14, "s3170", "3382", "=q1=Weak Troll's Blood Elixir", "=ds="..AL["Trainer"]};
			{ 15, "s7183", "5997", "=q1=Elixir of Minor Defense", "=ds="..AL["Trainer"]};
		};
		{
				Name = AL["Potions"].." 1";
			{ 1, "s22732", "18253", "=q1=Major Rejuvenation Potion", "=ds="..BabbleZone["Molten Core"]};
			{ 2, "s17580", "13444", "=q1=Major Mana Potion", "=ds="..AL["Vendor"]..", "..BabbleZone["Western Plaguelands"]};
			{ 3, "s17577", "13461", "=q1=Greater Arcane Protection Potion", "=ds="..BabbleZone["Winterspring"]};
			{ 4, "s17574", "13457", "=q1=Greater Fire Protection Potion", "=ds="..BabbleZone["Blackrock Spire"]};
			{ 5, "s17575", "13456", "=q1=Greater Frost Protection Potion", "=ds="..BabbleZone["Winterspring"]};
			{ 6, "s17576", "13458", "=q1=Greater Nature Protection Potion", "=ds="..BabbleZone["Western Plaguelands"]};
			{ 7, "s17578", "13459", "=q1=Greater Shadow Protection Potion", "=ds="..BabbleZone["Eastern Plaguelands"]};
			{ 8, "s24367", "20008", "=q1=Living Action Potion", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Zandalar Tribe"]};
			{ 9, "s17572", "13462", "=q1=Purification Potion", "=ds="..AL["World Drop"]};
			{ 10, "s17570", "13455", "=q1=Greater Stoneshield Potion", "=ds="..AL["World Drop"]};
			{ 11, "s24366", "20002", "=q1=Greater Dreamless Sleep Potion", "=ds="..BabbleFaction["Friendly"]..": "..BabbleFaction["Zandalar Tribe"]};
			{ 12, "s17556", "13446", "=q1=Major Healing Potion", "=ds="..AL["Trainer"]};
			{ 13, "s17553", "13443", "=q1=Superior Mana Potion", "=ds="..AL["Trainer"]};
			{ 14, "s17552", "13442", "=q1=Mighty Rage Potion", "=ds="..AL["Trainer"]};
			{ 15, "s3175", "3387", "=q1=Limited Invulnerability Potion", "=ds="..AL["World Drop"]};
			{ 16, "s11464", "9172", "=q1=Invisibility Potion", "=ds="..AL["World Drop"]};
			{ 17, "s15833", "12190", "=q1=Dreamless Sleep Potion", "=ds="..AL["Trainer"]};
			{ 18, "s11458", "9144", "=q1=Wildvine Potion", "=ds="..BabbleZone["The Hinterlands"].."/"..BabbleZone["Stranglethorn Vale"]};
			{ 19, "s4942", "4623", "=q1=Lesser Stoneshield Potion", "=ds="..AL["Quest"]..": "..BabbleZone["Badlands"]};
			{ 20, "s11457", "3928", "=q1=Superior Healing Potion", "=ds="..AL["Trainer"]};
			{ 21, "s11453", "9036", "=q1=Magic Resistance Potion", "=ds="..AL["World Drop"]};
		};
		{
			Name = AL["Potions"].." 2";
			{ 1, "s11452", "9030", "=q1=Restorative Potion", "=ds="..AL["Quest"]..": "..BabbleZone["Badlands"]};
			{ 2, "s11448", "6149", "=q1=Greater Mana Potion", "=ds="..AL["Trainer"]};
			{ 3, "s7258", "6050", "=q1=Frost Protection Potion", "=ds="..AL["Vendor"]};
			{ 4, "s7259", "6052", "=q1=Nature Protection Potion", "=ds="..AL["Vendor"]};
			{ 5, "s6618", "5633", "=q1=Great Rage Potion", "=ds="..AL["Vendor"]};
			{ 6, "s3448", "3823", "=q1=Lesser Invisibility Potion", "=ds="..AL["Trainer"]};
			{ 7, "s7257", "6049", "=q1=Fire Protection Potion", "=ds="..AL["Vendor"]};
			{ 8, "s3452", "3827", "=q1=Mana Potion", "=ds="..AL["Trainer"]};
			{ 9, "s7181", "1710", "=q1=Greater Healing Potion", "=ds="..AL["Trainer"]};
			{ 10, "s6624", "5634", "=q1=Free Action Potion", "=ds="..AL["Vendor"]};
			{ 11, "s7256", "6048", "=q1=Shadow Protection Potion", "=ds="..AL["Vendor"]};
			{ 12, "s3173", "3385", "=q1=Lesser Mana Potion", "=ds="..AL["Trainer"]};
			{ 13, "s3174", "3386", "=q1=Potion of Curing", "=ds="..AL["World Drop"]};
			{ 14, "s3447", "929", "=q1=Healing Potion", "=ds="..AL["Trainer"]};
			{ 15, "s3172", "3384", "=q1=Minor Magic Resistance Potion", "=ds="..AL["World Drop"]};
			{ 16, "s7255", "6051", "=q1=Holy Protection Potion", "=ds="..AL["Vendor"]};
			{ 17, "s7841", "6372", "=q1=Swim Speed Potion", "=ds="..AL["Trainer"]};
			{ 18, "s6617", "5631", "=q1=Rage Potion", "=ds="..AL["Vendor"]};
			{ 19, "s2335", "2459", "=q1=Swiftness Potion", "=ds="..AL["World Drop"]};
			{ 20, "s2337", "858", "=q1=Lesser Healing Potion", "=ds="..AL["Trainer"]};
			{ 21, "s4508", "4596", "=q1=Discolored Healing Potion", "=ds="..AL["Quest"]..", "..BabbleZone["Silverpine Forest"]};
			{ 22, "s2332", "2456", "=q1=Minor Rejuvenation Potion", "=ds="..AL["Trainer"]};
			{ 23, "s2331", "2455", "=q1=Minor Mana Potion", "=ds="..AL["Trainer"]};
			{ 24, "s2330", "118", "=q1=Minor Healing Potion", "=ds="..AL["Trainer"]};
		};
		{
			Name = AL["Flasks"];
			{ 1, "s17638", "13513", "=q1=Flask of Chromatic Resistance", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Lower City"]};
			{ 2, "s17636", "13511", "=q1=Flask of Distilled Wisdom", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Cenarion Expedition"]};
			{ 3, "s17634", "13506", "=q1=Flask of Petrification", "=ds="..AL["World Drop"]};
			{ 4, "s17637", "13512", "=q1=Flask of Supreme Power", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["Keepers of Time"]};
			{ 5, "s17635", "13510", "=q1=Flask of the Titans", "=ds="..BabbleFaction["Exalted"]..": "..BabbleFaction["The Sha'tar"]};
		};
		{
			Name = AL["Transmutes"];
			{ 1, "s11479", "3577", "=q2=Transmute: Iron to Gold", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 2, "s11480", "6037", "=q2=Transmute: Mithril to Truesilver", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 3, "s17187", "12360", "=q2=Transmute: Arcanite Bar", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 4, "s17559", "7078", "=q2=Transmute: Air to Fire", "=ds="..BabbleFaction["Honored"]..": "..BabbleFaction["Argent Dawn"]};
			{ 5, "s17566", "12803", "=q2=Transmute: Earth to Life", "=ds="..AL["World Drop"]};
			{ 6, "s17561", "7080", "=q2=Transmute: Earth to Water", "=ds="..AL["Vendor"]..", "..BabbleZone["Felwood"]};
			{ 7, "s17560", "7076", "=q2=Transmute: Fire to Earth", "=ds="..AL["Vendor"]..", "..BabbleZone["Blackrock Depths"]};
			{ 8, "s17565", "7076", "=q2=Transmute: Life to Earth", "=ds="..AL["World Drop"]};
			{ 9, "s17563", "7080", "=q2=Transmute: Undeath to Water", "=ds="..AL["World Drop"]};
			{ 10, "s17562", "7082", "=q2=Transmute: Water to Air", "=ds="..AL["Vendor"]..", "..BabbleZone["Western Plaguelands"]};
			{ 11, "s17564", "12808", "=q2=Transmute: Water to Undeath", "=ds="..AL["World Drop"]};
			{ 12, "s25146", "7068", "=q1=Transmute: Elemental Fire", "=ds="..AL["Vendor"]..", "..BabbleZone["Blackrock Depths"]};
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
	AtlasLoot_Data["SmithingCLASSIC"] = {
			Name = BLACKSMITHING;
			Type = "Crafting";
					{
			Name = BabbleInventory["Armor"].." - Chest";
			{ 1, "s28242", "22669", "=q4=Icebane Breastplate", "=ds=#sr# 300"};
			{ 2, "s16746", "12641", "=q4=Invulnerable Mail", "=ds=#sr# 300"};
			{ 3, "s27590", "22191", "=q4=Obsidian Mail Tunic", "=ds=#sr# 300"};
			{ 4, "s27587", "22196", "=q4=Thick Obsidian Breastplate", "=ds=#sr# 300"};
			{ 5, "s24136", "19690", "=q3=Bloodsoul Breastplate", "=ds=#sr# 300"};
			{ 6, "s24914", "20550", "=q3=Darkrune Breastplate", "=ds=#sr# 300"};
			{ 7, "s24139", "19693", "=q3=Darksoul Breastplate", "=ds=#sr# 300"};
			{ 8, "s28461", "22762", "=q3=Ironvine Breastplate", "=ds=#sr# 300"};
			{ 9, "s16745", "12618", "=q3=Enchanted Thorium Breastplate", "=ds=#sr# 300"};
			{ 10, "s16663", "12422", "=q2=Imperial Plate Chest", "=ds=#sr# 300"};
			{ 11, "s16731", "12613", "=q2=Runic Breastplate", "=ds="..AL["Drop"]..""};
			{ 12, "s16667", "12628", "=q3=Demon Forged Breastplate", "=ds=#sr# 285"};
			{ 13, "s15296", "11604", "=q3=Dark Iron Plate", "=ds=#sr# 285"};
			{ 14, "s16650", "12624", "=q3=Wildthorn Mail", "=ds=#sr# 270"};
			{ 15, "s16648", "12415", "=q2=Radiant Breastplate", "=ds=#sr# 270"};
			{ 16, "s16642", "12405", "=q2=Thorium Armor", "=ds=#sr# 250"};
			{ 17, "s9959", "7930", "=q2=Heavy Mithril Breastplate", "=ds=#sr# 230"};
			{ 18, "s9974", "7939", "=q3=Truesilver Breastplate", "=ds=#sr# 245"};
			{ 19, "s9916", "7963", "=q2=Steel Breastplate", "=ds=#sr# 200"};
			{ 20, "s3511", "3845", "=q2=Golden Scale Cuirass", "=ds=#sr# 195"};
			{ 21, "s3508", "3844", "=q3=Green Iron Hauberk", "=ds=#sr# 180"};
			{ 22, "s9813", "7914", "=q2=Barbaric Iron Breastplate", "=ds=#sr# 160"};
			{ 23, "s2675", "2870", "=q3=Shining Silver Breastplate", "=ds=#sr# 145"};
			{ 24, "s2673", "2869", "=q2=Silvered Bronze Breastplate", "=ds=#sr# 130"};
			{ 25, "s9972", "7935", "=q2=Ornate Mithril Breastplate", "=ds="..AL["Quest"]..""};
			{ 26, "s8367", "6731", "=q2=Ironforge Breastplate", "=ds=#sr# 100"};
			{ 27, "s2670", "2866", "=q1=Rough Bronze Cuirass", "=ds=#sr# 105"};
			{ 28, "s2667", "2864", "=q2=Runed Copper Breastplate", "=ds=#sr# 80"};
			{ 29, "s3321", "3471", "=q2=Copper Chain Vest", "=ds=#sr# 35"};
			{ 30, "s12260", "10421", "=q1=Rough Copper Vest", "=ds=#sr# 1"};	
		};
		{	Name = BabbleInventory["Armor"].." - Feet";
			{ 1, "s24399", "20039", "=q4=Dark Iron Boots", "=ds=#sr# 300"};
			{ 2, "s23629", "19048", "=q3=Heavy Timbermaw Boots", "=ds=#sr# 300"};
			{ 3, "s16665", "12611", "=q2=Runic Plate Boots", "=ds=#sr# 300"};
			{ 4, "s16657", "12426", "=q2=Imperial Plate Boots", "=ds=#sr# 295"};
			{ 5, "s16656", "12419", "=q2=Radiant Boots", "=ds=#sr# 290"};
			{ 6, "s16652", "12409", "=q2=Thorium Boots", "=ds=#sr# 280"};
			{ 7, "s9979", "7936", "=q2=Ornate Mithril Boots", "=ds="..AL["Quest"]..""};
			{ 8, "s9968", "7933", "=q2=Heavy Mithril Boots", "=ds=#sr# 235"};
			{ 9, "s3515", "3847", "=q2=Golden Scale Boots", "=ds=#sr# 200"};
			{ 10, "s3513", "3846", "=q2=Polished Steel Boots", "=ds=#sr# 185"};
			{ 11, "s9818", "7916", "=q2=Barbaric Iron Boots", "=ds=#sr# 180"};
			{ 12, "s3334", "3484", "=q2=Green Iron Boots", "=ds=#sr# 145"};
			{ 13, "s3331", "3482", "=q2=Silvered Bronze Boots", "=ds=#sr# 130"};
			{ 14, "s7817", "6350", "=q1=Rough Bronze Boots", "=ds=#sr# 95"};
			{ 15, "s3319", "3469", "=q1=Copper Chain Boots", "=ds=#sr# 20"};
		};
		{
			Name = BabbleInventory["Armor"].." - Hands";
			{ 1, "s23637", "19164", "=q4=Dark Iron Gauntlets", "=ds=#sr# 300"};
			{ 2, "s28243", "22670", "=q4=Icebane Gauntlets", "=ds=#sr# 300"};
			{ 3, "s16741", "12639", "=q4=Stronghold Gauntlets", "=ds=#sr# 300"};
			{ 4, "s24138", "19692", "=q3=Bloodsoul Gauntlets", "=ds=#sr# 300"};
			{ 5, "s24912", "20549", "=q3=Darkrune Gauntlets", "=ds=#sr# 300"};
			{ 6, "s23633", "19057", "=q3=Gloves of the Dawn", "=ds=#sr# 300"};
			{ 7, "s28462", "22763", "=q3=Ironvine Gloves", "=ds=#sr# 300"};
			{ 8, "s27589", "22194", "=q4=Black Grasp of the Destroyer", "=ds=#sr# 300"};
			{ 9, "s16661", "12632", "=q3=Storm Gauntlets", "=ds=#sr# 295"};
			{ 10, "s16655", "12631", "=q3=Fiery Plate Gauntlets", "=ds=#sr# 290"};
			{ 11, "s9954", "7938", "=q3=Truesilver Gauntlets", "=ds=#sr# 225"};
			{ 12, "s16654", "12418", "=q2=Radiant Gloves", "=ds=#sr# 285"};
			{ 13, "s9950", "7927", "=q2=Ornate Mithril Gloves", "=ds=#sr# 220"};
			{ 14, "s11643", "9366", "=q2=Golden Scale Gauntlets", "=ds=#sr# 205"};
			{ 15, "s9928", "7919", "=q2=Heavy Mithril Gauntlet", "=ds=#sr# 205"};
			{ 16, "s9820", "7917", "=q2=Barbaric Iron Gloves", "=ds=#sr# 185"};
			{ 17, "s3336", "3485", "=q2=Green Iron Gauntlets", "=ds=#sr# 150"};
			{ 18, "s3333", "3483", "=q2=Silvered Bronze Gauntlets", "=ds=#sr# 135"};
			{ 19, "s3325", "3474", "=q2=Gemmed Copper Gauntlets", "=ds=#sr# 60"};
			{ 20, "s3323", "3472", "=q1=Runed Copper Gauntlets", "=ds=#sr# 40"};
		};
		{
			Name = BabbleInventory["Armor"].." - Head";
			{ 1, "s23636", "19148", "=q4=Dark Iron Helm", "=ds=#sr# 300"};
			{ 2, "s16729", "12640", "=q4=Lionheart Helm", "=ds=#sr# 300"};
			{ 3, "s24913", "20551", "=q3=Darkrune Helm", "=ds=#sr# 300"};
			{ 4, "s16742", "12620", "=q3=Enchanted Thorium Helm", "=ds=#sr# 300"};
			{ 5, "s16728", "12636", "=q3=Helm of the Great Chief", "=ds=#sr# 300"};
			{ 6, "s16724", "12633", "=q3=Whitesoul Helm", "=ds=#sr# 300"};
			{ 7, "s16726", "12612", "=q2=Runic Plate Helm", "=ds="..AL["Drop"]..""};
			{ 8, "s16658", "12427", "=q2=Imperial Plate Helm", "=ds=#sr# 295"};
			{ 9, "s16659", "12417", "=q2=Radiant Circlet", "=ds=#sr# 295"};
			{ 10, "s16653", "12410", "=q2=Thorium Helm", "=ds=#sr# 280"};
			{ 11, "s15293", "11606", "=q2=Dark Iron Mail", "=ds=#sr# 270"};
			{ 12, "s9980", "7937", "=q2=Ornate Mithril Helm", "=ds="..AL["Quest"]..""};
			{ 13, "s9970", "7934", "=q2=Heavy Mithril Helm", "=ds=#sr# 245"};
			{ 14, "s9961", "7931", "=q2=Mithril Coif", "=ds=#sr# 230"};
			{ 15, "s9935", "7922", "=q1=Steel Plate Helm", "=ds=#sr# 215"};
			{ 16, "s3503", "3837", "=q2=Golden Scale Coif", "=ds=#sr# 190"};
			{ 17, "s16726", "12612", "=q2=Runic Plate Helm", "=ds="..AL["Drop"]..""};
			{ 18, "s9814", "7915", "=q2=Barbaric Iron Helm", "=ds=#sr# 175"};
			{ 19, "s3502", "3836", "=q2=Green Iron Helm", "=ds=#sr# 170"};
		};
		{
			Name = BabbleInventory["Armor"].." - Legs";
			{ 1, "s20876", "17013", "=q4=Dark Iron Leggings", "=ds=#sr# 300"};
			{ 3, "s16662", "12414", "=q2=Thorium Leggings", "=ds=#sr# 300"};
			{ 2, "s27829", "22385", "=q4=Titanic Leggings", "=ds=#sr# 300"};
			{ 4, "s24140", "19694", "=q3=Darksoul Leggings", "=ds=#sr# 300"};
			{ 5, "s16744", "12619", "=q3=Enchanted Thorium Leggings", "=ds=#sr# 300"};
			{ 6, "s16730", "12429", "=q2=Imperial Plate Leggings", "=ds=#sr# 300"};
			{ 7, "s16725", "12420", "=q2=Radiant Leggings", "=ds=#sr# 300"};
			{ 8, "s16732", "12614", "=q2=Runic Plate Leggings", "=ds=#sr# 300"};
			{ 9, "s36122", "30069", "=q3=Earthforged Leggings", "=ds=#sr# 260"};
			{ 10, "s36124", "30070", "=q3=Windforged Leggings", "=ds=#sr# 260"};
			{ 11, "s9945", "7926", "=q2=Ornate Mithril Pants", "=ds=#sr# 220"};
			{ 12, "s9931", "7920", "=q2=Mithril Scale Pants", "=ds=#sr# 210"};
			{ 13, "s9933", "7921", "=q2=Heavy Mithril Pants", "=ds=#sr# 210"};
			{ 14, "s9957", "7929", "=q2=Orcish War Leggings", "=ds="..AL["Quest"]..""};
			{ 15, "s3507", "3843", "=q2=Golden Scale Leggings", "=ds=#sr# 170"};
			{ 16, "s3506", "3842", "=q2=Green Iron Leggings", "=ds=#sr# 155"};
			{ 17, "s12259", "10423", "=q2=Silvered Bronze Leggings", "=ds=#sr# 155"};
			{ 18, "s2668", "2865", "=q2=Rough Bronze Leggings", "=ds=#sr# 105"};
			{ 19, "s3324", "3473", "=q2=Runed Copper Pants", "=ds=#sr# 45"};
			{ 20, "s2662", "2852", "=q1=Copper Chain Pants", "=ds=#sr# 1"};			
		};
		{
			Name = BabbleInventory["Armor"].." - Shoulder";
			{ 1, "s20873", "16988", "=q4=Fiery Chain Shoulders", "=ds=#sr# 300"};
			{ 2, "s24137", "19691", "=q3=Bloodsoul Shoulders", "=ds=#sr# 300"};
			{ 3, "s24141", "19695", "=q3=Darksoul Shoulders", "=ds=#sr# 300"};
			{ 4, "s16664", "12610", "=q2=Runic Plate Shoulders", "=ds=#sr# 300"};
			{ 5, "s16660", "12625", "=q3=Dawnbringer Shoulders", "=ds=#sr# 290"};
			{ 6, "s15295", "11605", "=q2=Dark Iron Shoulders", "=ds=#sr# 280"};
			{ 7, "s16646", "12428", "=q2=Imperial Plate Shoulders", "=ds=#sr# 265"};
			{ 8, "s9966", "7932", "=q2=Mithril Scale Shoulders", "=ds=#sr# 235"};
			{ 9, "s9952", "7928", "=q2=Ornate Mithril Shoulder", "=ds=#sr# 225"};
			{ 10, "s9926", "7918", "=q2=Heavy Mithril Shoulder", "=ds=#sr# 205"};
			{ 11, "s3505", "3841", "=q2=Golden Scale Shoulders", "=ds=#sr# 175"};
			{ 12, "s9811", "7913", "=q2=Barbaric Iron Shoulders", "=ds=#sr# 160"};
			{ 13, "s3504", "3840", "=q2=Green Iron Shoulders", "=ds=#sr# 160"};
			{ 14, "s3330", "3481", "=q2=Silvered Bronze Shoulders", "=ds=#sr# 125"};
			{ 15, "s3328", "3480", "=q1=Rough Bronze Shoulders", "=ds=#sr# 110"};
		};
		{
			Name = BabbleInventory["Armor"].." - Waist";
			{ 1, "s27585", "22197", "=q3=Heavy Obsidian Belt", "=ds=#sr# 300"};
			{ 2, "s28463", "22764", "=q3=Ironvine Belt", "=ds=#sr# 300"};
			{ 3, "s27588", "22195", "=q3=Light Obsidian Belt", "=ds=#sr# 300"};
			{ 4, "s20872", "16989", "=q4=Fiery Chain Girdle", "=ds=#sr# 295"};
			{ 5, "s23632", "19051", "=q3=Girdle of the Dawn", "=ds=#sr# 290"};
			{ 6, "s23628", "19043", "=q3=Heavy Timbermaw Belt", "=ds=#sr# 290"};
			{ 7, "s16647", "12424", "=q2=Imperial Plate Belt", "=ds=#sr# 265"};
			{ 8, "s16645", "12416", "=q2=Radiant Belt", "=ds=#sr# 260"};
			{ 9, "s16643", "12406", "=q2=Thorium Belt", "=ds=#sr# 250"};
			{ 10, "s2666", "2857", "=q1=Runed Copper Belt", "=ds=#sr# 70"};
			{ 11, "s2661", "2851", "=q1=Copper Chain Belt", "=ds=#sr# 35"};
		};
		{
			Name = BabbleInventory["Armor"].." - Wrist";
			{ 1, "s28244", "22671", "=q4=Icebane Bracers", "=ds=#sr# 300"};
			{ 2, "s20874", "17014", "=q4=Dark Iron Bracers", "=ds=#sr# 295"};
			{ 3, "s16649", "12425", "=q2=Imperial Plate Bracers", "=ds=#sr# 270"};
			{ 4, "s16644", "12408", "=q2=Thorium Bracers", "=ds=#sr# 255"};
			{ 5, "s9937", "7924", "=q2=Mithril Scale Bracers", "=ds=#sr# 215"};
			{ 6, "s7223", "6040", "=q1=Golden Scale Bracers", "=ds=#sr# 185"};
			{ 7, "s3501", "3835", "=q1=Green Iron Bracers", "=ds=#sr# 165"};
			{ 8, "s2672", "2868", "=q2=Patterned Bronze Bracers", "=ds=#sr# 120"};
			{ 9, "s2664", "2854", "=q1=Runed Copper Bracers", "=ds=#sr# 90"};
			{ 10, "s2663", "2853", "=q1=Copper Bracers", "=ds=#sr# 1"};
		};
		{
			Name = "Weapon - One Handed";
			{ 1, "s23638", "19166", "=q4=Black Amnesty", "=ds=#sr# 300"};
			{ 2, "s23652", "19168", "=q4=Blackguard", "=ds=#sr# 300"};
			{ 3, "s23650", "19170", "=q4=Ebon Hand", "=ds=#sr# 300"};
			{ 4, "s27830", "22384", "=q4=Persuader", "=ds=#sr# 300"};
			{ 5, "s27832", "22383", "=q4=Sageblade", "=ds=#sr# 300"};
			{ 6, "s16991", "12798", "=q3=Annihilator", "=ds=#sr# 300"};
			{ 7, "s20897", "17016", "=q3=Dark Iron Destroyer", "=ds=#sr# 300"};
			{ 8, "s20890", "17015", "=q3=Dark Iron Reaver", "=ds=#sr# 300"};
			{ 9, "s16992", "12797", "=q3=Frostguard", "=ds=#sr# 300"};
			{ 10, "s16995", "12783", "=q3=Heartseeker", "=ds=#sr# 300"};
			{ 11, "s16993", "12794", "=q3=Masterwork Stormhammer", "=ds=#sr# 300"};
			{ 12, "s16983", "12781", "=q3=Serenity", "=ds=#sr# 285"};
			{ 13, "s16978", "12777", "=q3=Blazing Rapier", "=ds=#sr# 280"};
			{ 14, "s16970", "12774", "=q3=Dawn's Edge", "=ds=#sr# 275"};
			{ 15, "s36125", "30071", "=q3=Light Earthforged Blade", "=ds=#sr# 260"};
			{ 16, "s36128", "30073", "=q3=Light Emberforged Hammer", "=ds=#sr# 260"};
			{ 17, "s36126", "30072", "=q3=Light Skyforged Axe", "=ds=#sr# 260"};
			{ 18, "s10007", "7961", "=q3=Phantom Blade", "=ds=#sr# 245"};
			{ 19, "s10003", "7954", "=q3=The Shatterer", "=ds=#sr# 235"};
			{ 20, "s16984", "12792", "=q2=Volcanic Hammer", "=ds=#sr# 290"};
			{ 21, "s16969", "12773", "=q2=Ornate Thorium Handaxe", "=ds=#sr# 275"};
			{ 22, "s10013", "7947", "=q2=Ebon Shiv", "=ds=#sr# 255"};
			{ 23, "s10009", "7946", "=q2=Runed Mithril Hammer", "=ds=#sr# 245"};
			{ 24, "s10005", "7944", "=q2=Dazzling Mithril Rapier", "=ds=#sr# 240"};
			{ 25, "s10001", "7945", "=q2=Big Black Mace", "=ds=#sr# 230"};
			{ 26, "s9997", "7943", "=q2=Wicked Mithril Blade", "=ds=#sr# 225"};
			{ 27, "s9995", "7942", "=q2=Blue Glittering Axe", "=ds=#sr# 220"};
			{ 28, "s9993", "7941", "=q2=Heavy Mithril Axe", "=ds=#sr# 210"};
			{ 29, "s15973", "12260", "=q2=Searing Golden Blade", "=ds=#sr# 190"};
			{ 30, "s21913", "17704", "=q2=Edge of Winter", "=ds=#sr# 190"};
		};
		{
			Name = "Weapon - One Handed";
			{ 1, "s15972", "12259", "=q2=Glinting Steel Dagger", "=ds=#sr# 180"};
			{ 2, "s3493", "3850", "=q2=Jade Serpentblade", "=ds=#sr# 175"};
			{ 3, "s3492", "3849", "=q2=Hardened Iron Shortsword", "=ds=#sr# 160"};
			{ 4, "s3297", "3492", "=q2=Mighty Iron Hammer", "=ds=#sr# 145"};
			{ 5, "s6518", "5541", "=q2=Iridescent Hammer", "=ds=#sr# 140"};
			{ 6, "s3296", "3491", "=q2=Heavy Bronze Mace", "=ds=#sr# 130"};
			{ 7, "s3295", "3490", "=q2=Deadly Bronze Poniard", "=ds=#sr# 125"};
			{ 8, "s6517", "5540", "=q2=Pearl-handled Dagger", "=ds=#sr# 110"};
			{ 9, "s3491", "3848", "=q2=Big Bronze Knife", "=ds=#sr# 105"};
			{ 10, "s3294", "3489", "=q2=Thick War Axe", "=ds=#sr# 70"};
			{ 11, "s43549", "33791", "=q2=Heavy Copper Longsword", "=ds=#sr# 35"};
			{ 12, "s2742", "2850", "=q1=Bronze Shortsword", "=ds=#sr# 120"};
			{ 13, "s2741", "2849", "=q1=Bronze Axe", "=ds=#sr# 115"};
			{ 14, "s2740", "2848", "=q1=Bronze Mace", "=ds=#sr# 110"};
			{ 15, "s2738", "2845", "=q1=Copper Axe", "=ds=#sr# 20"};
			{ 16, "s2737", "2844", "=q1=Copper Mace", "=ds=#sr# 15"};
		};
		{
			Name = "Weapon - Two Handed";
			{ 1, "s23639", "19167", "=q4=Blackfury", "=ds=#sr# 300"};
			{ 2, "s23653", "19169", "=q4=Nightfall", "=ds=#sr# 300"};
			{ 3, "s21161", "17193", "=q4=Sulfuron Hammer", "=ds=#sr# 300"};
			{ 4, "s16990", "12790", "=q3=Arcanite Champion", "=ds=#sr# 300"};
			{ 5, "s16994", "12784", "=q3=Arcanite Reaper", "=ds=#sr# 300"};
			{ 6, "s16988", "12796", "=q3=Hammer of the Titans", "=ds=#sr# 300"};
			{ 7, "s16985", "12782", "=q3=Corruption", "=ds=#sr# 290"};
			{ 8, "s16973", "12776", "=q3=Enchanted Battlehammer", "=ds=#sr# 280"};
			{ 9, "s15294", "11607", "=q3=Dark Iron Sunderer", "=ds=#sr# 275"};
			{ 10, "s15292", "11608", "=q3=Dark Iron Pulverizer", "=ds=#sr# 265"};
			{ 11, "s10015", "7960", "=q3=Truesilver Champion", "=ds=#sr# 260"};
			{ 12, "s10011", "7959", "=q3=Blight", "=ds=#sr# 250"};
			{ 13, "s16971", "12775", "=q2=Huge Thorium Battleaxe", "=ds=#sr# 280"};
			{ 14, "s3500", "3856", "=q2=Shadow Crescent Axe", "=ds=#sr# 200"};
			{ 15, "s3497", "3854", "=q2=Frost Tiger Blade", "=ds=#sr# 200"};
			{ 16, "s3498", "3855", "=q2=Massive Iron Axe", "=ds=#sr# 185"};
			{ 17, "s3496", "3853", "=q2=Moonsteel Broadsword", "=ds=#sr# 180"};
			{ 18, "s3495", "3852", "=q2=Golden Iron Destroyer", "=ds=#sr# 170"};
			{ 19, "s3494", "3851", "=q2=Solid Iron Maul", "=ds=#sr# 155"};
			{ 20, "s3292", "3487", "=q2=Heavy Copper Broadsword", "=ds=#sr# 95"};
			{ 21, "s3293", "3488", "=q2=Copper Battle Axe", "=ds=#sr# 35"};
			{ 22, "s9987", "7958", "=q1=Bronze Battle Axe", "=ds=#sr# 135"};
			{ 23, "s9986", "7957", "=q1=Bronze Greatsword", "=ds=#sr# 130"};
			{ 24, "s9985", "7956", "=q1=Bronze Warhammer", "=ds=#sr# 125"};
			{ 25, "s7408", "6214", "=q1=Heavy Copper Maul", "=ds=#sr# 65"};
			{ 26, "s9983", "7955", "=q1=Copper Claymore", "=ds=#sr# 30"};
			{ 27, "s8880", "7166", "=q1=Copper Dagger", "=ds=#sr# 30"};
			{ 28, "s2739", "2847", "=q1=Copper Shortsword", "=ds=#sr# 25"};

		};
		{
			Name = "Weapon - Thrown";
			{ 1, "s34979", "29201", "=q2=Thick Bronze Darts", "=ds=#sr# 100"};
			{ 2, "s34982", "29203", "=q2=Enchanted Thorium Blades", "=ds=#sr# 300"};
			{ 3, "s34981", "29202", "=q2=Whirling Steel Axes", "=ds=#sr# 200"};
		};
		{
			Name = "Shield";
			{ 1, "s27586", "22198", "=q4=Jagged Obsidian Shield", "=ds=#sr# 300"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s16641", "12404", "=q1=Dense Sharpening Stone", "=ds=#sr# 250"};
			{ 2, "s16640", "12643", "=q1=Dense Weightstone", "=ds=#sr# 250"};
			{ 3, "s9918", "7964", "=q1=Solid Sharpening Stone", "=ds=#sr# 200"};
			{ 4, "s9921", "7965", "=q1=Solid Weightstone", "=ds=#sr# 200"};
			{ 5, "s7224", "6041", "=q1=Steel Weapon Chain", "=ds=#sr# 190"};
			{ 6, "s7222", "6043", "=q1=Iron Counterweight", "=ds=#sr# 165"};
			{ 7, "s7221", "6042", "=q1=Iron Shield Spike", "=ds=#sr# 150"};
			{ 8, "s2674", "2871", "=q1=Heavy Sharpening Stone", "=ds=#sr# 125"};
			{ 9, "s3117", "3241", "=q1=Heavy Weightstone", "=ds=#sr# 125"};
			{ 10, "s2665", "2863", "=q1=Coarse Sharpening Stone", "=ds=#sr# 65"};
			{ 11, "s3116", "3240", "=q1=Coarse Weightstone", "=ds=#sr# 65"};
			{ 12, "s2660", "2862", "=q1=Rough Sharpening Stone", "=ds=#sr# 1"};
			{ 13, "s3115", "3239", "=q1=Rough Weightstone", "=ds=#sr# 1"};
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
			{ 1, "s36122", "30069", "=q3=Earthforged Leggings", "=ds=#sr# 260"};
			{ 2, "s36124", "30070", "=q3=Windforged Leggings", "=ds=#sr# 260"};
		};
		{
			Name = WEAPONSMITH;
			{ 1, "s36125", "30071", "=q3=Light Earthforged Blade", "=ds=#sr# 260"};
			{ 2, "s36128", "30073", "=q3=Light Emberforged Hammer", "=ds=#sr# 260"};
			{ 3, "s36126", "30072", "=q3=Light Skyforged Axe", "=ds=#sr# 260"};
		};
	};
		---------------
		--- Cooking ---
		---------------

	AtlasLoot_Data["CookingCLASSIC"] = {
			Name = COOKING;
			Type = "CraftingNoBF";
		{
			Name = COOKING;
			{ 1, "s25659", "21023", "=q1=Dirge's Kickin' Chimaerok Chops", "=ds="..AL["Quest"]..""};
			{ 2, "s966455", "100626", "=q1=Azerothian Schmorgus Boards", "=ds="..AL["Vendor"]..""};
			{ 3, "s966436", "100609", "=q1=Chilled Lava Eels", "=ds="..AL["Vendor"]..""};
			{ 4, "s966435", "100608", "=q1=Chillwind Flank Steaks", "=ds="..AL["Drop"]..""};
			{ 5, "s966434", "100607", "=q1=Hippogryph Steaks", "=ds="..AL["Quest"]..""};
			{ 6, "s966433", "100606", "=q1=Steamed Makrinni Claws", "=ds="..AL["Quest"]..""};
			{ 7, "s966432", "100605", "=q1=Rubbed Ravasaur Ribss", "=ds="..AL["Drop"]..""};
			{ 8, "s966431", "100604", "=q1=Hearty Stegodon Stews", "=ds="..AL["Drop"]..""};
			{ 9, "s966430", "100603", "=q1=Crispy Pterrordax Wings", "=ds="..AL["Drop"]..""};
			{ 10, "s966429", "100602", "=q1=Spicy Dino Jerkys", "=ds="..AL["Drop"]..""};
			{ 11, "s966428", "100601", "=q1=Dirge's Nevermelt Ice Creams", "=ds="..AL["Quest"]..""};
			{ 12, "s966427", "100599", "=q1=Silithid Snacks", "=ds="..AL["Quest"]..""};
			{ 13, "s966426", "100598", "=q1=Hydra Scale Soups", "=ds="..AL["Quest"]..""};
			{ 14, "s966425", "100597", "=q1=Ghostly Goulashs", "=ds="..AL["Quest"]..""};
			{ 15, "s966398", "100583", "=q1=Seared Cunning Carps", "=ds="..AL["Drop"]..""};
		};
		{
			Name = COOKING;
			{ 1, "s24801", "20452", "=q1=Smoked Desert Dumplings", "=ds="..AL["Quest"]..""};
			{ 2, "s18247", "13935", "=q1=Baked Salmon", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
			{ 3, "s18245", "13933", "=q1=Lobster Stew", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
			{ 4, "s18246", "13934", "=q1=Mightfish Steak", "=ds="..AL["Vendor"]..", "..BabbleZone["Feralas"]};
			{ 5, "s22761", "18254", "=q1=Runn Tum Tuber Surprise", "=ds="..AL["Drop"]..""};
			{ 6, "s46684", "35563", "=q1=Charred Bear Kabobs", "=ds="..AL["Vendor"]..", "..BabbleZone["Felwood"]};
			{ 7, "s46688", "35565", "=q1=Juicy Bear Burger", "=ds="..AL["Vendor"]..", "..BabbleZone["Felwood"]};
			{ 8, "s18243", "13931", "=q1=Nightfin Soup", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 9, "s18244", "13932", "=q1=Poached Sunscale Salmon", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 10, "s18240", "13928", "=q1=Grilled Squid", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 11, "s18242", "13929", "=q1=Hot Smoked Bass", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
			{ 12, "s64054", "INV_Misc_Shell_03", "=q1=Clamlette Magnifique", "=ds="..AL["Quest"]..""};
			{ 13, "s18239", "13927", "=q1=Cooked Glossy Mightfish", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
			{ 14, "s18241", "13930", "=q1=Filet of Redgill", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
			{ 15, "s15933", "12218", "=q1=Monster Omelet", "=ds="..AL["Vendor"]..""};
			{ 16, "s15915", "12216", "=q1=Spiced Chili Crab", "=ds="..AL["Vendor"]..""};
			{ 17, "s18238", "6887", "=q1=Spotted Yellowtail", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 18, "s22480", "18045", "=q1=Tender Wolf Steak", "=ds="..AL["Vendor"]..""};
			{ 19, "s20626", "16766", "=q1=Undermine Clam Chowder", "=ds="..AL["Vendor"]..", "..BabbleZone["Tanaris"]};
			{ 20, "s15906", "12217", "=q1=Dragonbreath Chili", "=ds="..AL["Vendor"]..""};
			{ 21, "s15910", "12215", "=q1=Heavy Kodo Stew", "=ds="..AL["Vendor"]..", "..BabbleZone["Desolace"]};
			{ 22, "s21175", "17222", "=q1=Spider Sausage", "=ds="..AL["Trainer"]};
			{ 23, "s4094", "4457", "=q1=Barbecued Buzzard Wing", "=ds="};
			{ 24, "s15863", "12213", "=q1=Carrion Surprise", "=ds="..AL["Vendor"]..""};
			{ 25, "s7213", "6038", "=q1=Giant Clam Scorcho", "=ds="..AL["Vendor"]..", "..BabbleZone["Stranglethorn Vale"]};
			{ 26, "s13028", "10841", "=q1=Goldthorn Tea", "=ds="};
			{ 27, "s15856", "13851", "=q1=Hot Wolf Ribs", "=ds="..AL["Vendor"]..""};
		};
		{
			Name = COOKING;	
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
		};
		{
			Name = COOKING;	
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
		};
		{
			Name = COOKING;	
			{ 1, "s15935", "12224", "=q1=Crispy Bat Wing", "=ds="..AL["Vendor"]..""};
			{ 2, "s43779", "33924", "=q1=Delicious Chocolate Cake", "=ds="..AL["Drop"]..""};
			{ 3, "s21143", "17197", "=q1=Gingerbread Cookie", "=ds="..AL["Vendor"]..""};
			{ 4, "s8604", "6888", "=q1=Herb Baked Egg", "=ds="};
			{ 5, "s2540", "2681", "=q1=Roasted Boar Meat", "=ds="};
			{ 6, "s33277", "24105", "=q1=Roasted Moongraze Tenderloin", "=ds="..AL["Quest"]..""};
			{ 7, "s7752", "787", "=q1=Slitherskin Mackerel", "=ds="..AL["Vendor"]..""};
			{ 8, "s37836", "30816", "=q1=Spice Bread", "=ds="..AL["Trainer"]};
			{ 9, "s65454", "46691", "=q1=Bread of the Dead", "=ds="..AL["Vendor"]};
		};
	};

		------------------
		--- Enchanting ---
		------------------

	AtlasLoot_Data["EnchantingCLASSIC"] = {
			Name = ENCHANTING;
			Type = "CraftingNoBF";
					{
			Name = AL["Enchant Boots"];
			{ 1, "s20023", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Agility", "=ds=#sr# 295"};
			{ 2, "s20024", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Spirit", "=ds=#sr# 275"};
			{ 3, "s20020", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Stamina", "=ds=#sr# 260"};
			{ 4, "s63746", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Accuracy", "=ds="};
			{ 5, "s13935", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Agility", "=ds=#sr# 235"};
			{ 6, "s13890", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Speed", "=ds=#sr# 225"};
			{ 16, "s13836", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Stamina", "=ds=#sr# 215"};
			{ 17, "s13687", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Spirit", "=ds=#sr# 190"};
			{ 18, "s13644", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Stamina", "=ds=#sr# 170"};
			{ 19, "s13637", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Agility", "=ds=#sr# 160"};
			{ 20, "s7867", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Agility", "=ds=#sr# 125"};
			{ 21, "s7863", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Stamina", "=ds=#sr# 125"};
		};
		{
			Name = AL["Enchant Bracer"];
			{ 1, "s23802", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Healing Power", "=ds=#sr# 300"};
			{ 2, "s20011", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Stamina", "=ds=#sr# 300"};
			{ 3, "s20010", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Strength", "=ds=#sr# 295"};
			{ 4, "s23801", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Mana Regeneration", "=ds=#sr# 290"};
			{ 5, "s20009", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Spirit", "=ds=#sr# 270"};
			{ 6, "s20008", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Intellect", "=ds=#sr# 255"};
			{ 7, "s13939", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Strength", "=ds=#sr# 240"};
			{ 8, "s13945", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Stamina", "=ds=#sr# 245"};
			{ 9, "s13931", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Deflection", "=ds=#sr# 235"};
			{ 10, "s13846", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Spirit", "=ds=#sr# 220"};
			{ 11, "s13822", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Intellect", "=ds=#sr# 210"};
			{ 12, "s13661", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Strength", "=ds=#sr# 180"};
			{ 13, "s13646", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Deflection", "=ds=#sr# 170"};
			{ 14, "s13648", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Stamina", "=ds=#sr# 170"};
			{ 15, "s13642", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Spirit", "=ds=#sr# 165"};
			{ 16, "s13622", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Intellect", "=ds=#sr# 150"};
			{ 17, "s13536", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Strength", "=ds=#sr# 140"};
			{ 18, "s13501", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Stamina", "=ds=#sr# 130"};
			{ 19, "s7859", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Spirit", "=ds=#sr# 120"};
			{ 20, "s7779", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Agility", "=ds=#sr# 80"};
			{ 21, "s7782", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Strength", "=ds=#sr# 80"};
			{ 22, "s7457", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Stamina", "=ds=#sr# 50"};
			{ 23, "s7766", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Spirit", "=ds=#sr# 60"};
			{ 24, "s7418", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Health", "=ds=#sr# 1"};
			{ 25, "s7428", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Deflection", "=ds=#sr# 1"};
		};
		{
			Name = AL["Enchant Chest"];
			{ 1, "s20025", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Stats", "=ds=#sr# 300"};
			{ 2, "s33991", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Restore Mana Prime", "=ds=#sr# 300"};
			{ 3, "s20028", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Mana", "=ds=#sr# 290"};
			{ 4, "s20026", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Health", "=ds=#sr# 275"};
			{ 5, "s13941", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Stats", "=ds=#sr# 245"};
			{ 6, "s13917", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Mana", "=ds=#sr# 230"};
			{ 7, "s13858", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Health", "=ds=#sr# 220"};
			{ 8, "s13700", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Stats", "=ds=#sr# 200"};
			{ 9, "s13663", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Mana", "=ds=#sr# 185"};
			{ 10, "s13640", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Health", "=ds=#sr# 160"};
			{ 11, "s13626", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Stats", "=ds=#sr# 150"};
			{ 12, "s13607", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mana", "=ds=#sr# 145"};
			{ 13, "s13538", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Absorption", "=ds=#sr# 140"};
			{ 14, "s7857", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Health", "=ds=#sr# 120"};
			{ 15, "s7776", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Mana", "=ds=#sr# 80"};
			{ 16, "s7748", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Health", "=ds=#sr# 60"};
			{ 17, "s7443", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Mana", "=ds=#sr# 20"};
			{ 18, "s7420", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Health", "=ds=#sr# 15"};
		};
		{
			Name = AL["Enchant Cloak"];
			{ 1, "s25081", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Fire Resistance", "=ds=#sr# 300"};
			{ 2, "s20015", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Defense", "=ds=#sr# 285"};
			{ 3, "s20014", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Resistance", "=ds=#sr# 265"};
			{ 4, "s13882", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Agility", "=ds=#sr# 225"};
			{ 5, "s13746", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Defense", "=ds=#sr# 205"};
			{ 6, "s13794", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Resistance", "=ds=#sr# 205"};
			{ 7, "s13657", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Fire Resistance", "=ds=#sr# 175"};
			{ 8, "s13635", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Defense", "=ds=#sr# 155"};
			{ 9, "s13522", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Shadow Resistance", "=ds=#sr# 135"};
			{ 10, "s7861", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Fire Resistance", "=ds=#sr# 125"};
			{ 11, "s13419", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Agility", "=ds=#sr# 110"};
			{ 12, "s13421", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Protection", "=ds=#sr# 115"};
			{ 13, "s7771", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Protection", "=ds=#sr# 70"};
			{ 14, "s7454", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Resistance", "=ds=#sr# 45"};
			{ 15, "s7426", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Absorption", "=ds=#sr# 40"};
		};
		{
			Name = AL["Enchant Gloves"];	
			{ 1, "s25078", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fire Power", "=ds=#sr# 300"};
			{ 2, "s25074", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Frost Power", "=ds=#sr# 300"};
			{ 3, "s25079", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Healing Power", "=ds=#sr# 300"};
			{ 4, "s25073", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Shadow Power", "=ds=#sr# 300"};
			{ 5, "s25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility", "=ds=#sr# 300"};
			{ 6, "s25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat", "=ds=#sr# 300"};
			{ 7, "s20013", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Strength", "=ds=#sr# 295"};
			{ 8, "s20012", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Agility", "=ds=#sr# 270"};
			{ 9, "s13948", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Minor Haste", "=ds=#sr# 250"};
			{ 10, "s13947", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Riding Skill", "=ds=#sr# 250"};
			{ 11, "s13868", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Herbalism", "=ds=#sr# 225"};
			{ 12, "s13887", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Strength", "=ds=#sr# 225"};
			{ 13, "s13841", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Mining", "=ds=#sr# 215"};
			{ 14, "s13815", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Agility", "=ds=#sr# 210"};
			{ 15, "s13698", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Skinning", "=ds=#sr# 200"};
			{ 16, "s13620", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fishing", "=ds=#sr# 145"};
			{ 17, "s13617", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Herbalism", "=ds=#sr# 145"};
			{ 18, "s13612", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Mining", "=ds=#sr# 145"};
		};
		{
			Name = AL["Enchant Shield"];
			{ 1, "s20016", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Superior Spirit", "=ds=#sr# 280"};
			{ 2, "s20017", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Stamina", "=ds=#sr# 265"};
			{ 3, "s13933", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Frost Resistance", "=ds=#sr# 235"};
			{ 4, "s13905", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Spirit", "=ds=#sr# 230"};
			{ 5, "s13817", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Stamina", "=ds=#sr# 210"};
			{ 6, "s13689", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Block", "=ds=#sr# 195"};
			{ 7, "s13659", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Spirit", "=ds=#sr# 180"};
			{ 8, "s13631", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Stamina", "=ds=#sr# 155"};
			{ 9, "s13485", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Spirit", "=ds=#sr# 130"};
			{ 10, "s13464", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Protection", "=ds=#sr# 115"};
			{ 11, "s13378", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Minor Stamina", "=ds=#sr# 105"};
		};
		{
			Name = AL["Enchant 2H Weapon"];
			{ 1, "s20036", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Intellect", "=ds=#sr# 300"};
			{ 2, "s20035", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Spirit", "=ds=#sr# 300"};
			{ 3, "s20030", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Superior Impact", "=ds=#sr# 295"};
			{ 4, "s27837", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Agility", "=ds=#sr# 290"};
			{ 5, "s13937", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Greater Impact", "=ds=#sr# 240"};
			{ 6, "s13695", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Impact", "=ds=#sr# 200"};
			{ 7, "s13529", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Impact", "=ds=#sr# 145"};
			{ 8, "s13380", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Spirit", "=ds=#sr# 110"};
			{ 9, "s7793", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Intellect", "=ds=#sr# 100"};
			{ 10, "s7745", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Minor Impact", "=ds=#sr# 100"};
		};
		{
			Name = AL["Enchant Weapon"];
			{ 1, "s20034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Crusader", "=ds=#sr# 300"};
			{ 2, "s22750", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Healing Power", "=ds=#sr# 300"};
			{ 3, "s20032", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lifestealing", "=ds=#sr# 300"};
			{ 4, "s23804", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Intellect", "=ds=#sr# 300"};
			{ 5, "s23803", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Spirit", "=ds=#sr# 300"};
			{ 6, "s22749", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spell Power", "=ds=#sr# 300"};
			{ 7, "s20031", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Superior Striking", "=ds=#sr# 300"};
			{ 8, "s20033", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Unholy Weapon", "=ds=#sr# 295"};
			{ 9, "s23800", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Agility", "=ds=#sr# 290"};
			{ 10, "s23799", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Strength", "=ds=#sr# 290"};
			{ 11, "s20029", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Icy Chill", "=ds=#sr# 285"};
			{ 12, "s13898", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Fiery Weapon", "=ds=#sr# 265"};
			{ 13, "s13943", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Striking", "=ds=#sr# 245"};
			{ 14, "s13915", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Demonslaying", "=ds=#sr# 230"};
			{ 15, "s13693", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Striking", "=ds=#sr# 195"};
			{ 16, "s21931", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Winter's Might", "=ds=#sr# 190"};
			{ 17, "s13655", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Elemental Slayer", "=ds=#sr# 175"};
			{ 18, "s13653", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Beastslayer", "=ds=#sr# 175"};
			{ 19, "s13503", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Striking", "=ds=#sr# 140"};
			{ 20, "s7786", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Beastslayer", "=ds=#sr# 90"};
			{ 21, "s7788", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Striking", "=ds=#sr# 90"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s25130", "20748", "=q1=Brilliant Mana Oil", "=ds=#sr# 300"};
			{ 2, "s25129", "20749", "=q1=Brilliant Wizard Oil", "=ds=#sr# 300"};
			{ 3, "s32664", "22461", "=q1=Runed Fel Iron Rod", "=ds=#sr# 300"};
			{ 4, "s20051", "16207", "=q1=Runed Arcanite Rod", "=ds=#sr# 290"};
			{ 5, "s25128", "20750", "=q1=Wizard Oil", "=ds=#sr# 275"};
			{ 6, "s17180", "12655", "=q1=Enchanted Thorium", "=ds=#sr# 250"};
			{ 7, "s25127", "20747", "=q1=Lesser Mana Oil", "=ds=#sr# 250"};
			{ 8, "s17181", "12810", "=q1=Enchanted Leather", "=ds=#sr# 250"};
			{ 9, "s25126", "20746", "=q1=Lesser Wizard Oil", "=ds=#sr# 200"};
			{ 10, "s13702", "11145", "=q1=Runed Truesilver Rod", "=ds=#sr# 200"};
			{ 11, "s25125", "20745", "=q1=Minor Mana Oil", "=ds=#sr# 150"};
			{ 12, "s13628", "11130", "=q1=Runed Golden Rod", "=ds=#sr# 150"};
			{ 13, "s7795", "6339", "=q1=Runed Silver Rod", "=ds=#sr# 100"};
			{ 14, "s25124", "20744", "=q1=Minor Wizard Oil", "=ds=#sr# 45"};
			{ 15, "s7421", "6218", "=q1=Runed Copper Rod", "=ds=#sr# 1"};
			{ 16, "s14810", "11290", "=q2=Greater Mystic Wand", "=ds=#sr# 175"};
			{ 17, "s14809", "11289", "=q2=Lesser Mystic Wand", "=ds=#sr# 155"};
			{ 18, "s14807", "11288", "=q2=Greater Magic Wand", "=ds=#sr# 70"};
			{ 19, "s14293", "11287", "=q2=Lesser Magic Wand", "=ds=#sr# 10"};
		};
	};

		-------------------
		--- Engineering ---
		-------------------

	AtlasLoot_Data["EngineeringCLASSIC"] = {
			Name = ENGINEERING;
			Type = "Crafting";
					{
			Name = AL["Ammunition"];
			{ 1, "s19800", "15997", "=q2=Thorium Shells", "=ds=#sr# 285"};
			{ 2, "s12621", "10513", "=q2=Mithril Gyro-Shot", "=ds=#sr# 245"};
			{ 3, "s12596", "10512", "=q2=Hi-Impact Mithril Slugs", "=ds=#sr# 210"};
			{ 4, "s3947", "8069", "=q1=Crafted Solid Shot", "=ds=#sr# 125"};
			{ 5, "s3930", "8068", "=q1=Crafted Heavy Shot", "=ds=#sr# 75"};
			{ 6, "s3920", "8067", "=q1=Crafted Light Shot", "=ds=#sr# 1"};
		};
		{
			Name = BabbleInventory["Armor"];
			{ 1, "s19830", "16022", "=q3=Arcanite Dragonling", "=ds=#sr# 300"};
			{ 2, "s24356", "19999", "=q3=Bloodvine Goggles", "=ds=#sr# 300"};
			{ 3, "s24357", "19998", "=q3=Bloodvine Lens", "=ds=#sr# 300"};
			{ 4, "s23082", "18639", "=q3=Ultra-Flash Shadow Reflector", "=ds=#sr# 300"};
			{ 5, "s23081", "18638", "=q3=Hyper-Radiant Flame Reflector", "=ds=#sr# 290"};
			{ 6, "s23077", "18634", "=q3=Gyrofreeze Ice Reflector", "=ds=#sr# 260"};
			{ 7, "s12622", "10504", "=q3=Green Lens", "=ds=#sr# 245"};
			{ 8, "s19825", "16008", "=q2=Master Engineer's Goggles", "=ds=#sr# 290"};
			{ 9, "s19819", "16009", "=q2=Voice Amplification Modulator", "=ds=#sr# 290"};
			{ 10, "s23079", "18637", "=q2=Major Recombobulator", "=ds=#sr# 275"};
			{ 11, "s19794", "15999", "=q2=Spellpower Goggles Xtreme Plus", "=ds=#sr# 270"};
			{ 12, "s12624", "10576", "=q2=Mithril Mechanical Dragonling", "=ds=#sr# 250"};
			{ 13, "s12617", "10506", "=q2=Deepdive Helmet", "=ds=#sr# 230"};
			{ 14, "s12618", "10503", "=q2=Rose Colored Goggles", "=ds=#sr# 230"};
			{ 15, "s12616", "10518", "=q2=Parachute Cloak", "=ds=#sr# 225"};
			{ 16, "s12615", "10502", "=q2=Spellpower Goggles Xtreme", "=ds=#sr# 225"};
			{ 17, "s12607", "10501", "=q2=Catseye Ultra Goggles", "=ds=#sr# 220"};
			{ 18, "s12594", "10500", "=q2=Fire Goggles", "=ds=#sr# 205"};
			{ 19, "s3969", "4396", "=q1=Mechanical Dragonling", "=ds=#sr# 200"};
			{ 20, "s3966", "4393", "=q2=Craftsman's Monocle", "=ds=#sr# 185"};
			{ 21, "s12587", "10499", "=q2=Bright-Eye Goggles", "=ds=#sr# 175"};
			{ 22, "s3956", "4385", "=q2=Green Tinted Goggles", "=ds=#sr# 150"};
			{ 23, "s3952", "4381", "=q2=Minor Recombobulator", "=ds=#sr# 140"};
			{ 24, "s3940", "4373", "=q2=Shadow Goggles", "=ds=#sr# 120"};
			{ 25, "s3934", "4368", "=q2=Flying Tiger Goggles", "=ds=#sr# 100"};
		};
		{
			Name = AL["Explosives"];
			{ 1, "s19831", "16040", "=q1=Arcane Bomb", "=ds=#sr# 300"};
			{ 2, "s19799", "16005", "=q1=Dark Iron Bomb", "=ds=#sr# 285"};
			{ 3, "s23080", "18594", "=q1=Powerful Seaforium Charge", "=ds=#sr# 275"};
			{ 4, "s19790", "15993", "=q1=Thorium Grenade", "=ds=#sr# 260"};
			{ 5, "s23070", "18641", "=q1=Dense Dynamite", "=ds=#sr# 250"};
			{ 6, "s12619", "10562", "=q1=Hi-Explosive Bomb", "=ds=#sr# 235"};
			{ 7, "s12754", "10586", "=q1=The Big One", "=ds=#sr# 235"};
			{ 8, "s12603", "10514", "=q1=Mithril Frag Bomb", "=ds=#sr# 215"};
			{ 9, "s12716", "10577", "=q1=Goblin Mortar", "=ds=#sr# 205"};
			{ 10, "s12760", "10646", "=q1=Goblin Sapper Charge", "=ds=#sr# 205"};
			{ 11, "s13240", "10577", "=q1=The Mortar: Reloaded", "=ds=#sr# 205"};
			{ 12, "s23069", "18588", "=q1=EZ-Thro Dynamite II", "=ds=#sr# 200"};
			{ 13, "s3972", "4398", "=q1=Large Seaforium Charge", "=ds=#sr# 200"};
			{ 14, "s3968", "4395", "=q1=Goblin Land Mine", "=ds=#sr# 195"};
			{ 15, "s3967", "4394", "=q1=Big Iron Bomb", "=ds=#sr# 190"};
			{ 16, "s3962", "4390", "=q1=Iron Grenade", "=ds=#sr# 175"};
			{ 17, "s12586", "10507", "=q1=Solid Dynamite", "=ds=#sr# 175"};
			{ 18, "s3960", "4403", "=q1=Portable Bronze Mortar", "=ds=#sr# 165"};
			{ 19, "s3950", "4380", "=q1=Big Bronze Bomb", "=ds=#sr# 140"};
			{ 20, "s3946", "4378", "=q1=Heavy Dynamite", "=ds=#sr# 125"};
			{ 21, "s3941", "4374", "=q1=Small Bronze Bomb", "=ds=#sr# 120"};
			{ 22, "s3937", "4370", "=q1=Large Copper Bomb", "=ds=#sr# 105"};
			{ 23, "s8339", "6714", "=q1=EZ-Thro Dynamite", "=ds=#sr# 100"};
			{ 24, "s3933", "4367", "=q1=Small Seaforium Charge", "=ds=#sr# 100"};
			{ 25, "s3931", "4365", "=q1=Coarse Dynamite", "=ds=#sr# 75"};
			{ 26, "s3923", "4360", "=q1=Rough Copper Bomb", "=ds=#sr# 30"};
			{ 27, "s3919", "4358", "=q1=Rough Dynamite", "=ds=#sr# 1"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s22793", "18283", "=q3=Biznicks 247x128 Accurascope", "=ds=#sr# 300"};
			{ 2, "s12620", "10548", "=q1=Sniper Scope", "=ds=#sr# 240"};
			{ 3, "s12597", "10546", "=q1=Deadly Scope", "=ds=#sr# 210"};
			{ 4, "s3979", "4407", "=q2=Accurate Scope", "=ds=#sr# 180"};
			{ 5, "s3978", "4406", "=q1=Standard Scope", "=ds=#sr# 110"};
			{ 6, "s3977", "4405", "=q1=Crude Scope", "=ds=#sr# 60"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s22704", "18232", "=q1=Field Repair Bot 74A", "=ds=#sr# 300"};
			{ 2, "s30573", "23832", "=q1=Gnomish Tonk Controller", "=ds=#sr# 295"};
			{ 3, "s30561", "23831", "=q1=Goblin Tonk Controller", "=ds=#sr# 295"};
			{ 4, "s26443", "21570", "=q1=Firework Cluster Launcher", "=ds=#sr# 275"};
			{ 5, "s19814", "16023", "=q1=Masterwork Target Dummy", "=ds=#sr# 275"};
			{ 6, "s26426", "21714", "=q1=Large Blue Rocket Cluster", "=ds=#sr# 275"};
			{ 7, "s26427", "21716", "=q1=Large Green Rocket Cluster", "=ds=#sr# 275"};
			{ 8, "s26428", "21718", "=q1=Large Red Rocket Cluster", "=ds=#sr# 275"};
			{ 9, "s23096", "18645", "=q1=Alarm-O-Bot", "=ds=#sr# 265"};
			{ 10, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "=ds=#sr# 265"};
			{ 11, "s19793", "15996", "=q1=Lifelike Mechanical Toad", "=ds=#sr# 265"};
			{ 12, "s19567", "15846", "=q1=Salt Shaker", "=ds=#sr# 250"};
			{ 13, "s26011", "21277", "=q1=Tranquil Mechanical Yeti", "=ds=#sr# 250"};
			{ 14, "s23507", "19026", "=q1=Snake Burst Firework", "=ds=#sr# 250"};
			{ 15, "s26442", "21569", "=q1=Firework Launcher", "=ds=#sr# 225"};
			{ 16, "s26423", "21571", "=q1=Blue Rocket Cluster", "=ds=#sr# 225"};
			{ 17, "s26424", "21574", "=q1=Green Rocket Cluster", "=ds=#sr# 225"};
			{ 18, "s26425", "21576", "=q1=Red Rocket Cluster", "=ds=#sr# 225"};
			{ 19, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# 210"};
			{ 20, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# 205"};
			{ 21, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# 205"};
			{ 22, "s15633", "11826", "=q1=Lil' Smoky", "=ds=#sr# 205"};
			{ 23, "s15628", "11825", "=q1=Pet Bombling", "=ds=#sr# 205"};
			{ 24, "s15255", "11590", "=q1=Mechanical Repair Kit", "=ds=#sr# 200"};
			{ 25, "s21940", "17716", "=q1=Snowmaster 9000", "=ds=#sr# 190"};
			{ 26, "s3965", "4392", "=q1=Advanced Target Dummy", "=ds=#sr# 185"};
			{ 27, "s8243", "4852", "=q1=Flash Bomb", "=ds=#sr# 185"};
			{ 28, "s26420", "21589", "=q1=Large Blue Rocket", "=ds=#sr# 175"};
			{ 29, "s26421", "21590", "=q1=Large Green Rocket", "=ds=#sr# 175"};
			{ 30, "s26422", "21592", "=q1=Large Red Rocket", "=ds=#sr# 175"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s3963", "4391", "=q1=Compact Harvest Reaper Kit", "=ds=#sr# 175"};
			{ 2, "s9273", "7148", "=q1=Goblin Jumper Cables", "=ds=#sr# 165"};
			{ 3, "s3959", "4388", "=q1=Discombobulator Ray", "=ds=#sr# 160"};
			{ 4, "s3957", "4386", "=q1=Ice Deflector", "=ds=#sr# 155"};
			{ 5, "s3955", "4384", "=q1=Explosive Sheep", "=ds=#sr# 150"};
			{ 6, "s9271", "6533", "=q1=Aquadynamic Fish Attractor", "=ds=#sr# 150"};
			{ 7, "s23067", "9312", "=q1=Blue Firework", "=ds=#sr# 150"};
			{ 8, "s23068", "9313", "=q1=Green Firework", "=ds=#sr# 150"};
			{ 9, "s23066", "9318", "=q1=Red Firework", "=ds=#sr# 150"};
			{ 10, "s6458", "5507", "=q1=Ornate Spyglass", "=ds=#sr# 135"};
			{ 11, "s26416", "21558", "=q1=Small Blue Rocket", "=ds=#sr# 125"};
			{ 12, "s26417", "21559", "=q1=Small Green Rocket", "=ds=#sr# 125"};
			{ 13, "s26418", "21557", "=q1=Small Red Rocket", "=ds=#sr# 125"};
			{ 14, "s3944", "4376", "=q1=Flame Deflector", "=ds=#sr# 125"};
			{ 15, "s8334", "6712", "=q1=Practice Lock", "=ds=#sr# 100"};
			{ 16, "s3932", "4366", "=q1=Target Dummy", "=ds=#sr# 85"};
			{ 17, "s3928", "4401", "=q1=Mechanical Squirrel", "=ds=#sr# 75"};
		};
		{
			Name = AL["Reagents"];
			{ 1, "s19815", "16006", "=q1=Delicate Arcanite Converter", "=ds=#sr# 285"};
			{ 2, "s19795", "16000", "=q1=Thorium Tube", "=ds=#sr# 275"};
			{ 3, "s39895", "7191", "=q1=Fused Wiring", "=ds=#sr# 275"};
			{ 4, "s19791", "15994", "=q1=Thorium Widget", "=ds=#sr# 260"};
			{ 5, "s23071", "18631", "=q1=Truesilver Transformer", "=ds=#sr# 260"};
			{ 6, "s19788", "15992", "=q1=Dense Blasting Powder", "=ds=#sr# 250"};
			{ 7, "s12599", "10561", "=q1=Mithril Casing", "=ds=#sr# 215"};
			{ 8, "s12591", "10560", "=q1=Unstable Trigger", "=ds=#sr# 200"};
			{ 9, "s12589", "10559", "=q1=Mithril Tube", "=ds=#sr# 195"};
			{ 10, "s12590", "10498", "=q1=Gyromatic Micro-Adjustor", "=ds=#sr# 175"};
			{ 11, "s12585", "10505", "=q1=Solid Blasting Powder", "=ds=#sr# 175"};
			{ 12, "s3961", "4389", "=q1=Gyrochronatom", "=ds=#sr# 170"};
			{ 13, "s3958", "4387", "=q1=Iron Strut", "=ds=#sr# 160"};
			{ 14, "s12584", "10558", "=q1=Gold Power Core", "=ds=#sr# 150"};
			{ 15, "s3953", "4382", "=q1=Bronze Framework", "=ds=#sr# 145"};
			{ 16, "s3942", "4375", "=q1=Whirring Bronze Gizmo", "=ds=#sr# 125"};
			{ 17, "s3945", "4377", "=q1=Heavy Blasting Powder", "=ds=#sr# 125"};
			{ 18, "s3938", "4371", "=q1=Bronze Tube", "=ds=#sr# 105"};
			{ 19, "s3973", "4404", "=q1=Silver Contact", "=ds=#sr# 90"};
			{ 20, "s3929", "4364", "=q1=Coarse Blasting Powder", "=ds=#sr# 75"};
			{ 21, "s3926", "4363", "=q1=Copper Modulator", "=ds=#sr# 65"};
			{ 22, "s3924", "4361", "=q1=Copper Tube", "=ds=#sr# 50"};
			{ 23, "s3922", "4359", "=q1=Handful of Copper Bolts", "=ds=#sr# 30"};
			{ 24, "s3918", "4357", "=q1=Rough Blasting Powder", "=ds=#sr# 1"};
		};
		{
			Name = BabbleInventory["Weapon"];
			{ 1, "s22795", "18282", "=q4=Core Marksman Rifle", "=ds=#sr# 300"};
			{ 2, "s19833", "16007", "=q3=Flawless Arcanite Rifle", "=ds=#sr# 300"};
			{ 3, "s19796", "16004", "=q3=Dark Iron Rifle", "=ds=#sr# 275"};
			{ 4, "s19792", "15995", "=q2=Thorium Rifle", "=ds=#sr# 260"};
			{ 5, "s12614", "10510", "=q2=Mithril Heavy-bore Rifle", "=ds=#sr# 220"};
			{ 6, "s12595", "10508", "=q2=Mithril Blunderbuss", "=ds=#sr# 205"};
			{ 7, "s3954", "4383", "=q2=Moonsight Rifle", "=ds=#sr# 145"};
			{ 8, "s3949", "4379", "=q2=Silver-plated Shotgun", "=ds=#sr# 130"};
			{ 9, "s3939", "4372", "=q2=Lovingly Crafted Boomstick", "=ds=#sr# 120"};
			{ 10, "s3936", "4369", "=q2=Deadly Blunderbuss", "=ds=#sr# 105"};
			{ 11, "s3925", "4362", "=q2=Rough Boomstick", "=ds=#sr# 50"};
			{ 12, "s7430", "6219", "=q1=Arclight Spanner", "=ds=#sr# 50"};
		};
		{
			Name = GNOMISH;
			{ 1, "s23489", "18986", "=q2=Ultrasafe Transporter - Gadgetzan", "=ds=#sr# 260"};
			{ 2, "s23129", "18660", "=q2=World Enlarger", "=ds=#sr# 260"};
			{ 3, "s12907", "10726", "=q2=Gnomish Mind Control Cap", "=ds=#sr# 235"};
			{ 4, "s12905", "10724", "=q2=Gnomish Rocket Boots", "=ds=#sr# 225"};
			{ 5, "s12903", "10721", "=q2=Gnomish Harm Prevention Belt", "=ds=#sr# 215"};
			{ 6, "s12897", "10545", "=q2=Gnomish Goggles", "=ds=#sr# 210"};
			{ 7, "s30568", "23841", "=q1=Gnomish Flame Turret", "=ds=#sr# 325"};
			{ 8, "s23096", "18645", "=q1=Alarm-O-Bot", "=ds=#sr# 265"};
			{ 9, "s12759", "10645", "=q1=Gnomish Death Ray", "=ds=#sr# 240"};
			{ 10, "s12906", "10725", "=q1=Gnomish Battle Chicken", "=ds=#sr# 230"};
			{ 11, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "=ds=#sr# 210"};
			{ 12, "s12899", "10716", "=q1=Gnomish Shrink Ray", "=ds=#sr# 205"};
			{ 13, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "=ds=#sr# 205"};
			{ 14, "s3971", "4397", "=q1=Gnomish Cloaking Device", "=ds=#sr# 200"};
			{ 15, "s9269", "7506", "=q2=Gnomish Universal Remote", "=ds=#sr# 125"};
		};
		{
			Name = GOBLIN;
			{ 1, "s23486", "18984", "=q2=Dimensional Ripper - Everlook", "=ds=#sr# 260"};
			{ 2, "s12758", "10588", "=q2=Goblin Rocket Helmet", "=ds=#sr# 245"};
			{ 3, "s8895", "7189", "=q2=Goblin Rocket Boots", "=ds=#sr# 225"};
			{ 4, "s12718", "10543", "=q2=Goblin Construction Helmet", "=ds=#sr# 205"};
			{ 5, "s12717", "10542", "=q2=Goblin Mining Helmet", "=ds=#sr# 205"};
			{ 6, "s56514", "42641", "=q1=Global Thermal Sapper Charge", "=ds=#sr# 425" };
			{ 7, "s30560", "23827", "=q1=Super Sapper Charge", "=ds=#sr# 340"};
			{ 8, "s30558", "23826", "=q1=The Bigger One", "=ds=#sr# 325"};
			{ 9, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "=ds=#sr# 265"};
			{ 10, "s12908", "10727", "=q1=Goblin Dragon Gun", "=ds=#sr# 240"};
			{ 11, "s12754", "10586", "=q1=The Big One", "=ds=#sr# 235"};
			{ 12, "s12755", "10587", "=q1=Goblin Bomb Dispenser", "=ds=#sr# 230"};
			{ 13, "s12716", "10577", "=q1=Goblin Mortar", "=ds=#sr# 205"};
			{ 14, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "=ds=#sr# 205"};
			{ 15, "s12760", "10646", "=q1=Goblin Sapper Charge", "=ds=#sr# 205"};
			{ 16, "s13240", "10577", "=q1=The Mortar: Reloaded", "=ds=#sr# 205"};
		};
	};

		-----------------
		--- First Aid ---
		-----------------

	AtlasLoot_Data["FirstAidCLASSIC"] = {
			Name = FIRSTAID;
			Type = "CraftingNoBF";
					{
			Name = FIRSTAID;
			{ 1, "s23787", "19440", "=q1=Powerful Anti-Venom", "=ds=#sr# 300"};
			{ 2, "s18630", "14530", "=q1=Heavy Runecloth Bandage", "=ds=#sr# 290"};
			{ 3, "s18629", "14529", "=q1=Runecloth Bandage", "=ds=#sr# 260"};
			{ 4, "s10841", "8545", "=q1=Heavy Mageweave Bandage", "=ds=#sr# 240"};
			{ 5, "s10840", "8544", "=q1=Mageweave Bandage", "=ds=#sr# 210"};
			{ 6, "s7929", "6451", "=q1=Heavy Silk Bandage", "=ds=#sr# 180"};
			{ 7, "s7928", "6450", "=q1=Silk Bandage", "=ds=#sr# 150"};
			{ 8, "s7935", "6453", "=q1=Strong Anti-Venom", "=ds=#sr# 130"};
			{ 9, "s3278", "3531", "=q1=Heavy Wool Bandage", "=ds=#sr# 115"};
			{ 10, "s3277", "3530", "=q1=Wool Bandage", "=ds=#sr# 80"};
			{ 11, "s7934", "6452", "=q1=Anti-Venom", "=ds=#sr# 80"};
			{ 12, "s3276", "2581", "=q1=Heavy Linen Bandage", "=ds=#sr# 40"};
			{ 13, "s3275", "1251", "=q1=Linen Bandage", "=ds=#sr# 1"};
		};
	};
		-------------------
		--- Inscription ---
		-------------------

	AtlasLoot_Data["Inscription"] = {
			Name = INSCRIPTION;
			Type = "CraftingNoBF";
					{
			Name = AL["Off-Hand Items"];
			{ 1, "s59498", "44210", "=q4=Faces of Doom", "=ds=" };
			{ 2, "s59497", "38322", "=q4=Iron-bound Tome", "=ds=" };
			{ 3, "s64051", "45854", "=q3=Rituals of the New Moon", "=ds="};
			{ 4, "s64053", "45849", "=q3=Twilight Tome", "=ds="};
			{ 5, "s59496", "43667", "=q3=Book of Clever Tricks", "=ds=" };
			{ 6, "s59495", "43666", "=q3=Hellfire Tome", "=ds=" };
			{ 7, "s59494", "43664", "=q3=Manual of Clouds", "=ds=" };
			{ 8, "s59493", "43663", "=q3=Stormbound Tome", "=ds=" };
			{ 9, "s59490", "43661", "=q3=Book of Stars", "=ds=" };
			{ 10, "s59489", "43660", "=q3=Fire Eater's Guide", "=ds=" };
			{ 11, "s59486", "43657", "=q3=Royal Guide of Escape Routes", "=ds=" };
			{ 12, "s59484", "43656", "=q3=Tome of Kings", "=ds=" };
			{ 13, "s59478", "43655", "=q3=Book of Survival", "=ds=" };
			{ 14, "s59475", "43654", "=q3=Tome of the Dawn", "=ds=" };
			{ 15, "s58565", "43515", "=q3=Mystic Tome", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Reagents"];
			{ 1, "s57716", "43127", "=q2=Snowfall Ink", "=ds="..AL["Trainer"] };
			{ 2, "s57714", "43125", "=q2=Darkflame Ink", "=ds="..AL["Trainer"] };
			{ 3, "s57712", "43123", "=q2=Ink of the Sky", "=ds="..AL["Trainer"] };
			{ 4, "s57710", "43121", "=q2=Fiery Ink", "=ds="..AL["Trainer"] };
			{ 5, "s57708", "43119", "=q2=Royal Ink", "=ds="..AL["Trainer"] };
			{ 6, "s57706", "43117", "=q2=Dawnstar Ink", "=ds="..AL["Trainer"] };
			{ 7, "s57703", "43115", "=q2=Hunter's Ink", "=ds="..AL["Trainer"] };
			{ 8, "s57715", "43126", "=q1=Ink of the Sea", "=ds="..AL["Trainer"] };
			{ 9, "s57713", "43124", "=q1=Ethereal Ink", "=ds="..AL["Trainer"] };
			{ 10, "s57711", "43122", "=q1=Shimmering Ink", "=ds="..AL["Trainer"] };
			{ 11, "s57709", "43120", "=q1=Celestial Ink", "=ds="..AL["Trainer"] };
			{ 12, "s57707", "43118", "=q1=Jadefire Ink", "=ds="..AL["Trainer"] };
			{ 13, "s57704", "43116", "=q1=Lion's Ink", "=ds="..AL["Trainer"] };
			{ 14, "s53462", "39774", "=q1=Midnight Ink", "=ds="..AL["Trainer"] };
			{ 15, "s52843", "39469", "=q1=Moonglow Ink", "=ds="..AL["Trainer"] };
			{ 16, "s52738", "37101", "=q1=Ivory Ink", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Scrolls"];
			{ 1, "s69385", "49632", "=q1=Runescroll of Fortitude", "=ds=" };
			{ 3, "s60337", "44315", "=q1=Scroll of Recall III", "=ds=" };
			{ 4, "s60336", "44314", "=q1=Scroll of Recall II", "=ds=" };
			{ 5, "s48248", "37118", "=q1=Scroll of Recall", "=ds=" };
			{ 6, "s58483", "3012", "=q1=Scroll of Agility VIII", "=ds=" };
			{ 7, "s58482", "3012", "=q1=Scroll of Agility VII", "=ds=" };
			{ 8, "s58481", "3012", "=q1=Scroll of Agility VI", "=ds=" };
			{ 9, "s58480", "3012", "=q1=Scroll of Agility V", "=ds=" };
			{ 10, "s58478", "3012", "=q1=Scroll of Agility IV", "=ds=" };
			{ 11, "s58476", "3012", "=q1=Scroll of Agility III", "=ds=" };
			{ 12, "s58473", "3012", "=q1=Scroll of Agility II", "=ds=" };
			{ 13, "s58472", "3012", "=q1=Scroll of Agility", "=ds=" };
			{ 14, "s50604", "955", "=q1=Scroll of Intellect VIII", "=ds=" };
			{ 15, "s50603", "955", "=q1=Scroll of Intellect VII", "=ds=" };
			{ 16, "s50602", "955", "=q1=Scroll of Intellect VI", "=ds=" };
			{ 17, "s50601", "955", "=q1=Scroll of Intellect V", "=ds=" };
			{ 18, "s50600", "955", "=q1=Scroll of Intellect IV", "=ds=" };
			{ 19, "s50599", "955", "=q1=Scroll of Intellect III", "=ds=" };
			{ 20, "s50598", "955", "=q1=Scroll of Intellect II", "=ds=" };
			{ 21, "s48114", "955", "=q1=Scroll of Intellect", "=ds=" };
			{ 23, "s50611", "955", "=q1=Scroll of Spirit VIII", "=ds=" };
			{ 24, "s50610", "955", "=q1=Scroll of Spirit VII", "=ds=" };
			{ 25, "s50609", "955", "=q1=Scroll of Spirit VI", "=ds=" };
			{ 26, "s50608", "955", "=q1=Scroll of Spirit V", "=ds=" };
			{ 27, "s50607", "955", "=q1=Scroll of Spirit IV", "=ds=" };
			{ 28, "s50606", "955", "=q1=Scroll of Spirit III", "=ds=" };
			{ 29, "s50605", "955", "=q1=Scroll of Spirit II", "=ds=" };
			{ 30, "s48116", "955", "=q1=Scroll of Spirit", "=ds=" };
		};
		{
			Name = AL["Scrolls"];
			{ 1, "s50620", "1180", "=q1=Scroll of Stamina VIII", "=ds=" };
			{ 2, "s50619", "1180", "=q1=Scroll of Stamina VII", "=ds=" };
			{ 3, "s50618", "1180", "=q1=Scroll of Stamina VI", "=ds=" };
			{ 4, "s50617", "1180", "=q1=Scroll of Stamina V", "=ds=" };
			{ 5, "s50616", "1180", "=q1=Scroll of Stamina IV", "=ds=" };
			{ 6, "s50614", "1180", "=q1=Scroll of Stamina III", "=ds=" };
			{ 7, "s50612", "1180", "=q1=Scroll of Stamina II", "=ds=" };
			{ 8, "s45382", "1180", "=q1=Scroll of Stamina", "=ds=" };
			{ 16, "s58491", "3012", "=q1=Scroll of Strength VIII", "=ds=" };
			{ 17, "s58490", "3012", "=q1=Scroll of Strength VII", "=ds=" };
			{ 18, "s58489", "3012", "=q1=Scroll of Strength VI", "=ds=" };
			{ 19, "s58488", "3012", "=q1=Scroll of Strength V", "=ds=" };
			{ 20, "s58487", "3012", "=q1=Scroll of Strength IV", "=ds=" };
			{ 21, "s58486", "3012", "=q1=Scroll of Strength III", "=ds=" };
			{ 22, "s58485", "3012", "=q1=Scroll of Strength II", "=ds=" };
			{ 23, "s58484", "3012", "=q1=Scroll of Strength", "=ds=" };
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s59504", "INV_Feather_05", "=ds=Darkmoon Card of the North", "=ds=" };
			{ 2, "s59503", "INV_Feather_05", "=ds=Greater Darkmoon Card", "=ds=" };
			{ 3, "s59502", "INV_Feather_05", "=ds=Darkmoon Card", "=ds=" };
			{ 4, "s59491", "INV_Feather_05", "=ds=Shadowy Tarot", "=ds=" };
			{ 5, "s59487", "INV_Feather_05", "=ds=Arcane Tarot", "=ds=" };
			{ 6, "s48247", "INV_Feather_05", "=ds=Mysterious Tarot", "=ds="..AL["Trainer"]..""};
			{ 7, "s59480", "INV_Feather_05", "=ds=Strange Tarot", "=ds=" };
			{ 9, "s61117", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Axe", "=ds=" };
			{ 10, "s61118", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Crag", "=ds=" };
			{ 11, "s61119", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Pinnacle", "=ds=" };
			{ 12, "s61120", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Storm", "=ds=" };
			{ 14, "s52175", "INV_Misc_Book_11", "=ds=Decipher", "=ds="..AL["Trainer"] };
			{ 16, "s59500", "43145", "=q1=Armor Vellum III", "=ds=" };
			{ 17, "s59499", "37602", "=q1=Armor Vellum II", "=ds=" };
			{ 18, "s52739", "38682", "=q1=Armor Vellum", "=ds="..AL["Trainer"] };
			{ 20, "s59501", "43146", "=q1=Weapon Vellum III", "=ds=" };
			{ 21, "s59488", "39350", "=q1=Weapon Vellum II", "=ds=" };
			{ 22, "s52840", "39349", "=q1=Weapon Vellum", "=ds="..AL["Trainer"] };
			{ 24, "s59387", "43850", "=q1=Certificate of Ownership", "=ds=" };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"];
			{ 1, "s57207", "43533", "=q1=Glyph of Anti-Magic Shell", "=ds="..GetSpellInfo(61177) };
			{ 2, "s59339", "43826", "=q1=Glyph of Blood Strike", "=ds="..AL["Trainer"] };
			{ 3, "s57210", "43536", "=q1=Glyph of Bone Shield", "=ds="..AL["Trainer"] };
			{ 4, "s57211", "43537", "=q1=Glyph of Chains of Ice", "=ds="..GetSpellInfo(61177)  };
			{ 5, "s64297", "45799", "=q1=Glyph of Dancing Rune Weapon", "=ds="..AL["Book of Glyph Mastery"]};
			{ 6, "s57212", "43538", "=q1=Glyph of Dark Command", "=ds="..GetSpellInfo(61177) };
			{ 7, "s64266", "45804", "=q1=Glyph of Dark Death", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s57214", "43542", "=q1=Glyph of Death and Decay", "=ds="..GetSpellInfo(61177) };
			{ 9, "s57213", "43541", "=q1=Glyph of Death Grip", "=ds="..AL["Trainer"] };
			{ 10, "s59340", "43827", "=q1=Glyph of Death Strike", "=ds="..AL["Trainer"] };
			{ 11, "s64267", "45805", "=q1=Glyph of Disease", "=ds="..AL["Book of Glyph Mastery"]};
			{ 12, "s57216", "43543", "=q1=Glyph of Frost Strike", "=ds="..AL["Trainer"] };
			{ 13, "s57208", "43534", "=q1=Glyph of Heart Strike", "=ds="..GetSpellInfo(61177) };
			{ 14, "s64300", "45806", "=q1=Glyph of Howling Blast", "=ds="..AL["Book of Glyph Mastery"]};
			{ 15, "s64298", "45800", "=q1=Glyph of Hungering Cold", "=ds="..AL["Book of Glyph Mastery"]};
			{ 16, "s57218", "43545", "=q1=Glyph of Icebound Fortitude", "=ds="..GetSpellInfo(61177) };
			{ 17, "s57219", "43546", "=q1=Glyph of Icy Touch", "=ds="..AL["Trainer"] };
			{ 18, "s57220", "43547", "=q1=Glyph of Obliterate", "=ds="..GetSpellInfo(61177)  };
			{ 19, "s57221", "43548", "=q1=Glyph of Plague Strike", "=ds="..AL["Trainer"] };
			{ 20, "s57223", "43550", "=q1=Glyph of Rune Strike", "=ds="..GetSpellInfo(61177)  };
			{ 21, "s59338", "43825", "=q1=Glyph of Rune Tap", "=ds="..AL["Trainer"] };
			{ 22, "s57224", "43551", "=q1=Glyph of Scourge Strike", "=ds="..AL["Trainer"] };
			{ 23, "s57225", "43552", "=q1=Glyph of Strangulate", "=ds="..AL["Trainer"] };
			{ 24, "s57222", "43549", "=q1=Glyph of the Ghoul", "=ds="..AL["Trainer"] };
			{ 25, "s57226", "43553", "=q1=Glyph of Unbreakable Armor", "=ds="..AL["Trainer"] };
			{ 26, "s64299", "45803", "=q1=Glyph of Unholy Blight", "=ds="..AL["Book of Glyph Mastery"]};
			{ 27, "s57227", "43554", "=q1=Glyph of Vampiric Blood", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"];
			{ 1, "s57209", "43535", "=q1=Glyph of Blood Tap", "=ds="..GetSpellInfo(61288) };
			{ 2, "s57229", "43671", "=q1=Glyph of Corpse Explosion", "=ds="..GetSpellInfo(61288) };
			{ 3, "s57215", "43539", "=q1=Glyph of Death's Embrace", "=ds="..GetSpellInfo(61288) };
			{ 4, "s57217", "43544", "=q1=Glyph of Horn of Winter", "=ds="..GetSpellInfo(61288) };
			{ 5, "s57230", "43672", "=q1=Glyph of Pestilence", "=ds="..GetSpellInfo(61288) };
			{ 6, "s57228", "43673", "=q1=Glyph of Raise Dead", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..AL["Druid"];
			{ 1, "s64256", "45623", "=q1=Glyph of Barkskin", "=ds="..AL["Book of Glyph Mastery"]};
			{ 2, "s64268", "45601", "=q1=Glyph of Berserk", "=ds="..AL["Book of Glyph Mastery"]};
			{ 3, "s67600", "48720", "=q1=Glyph of Claw", "=ds="..AL["Trainer"]};
			{ 4, "s48121", "40924", "=q1=Glyph of Entangling Roots", "=ds="..AL["Trainer"] };
			{ 5, "s62162", "44928", "=q1=Glyph of Focus", "=ds="..GetSpellInfo(61177)};
			{ 6, "s56943", "40896", "=q1=Glyph of Frenzied Regeneration", "=ds="..AL["Trainer"] };
			{ 7, "s56944", "40899", "=q1=Glyph of Growl", "=ds="..GetSpellInfo(61177) };
			{ 8, "s56945", "40914", "=q1=Glyph of Healing Touch", "=ds="..AL["Trainer"] };
			{ 9, "s56946", "40920", "=q1=Glyph of Hurricane", "=ds="..GetSpellInfo(61177) };
			{ 10, "s56947", "40908", "=q1=Glyph of Innervate", "=ds="..GetSpellInfo(61177)  };
			{ 11, "s56948", "40919", "=q1=Glyph of Insect Swarm", "=ds="..AL["Trainer"] };
			{ 12, "s56949", "40915", "=q1=Glyph of Lifebloom", "=ds="..GetSpellInfo(61177) };
			{ 13, "s56950", "40900", "=q1=Glyph of Mangle", "=ds="..GetSpellInfo(61177)  };
			{ 14, "s56961", "40897", "=q1=Glyph of Maul", "=ds="..AL["Trainer"] };
			{ 15, "s64258", "45622", "=q1=Glyph of Monsoon", "=ds="..AL["Book of Glyph Mastery"]};
			{ 16, "s56951", "40923", "=q1=Glyph of Moonfire", "=ds="..AL["Trainer"] };
			{ 17, "s64313", "45603", "=q1=Glyph of Nourish", "=ds="..AL["Book of Glyph Mastery"]};
			{ 18, "s56952", "40903", "=q1=Glyph of Rake", "=ds="..AL["Trainer"] };
			{ 19, "s71015", "50125", "=q1=Glyph of Rapid Rejuvenation", "=ds="..AL["Vendor"]..""};
			{ 20, "s56953", "40909", "=q1=Glyph of Rebirth", "=ds="..AL["Trainer"] };
			{ 21, "s56954", "40912", "=q1=Glyph of Regrowth", "=ds="..GetSpellInfo(61177) };
			{ 22, "s56955", "40913", "=q1=Glyph of Rejuvenation", "=ds="..AL["Trainer"] };
			{ 23, "s56956", "40902", "=q1=Glyph of Rip", "=ds="..AL["Trainer"] };
			{ 24, "s64307", "45604", "=q1=Glyph of Savage Roar", "=ds="..AL["Book of Glyph Mastery"]};
			{ 25, "s56957", "40901", "=q1=Glyph of Shred", "=ds="..AL["Trainer"] };
			{ 26, "s56958", "40921", "=q1=Glyph of Starfall", "=ds="..GetSpellInfo(61177) };
			{ 27, "s56959", "40916", "=q1=Glyph of Starfire", "=ds="..AL["Trainer"] };
			{ 28, "s65245", "46372", "=q1=Glyph of Survival Instincts", "=ds="..AL["Book of Glyph Mastery"]};
			{ 29, "s56960", "40906", "=q1=Glyph of Swiftmend", "=ds="..GetSpellInfo(61177) };
			{ 30, "s56963", "40922", "=q1=Glyph of WRATH", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..AL["Druid"];
			{ 1, "s64270", "45602", "=q1=Glyph of Wild Growth", "=ds="..AL["Book of Glyph Mastery"]};
			{ 2, "s58286", "43316", "=q1=Glyph of Aquatic Form", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58287", "43334", "=q1=Glyph of Challenging Roar", "=ds="..GetSpellInfo(61288) };
			{ 4, "s59315", "43674", "=q1=Glyph of Dash", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58296", "43335", "=q1=Glyph of the Wild", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58289", "43332", "=q1=Glyph of Thorns", "=ds="..GetSpellInfo(61288) };
			{ 7, "s56965", "44922", "=q1=Glyph of Typhoon", "=ds="..GetSpellInfo(61288)};
			{ 8, "s58288", "43331", "=q1=Glyph of Unburdened Rebirth", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["HUNTER"];
			{ 1, "s56994", "42897", "=q1=Glyph of Aimed Shot", "=ds="..AL["Trainer"] };
			{ 2, "s56995", "42898", "=q1=Glyph of Arcane Shot", "=ds="..AL["Trainer"] };
			{ 3, "s56996", "42899", "=q1=Glyph of Aspect of the Beast", "=ds="..GetSpellInfo(61177) };
			{ 4, "s56997", "42900", "=q1=Glyph of Aspect of the Monkey", "=ds="..AL["Trainer"] };
			{ 5, "s56998", "42901", "=q1=Glyph of Aspect of the Viper", "=ds="..GetSpellInfo(61177) };
			{ 6, "s56999", "42902", "=q1=Glyph of Beastial WRATH", "=ds="..GetSpellInfo(61177)  };
			{ 7, "s64271", "45625", "=q1=Glyph of Chimera Shot", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s57000", "42903", "=q1=Glyph of Deterrence", "=ds="..AL["Trainer"] };
			{ 9, "s57001", "42904", "=q1=Glyph of Disengage", "=ds="..AL["Trainer"] };
			{ 10, "s64273", "45731", "=q1=Glyph of Explosive Shot", "=ds="..AL["Book of Glyph Mastery"]};
			{ 11, "s64253", "45733", "=q1=Glyph of Explosive Trap", "=ds="..AL["Book of Glyph Mastery"]};
			{ 12, "s57002", "42905", "=q1=Glyph of Freezing Trap", "=ds="..AL["Trainer"] };
			{ 13, "s57003", "42906", "=q1=Glyph of Frost Trap", "=ds="..AL["Trainer"] };
			{ 14, "s57004", "42907", "=q1=Glyph of Hunter's Mark", "=ds="..AL["Trainer"] };
			{ 15, "s57005", "42908", "=q1=Glyph of Immolation Trap", "=ds="..AL["Trainer"] };
			{ 16, "s57006", "42909", "=q1=Glyph of Improved Aspect of the Hawk", "=ds="..AL["Trainer"] };
			{ 17, "s64304", "45732", "=q1=Glyph of Kill Shot", "=ds="..AL["Book of Glyph Mastery"]};
			{ 18, "s57007", "42910", "=q1=Glyph of Multi-Shot", "=ds="..AL["Trainer"] };
			{ 19, "s57008", "42911", "=q1=Glyph of Rapid Fire", "=ds="..AL["Trainer"] };
			{ 20, "s64246", "45735", "=q1=Glyph of Raptor Strike", "=ds="..AL["Book of Glyph Mastery"]};
			{ 21, "s64249", "45734", "=q1=Glyph of Scatter Shot", "=ds="..AL["Book of Glyph Mastery"]};
			{ 22, "s57009", "42912", "=q1=Glyph of Serpent Sting", "=ds="..AL["Trainer"] };
			{ 23, "s57010", "42913", "=q1=Glyph of Snake Trap", "=ds="..GetSpellInfo(61177) };
			{ 24, "s57011", "42914", "=q1=Glyph of Steady Shot", "=ds="..GetSpellInfo(61177)  };
			{ 25, "s57012", "42915", "=q1=Glyph of Trueshot Aura", "=ds="..GetSpellInfo(61177) };
			{ 26, "s57013", "42916", "=q1=Glyph of Volley", "=ds="..GetSpellInfo(61177) };
			{ 27, "s57014", "42917", "=q1=Glyph of Wyvern Sting", "=ds="..GetSpellInfo(61177) };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["HUNTER"];
			{ 1, "s58302", "43351", "=q1=Glyph of Feign Death", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58301", "43350", "=q1=Glyph of Mend Pet", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58300", "43354", "=q1=Glyph of Possessed Strength", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58299", "43338", "=q1=Glyph of Revive Pet", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58298", "43356", "=q1=Glyph of Scare Beast", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58297", "43355", "=q1=Glyph of the Pack", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["MAGE"];
			{ 1, "s64276", "45738", "=q1=Glyph of Arcane Barrage", "=ds="..AL["Book of Glyph Mastery"]};
			{ 2, "s56991", "44955", "=q1=Glyph of Arcane Blast", "=ds="..GetSpellInfo(61177)};
			{ 3, "s56968", "42734", "=q1=Glyph of Arcane Explosion", "=ds="..AL["Trainer"] };
			{ 4, "s56971", "42735", "=q1=Glyph of Arcane Missiles", "=ds="..AL["Trainer"] };
			{ 5, "s56972", "42736", "=q1=Glyph of Arcane Power", "=ds="..AL["Trainer"] };
			{ 6, "s56973", "42737", "=q1=Glyph of Blink", "=ds="..AL["Trainer"] };
			{ 7, "s64274", "45736", "=q1=Glyph of Deep Freeze", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s71101", "50045", "=q1=Glyph of Eternal Water", "=ds="..AL["Vendor"]..""};
			{ 9, "s56974", "42738", "=q1=Glyph of Evocation", "=ds="..AL["Trainer"] };
			{ 10, "s57719", "42740", "=q1=Glyph of Fire Blast", "=ds="..GetSpellInfo(61177) };
			{ 11, "s56975", "42739", "=q1=Glyph of Fireball", "=ds="..GetSpellInfo(61177)  };
			{ 12, "s56976", "42741", "=q1=Glyph of Frost Nova", "=ds="..AL["Trainer"] };
			{ 13, "s56977", "42742", "=q1=Glyph of Frostbolt", "=ds="..GetSpellInfo(61177) };
			{ 14, "s61677", "44684", "=q1=Glyph of Frostfire", "=ds="..GetSpellInfo(61177)  };
			{ 15, "s56978", "42743", "=q1=Glyph of Ice Armor", "=ds="..AL["Trainer"] };
			{ 16, "s64257", "45740", "=q1=Glyph of Ice Barrier", "=ds="..AL["Book of Glyph Mastery"]};
			{ 17, "s56979", "42744", "=q1=Glyph of Ice Block", "=ds="..AL["Trainer"] };
			{ 18, "s56980", "42745", "=q1=Glyph of Ice Lance", "=ds="..AL["Trainer"] };
			{ 19, "s56981", "42746", "=q1=Glyph of Icy Veins", "=ds="..AL["Trainer"] };
			{ 20, "s56982", "42747", "=q1=Glyph of Improved Scorch", "=ds="..AL["Trainer"] };
			{ 21, "s56983", "42748", "=q1=Glyph of Invisibility", "=ds="..GetSpellInfo(61177) };
			{ 22, "s64275", "45737", "=q1=Glyph of Living Bomb", "=ds="..AL["Book of Glyph Mastery"]};
			{ 23, "s56984", "42749", "=q1=Glyph of Mage Armor", "=ds="..AL["Trainer"] };
			{ 24, "s56985", "42750", "=q1=Glyph of Mana Gem", "=ds="..AL["Trainer"] };
			{ 25, "s64314", "45739", "=q1=Glyph of Mirror Image", "=ds="..AL["Book of Glyph Mastery"]};
			{ 26, "s56986", "42751", "=q1=Glyph of Molten Armor", "=ds="..GetSpellInfo(61177)  };
			{ 27, "s56987", "42752", "=q1=Glyph of Polymorph", "=ds="..AL["Trainer"] };
			{ 28, "s56988", "42753", "=q1=Glyph of Remove Curse", "=ds="..GetSpellInfo(61177) };
			{ 29, "s56989", "42754", "=q1=Glyph of Water Elemental", "=ds="..GetSpellInfo(61177)  };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["MAGE"];
			{ 1, "s58303", "43339", "=q1=Glyph of Arcane Intellect", "=ds="..GetSpellInfo(61288) };
			{ 2, "s56990", "44920", "=q1=Glyph of Blast Wave", "=ds="..GetSpellInfo(61288)};
			{ 3, "s58305", "43357", "=q1=Glyph of Fire Ward", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58306", "43359", "=q1=Glyph of Frost Armor", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58307", "43360", "=q1=Glyph of Frost Ward", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58308", "43364", "=q1=Glyph of Slow Fall", "=ds="..GetSpellInfo(61288) };
			{ 7, "s58310", "43361", "=q1=Glyph of the Penguin", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
			{ 1, "s57019", "41101", "=q1=Glyph of Avenger's Shield", "=ds="..GetSpellInfo(61177) };
			{ 2, "s57021", "41107", "=q1=Glyph of Avenging WRATH", "=ds="..GetSpellInfo(61177) };
			{ 3, "s64277", "45741", "=q1=Glyph of Beacon of Light", "=ds="..AL["Book of Glyph Mastery"]};
			{ 4, "s57020", "41104", "=q1=Glyph of Cleansing", "=ds="..AL["Trainer"] };
			{ 5, "s57023", "41099", "=q1=Glyph of Consecration", "=ds="..AL["Trainer"] };
			{ 6, "s57024", "41098", "=q1=Glyph of Crusader Strike", "=ds="..AL["Trainer"] };
			{ 7, "s64305", "45745", "=q1=Glyph of Divine Plea", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s64279", "45743", "=q1=Glyph of Divine Storm", "=ds="..AL["Book of Glyph Mastery"]};
			{ 9, "s57031", "41108", "=q1=Glyph of Divinity", "=ds="..AL["Trainer"] };
			{ 10, "s57025", "41103", "=q1=Glyph of Exorcism", "=ds="..AL["Trainer"] };
			{ 11, "s57026", "41105", "=q1=Glyph of Flash of Light", "=ds="..AL["Trainer"] };
			{ 12, "s57027", "41095", "=q1=Glyph of Hammer of Justice", "=ds="..AL["Trainer"] };
			{ 13, "s64278", "45742", "=q1=Glyph of Hammer of the Righteous", "=ds="..AL["Book of Glyph Mastery"]};
			{ 14, "s57028", "41097", "=q1=Glyph of Hammer of WRATH", "=ds="..GetSpellInfo(61177) };
			{ 15, "s57029", "41106", "=q1=Glyph of Holy Light", "=ds="..AL["Trainer"] };
			{ 16, "s64254", "45746", "=q1=Glyph of Holy Shock", "=ds="..AL["Book of Glyph Mastery"]};
			{ 17, "s57030", "41092", "=q1=Glyph of Judgement", "=ds="..AL["Trainer"] };
			{ 18, "s57032", "41100", "=q1=Glyph of Righteous Defense", "=ds="..AL["Trainer"] };
			{ 19, "s64251", "45747", "=q1=Glyph of Salvation", "=ds="..AL["Book of Glyph Mastery"]};
			{ 20, "s59559", "43867", "=q1=Glyph of Seal of Blood", "=ds="..GetSpellInfo(61177)  };
			{ 21, "s57033", "41094", "=q1=Glyph of Seal of Command", "=ds="..AL["Trainer"]  };
			{ 22, "s57034", "41110", "=q1=Glyph of Seal of Light", "=ds="..GetSpellInfo(61177) };
			{ 23, "s59560", "43868", "=q1=Glyph of Seal of Righteousness", "=ds="..GetSpellInfo(61177)  };
			{ 24, "s59561", "43869", "=q1=Glyph of Seal of Vengeance", "=ds="..GetSpellInfo(61177)  };
			{ 25, "s57035", "41109", "=q1=Glyph of Seal of Wisdom", "=ds="..GetSpellInfo(61177) };
			{ 26, "s64308", "45744", "=q1=Glyph of Shield of Righteousness", "=ds="..AL["Book of Glyph Mastery"]};
			{ 27, "s57022", "41096", "=q1=Glyph of Spiritual Attunement", "=ds="..AL["Trainer"] };
			{ 28, "s57036", "41102", "=q1=Glyph of Turn Evil", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
			{ 1, "s58311", "43365", "=q1=Glyph of Blessing of Kings", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58314", "43340", "=q1=Glyph of Blessing of Might", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58312", "43366", "=q1=Glyph of Blessing of Wisdom", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58313", "43367", "=q1=Glyph of Lay on Hands", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58315", "43368", "=q1=Glyph of Sense Undead", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58316", "43369", "=q1=Glyph of the Wise", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
			{ 1, "s57181", "42396", "=q1=Glyph of Circle of Healing", "=ds="..GetSpellInfo(61177) };
			{ 2, "s57183", "42397", "=q1=Glyph of Dispel Magic", "=ds="..AL["Trainer"] };
			{ 3, "s64280", "45753", "=q1=Glyph of Dispersion", "=ds="..AL["Book of Glyph Mastery"]};
			{ 4, "s57184", "42398", "=q1=Glyph of Fade", "=ds="..AL["Trainer"] };
			{ 5, "s57185", "42399", "=q1=Glyph of Fear Ward", "=ds="..AL["Trainer"] };
			{ 6, "s57186", "42400", "=q1=Glyph of Flash Heal", "=ds="..AL["Trainer"] };
			{ 7, "s64281", "45755", "=q1=Glyph of Guardian Spirit", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s57187", "42401", "=q1=Glyph of Holy Nova", "=ds="..AL["Trainer"] };
			{ 9, "s64283", "45758", "=q1=Glyph of Hymn of Hope", "=ds="..AL["Book of Glyph Mastery"]};
			{ 10, "s57188", "42402", "=q1=Glyph of Inner Fire", "=ds="..AL["Trainer"] };
			{ 11, "s57189", "42403", "=q1=Glyph of Lightwell", "=ds="..GetSpellInfo(61177) };
			{ 12, "s57190", "42404", "=q1=Glyph of Mass Dispel", "=ds="..GetSpellInfo(61177) };
			{ 13, "s57191", "42405", "=q1=Glyph of Mind Control", "=ds="..GetSpellInfo(61177) };
			{ 14, "s57192", "42406", "=q1=Glyph of Mind Flay", "=ds="..AL["Trainer"] };
			{ 15, "s64309", "45757", "=q1=Glyph of Mind Sear", "=ds="..AL["Book of Glyph Mastery"]};
			{ 16, "s64259", "45760", "=q1=Glyph of Pain Suppression", "=ds="..AL["Book of Glyph Mastery"]};
			{ 17, "s64282", "45756", "=q1=Glyph of Penance", "=ds="..AL["Book of Glyph Mastery"]};
			{ 18, "s57194", "42408", "=q1=Glyph of Power Word: Shield", "=ds="..AL["Trainer"] };
			{ 19, "s57195", "42409", "=q1=Glyph of Prayer of Healing", "=ds="..GetSpellInfo(61177) };
			{ 20, "s57196", "42410", "=q1=Glyph of Psychic Scream", "=ds="..AL["Trainer"] };
			{ 21, "s57197", "42411", "=q1=Glyph of Renew", "=ds="..AL["Trainer"] };
			{ 22, "s57198", "42412", "=q1=Glyph of Scourge Imprisonment", "=ds="..AL["Trainer"] };
			{ 23, "s57193", "42407", "=q1=Glyph of Shadow", "=ds="..GetSpellInfo(61177)  };
			{ 24, "s57199", "42414", "=q1=Glyph of Shadow Word: Death", "=ds="..GetSpellInfo(61177) };
			{ 25, "s57200", "42415", "=q1=Glyph of Shadow Word: Pain", "=ds="..AL["Trainer"] };
			{ 26, "s57201", "42416", "=q1=Glyph of Smite", "=ds="..AL["Trainer"] };
			{ 27, "s57202", "42417", "=q1=Glyph of Spirit of Redemption", "=ds="..GetSpellInfo(61177) };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
			{ 1, "s58317", "43342", "=q1=Glyph of Fading", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58318", "43371", "=q1=Glyph of Fortitude", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58319", "43370", "=q1=Glyph of Levitate", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58320", "43373", "=q1=Glyph of Shackle Undead", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58321", "43372", "=q1=Glyph of Shadow Protection", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58322", "43374", "=q1=Glyph of Shadowfiend", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["ROGUE"];
			{ 1, "s57112", "42954", "=q1=Glyph of Adrenaline Rush", "=ds="..GetSpellInfo(61177) };
			{ 2, "s57113", "42955", "=q1=Glyph of Ambush", "=ds="..AL["Trainer"] };
			{ 3, "s57114", "42956", "=q1=Glyph of Backstab", "=ds="..AL["Trainer"] };
			{ 4, "s57115", "42957", "=q1=Glyph of Blade Flurry", "=ds="..GetSpellInfo(61177) };
			{ 5, "s64303", "45769", "=q1=Glyph of Cloak of Shadows", "=ds="..AL["Book of Glyph Mastery"]};
			{ 6, "s57116", "42958", "=q1=Glyph of Crippling Poison", "=ds="..GetSpellInfo(61177) };
			{ 7, "s57117", "42959", "=q1=Glyph of Deadly Throw", "=ds="..GetSpellInfo(61177) };
			{ 8, "s57119", "42960", "=q1=Glyph of Evasion", "=ds="..AL["Trainer"] };
			{ 9, "s57120", "42961", "=q1=Glyph of Eviscerate", "=ds="..AL["Trainer"] };
			{ 10, "s57121", "42962", "=q1=Glyph of Expose Armor", "=ds="..AL["Trainer"] };
			{ 11, "s64315", "45766", "=q1=Glyph of Fan of Knives", "=ds="..AL["Book of Glyph Mastery"]};
			{ 12, "s57122", "42963", "=q1=Glyph of Feint", "=ds="..AL["Trainer"] };
			{ 13, "s57123", "42964", "=q1=Glyph of Garrote", "=ds="..AL["Trainer"] };
			{ 14, "s57124", "42965", "=q1=Glyph of Ghostly Strike", "=ds="..GetSpellInfo(61177) };
			{ 15, "s57125", "42966", "=q1=Glyph of Gouge", "=ds="..AL["Trainer"] };
			{ 16, "s57126", "42967", "=q1=Glyph of Hemorrhage", "=ds="..GetSpellInfo(61177) };
			{ 17, "s64284", "45761", "=q1=Glyph of Hunger for Blood", "=ds="..AL["Book of Glyph Mastery"]};
			{ 18, "s64285", "45762", "=q1=Glyph of Killing Spree", "=ds="..AL["Book of Glyph Mastery"]};
			{ 19, "s64260", "45768", "=q1=Glyph of Mutilate", "=ds="..AL["Book of Glyph Mastery"]};
			{ 20, "s57127", "42968", "=q1=Glyph of Preparation", "=ds="..GetSpellInfo(61177) };
			{ 21, "s57128", "42969", "=q1=Glyph of Rupture", "=ds="..GetSpellInfo(61177) };
			{ 22, "s57129", "42970", "=q1=Glyph of Sap", "=ds="..AL["Trainer"] };
			{ 23, "s64286", "45764", "=q1=Glyph of Shadow Dance", "=ds="..AL["Book of Glyph Mastery"]};
			{ 24, "s57131", "42972", "=q1=Glyph of Sinister Strike", "=ds="..AL["Trainer"] };
			{ 25, "s57132", "42973", "=q1=Glyph of Slice and Dice", "=ds="..AL["Trainer"] };
			{ 26, "s57133", "42974", "=q1=Glyph of Sprint", "=ds="..AL["Trainer"] };
			{ 27, "s64310", "45767", "=q1=Glyph of Tricks of the Trade", "=ds="..AL["Book of Glyph Mastery"]};
			{ 28, "s57130", "42971", "=q1=Glyph of Vigor", "=ds="..GetSpellInfo(61177) };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["ROGUE"];
			{ 1, "s58323", "43379", "=q1=Glyph of Blurred Speed", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58324", "43376", "=q1=Glyph of Distract", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58325", "43377", "=q1=Glyph of Pick Lock", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58326", "43343", "=q1=Glyph of Pick Pocket", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58327", "43378", "=q1=Glyph of Safe Fall", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58328", "43380", "=q1=Glyph of Vanish", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
			{ 1, "s57232", "41517", "=q1=Glyph of Chain Heal", "=ds="..GetSpellInfo(61177) };
			{ 2, "s57233", "41518", "=q1=Glyph of Chain Lightning", "=ds="..GetSpellInfo(61177) };
			{ 3, "s64261", "45775", "=q1=Glyph of Earth Shield", "=ds="..AL["Book of Glyph Mastery"]};
			{ 4, "s57235", "41526", "=q1=Glyph of Earth Shock", "=ds="..GetSpellInfo(61177) };
			{ 5, "s57236", "41527", "=q1=Glyph of Earthliving Weapon", "=ds="..AL["Trainer"] };
			{ 6, "s57250", "41552", "=q1=Glyph of Elemental Mastery", "=ds="..GetSpellInfo(61177) };
			{ 7, "s64288", "45771", "=q1=Glyph of Feral Spirit", "=ds="..AL["Book of Glyph Mastery"]};
			{ 8, "s57237", "41529", "=q1=Glyph of Fire Elemental Totem", "=ds="..GetSpellInfo(61177) };
			{ 9, "s57238", "41530", "=q1=Glyph of Fire Nova Totem", "=ds="..AL["Trainer"] };
			{ 10, "s57239", "41531", "=q1=Glyph of Flame Shock", "=ds="..AL["Trainer"] };
			{ 11, "s57240", "41532", "=q1=Glyph of Flametongue Weapon", "=ds="..AL["Trainer"] };
			{ 12, "s57241", "41547", "=q1=Glyph of Frost Shock", "=ds="..AL["Trainer"] };
			{ 13, "s57242", "41533", "=q1=Glyph of Healing Stream Totem", "=ds="..AL["Trainer"] };
			{ 14, "s57243", "41534", "=q1=Glyph of Healing Wave", "=ds="..GetSpellInfo(61177) };
			{ 15, "s64316", "45777", "=q1=Glyph of Hex", "=ds="..AL["Book of Glyph Mastery"]};
			{ 16, "s57234", "41524", "=q1=Glyph of Lava", "=ds="..GetSpellInfo(61177) };
			{ 17, "s57249", "41540", "=q1=Glyph of Lava Lash", "=ds="..AL["Trainer"] };
			{ 18, "s57244", "41535", "=q1=Glyph of Lesser Healing Wave", "=ds="..AL["Trainer"] };
			{ 19, "s57245", "41536", "=q1=Glyph of Lightning Bolt", "=ds="..AL["Trainer"] };
			{ 20, "s57246", "41537", "=q1=Glyph of Lightning Shield", "=ds="..AL["Trainer"] };
			{ 21, "s57247", "41538", "=q1=Glyph of Mana Tide Totem", "=ds="..GetSpellInfo(61177) };
			{ 22, "s64289", "45772", "=q1=Glyph of Riptide", "=ds="..AL["Book of Glyph Mastery"]};
			{ 23, "s64247", "45778", "=q1=Glyph of Stoneclaw Totem", "=ds="..AL["Book of Glyph Mastery"]};
			{ 24, "s57248", "41539", "=q1=Glyph of Stormstrike", "=ds="..AL["Trainer"] };
			{ 25, "s64287", "45770", "=q1=Glyph of Thunder", "=ds="..AL["Book of Glyph Mastery"]};
			{ 26, "s64262", "45776", "=q1=Glyph of Totem of WRATH", "=ds="..AL["Book of Glyph Mastery"]};
			{ 27, "s57251", "41541", "=q1=Glyph of Water Mastery", "=ds="..AL["Trainer"] };
			{ 28, "s57252", "41542", "=q1=Glyph of Windfury Weapon", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
			{ 1, "s58329", "43381", "=q1=Glyph of Astral Recall", "=ds="..GetSpellInfo(61288) };
			{ 2, "s59326", "43725", "=q1=Glyph of Ghost Wolf", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58330", "43385", "=q1=Glyph of Renewed Life", "=ds="..GetSpellInfo(61288) };
			{ 4, "s57253", "44923", "=q1=Glyph of Thunderstorm", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58331", "43344", "=q1=Glyph of Water Breathing", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58332", "43386", "=q1=Glyph of Water Shield", "=ds="..GetSpellInfo(61288) };
			{ 7, "s58333", "43388", "=q1=Glyph of Water Walking", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
			{ 1, "s64294", "45781", "=q1=Glyph of Chaos Bolt", "=ds="..AL["Book of Glyph Mastery"]};
			{ 2, "s57258", "42454", "=q1=Glyph of Conflagrate", "=ds="..GetSpellInfo(61177) };
			{ 3, "s57259", "42455", "=q1=Glyph of Corruption", "=ds="..AL["Trainer"] };
			{ 4, "s57260", "42456", "=q1=Glyph of Curse of Agony", "=ds="..GetSpellInfo(61177) };
			{ 5, "s57261", "42457", "=q1=Glyph of Death Coil", "=ds="..GetSpellInfo(61177) };
			{ 6, "s64317", "45782", "=q1=Glyph of Demonic Circle", "=ds="..AL["Book of Glyph Mastery"]};
			{ 7, "s57262", "42458", "=q1=Glyph of Fear", "=ds="..AL["Trainer"] };
			{ 8, "s57263", "42459", "=q1=Glyph of Felguard", "=ds="..GetSpellInfo(61177) };
			{ 9, "s57264", "42460", "=q1=Glyph of Felhunter", "=ds="..GetSpellInfo(61177) };
			{ 10, "s64291", "45779", "=q1=Glyph of Haunt", "=ds="..AL["Book of Glyph Mastery"]};
			{ 11, "s57265", "42461", "=q1=Glyph of Health Funnel", "=ds="..AL["Trainer"] };
			{ 12, "s57266", "42462", "=q1=Glyph of Healthstone", "=ds="..AL["Trainer"] };
			{ 13, "s57267", "42463", "=q1=Glyph of Howl of Terror", "=ds="..GetSpellInfo(61177) };
			{ 14, "s57268", "42464", "=q1=Glyph of Immolate", "=ds="..GetSpellInfo(61177) };
			{ 15, "s57269", "42465", "=q1=Glyph of Imp", "=ds="..AL["Trainer"] };
			{ 16, "s57257", "42453", "=q1=Glyph of Incinerate", "=ds="..AL["Trainer"] };
			{ 17, "s64248", "45785", "=q1=Glyph of Life Tap", "=ds="..AL["Book of Glyph Mastery"]};
			{ 18, "s64318", "45780", "=q1=Glyph of Metamorphosis", "=ds="..AL["Book of Glyph Mastery"]};
			{ 19, "s71102", "50077", "=q1=Glyph of Quick Decay", "=ds="..AL["Trainer"] };
			{ 20, "s57270", "42466", "=q1=Glyph of Searing Pain", "=ds="..AL["Trainer"] };
			{ 21, "s57271", "42467", "=q1=Glyph of Shadow Bolt", "=ds="..AL["Trainer"] };
			{ 22, "s57272", "42468", "=q1=Glyph of Shadowburn", "=ds="..AL["Trainer"] };
			{ 23, "s64311", "45783", "=q1=Glyph of Shadowflame", "=ds="..AL["Book of Glyph Mastery"]};
			{ 24, "s57273", "42469", "=q1=Glyph of Siphon Life", "=ds="..GetSpellInfo(61177) };
			{ 25, "s64250", "45789", "=q1=Glyph of Soul Link", "=ds="..AL["Book of Glyph Mastery"]};
			{ 26, "s57274", "42470", "=q1=Glyph of Soulstone", "=ds="..AL["Trainer"] };
			{ 27, "s57275", "42471", "=q1=Glyph of Succubus", "=ds="..AL["Trainer"] };
			{ 28, "s57276", "42472", "=q1=Glyph of Unstable Affliction", "=ds="..GetSpellInfo(61177) };
			{ 29, "s57277", "42473", "=q1=Glyph of Voidwalker", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
			{ 1, "s58338", "43392", "=q1=Glyph of Curse of Exhaustion", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58337", "43390", "=q1=Glyph of Drain Soul", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58339", "43393", "=q1=Glyph of Enslave Demon", "=ds="..GetSpellInfo(61288) };
			{ 4, "s58340", "43391", "=q1=Glyph of Kilrogg", "=ds="..GetSpellInfo(61288) };
			{ 5, "s58341", "43394", "=q1=Glyph of Souls", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58336", "43389", "=q1=Glyph of Unending Breath", "=ds="..GetSpellInfo(61288) };
		};
		{
			Name = AL["Major Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
			{ 1, "s57151", "43420", "=q1=Glyph of Barbaric Insults", "=ds="..AL["Trainer"] };
			{ 2, "s64295", "45790", "=q1=Glyph of Bladestorm", "=ds="..AL["Book of Glyph Mastery"]};
			{ 3, "s57152", "43425", "=q1=Glyph of Blocking", "=ds="..GetSpellInfo(61177) };
			{ 4, "s57153", "43412", "=q1=Glyph of Bloodthirst", "=ds="..GetSpellInfo(61177) };
			{ 5, "s57154", "43414", "=q1=Glyph of Cleaving", "=ds="..AL["Trainer"] };
			{ 6, "s57155", "43415", "=q1=Glyph of Devastate", "=ds="..GetSpellInfo(61177) };
			{ 7, "s64312", "45794", "=q1=Glyph of Enraged Regeneration", "=ds="};
			{ 8, "s57156", "43416", "=q1=Glyph of Execution", "=ds="..AL["Trainer"] };
			{ 9, "s57157", "43417", "=q1=Glyph of Hamstring", "=ds="..AL["Trainer"] };
			{ 10, "s57158", "43418", "=q1=Glyph of Heroic Strike", "=ds="..AL["Trainer"] };
			{ 11, "s57159", "43419", "=q1=Glyph of Intervene", "=ds="..GetSpellInfo(61177) };
			{ 12, "s57166", "43426", "=q1=Glyph of Last Stand", "=ds="..GetSpellInfo(61177) };
			{ 13, "s57160", "43421", "=q1=Glyph of Mortal Strike", "=ds="..GetSpellInfo(61177) };
			{ 14, "s57161", "43422", "=q1=Glyph of Overpower", "=ds="..AL["Trainer"] };
			{ 15, "s57162", "43413", "=q1=Glyph of Rapid Charge", "=ds="..AL["Trainer"] };
			{ 16, "s57163", "43423", "=q1=Glyph of Rending", "=ds="..AL["Trainer"] };
			{ 17, "s57164", "43430", "=q1=Glyph of Resonating Power", "=ds="..GetSpellInfo(61177) };
			{ 18, "s57165", "43424", "=q1=Glyph of Revenge", "=ds="..AL["Trainer"] };
			{ 19, "s64252", "45797", "=q1=Glyph of Shield Wall", "=ds="..AL["Book of Glyph Mastery"]};
			{ 20, "s64296", "45792", "=q1=Glyph of Shockwave", "=ds="..AL["Book of Glyph Mastery"]};
			{ 21, "s64302", "45795", "=q1=Glyph of Spell Reflection", "=ds="..AL["Book of Glyph Mastery"]};
			{ 22, "s57167", "43427", "=q1=Glyph of Sunder Armor", "=ds="..AL["Trainer"] };
			{ 23, "s57168", "43428", "=q1=Glyph of Sweeping Strikes", "=ds="..AL["Trainer"] };
			{ 24, "s57169", "43429", "=q1=Glyph of Taunt", "=ds="..GetSpellInfo(61177) };
			{ 25, "s57170", "43431", "=q1=Glyph of Victory Rush", "=ds="..GetSpellInfo(61177) };
			{ 26, "s64255", "45793", "=q1=Glyph of Vigilance", "=ds="..AL["Book of Glyph Mastery"]};
			{ 27, "s57172", "43432", "=q1=Glyph of Whirlwind", "=ds="..AL["Trainer"] };
		};
		{
			Name = AL["Minor Glyph"].." - "..LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
			{ 1, "s58342", "43395", "=q1=Glyph of Battle", "=ds="..GetSpellInfo(61288) };
			{ 2, "s58343", "43396", "=q1=Glyph of Bloodrage", "=ds="..GetSpellInfo(61288) };
			{ 3, "s58344", "43397", "=q1=Glyph of Charge", "=ds="..GetSpellInfo(61288) };
			{ 4, "s68166", "49084", "=q1=Glyph of Command", "=ds="..GetSpellInfo(61288)};
			{ 5, "s58347", "43400", "=q1=Glyph of Enduring Victory", "=ds="..GetSpellInfo(61288) };
			{ 6, "s58345", "43398", "=q1=Glyph of Mocking Blow", "=ds="..GetSpellInfo(61288) };
			{ 7, "s58346", "43399", "=q1=Glyph of Thunder Clap", "=ds="..GetSpellInfo(61288) };
		};
	};

		----------------------
		--- Leatherworking ---
		----------------------

	AtlasLoot_Data["LeatherworkingCLASSIC"] = {
			Name = LEATHERWORKING;
			Type = "Crafting";
		{
			Name = AL["Leather Armor"].." - Back";
			{ 1, "s22926", "18509", "=q4=Chromatic Cloak", "=ds=#sr# 300"};
			{ 2, "s22928", "18511", "=q4=Shifting Cloak", "=ds=#sr# 300"};
			{ 3, "s22927", "18510", "=q4=Hide of the Wild", "=ds=#sr# 300"};
			{ 4, "s19093", "15138", "=q3=Onyxia Scale Cloak", "=ds=#sr# 300"};
			{ 5, "s10574", "8215", "=q2=Wild Leather Cloak", "=ds=#sr# 250"};
			{ 6, "s10562", "8216", "=q2=Big Voodoo Cloak", "=ds=#sr# 240"};
			{ 7, "s7153", "5965", "=q2=Guardian Cloak", "=ds=#sr# 185"};
			{ 8, "s9198", "7377", "=q2=Frost Leather Cloak", "=ds=#sr# 180"};
			{ 9, "s9070", "7283", "=q2=Black Whelp Cloak", "=ds=#sr# 100"};
			{ 10, "s7953", "6466", "=q2=Deviate Scale Cloak", "=ds=#sr# 90"};
			{ 11, "s2159", "2308", "=q2=Fine Leather Cloak", "=ds=#sr# 85"};
			{ 12, "s3760", "3719", "=q1=Hillman's Cloak", "=ds=#sr# 150"};
			{ 13, "s2168", "2316", "=q1=Dark Leather Cloak", "=ds=#sr# 110"};
			{ 14, "s2162", "2310", "=q1=Embossed Leather Cloak", "=ds=#sr# 60"};
			{ 15, "s9058", "7276", "=q1=Handstitched Leather Cloak", "=ds=#sr# 1"};
		};
		{
			Name = AL["Leather Armor"].." - Chest";
			{ 1, "s28219", "22661", "=q4=Polar Tunic", "=ds=#sr# 300"};
			{ 2, "s19095", "15059", "=q3=Living Breastplate", "=ds=#sr# 300"};
			{ 3, "s24121", "19685", "=q3=Primal Batskin Jerkin", "=ds=#sr# 300"};
			{ 4, "s24124", "19688", "=q3=Blood Tiger Breastplate", "=ds=#sr# 300"};
			{ 5, "s19104", "15068", "=q2=Frostsaber Tunic", "=ds=#sr# 300"};
			{ 6, "s19102", "15090", "=q2=Runic Leather Armor", "=ds=#sr# 300"};
			{ 7, "s19098", "15085", "=q2=Wicked Leather Armor", "=ds=#sr# 300"};
			{ 8, "s19081", "15075", "=q2=Chimeric Vest", "=ds=#sr# 290"};
			{ 9, "s19086", "15066", "=q3=Ironfeather Breastplate", "=ds=#sr# 290"};
			{ 10, "s19079", "15056", "=q3=Stormshroud Armor", "=ds=#sr# 285"};
			{ 11, "s19076", "15053", "=q2=Volcanic Breastplate", "=ds=#sr# 285"};
			{ 12, "s19068", "15064", "=q3=Warbear Harness", "=ds=#sr# 275"};
			{ 13, "s10647", "8349", "=q3=Feathered Breastplate", "=ds=#sr# 250"};
			{ 14, "s10630", "8346", "=q3=Gauntlets of the Sea", "=ds=#sr# 230"};
			{ 15, "s10544", "8211", "=q2=Wild Leather Vest", "=ds=#sr# 225"};
			{ 16, "s10520", "8200", "=q2=Big Voodoo Robe", "=ds=#sr# 215"};
		};
		{
			Name = AL["Leather Armor"].." - Chest";
			{ 1, "s10499", "8175", "=q2=Nightscape Tunic", "=ds=#sr# 205"};
			{ 2, "s6661", "5739", "=q1=Barbaric Harness", "=ds=#sr# 190"};
			{ 3, "s9196", "7374", "=q2=Dusky Leather Armor", "=ds=#sr# 175"};
			{ 4, "s9197", "7375", "=q2=Green Whelp Armor", "=ds=#sr# 175"};
			{ 5, "s3773", "4256", "=q2=Guardian Armor", "=ds=#sr# 175"};
			{ 6, "s6704", "5782", "=q2=Thick Murloc Armor", "=ds=#sr# 170"};
			{ 7, "s4096", "4455", "=q2=Raptor Hide Harness", "=ds=#sr# 165"};
			{ 8, "s2166", "2314", "=q1=Toughened Leather Armor", "=ds=#sr# 120"};
			{ 9, "s24940", "20575", "=q2=Black Whelp Tunic", "=ds=#sr# 100"};
			{ 10, "s2169", "2317", "=q2=Dark Leather Tunic", "=ds=#sr# 100"};
			{ 11, "s3762", "4244", "=q2=Hillman's Leather Vest", "=ds=#sr# 100"};
			{ 12, "s6703", "5781", "=q2=Murloc Scale Breastplate", "=ds=#sr# 95"};
			{ 13, "s8322", "6709", "=q2=Moonglow Vest", "=ds=#sr# 90"};
			{ 14, "s3761", "4243", "=q2=Fine Leather Tunic", "=ds=#sr# 85"};
			{ 15, "s2160", "2300", "=q2=Embossed Leather Vest", "=ds=#sr# 40"};
			{ 16, "s2163", "2311", "=q1=White Leather Jerkin", "=ds=#sr# 60"};
			{ 17, "s7126", "5957", "=q1=Handstitched Leather Vest", "=ds=#sr# 1"};
		};

		{
			Name = AL["Leather Armor"].." - Feet";
			{ 1, "s28473", "22760", "=q3=Bramblewood Boots", "=ds=#sr# 300"};
			{ 2, "s22922", "18506", "=q3=Mongoose Boots", "=ds=#sr# 300"};
			{ 3, "s20853", "16982", "=q4=Corehound Boots", "=ds=#sr# 295"};
			{ 4, "s23705", "19052", "=q3=Dawn Treaders", "=ds=#sr# 290"};
			{ 5, "s44953", "34086", "=q1=Winter Boots", "=ds=#sr# 285"};
			{ 6, "s19063", "15073", "=q2=Chimeric Boots", "=ds=#sr# 275"};
			{ 7, "s19066", "15071", "=q2=Frostsaber Boots", "=ds=#sr# 275"};
			{ 8, "s10566", "8213", "=q2=Wild Leather Boots", "=ds=#sr# 245"};
			{ 9, "s10558", "8197", "=q2=Nightscape Boots", "=ds=#sr# 235"};
			{ 10, "s9207", "7390", "=q2=Dusky Boots", "=ds=#sr# 200"};
			{ 11, "s9208", "7391", "=q2=Swift Boots", "=ds=#sr# 200"};
			{ 12, "s2167", "2315", "=q1=Dark Leather Boots", "=ds=#sr# 100"};
			{ 13, "s2158", "2307", "=q1=Fine Leather Boots", "=ds=#sr# 90"};
			{ 14, "s2161", "2309", "=q2=Embossed Leather Boots", "=ds=#sr# 55"};
			{ 15, "s2149", "2302", "=q1=Handstitched Leather Boots", "=ds=#sr# 1"};
		};
		{
			Name = AL["Leather Armor"].." - Hands";
			{ 1, "s28220", "22662", "=q4=Polar Gloves", "=ds=#sr# 300"};
			{ 2, "s24122", "19686", "=q3=Primal Batskin Gloves", "=ds=#sr# 300"};
			{ 3, "s26279", "21278", "=q3=Stormshroud Gloves", "=ds=#sr# 300"};
			{ 4, "s19087", "15070", "=q2=Frostsaber Gloves", "=ds=#sr# 295"};
			{ 5, "s19084", "15063", "=q3=Devilsaur Gauntlets", "=ds=#sr# 290"};
			{ 6, "s19055", "15091", "=q2=Runic Leather Gauntlets", "=ds=#sr# 270"};
			{ 7, "s19053", "15074", "=q2=Chimeric Gloves", "=ds=#sr# 265"};
			{ 8, "s19049", "15083", "=q2=Wicked Leather Gauntlets", "=ds=#sr# 260"};
			{ 9, "s22711", "18238", "=q3=Shadowskin Gloves", "=ds=#sr# 200"};
			{ 10, "s21943", "17721", "=q2=Gloves of the Greatfather", "=ds=#sr# 190"};
			{ 11, "s7156", "5966", "=q1=Guardian Gloves", "=ds=#sr# 190"};
			{ 12, "s3771", "4254", "=q2=Barbaric Gloves", "=ds=#sr# 150"};
			{ 13, "s9149", "7359", "=q2=Heavy Earthen Gloves", "=ds=#sr# 145"};
			{ 14, "s3764", "4247", "=q2=Hillman's Leather Gloves", "=ds=#sr# 145"};
			{ 15, "s9148", "7358", "=q2=Pilferer's Gloves", "=ds=#sr# 140"};
			{ 16, "s3770", "4253", "=q3=Toughened Leather Gloves", "=ds=#sr# 135"};
			{ 17, "s9146", "7349", "=q2=Herbalist's Gloves", "=ds=#sr# 135"};
			{ 18, "s9145", "7348", "=q2=Fletcher's Gloves", "=ds=#sr# 125"};
			{ 19, "s3765", "4248", "=q2=Dark Leather Gloves", "=ds=#sr# 120"};
			{ 20, "s9074", "7285", "=q2=Nimble Leather Gloves", "=ds=#sr# 120"};
			{ 21, "s9072", "7284", "=q2=Red Whelp Gloves", "=ds=#sr# 120"};
			{ 22, "s7954", "6467", "=q2=Deviate Scale Gloves", "=ds=#sr# 105"};
			{ 23, "s2164", "2312", "=q2=Fine Leather Gloves", "=ds=#sr# 75"};
			{ 24, "s3756", "4239", "=q1=Embossed Leather Gloves", "=ds=#sr# 55"};
		};
		{
			Name = AL["Leather Armor"].." - Head";
			{ 1, "s20854", "16983", "=q4=Molten Helm", "=ds=#sr# 300"};
			{ 2, "s28472", "22759", "=q3=Bramblewood Helm", "=ds=#sr# 300"};
			{ 3, "s19082", "15094", "=q2=Runic Leather Headband", "=ds=#sr# 290"};
			{ 4, "s19071", "15086", "=q2=Wicked Leather Headband", "=ds=#sr# 280"};
			{ 5, "s10632", "8348", "=q3=Helm of Fire", "=ds=#sr# 250"};
			{ 6, "s10546", "8214", "=q2=Wild Leather Helmet", "=ds=#sr# 225"};
			{ 7, "s10621", "8345", "=q3=Wolfshead Helm", "=ds=#sr# 225"};
			{ 8, "s10531", "8201", "=q2=Big Voodoo Mask", "=ds=#sr# 220"};
			{ 9, "s10507", "8176", "=q2=Nightscape Headband", "=ds=#sr# 205"};
			{ 10, "s10490", "8174", "=q2=Comfortable Leather Hat", "=ds=#sr# 200"};
		};
		{
			Name = AL["Leather Armor"].." - Legs";
			{ 1, "s19091", "15095", "=q2=Runic Leather Pants", "=ds=#sr# 300"};
			{ 2, "s19097", "15062", "=q3=Devilsaur Leggings", "=ds=#sr# 300"};
			{ 3, "s19083", "15087", "=q2=Wicked Leather Pants", "=ds=#sr# 290"};
			{ 4, "s19074", "15069", "=q2=Frostsaber Leggings", "=ds=#sr# 285"};
			{ 5, "s19080", "15065", "=q3=Warbear Woolies", "=ds=#sr# 285"};
			{ 6, "s19078", "15060", "=q3=Living Leggings", "=ds=#sr# 285"};
			{ 7, "s19073", "15072", "=q2=Chimeric Leggings", "=ds=#sr# 280"};
			{ 8, "s19067", "15057", "=q3=Stormshroud Pants", "=ds=#sr# 275"};
			{ 9, "s19059", "15054", "=q2=Volcanic Leggings", "=ds=#sr# 270"};
			{ 10, "s36074", "29964", "=q3=Blackstorm Leggings", "=ds=#sr# 260"};
			{ 11, "s36075", "29970", "=q3=Wildfeather Leggings", "=ds=#sr# 260"};
			{ 12, "s10572", "8212", "=q2=Wild Leather Leggings", "=ds=#sr# 250"};
			{ 13, "s10560", "8202", "=q2=Big Voodoo Pants", "=ds=#sr# 240"};
			{ 14, "s10548", "8193", "=q2=Nightscape Pants", "=ds=#sr# 230"};
			{ 15, "s7149", "5963", "=q2=Barbaric Leggings", "=ds=#sr# 170"};
			{ 16, "s9195", "7373", "=q2=Dusky Leather Leggings", "=ds=#sr# 165"};
			{ 17, "s7147", "5962", "=q2=Guardian Pants", "=ds=#sr# 160"};
			{ 18, "s3772", "4255", "=q2=Green Leather Armor", "=ds=#sr# 155"};
			{ 19, "s7133", "5958", "=q2=Fine Leather Pants", "=ds=#sr# 105"};
			{ 20, "s7135", "5961", "=q2=Dark Leather Pants", "=ds=#sr# 115"};
			{ 21, "s9068", "7282", "=q2=Light Leather Pants", "=ds=#sr# 95"};
			{ 22, "s3759", "4242", "=q2=Embossed Leather Pants", "=ds=#sr# 75"};
			{ 23, "s9064", "7280", "=q2=Rugged Leather Pants", "=ds=#sr# 35"};
			{ 24, "s2153", "2303", "=q1=Handstitched Leather Pants", "=ds=#sr# 15"};

		};
		{
			Name = AL["Leather Armor"].." - Shoulder";
			{ 1, "s23704", "19049", "=q3=Timbermaw Brawlers", "=ds=#sr# 300"};
			{ 2, "s24125", "19689", "=q3=Blood Tiger Shoulders", "=ds=#sr# 300"};
			{ 3, "s23706", "19058", "=q3=Golden Mantle of the Dawn", "=ds=#sr# 300"};
			{ 4, "s19103", "15096", "=q2=Runic Leather Shoulders", "=ds=#sr# 300"};
			{ 5, "s19101", "15055", "=q2=Volcanic Shoulders", "=ds=#sr# 300"};
			{ 6, "s19090", "15058", "=q3=Stormshroud Shoulders", "=ds=#sr# 295"};
			{ 7, "s23703", "19044", "=q3=Might of the Timbermaw", "=ds=#sr# 290"};
			{ 8, "s19062", "15067", "=q3=Ironfeather Shoulders", "=ds=#sr# 270"};
			{ 9, "s19061", "15061", "=q3=Living Shoulders", "=ds=#sr# 270"};	
			{ 10, "s10529", "8210", "=q2=Wild Leather Shoulders", "=ds=#sr# 220"};
			{ 11, "s10516", "8192", "=q2=Nightscape Shoulders", "=ds=#sr# 210"};
			{ 12, "s7151", "5964", "=q2=Barbaric Shoulders", "=ds=#sr# 175"};
			{ 13, "s3769", "4252", "=q2=Dark Leather Shoulders", "=ds=#sr# 140"};
			{ 14, "s9147", "7352", "=q2=Earthen Leather Shoulders", "=ds=#sr# 135"};
			{ 15, "s3768", "4251", "=q2=Hillman's Shoulders", "=ds=#sr# 130"};
		};
		{
			Name = AL["Leather Armor"].." - Waist";
			{ 1, "s23709", "19162", "=q4=Corehound Belt", "=ds=#sr# 300"};
			{ 2, "s23707", "19149", "=q4=Lava Belt", "=ds=#sr# 300"};
			{ 3, "s23710", "19163", "=q4=Molten Belt", "=ds=#sr# 300"};
			{ 4, "s22921", "18504", "=q3=Girdle of Insight", "=ds=#sr# 300"};
			{ 5, "s28474", "22761", "=q3=Bramblewood Belt", "=ds=#sr# 300"};
			{ 6, "s19092", "15088", "=q2=Wicked Leather Belt", "=ds=#sr# 300"};
			{ 7, "s19072", "15093", "=q2=Runic Leather Belt", "=ds=#sr# 280"};
			{ 8, "s3779", "4264", "=q2=Barbaric Belt", "=ds=#sr# 200"};
			{ 9, "s9206", "7387", "=q2=Dusky Belt", "=ds=#sr# 195"};
			{ 10, "s3778", "4262", "=q3=Gem-studded Leather Belt", "=ds=#sr# 185"};
			{ 11, "s3775", "4258", "=q2=Guardian Belt", "=ds=#sr# 170"};
			{ 12, "s4097", "4456", "=q2=Raptor Hide Belt", "=ds=#sr# 165"};
			{ 13, "s3774", "4257", "=q2=Green Leather Belt", "=ds=#sr# 160"};
			{ 14, "s3766", "4249", "=q2=Dark Leather Belt", "=ds=#sr# 125"};
			{ 15, "s3767", "4250", "=q2=Hillman's Belt", "=ds=#sr# 120"};
			{ 16, "s7955", "6468", "=q3=Deviate Scale Belt", "=ds=#sr# 115"};
			{ 17, "s6702", "5780", "=q2=Murloc Scale Belt", "=ds=#sr# 90"};
			{ 18, "s3763", "4246", "=q1=Fine Leather Belt", "=ds=#sr# 80"};
			{ 19, "s3753", "4237", "=q1=Handstitched Leather Belt", "=ds=#sr# 25"};
		};
		{
			Name = AL["Leather Armor"].." - Wrist";
			{ 1, "s28221", "22663", "=q4=Polar Bracers", "=ds=#sr# 300"};
			{ 2, "s24123", "19687", "=q3=Primal Batskin Bracers", "=ds=#sr# 300"};
			{ 3, "s19065", "15092", "=q2=Runic Leather Bracers", "=ds=#sr# 275"};
			{ 4, "s19052", "15084", "=q2=Wicked Leather Bracers", "=ds=#sr# 265"};
			{ 5, "s3777", "4260", "=q2=Guardian Leather Bracers", "=ds=#sr# 195"};
			{ 6, "s9202", "7386", "=q2=Green Whelp Bracers", "=ds=#sr# 190"};
			{ 7, "s6705", "5783", "=q2=Murloc Scale Bracers", "=ds=#sr# 190"};
			{ 8, "s9201", "7378", "=q2=Dusky Bracers", "=ds=#sr# 185"};
			{ 9, "s3776", "4259", "=q2=Green Leather Bracers", "=ds=#sr# 180"};
			{ 10, "s23399", "18948", "=q3=Barbaric Bracers", "=ds=#sr# 155"};
			{ 11, "s9065", "7281", "=q1=Light Leather Bracers", "=ds=#sr# 70"};
			{ 12, "s9059", "7277", "=q1=Handstitched Leather Bracers", "=ds=#sr# 1"};
		};
		{
			Name = AL["Mail Armor"].." - Chest";
			{ 1, "s28222", "22664", "=q4=Icy Scale Breastplate", "=ds=#sr# 300"};
			{ 2, "s24703", "20380", "=q4=Dreamscale Breastplate", "=ds=#sr# 300"};
			{ 3, "s24851", "20478", "=q3=Sandstalker Breastplate", "=ds=#sr# 300"};
			{ 4, "s24848", "20479", "=q3=Spitfire Breastplate", "=ds=#sr# 300"};
			{ 5, "s19054", "15047", "=q3=Red Dragonscale Breastplate", "=ds=#sr# 300"};
			{ 6, "s19085", "15050", "=q3=Black Dragonscale Breastplate", "=ds=#sr# 290"};
			{ 7, "s19077", "15048", "=q3=Blue Dragonscale Breastplate", "=ds=#sr# 285"};
			{ 8, "s19050", "15045", "=q3=Green Dragonscale Breastplate", "=ds=#sr# 260"};
			{ 9, "s19051", "15076", "=q2=Heavy Scorpid Vest", "=ds=#sr# 265"};
			{ 10, "s10650", "8367", "=q3=Dragonscale Breastplate", "=ds=#sr# 255"};
			{ 11, "s10525", "8203", "=q2=Tough Scorpid Breastplate", "=ds=#sr# 220"};
			{ 12, "s10511", "8189", "=q2=Turtle Scale Breastplate", "=ds=#sr# 210"};
		};
		{
			Name = AL["Mail Armor"].." - Feet";
			{ 1, "s20855", "16984", "=q4=Black Dragonscale Boots", "=ds=#sr# 300"};
			{ 2, "s10554", "8209", "=q2=Tough Scorpid Boots", "=ds=#sr# 235"};
		};
		{
			Name = AL["Mail Armor"].." - Hands";
			{ 1, "s28223", "22666", "=q4=Icy Scale Gauntlets", "=ds=#sr# 300"};
			{ 2, "s23708", "19157", "=q4=Chromatic Gauntlets", "=ds=#sr# 300"};
			{ 3, "s24850", "20477", "=q3=Sandstalker Gauntlets", "=ds=#sr# 300"};
			{ 4, "s24847", "20480", "=q3=Spitfire Gauntlets", "=ds=#sr# 300"};
			{ 5, "s24655", "20296", "=q3=Green Dragonscale Gauntlets", "=ds=#sr# 280"};
			{ 6, "s19064", "15078", "=q2=Heavy Scorpid Gauntlets", "=ds=#sr# 275"};
			{ 7, "s10619", "8347", "=q3=Dragonscale Gauntlets", "=ds=#sr# 225"};
			{ 8, "s10542", "8204", "=q2=Tough Scorpid Gloves", "=ds=#sr# 225"};
			{ 9, "s10509", "8187", "=q2=Turtle Scale Gloves", "=ds=#sr# 205"};
		};
		{
			Name = AL["Mail Armor"].." - Head";
			{ 1, "s19088", "15080", "=q2=Heavy Scorpid Helm", "=ds=#sr# 295"};
			{ 2, "s10570", "8208", "=q2=Tough Scorpid Helm", "=ds=#sr# 250"};
			{ 3, "s10552", "8191", "=q2=Turtle Scale Helm", "=ds=#sr# 230"};
		};
		{
			Name = AL["Mail Armor"].." - Legs";
			{ 1, "s24654", "20295", "=q3=Blue Dragonscale Leggings", "=ds=#sr# 300"};
			{ 2, "s19107", "15052", "=q3=Black Dragonscale Leggings", "=ds=#sr# 300"};
			{ 3, "s19075", "15079", "=q2=Heavy Scorpid Leggings", "=ds=#sr# 285"};
			{ 4, "s19060", "15046", "=q3=Green Dragonscale Leggings", "=ds=#sr# 270"};
			{ 5, "s36076", "29971", "=q3=Dragonstrike Leggings", "=ds=#sr# 260"};
			{ 6, "s10568", "8206", "=q2=Tough Scorpid Leggings", "=ds=#sr# 245"};
			{ 7, "s10556", "8185", "=q2=Turtle Scale Leggings", "=ds=#sr# 235"};
		};
		{
			Name = AL["Mail Armor"].." - Shoulder";
			{ 1, "s19094", "15051", "=q3=Black Dragonscale Shoulders", "=ds=#sr# 300"};
			{ 2, "s19100", "15081", "=q2=Heavy Scorpid Shoulders", "=ds=#sr# 300"};
			{ 3, "s19089", "15049", "=q3=Blue Dragonscale Shoulders", "=ds=#sr# 295"};
			{ 4, "s10564", "8207", "=q2=Tough Scorpid Shoulders", "=ds=#sr# 240"};

		};
		{
			Name = AL["Mail Armor"].." - Waist";
			{ 1, "s19070", "15082", "=q2=Heavy Scorpid Belt", "=ds=#sr# 280"};
		};
		{
			Name = AL["Mail Armor"].." - Wrist";
			{ 1, "s28224", "22665", "=q4=Icy Scale Bracers", "=ds=#sr# 300"};
			{ 2, "s22923", "18508", "=q3=Swift Flight Bracers", "=ds=#sr# 300"};
			{ 3, "s24849", "20476", "=q3=Sandstalker Bracers", "=ds=#sr# 300"};
			{ 4, "s24846", "20481", "=q3=Spitfire Bracers", "=ds=#sr# 300"};
			{ 5, "s19048", "15077", "=q2=Heavy Scorpid Bracers", "=ds=#sr# 255"};
			{ 6, "s10533", "8205", "=q2=Tough Scorpid Bracers", "=ds=#sr# 220"};
			{ 7, "s10518", "8198", "=q2=Turtle Scale Bracers", "=ds=#sr# 210"};
		};
		{
			Name = AL["Item Enhancements"];
			{ 1, "s19058", "15564", "=q1=Rugged Armor Kit", "=ds=#sr# 250"};
			{ 2, "s10487", "8173", "=q1=Thick Armor Kit", "=ds=#sr# 200"};
			{ 3, "s3780", "4265", "=q1=Heavy Armor Kit", "=ds=#sr# 150"};
			{ 4, "s2165", "2313", "=q1=Medium Armor Kit", "=ds=#sr# 100"};
			{ 5, "s2152", "2304", "=q1=Light Armor Kit", "=ds=#sr# 1"};
		};
		{
			Name = AL["Quivers and Ammo Pouches"];
			{ 1, "s14930", "8217", "=q2=Quickdraw Quiver", "=ds=#sr# 225"};
			{ 2, "s14932", "8218", "=q2=Thick Leather Ammo Pouch", "=ds=#sr# 225"};
			{ 3, "s9194", "7372", "=q2=Heavy Leather Ammo Pouch", "=ds=#sr# 150"};
			{ 4, "s9193", "7371", "=q2=Heavy Quiver", "=ds=#sr# 150"};
			{ 5, "s9060", "7278", "=q1=Light Leather Quiver", "=ds=#sr# 30"};
			{ 6, "s9062", "7279", "=q1=Small Leather Ammo Pouch", "=ds=#sr# 30"};
		};
		{
			Name = AL["Drums, Bags and Misc."];
			{ 1, "s22815", "18258", "=q2=Gordok Ogre Suit", "=ds=#sr# 275"};
			{ 2, "s23190", "18662", "=q1=Heavy Leather Ball", "=ds=#sr# 150"};
			{ 3, "s5244", "5081", "=q1=Kodo Hide Bag", "=ds=#sr# 40"};
		};
		{
			Name = BabbleInventory["Leather"];
			{ 1, "s22331", "8170", "=q1=Rugged Leather", "=ds=#sr# 250"};
			{ 2, "s19047", "15407", "=q1=Cured Rugged Hide", "=ds=#sr# 250"};
			{ 3, "s20650", "4304", "=q1=Thick Leather", "=ds=#sr# 200"};
			{ 4, "s10482", "8172", "=q1=Cured Thick Hide", "=ds=#sr# 200"};
			{ 5, "s20649", "4234", "=q1=Heavy Leather", "=ds=#sr# 150"};
			{ 6, "s3818", "4236", "=q1=Cured Heavy Hide", "=ds=#sr# 150"};
			{ 7, "s20648", "2319", "=q1=Medium Leather", "=ds=#sr# 100"};
			{ 8, "s3817", "4233", "=q1=Cured Medium Hide", "=ds=#sr# 100"};
			{ 9, "s3816", "4231", "=q1=Cured Light Hide", "=ds=#sr# 35"};
			{ 10, "s2881", "2318", "=q1=Light Leather", "=ds=#sr# 1"};
		};
		{
			Name = DRAGONSCALE;
			{ 1, "s24654", "20295", "=q3=Blue Dragonscale Leggings", "=ds=#sr# 300"};
			{ 2, "s24655", "20296", "=q3=Green Dragonscale Gauntlets", "=ds=#sr# 280"};
			{ 3, "s36076", "29971", "=q3=Dragonstrike Leggings", "=ds=#sr# 260"};
			{ 4, "s10650", "8367", "=q3=Dragonscale Breastplate", "=ds=#sr# 255"};
			{ 5, "s10619", "8347", "=q3=Dragonscale Gauntlets", "=ds=#sr# 225"};
		};
		{
			Name = ELEMENTAL;
			{ 3, "s10630", "8346", "=q3=Gauntlets of the Sea", "=ds=#sr# 230"};
			{ 2, "s10632", "8348", "=q3=Helm of Fire", "=ds=#sr# 250"};
			{ 1, "s36074", "29964", "=q3=Blackstorm Leggings", "=ds=#sr# 260"};
		};
		{
			Name = TRIBAL;
			{ 3, "s10621", "8345", "=q3=Wolfshead Helm", "=ds=#sr# 225"};
			{ 2, "s10647", "8349", "=q3=Feathered Breastplate", "=ds=#sr# 250"};
			{ 1, "s36075", "29970", "=q3=Wildfeather Leggings", "=ds=#sr# 260"};
		};
	};

		--------------
		--- Mining ---
		--------------

	AtlasLoot_Data["MiningCLASSIC"] = {
			Name = MINING;
			Type = "CraftingNoBF";
					{
			Name = MINING;
			{ 1, "s22967", "17771", "=q5=Smelt Elementium", "=ds=#sr# 300"};
			{ 2, "s70524", "12655", "=q1=Enchanted Thorium", "=ds=#sr# 250"};
			{ 3, "s16153", "12359", "=q1=Smelt Thorium", "=ds=#sr# 250"};
			{ 4, "s14891", "11371", "=q1=Smelt Dark Iron", "=ds=#sr# 230"};
			{ 5, "s10098", "6037", "=q2=Smelt Truesilver", "=ds=#sr# 230"};
			{ 6, "s10097", "3860", "=q1=Smelt Mithril", "=ds=#sr# 175"};
			{ 7, "s3569", "3859", "=q1=Smelt Steel", "=ds=#sr# 165"};
			{ 8, "s3308", "3577", "=q2=Smelt Gold", "=ds=#sr# 155"};
			{ 9, "s3307", "3575", "=q1=Smelt Iron", "=ds=#sr# 125"};
			{ 10, "s2658", "2842", "=q2=Smelt Silver", "=ds=#sr# 75"};
			{ 11, "s2659", "2841", "=q1=Smelt Bronze", "=ds=#sr# 65"};
			{ 12, "s3304", "3576", "=q1=Smelt Tin", "=ds=#sr# 65"};
			{ 13, "s2657", "2840", "=q1=Smelt Copper", "=ds=#sr# 1"};
		};
	};

		-----------------
		--- Tailoring ---
		-----------------

	AtlasLoot_Data["TailoringCLASSIC"] = {
			Name = TAILORING;
			Type = "Crafting";
					{
			Name = AL["Cloth Armor"].." - Back";
			{ 1, "s28208", "22658", "=q4=Glacial Cloak", "=ds=#sr# 300"};
			{ 2, "s22870", "18413", "=q3=Cloak of Warding", "=ds=#sr# 300"};
			{ 3, "s23662", "19047", "=q3=Wisdom of the Timbermaw", "=ds=#sr# 290"};
			{ 4, "s18422", "14134", "=q3=Cloak of Fire", "=ds=#sr# 275"};
			{ 5, "s18409", "13860", "=q2=Runecloth Cloak", "=ds=#sr# 265"};
			{ 6, "s3862", "4327", "=q3=Icy Cloak", "=ds=#sr# 200"};
			{ 7, "s63742", "45626", "=q3=Spidersilk Drape", "=ds=#sr# 125"};
			{ 8, "s18420", "14103", "=q2=Brightcloth Cloak", "=ds=#sr# 275"};
			{ 9, "s18418", "14044", "=q2=Cindercloth Cloak", "=ds=#sr# 275"};
			{ 10, "s3861", "4326", "=q2=Long Silken Cloak", "=ds=#sr# 185"};
			{ 11, "s8789", "7056", "=q2=Crimson Silk Cloak", "=ds=#sr# 180"};
			{ 12, "s8786", "7053", "=q2=Azure Silk Cloak", "=ds=#sr# 175"};
			{ 13, "s8780", "7047", "=q2=Hands of Darkness", "=ds=#sr# 145"};
			{ 14, "s3856", "4321", "=q2=Spider Silk Slippers", "=ds=#sr# 140"};
			{ 15, "s3844", "4311", "=q2=Heavy Woolen Cloak", "=ds=#sr# 100"};
			{ 16, "s6521", "5542", "=q2=Pearl-clasped Cloak", "=ds=#sr# 90"};
			{ 17, "s3842", "4309", "=q2=Handstitched Linen Britches", "=ds=#sr# 70"};
			{ 18, "s2402", "2584", "=q1=Woolen Cape", "=ds=#sr# 75"};
			{ 19, "s2387", "2570", "=q1=Linen Cloak", "=ds=#sr# 1"};
		};
		{
			Name = AL["Cloth Armor"].." - Chest";
			{ 1, "s23666", "19156", "=q4=Flarecore Robe", "=ds=#sr# 300"};
			{ 2, "s28207", "22652", "=q4=Glacial Vest", "=ds=#sr# 300"};
			{ 3, "s18457", "14152", "=q4=Robe of the Archmage", "=ds=#sr# 300"};
			{ 4, "s18458", "14153", "=q4=Robe of the Void", "=ds=#sr# 300"};
			{ 5, "s18456", "14154", "=q4=Truefaith Vestments", "=ds=#sr# 300"};
			{ 6, "s24091", "19682", "=q3=Bloodvine Vest", "=ds=#sr# 300"};
			{ 7, "s22902", "18486", "=q3=Mooncloth Robe", "=ds=#sr# 300"};
			{ 8, "s18447", "14138", "=q3=Mooncloth Vest", "=ds=#sr# 300"};
			{ 9, "s28480", "22756", "=q3=Sylvan Vest", "=ds=#sr# 300"};
			{ 10, "s18436", "14136", "=q3=Robe of Winter Night", "=ds=#sr# 285"};
			{ 11, "s12070", "10021", "=q3=Dreamweave Vest", "=ds=#sr# 225"};
			{ 12, "s8770", "7054", "=q3=Robe of Power", "=ds=#sr# 190"};
			{ 13, "s18451", "14106", "=q2=Felcloth Robe", "=ds=#sr# 300"};
			{ 14, "s18446", "14128", "=q2=Wizardweave Robe", "=ds=#sr# 300"};
			{ 15, "s18416", "14141", "=q2=Ghostweave Vest", "=ds=#sr# 275"};
			{ 16, "s22813", "18258", "=q2=Gordok Ogre Suit", "=ds=#sr# 275"};
			{ 17, "s18414", "14100", "=q2=Brightcloth Robe", "=ds=#sr# 270"};
			{ 18, "s18408", "14042", "=q2=Cindercloth Vest", "=ds=#sr# 260"};
			{ 19, "s18406", "13858", "=q2=Runecloth Robe", "=ds=#sr# 260"};
			{ 20, "s18407", "13857", "=q2=Runecloth Tunic", "=ds=#sr# 260"};
			{ 21, "s18404", "13868", "=q2=Frostweave Robe", "=ds=#sr# 255"};
			{ 22, "s18403", "13869", "=q2=Frostweave Tunic", "=ds=#sr# 255"};
			{ 23, "s26407", "21542", "=q1=Festive Red Pant Suit", "=ds=#sr# 250"};
			{ 24, "s26403", "21154", "=q1=Festival Dress", "=ds=#sr# 250"};
			{ 25, "s12093", "10036", "=q1=Tuxedo Jacket", "=ds=#sr# 250"};
			{ 26, "s44950", "34087", "=q1=Green Winter Clothes", "=ds=#sr# 250"};
			{ 27, "s44958", "34085", "=q1=Red Winter Clothes", "=ds=#sr# 250"};
			{ 28, "s12091", "10040", "=q1=White Wedding Dress", "=ds=#sr# 250"};
			{ 29, "s12077", "10053", "=q1=Simple Black Dress", "=ds=#sr# 235"};
			{ 30, "s12069", "10042", "=q2=Cindercloth Robe", "=ds=#sr# 225"};
		};
		{
			Name = AL["Cloth Armor"].." - Chest";
			{ 1, "s12056", "10007", "=q2=Red Mageweave Vest", "=ds=#sr# 215"};
			{ 2, "s12055", "10004", "=q2=Shadoweave Robe", "=ds=#sr# 215"};
			{ 3, "s12050", "10001", "=q2=Black Mageweave Robe", "=ds=#sr# 210"};
			{ 4, "s12048", "9998", "=q2=Black Mageweave Vest", "=ds=#sr# 205"};
			{ 5, "s8802", "7063", "=q2=Crimson Silk Robe", "=ds=#sr# 205"};
			{ 6, "s8791", "7058", "=q1=Crimson Silk Vest", "=ds=#sr# 185"};
			{ 7, "s8764", "7051", "=q2=Earthen Vest", "=ds=#sr# 170"};
			{ 8, "s8784", "7065", "=q2=Green Silk Armor", "=ds=#sr# 165"};
			{ 9, "s3859", "4324", "=q2=Azure Silk Vest", "=ds=#sr# 150"};
			{ 10, "s6692", "5770", "=q2=Robes of Arcana", "=ds=#sr# 150"};
			{ 11, "s6690", "5766", "=q2=Lesser Wizard's Robe", "=ds=#sr# 135"};
			{ 12, "s12047", "10048", "=q2=Colorful Kilt", "=ds=#sr# 120"};
			{ 13, "s7643", "6264", "=q2=Greater Adept's Robe", "=ds=#sr# 115"};
			{ 14, "s8467", "6787", "=q1=White Woolen Dress", "=ds=#sr# 110"};
			{ 15, "s2403", "2585", "=q2=Gray Woolen Robe", "=ds=#sr# 105"};
			{ 16, "s7639", "6263", "=q2=Blue Overalls", "=ds=#sr# 100"};
			{ 17, "s2399", "2582", "=q1=Green Woolen Vest", "=ds=#sr# 85"};
			{ 18, "s12046", "10047", "=q1=Simple Kilt", "=ds=#sr# 75"};
			{ 19, "s2395", "2578", "=q2=Barbaric Linen Vest", "=ds=#sr# 70"};
			{ 20, "s7633", "6242", "=q2=Blue Linen Robe", "=ds=#sr# 70"};
			{ 21, "s7630", "6240", "=q2=Blue Linen Vest", "=ds=#sr# 55"};
			{ 22, "s7629", "6239", "=q2=Red Linen Vest", "=ds=#sr# 55"};
			{ 23, "s8465", "6786", "=q1=Simple Dress", "=ds=#sr# 40"};
			{ 24, "s2389", "2572", "=q2=Red Linen Robe", "=ds=#sr# 40"};
			{ 25, "s7623", "6238", "=q2=Brown Linen Robe", "=ds=#sr# 30"};
			{ 26, "s7624", "6241", "=q2=White Linen Robe", "=ds=#sr# 30"};
			{ 27, "s2385", "2568", "=q1=Brown Linen Vest", "=ds=#sr# 10"};
			{ 28, "s50644", "38277", "=q1=Haliscan Jacket", "=ds="..AL["Vendor"]..""};
		};
		{
			Name = AL["Cloth Armor"].." - Feet";
			{ 1, "s24093", "19684", "=q3=Bloodvine Boots", "=ds=#sr# 300"};
			{ 2, "s24903", "20537", "=q3=Runed Stygian Boots", "=ds=#sr# 300"};
			{ 3, "s19435", "15802", "=q3=Mooncloth Boots", "=ds=#sr# 290"};
			{ 4, "s23664", "19056", "=q3=Argent Boots", "=ds=#sr# 290"};
			{ 5, "s18437", "14108", "=q2=Felcloth Boots", "=ds=#sr# 285"};
			{ 6, "s18423", "13864", "=q2=Runecloth Boots", "=ds=#sr# 280"};
			{ 7, "s12088", "10044", "=q2=Cindercloth Boots", "=ds=#sr# 245"};
			{ 8, "s12082", "10031", "=q2=Shadoweave Boots", "=ds=#sr# 240"};
			{ 9, "s12073", "10026", "=q2=Black Mageweave Boots", "=ds=#sr# 230"};
			{ 10, "s3860", "4325", "=q2=Boots of the Enchanter", "=ds=#sr# 175"};
			{ 11, "s3855", "4320", "=q3=Spidersilk Boots", "=ds=#sr# 125"};
			{ 12, "s3847", "4313", "=q2=Red Woolen Boots", "=ds=#sr# 95"};
			{ 13, "s2401", "2583", "=q2=Woolen Boots", "=ds=#sr# 95"};
			{ 14, "s3845", "4312", "=q2=Soft-soled Linen Boots", "=ds=#sr# 80"};
			{ 15, "s2386", "2569", "=q1=Linen Boots", "=ds=#sr# 65"};
			{ 16, "s12045", "10046", "=q1=Simple Linen Boots", "=ds=#sr# 20"};
			{ 17, "s49677", "6836", "=q1=Dress Shoes", "=ds="..AL["Vendor"]..""};
		};
		{
			Name = AL["Cloth Armor"].." - Hands";
			{ 1, "s22759", "18263", "=q4=Flarecore Wraps", "=ds=#sr# 300"};
			{ 2, "s20849", "16979", "=q4=Flarecore Gloves", "=ds=#sr# 300"};
			{ 3, "s28205", "22654", "=q4=Glacial Gloves", "=ds=#sr# 300"};
			{ 4, "s18454", "14146", "=q4=Gloves of Spell Mastery", "=ds=#sr# 300"};
			{ 5, "s22867", "18407", "=q3=Felcloth Gloves", "=ds=#sr# 300"};
			{ 6, "s22868", "18408", "=q3=Inferno Gloves", "=ds=#sr# 300"};
			{ 7, "s22869", "18409", "=q3=Mooncloth Gloves", "=ds=#sr# 300"};
			{ 8, "s12067", "10019", "=q3=Dreamweave Gloves", "=ds=#sr# 225"};
			{ 9, "s18417", "13863", "=q2=Runecloth Gloves", "=ds=#sr# 275"};
			{ 10, "s18415", "14101", "=q2=Brightcloth Gloves", "=ds=#sr# 270"};
			{ 11, "s18412", "14043", "=q2=Cindercloth Gloves", "=ds=#sr# 270"};
			{ 12, "s18413", "14142", "=q2=Ghostweave Gloves", "=ds=#sr# 270"};
			{ 13, "s18411", "13870", "=q2=Frostweave Gloves", "=ds=#sr# 265"};
			{ 14, "s12066", "10018", "=q2=Red Mageweave Gloves", "=ds=#sr# 225"};
			{ 15, "s12071", "10023", "=q2=Shadoweave Gloves", "=ds=#sr# 225"};
			{ 16, "s12053", "10003", "=q2=Black Mageweave Gloves", "=ds=#sr# 215"};
			{ 17, "s8804", "7064", "=q2=Crimson Silk Gloves", "=ds=#sr# 210"};
			{ 18, "s8782", "7049", "=q2=Truefaith Gloves", "=ds=#sr# 150"};
			{ 19, "s3854", "4319", "=q2=Azure Silk Gloves", "=ds=#sr# 145"};
			{ 20, "s3852", "4318", "=q2=Gloves of Meditation", "=ds=#sr# 130"};
			{ 21, "s3868", "4331", "=q2=Phoenix Gloves", "=ds=#sr# 125"};
			{ 22, "s3843", "4310", "=q2=Heavy Woolen Gloves", "=ds=#sr# 85"};
			{ 23, "s3840", "4307", "=q1=Heavy Linen Gloves", "=ds=#sr# 35"};
		};
		{
			Name = AL["Cloth Armor"].." - Head";
			{ 1, "s28210", "22660", "=q3=Gaea's Embrace", "=ds=#sr# 300"};
			{ 2, "s18452", "14140", "=q3=Mooncloth Circlet", "=ds=#sr# 300"};
			{ 3, "s28481", "22757", "=q3=Sylvan Crown", "=ds=#sr# 300"};
			{ 4, "s18450", "14130", "=q2=Wizardweave Turban", "=ds=#sr# 300"};
			{ 5, "s12092", "10041", "=q3=Dreamweave Circlet", "=ds=#sr# 250"};
			{ 6, "s18442", "14111", "=q2=Felcloth Hood", "=ds=#sr# 290"};
			{ 7, "s18444", "13866", "=q2=Runecloth Headband", "=ds=#sr# 295"};
			{ 8, "s12086", "10025", "=q2=Shadoweave Mask", "=ds=#sr# 245"};
			{ 9, "s12081", "10030", "=q2=Admiral's Hat", "=ds=#sr# 240"};
			{ 10, "s12084", "10033", "=q2=Red Mageweave Headband", "=ds=#sr# 240"};
			{ 11, "s12072", "10024", "=q2=Black Mageweave Headband", "=ds=#sr# 230"};
			{ 12, "s12059", "10008", "=q2=White Bandit Mask", "=ds=#sr# 215"};
			{ 13, "s3858", "4323", "=q2=Shadow Hood", "=ds=#sr# 170"};
			{ 14, "s3857", "4322", "=q2=Enchanter's Cowl", "=ds=#sr# 165"};
			{ 15, "s8762", "7050", "=q1=Silk Headband", "=ds=#sr# 160"};
			{ 16, "s8760", "7048", "=q1=Azure Silk Hood", "=ds=#sr# 145"};
			{ 17, "s2397", "2580", "=q1=Reinforced Linen Cape", "=ds=#sr# 60"};

		};
		{
			Name = AL["Cloth Armor"].." - Legs";
			{ 1, "s23667", "19165", "=q4=Flarecore Leggings", "=ds=#sr# 300"};
			{ 2, "s24092", "19683", "=q3=Bloodvine Leggings", "=ds=#sr# 300"};
			{ 3, "s24901", "20538", "=q3=Runed Stygian Leggings", "=ds=#sr# 300"};
			{ 4, "s18440", "14137", "=q3=Mooncloth Leggings", "=ds=#sr# 290"};
			{ 5, "s18439", "14104", "=q2=Brightcloth Pants", "=ds=#sr# 290"};
			{ 6, "s18441", "14144", "=q2=Ghostweave Pants", "=ds=#sr# 290"};
			{ 7, "s18438", "13865", "=q2=Runecloth Pants", "=ds=#sr# 285"};
			{ 8, "s18434", "14045", "=q2=Cindercloth Pants", "=ds=#sr# 280"};
			{ 9, "s18424", "13871", "=q2=Frostweave Pants", "=ds=#sr# 280"};
			{ 10, "s18419", "14107", "=q2=Felcloth Pants", "=ds=#sr# 275"};
			{ 11, "s18421", "14132", "=q2=Wizardweave Leggings", "=ds=#sr# 275"};
			{ 12, "s50647", "38278", "=q1=Haliscan Pantaloons", "=ds="..AL["Vendor"]..""};
			{ 13, "s12060", "10009", "=q2=Red Mageweave Pants", "=ds=#sr# 215"};
			{ 14, "s12052", "10002", "=q2=Shadoweave Pants", "=ds=#sr# 210"};
			{ 15, "s12049", "9999", "=q2=Black Mageweave Leggings", "=ds=#sr# 205"};
			{ 16, "s8758", "7046", "=q2=Azure Silk Pants", "=ds=#sr# 140"};
			{ 17, "s3851", "4317", "=q2=Phoenix Pants", "=ds=#sr# 125"};
			{ 18, "s3850", "4316", "=q2=Heavy Woolen Pants", "=ds=#sr# 110"};
			{ 19, "s12089", "10035", "=q1=Tuxedo Pants", "=ds=#sr# 245"};
			{ 20, "s3914", "4343", "=q1=Brown Linen Pants", "=ds=#sr# 30"};
			{ 21, "s12044", "10045", "=q1=Simple Linen Pants", "=ds=#sr# 1"};

		};
		{
			Name = AL["Cloth Armor"].." - Shoulder";
			{ 1, "s20848", "16980", "=q4=Flarecore Mantle", "=ds=#sr# 300"};
			{ 2, "s23665", "19059", "=q3=Argent Shoulders", "=ds=#sr# 300"};
			{ 3, "s23663", "19050", "=q3=Mantle of the Timbermaw", "=ds=#sr# 300"};
			{ 4, "s18448", "14139", "=q3=Mooncloth Shoulders", "=ds=#sr# 300"};
			{ 5, "s28482", "22758", "=q3=Sylvan Shoulders", "=ds=#sr# 300"};
			{ 6, "s18453", "14112", "=q2=Felcloth Shoulders", "=ds=#sr# 300"};
			{ 7, "s18449", "13867", "=q2=Runecloth Shoulders", "=ds=#sr# 300"};
			{ 8, "s12078", "10029", "=q2=Red Mageweave Shoulders", "=ds=#sr# 235"};
			{ 9, "s12076", "10028", "=q2=Shadoweave Shoulders", "=ds=#sr# 235"};
			{ 10, "s12074", "10027", "=q2=Black Mageweave Shoulders", "=ds=#sr# 230"};
			{ 11, "s8799", "7062", "=q1=Crimson Silk Pantaloons", "=ds=#sr# 195"};
			{ 12, "s8795", "7060", "=q2=Azure Shoulders", "=ds=#sr# 190"};
			{ 13, "s8793", "7059", "=q2=Crimson Silk Shoulders", "=ds=#sr# 190"};
			{ 14, "s8774", "7057", "=q2=Green Silken Shoulders", "=ds=#sr# 180"};
			{ 15, "s3849", "4315", "=q1=Reinforced Woolen Shoulders", "=ds=#sr# 120"};
			{ 16, "s3848", "4314", "=q1=Double-stitched Woolen Shoulders", "=ds=#sr# 110"};
		};
		{
			Name = AL["Cloth Armor"].." - Waist";
			{ 1, "s22866", "18405", "=q4=Belt of the Archmage", "=ds=#sr# 300"};
			{ 2, "s24902", "20539", "=q3=Runed Stygian Belt", "=ds=#sr# 300"};
			{ 3, "s18410", "14143", "=q2=Ghostweave Belt", "=ds=#sr# 265"};
			{ 4, "s18402", "13856", "=q2=Runecloth Belt", "=ds=#sr# 255"};
			{ 5, "s3864", "4329", "=q2=Star Belt", "=ds=#sr# 200"};
			{ 6, "s8797", "7061", "=q2=Earthen Silk Belt", "=ds=#sr# 195"};
			{ 7, "s3863", "4328", "=q2=Spider Belt", "=ds=#sr# 180"};
			{ 8, "s8766", "7052", "=q2=Azure Silk Belt", "=ds=#sr# 175"};
			{ 9, "s8772", "7055", "=q2=Crimson Silk Belt", "=ds=#sr# 175"};
			{ 10, "s8776", "7026", "=q1=Linen Belt", "=ds=#sr# 15"};
		};
		{
			Name = AL["Cloth Armor"].." - Wrist";
			{ 1, "s28209", "22655", "=q4=Glacial Wrists", "=ds=#sr# 300"};
			{ 2, "s3841", "4308", "=q1=Green Linen Bracers", "=ds=#sr# 60"};
		};
		{
			Name = AL["Bags"];
			{ 1, "s26087", "21342", "=q4=Core Felcloth Bag", "=ds=#sr# 300"};
			{ 2, "s18455", "14156", "=q3=Bottomless Bag", "=ds=#sr# 300"};
			{ 3, "s26086", "21341", "=q3=Felcloth Bag", "=ds=#sr# 280"};
			{ 4, "s27660", "22249", "=q2=Big Bag of Enchantment", "=ds=#sr# 300"};
			{ 5, "s18445", "14155", "=q2=Mooncloth Bag", "=ds=#sr# 300"};
			{ 6, "s27725", "22252", "=q2=Satchel of Cenarius", "=ds=#sr# 300"};
			{ 7, "s27659", "22248", "=q2=Enchanted Runecloth Bag", "=ds=#sr# 275"};
			{ 8, "s27724", "22251", "=q2=Cenarion Herb Bag", "=ds=#sr# 275"};
			{ 9, "s26085", "21340", "=q2=Soul Pouch", "=ds=#sr# 260"};
			{ 10, "s27658", "22246", "=q2=Enchanted Mageweave Pouch", "=ds=#sr# 225"};
			{ 11, "s18405", "14046", "=q1=Runecloth Bag", "=ds=#sr# 260"};
			{ 12, "s12079", "10051", "=q1=Red Mageweave Bag", "=ds=#sr# 235"};
			{ 13, "s12065", "10050", "=q1=Mageweave Bag", "=ds=#sr# 225"};
			{ 14, "s6695", "5765", "=q1=Black Silk Pack", "=ds=#sr# 185"};
			{ 15, "s6693", "5764", "=q1=Green Silk Pack", "=ds=#sr# 175"};
			{ 16, "s3813", "4245", "=q1=Small Silk Pack", "=ds=#sr# 150"};
			{ 17, "s6688", "5763", "=q1=Red Woolen Bag", "=ds=#sr# 115"};
			{ 18, "s3758", "4241", "=q1=Green Woolen Bag", "=ds=#sr# 95"};
			{ 19, "s3757", "4240", "=q1=Woolen Bag", "=ds=#sr# 80"};
			{ 20, "s6686", "5762", "=q1=Red Linen Bag", "=ds=#sr# 70"};
			{ 21, "s3755", "4238", "=q1=Linen Bag", "=ds=#sr# 45"};
		};
		{
			Name = AL["Miscellaneous"];
			{ 1, "s18560", "14342", "=q1=Mooncloth", "=ds=#sr# 250"};
			{ 2, "s18401", "14048", "=q1=Bolt of Runecloth", "=ds=#sr# 250"};
			{ 3, "s3865", "4339", "=q1=Bolt of Mageweave", "=ds=#sr# 175"};
			{ 4, "s3839", "4305", "=q1=Bolt of Silk Cloth", "=ds=#sr# 125"};
			{ 5, "s2964", "2997", "=q1=Bolt of Woolen Cloth", "=ds=#sr# 75"};
			{ 6, "s2963", "2996", "=q1=Bolt of Linen Cloth", "=ds=#sr# 1"};
		};
		{
			Name = AL["Shirts"];
			{ 1, "s12085", "10034", "=q1=Tuxedo Shirt", "=ds=#sr# 240"};
			{ 2, "s12080", "10055", "=q1=Pink Mageweave Shirt", "=ds=#sr# 235"};
			{ 3, "s12075", "10054", "=q1=Lavender Mageweave Shirt", "=ds=#sr# 230"};
			{ 4, "s12064", "10052", "=q1=Orange Martial Shirt", "=ds=#sr# 220"};
			{ 5, "s12061", "10056", "=q1=Orange Mageweave Shirt", "=ds=#sr# 215"};
			{ 6, "s3873", "4336", "=q1=Black Swashbuckler's Shirt", "=ds=#sr# 200"};
			{ 7, "s21945", "17723", "=q1=Green Holiday Shirt", "=ds=#sr# 190"};
			{ 8, "s3872", "4335", "=q1=Rich Purple Silk Shirt", "=ds=#sr# 185"};
			{ 9, "s8489", "6796", "=q1=Red Swashbuckler's Shirt", "=ds=#sr# 175"};
			{ 10, "s3871", "4334", "=q1=Formal White Shirt", "=ds=#sr# 170"};
			{ 11, "s8483", "6795", "=q1=White Swashbuckler's Shirt", "=ds=#sr# 160"};
			{ 12, "s3870", "4333", "=q1=Dark Silk Shirt", "=ds=#sr# 155"};
			{ 13, "s3869", "4332", "=q1=Bright Yellow Shirt", "=ds=#sr# 135"};
			{ 14, "s7892", "6384", "=q1=Stylish Blue Shirt", "=ds=#sr# 120"};
			{ 15, "s7893", "6385", "=q1=Stylish Green Shirt", "=ds=#sr# 120"};
			{ 16, "s3866", "4330", "=q1=Stylish Red Shirt", "=ds=#sr# 110"};
			{ 17, "s2406", "2587", "=q1=Gray Woolen Shirt", "=ds=#sr# 100"};
			{ 18, "s2396", "2579", "=q1=Green Linen Shirt", "=ds=#sr# 70"};
			{ 19, "s2394", "2577", "=q1=Blue Linen Shirt", "=ds=#sr# 40"};
			{ 20, "s2392", "2575", "=q1=Red Linen Shirt", "=ds=#sr# 40"};
			{ 21, "s2393", "2576", "=q1=White Linen Shirt", "=ds=#sr# 1"};
			{ 22, "s3915", "4344", "=q1=Brown Linen Shirt", "=ds=#sr# 1"};
		};
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
	};

		---------------------
		---   High Risk   ---
		---------------------

	AtlasLoot_Data["AlchemyHighRiskCLASSIC"] = {
			Name = ALCHEMY.." High Risk";
			Type = "CraftingNoBF";
					{
			Name = "Common";
			{ 1, "s968402", "967443",  "=q2=Flask of Manifesting Power", 	"=ds=#sr# 300"};	
			{ 2, "s968405", "967446",  "=q2=Flask of the Warsong", 			"=ds=#sr# 300"};	
			{ 3, "s968408", "967449",  "=q2=Flask of the Kirin Tor", 		"=ds=#sr# 300"};			
			{ 4, "s968411", "967452", "=q2=Flask of Butchery", 				"=ds=#sr# 300"};	
			{ 5, "s968414", "967455", "=q2=Flask of the Unyielding", 		"=ds=#sr# 300"};	
			{ 6, "s968417", "967458", "=q2=Flask of Unrelenting Power", 	"=ds=#sr# 300"};	
			{ 7, "s968420", "967461", "=q2=Flask of Savage Assault", 		"=ds=#sr# 300"};	
			{ 8, "s968423", "967464", "=q2=Flask of Shattering Thunder", 	"=ds=#sr# 300"};	
			{ 9, "s968426", "967467", "=q2=Flask of the Executioner", 		"=ds=#sr# 300"};
			{ 10, "s968429", "967470", "=q2=Flask of Deep Meditation", 		"=ds=#sr# 300"};	
			{ 11, "s968432", "967473", "=q2=Flask of Adept Striking", 		"=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968403", "967444",  "=q3=Potent Flask of Manifesting Power", 	"=ds=#sr# 300"};
			{ 2, "s968406", "967447",  "=q3=Potent Flask of the Warsong", 			"=ds=#sr# 300"};
			{ 3, "s968409", "967450",  "=q3=Potent Flask of the Kirin Tor", 		"=ds=#sr# 300"};
			{ 4, "s968412", "967453", "=q3=Potent Flask of Butchery", 				"=ds=#sr# 300"};
			{ 5, "s968415", "967456", "=q3=Potent Flask of the Unyielding", 		"=ds=#sr# 300"};
			{ 6, "s968418", "967459", "=q3=Potent Flask of Unrelenting Power", 		"=ds=#sr# 300"};
			{ 7, "s968421", "967462", "=q3=Potent Flask of Savage Assault", 		"=ds=#sr# 300"};
			{ 8, "s968424", "967465", "=q3=Potent Flask of Shattering Thunder", 	"=ds=#sr# 300"};
			{ 9, "s968427", "967468", "=q3=Potent Flask of the Executioner", 		"=ds=#sr# 300"};
			{ 10, "s968430", "967471", "=q3=Potent Flask of Deep Meditation", 		"=ds=#sr# 300"};
			{ 11, "s968433", "967474", "=q3=Potent Flask of Adept Striking", 		"=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968404", "967445",  "=q4=Distilled Flask of Manifesting Power", 	"=ds=#sr# 300"};
			{ 2, "s968407", "967448",  "=q4=Distilled Flask of the Warsong", "=ds=#sr# 300"};
			{ 3, "s968410", "967451",  "=q4=Distilled Flask of the Kirin Tor", "=ds=#sr# 300"};
			{ 4, "s968413", "967454", "=q4=Distilled Flask of Butchery", "=ds=#sr# 300"};
			{ 5, "s968416", "967457", "=q4=Distilled Flask of the Unyielding", "=ds=#sr# 300"};
			{ 6, "s968419", "967460", "=q4=Distilled Flask of Unrelenting Power", "=ds=#sr# 300"};
			{ 7, "s968422", "967463", "=q4=Distilled Flask of Savage Assault", "=ds=#sr# 300"};
			{ 8, "s968425", "967466", "=q4=Distilled Flask of Shattering Thunder", "=ds=#sr# 300"};
			{ 9, "s968428", "967469", "=q4=Distilled Flask of the Executioner", "=ds=#sr# 300"};
			{ 10, "s968431", "967472", "=q4=Distilled Flask of Deep Meditation", "=ds=#sr# 300"};
			{ 11, "s968434", "967475", "=q4=Distilled Flask of Adept Striking", "=ds=#sr# 300"};
		};
	};

	AtlasLoot_Data["SmithingHighRiskCLASSIC"] = {
			Name = BLACKSMITHING.." High Risk";
			Type = "CraftingNoBF";
					{
			Name = "Common";
			{ 1, "s968018", "967172", "=q2=Living Belt Buckle", "=ds=#sr# 300"};
			{ 2, "s968021", "967175", "=q2=Deflecting Buckle", "=ds=#sr# 300"};
			{ 3, "s968024", "967178", "=q2=Roguish Belt Buckle", "=ds=#sr# 300"};
			{ 4, "s968027", "967181", "=q2=Dancing Belt Buckle", "=ds=#sr# 300"};
			{ 5, "s968030", "967184", "=q2=Magus Belt Buckle", "=ds=#sr# 300"};
			{ 6, "s968033", "967187", "=q2=Cleric's Belt Buckle", "=ds=#sr# 300"};
			{ 7, "s968036", "967190", "=q2=Warlord's Belt Buckle", "=ds=#sr# 300"};
			{ 8, "s968039", "967193", "=q2=Gaurdian's Belt Buckle", "=ds=#sr# 300"};
			{ 10, "s968480", "967680", "=q2=Homicite Key", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968019", "967173", "=q3=Sturdy Living Belt Buckle", "=ds=#sr# 300"};
			{ 2, "s968022", "967176", "=q3=Sturdy Deflecting Belt Buckle", "=ds=#sr# 300"};
			{ 3, "s968025", "967179", "=q3=Sturdy Roguish Belt Buckle", "=ds=#sr# 300"};
			{ 4, "s968028", "967182", "=q3=Sturdy Dancing Belt Buckle", "=ds=#sr# 300"};
			{ 5, "s968031", "967185", "=q3=Sturdy Magus Belt Buckle", 	"=ds=#sr# 300"};
			{ 6, "s968034", "967188", "=q3=Sturdy Cleric's Belt Buckle", "=ds=#sr# 300"};
			{ 7, "s968037", "967191", "=q3=Sturdy Warlord's Belt Buckle", "=ds=#sr# 300"};
			{ 8, "s968040", "967194", "=q3=Sturdy Gaurdian's Belt Buckle", "=ds=#sr# 300"};
			{ 10, "s968481", "967681", "=q3=Homicite Key", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968020", "967174", "=q4=Mastercraft Living Belt Buckle", "=ds=#sr# 300"};
			{ 2, "s968023", "967177", "=q4=Mastercraft Deflecting Belt Buckle", "=ds=#sr# 300"};
			{ 3, "s968026", "967180", "=q4=Mastercraft Roguish Belt Buckle", "=ds=#sr# 300"};
			{ 4, "s968029", "967183", "=q4=Mastercraft Dancing Belt Buckle", "=ds=#sr# 300"};
			{ 5, "s968032", "967186", "=q4=Mastercraft Magus Belt Buckle", "=ds=#sr# 300"};
			{ 6, "s968035", "967189", "=q4=Mastercraft Cleric's Belt Buckle", "=ds=#sr# 300"};
			{ 7, "s968038", "967192", "=q4=Mastercraft Warlord's Belt Buckle", "=ds=#sr# 300"};
			{ 8, "s968041", "967195", "=q4=Mastercraft Gaurdian's Belt Buckle", "=ds=#sr# 300"};
			{ 10, "s968482", "967682", "=q4=Homicite Key", "=ds=#sr# 300"};
		};
	};
	
	AtlasLoot_Data["LeatherworkingHighRiskCLASSIC"] = {
			Name = LEATHERWORKING.." High Risk";
			Type = "CraftingNoBF";
						{
			Name = "Common";
			{ 1, "s968000", "967154", "=q2=Yeti Gambeson", "=ds=#sr# 300"};
			{ 2, "s968003", "967157", "=q2=Devilsaur Gambeson", "=ds=#sr# 300"};
			{ 3, "s968006", "967160", "=q2=Plaguebat Gambeson", "=ds=#sr# 300"};
			{ 4, "s968009", "967163", "=q2=Sandworm Gambeson", "=ds=#sr# 300"};
			{ 5, "s968012", "967166", "=q2=Black Scale Gambeson", "=ds=#sr# 300"};
			{ 6, "s968015", "967169", "=q2=Blue Scale Gambeson", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968001", "967155", "=q3=Sturdy Yeti Gambeson", "=ds=#sr# 300"};
			{ 2, "s968004", "967158", "=q3=Sturdy Devilsaur Gambeson", "=ds=#sr# 300"};
			{ 3, "s968007", "967161", "=q3=Sturdy Plaguebat Gambeson", "=ds=#sr# 300"};
			{ 4, "s968010", "967164", "=q3=Sturdy Sandworm Gambeson", "=ds=#sr# 300"};
			{ 5, "s968013", "967167", "=q3=Sturdy Black Scale Gambeson", "=ds=#sr# 300"};
			{ 6, "s968016", "967170", "=q3=Sturdy Blue Scale Gambeson", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968002", "967156", "=q4=Mastercraft Yeti Gambeson", 			"=ds=#sr# 300"};
			{ 2, "s968005", "967159", "=q4=Mastercraft Devilsaur Gambeson", 	"=ds=#sr# 300"};
			{ 3, "s968008", "967162", "=q4=Mastercraft Plaguebat Gambeson", 	"=ds=#sr# 300"};
			{ 4, "s968011", "967165", "=q4=Mastercraft Sandworm Gambeson", 	"=ds=#sr# 300"};	
			{ 5, "s968014", "967168", "=q4=Mastercraft Black Scale Gambeson", 	"=ds=#sr# 300"};
			{ 6, "s968017", "967171", "=q4=Mastercraft Blue Scale Gambeson", 	"=ds=#sr# 300"};
		};
	};
	
	AtlasLoot_Data["EngineeringHighRiskCLASSIC"] = {
			Name = ENGINEERING.." High Risk";
			Type = "CraftingNoBF";
					{
			Name = "Common";
			{ 1, "s968042", "967196", "=q2=Gnomish Magnifying Lense I", "=ds=#sr# 300"};
			{ 2, "s968045", "967199", "=q2=Gnomish Focusing Lense", "=ds=#sr# 300"};
			{ 3, "s968048", "967202", "=q2=Gnomish Prismatic Lense", "=ds=#sr# 300"};
			{ 4, "s968051", "967205", "=q2=Hipfire Scope", "=ds=#sr# 300"};
			{ 5, "s968054", "967208", "=q2=Precision Scope", "=ds=#sr# 300"};
			{ 6, "s968057", "967211", "=q2=Reflex Scope", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968043", "967197", "=q3=Focused Gnomish Magnifying Lense", "=ds=#sr# 300"};
			{ 2, "s968046", "967200", "=q3=Focused Gnomish Focusing Lense", "=ds=#sr# 300"};
			{ 3, "s968049", "967203", "=q3=Focused Gnomish Prismatic Lense", "=ds=#sr# 300"};
			{ 4, "s968052", "967206", "=q3=Focused Hipfire Scope", "=ds=#sr# 300"};
			{ 5, "s968055", "967209", "=q3=Focused Precision Scope", "=ds=#sr# 300"};
			{ 6, "s968058", "967212", "=q3=Focused Reflex Scope", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968044", "967198", "=q4=Polished Gnomish Magnifying Lense", "=ds=#sr# 300"};
			{ 2, "s968047", "967201", "=q4=Polished Gnomish Focusing Lense", "=ds=#sr# 300"};
			{ 3, "s968050", "967204", "=q4=Polished Gnomish Prismatic Lense", "=ds=#sr# 300"};
			{ 4, "s968053", "967207", "=q4=Polished Hipfire Scope", "=ds=#sr# 300"};
			{ 5, "s968056", "967210", "=q4=Polished Precision Scope", "=ds=#sr# 300"};
			{ 6, "s968059", "967213", "=q4=Polished Reflex Scope", "=ds=#sr# 300"};
		};
	};

	AtlasLoot_Data["EnchantingHighRiskCLASSIC"] = {
			Name = ENCHANTING.." High Risk";
			Type = "CraftingNoBF";
				{
			Name = "Common";
			{ 1, "s968676", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Unstoppable Assault", "=ds=#sr# 300"};
			{ 2, "s968679", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Lucid Assault", "=ds=#sr# 300"};
			{ 3, "s968682", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Spellbinder's Rage", "=ds=#sr# 300"};
			{ 4, "s968685", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Ninja's Focus", "=ds=#sr# 300"};
			{ 5, "s968688", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Grovewarden's Blessing", "=ds=#sr# 300"};
			{ 6, "s968691", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Viscious Assault", "=ds=#sr# 300"};
			{ 7, "s968694", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Arcane Dexterity", "=ds=#sr# 300"};
			{ 8, "s968697", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Arcane Artillery", "=ds=#sr# 300"};
			{ 9, "s968700", "Spell_Holy_GreaterHeal", "=q2=Enchant Weapon - Lesser Arcane Precision", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968677", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Unstoppable Assault", "=ds=#sr# 300"};
			{ 2, "s968680", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Lucid Assault", "=ds=#sr# 300"};
			{ 3, "s968683", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Spellbinder's Rage", "=ds=#sr# 300"};
			{ 4, "s968686", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Ninja's Focus", "=ds=#sr# 300"};
			{ 5, "s968689", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Grovewarden's Blessing", "=ds=#sr# 300"};
			{ 6, "s968692", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Viscious Assault", "=ds=#sr# 300"};
			{ 7, "s968695", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Dexterity", "=ds=#sr# 300"};
			{ 8, "s968698", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Artillery", "=ds=#sr# 300"};
			{ 9, "s968701", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Precision", "=ds=#sr# 300"};
			{ 10, "s968770", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Crusader II", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968678", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Unstoppable Assault", "=ds=#sr# 300"};
			{ 2, "s968681", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Lucid Assualt", "=ds=#sr# 300"};
			{ 3, "s968684", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Spellbinder's Rage", "=ds=#sr# 300"};
			{ 4, "s968687", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Ninja's Focus", "=ds=#sr# 300"};
			{ 5, "s968690", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Grovewarden's Blessing", "=ds=#sr# 300"};
			{ 6, "s968693", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Viscious Assault", "=ds=#sr# 300"};
			{ 7, "s968696", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Dexterity", "=ds=#sr# 300"};
			{ 8, "s968699", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Artillery", "=ds=#sr# 300"};
			{ 9, "s968702", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Precision", "=ds=#sr# 300"};
			{ 10, "s968771", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Crusader III", "=ds=#sr# 300"};
		};
	};
	
	AtlasLoot_Data["TailoringHighRiskCLASSIC"] = {
			Name = TAILORING.." High Risk";
			Type = "CraftingNoBF";
		{
			Name = "Common";
			{ 1, "s968060", "967214", "=q2=Dragonweave Cloak Lining", "=ds=#sr# 300"};
			{ 2, "s968063", "967217", "=q2=Twilight Cloak Lining", "=ds=#sr# 300"};
			{ 3, "s968066", "967220", "=q2=Scarlet Cloak Lining", "=ds=#sr# 300"};
			{ 4, "s968069", "967223", "=q2=Rampager's Cloak Lining", "=ds=#sr# 300"};
			{ 5, "s968072", "967226", "=q2=Deadwind Cloak Lining", "=ds=#sr# 300"};
			{ 6, "s968075", "967229", "=q2=Slippery Cloak Lining", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968061", "967215", "=q3=Heavy Dragonweave Cloak Lining", "=ds=#sr# 300"};
			{ 2, "s968064", "967218", "=q3=Heavy Twilight Cloak Lining", "=ds=#sr# 300"};
			{ 3, "s968067", "967221", "=q3=Heavy Scarlet Cloak Lining", "=ds=#sr# 300"};
			{ 4, "s968070", "967224", "=q3=Heavy Rampager's Cloak Lining", "=ds=#sr# 300"};
			{ 5, "s968073", "967227", "=q3=Heavy Deadwind Cloak Lining", "=ds=#sr# 300"};
			{ 6, "s968076", "967230", "=q3=Heavy Slippery Cloak Lining", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968062", "967216", "=q4=Illustrious Dragonweave Cloak Lining", "=ds=#sr# 300"};
			{ 2, "s968065", "967219", "=q4=Illustrious Twilight Cloak Lining", "=ds=#sr# 300"};
			{ 3, "s968068", "967222", "=q4=Illustrious Scarlet Cloak Lining", "=ds=#sr# 300"};
			{ 4, "s968071", "967225", "=q4=Illustrious Rampager's Cloak Lining", "=ds=#sr# 300"};
			{ 5, "s968074", "967228", "=q4=Illustrious Deadwind Cloak Lining", "=ds=#sr# 300"};
			{ 6, "s968077", "967231", "=q4=Illustrious Slippery Cloak Lining", "=ds=#sr# 300"};
		};
	};

	AtlasLoot_Data["CookingHighRiskCLASSIC"] = {
			Name = COOKING.." High Risk";
			Type = "CraftingNoBF";
		{
			Name = "Common";
			{ 1, "s968279",	"967509", "=q2=Animated Soup for the Soul", "=ds=#sr# 300"};
			{ 2, "s968282",	"967512", "=q2=Volcanic Sandwich", "=ds=#sr# 300"};
			{ 3, "s968285",	"967515", "=q2=Winter Wontons", "=ds=#sr# 300"};
			{ 4, "s968288",	"967518", "=q2=Storm Steak", "=ds=#sr# 300"};
			{ 5, "s968291",	"967521", "=q2=Void Touched Stew", "=ds=#sr# 300"};
			{ 6, "s968294",	"967524", "=q2=Spicy Vulture Steak", "=ds=#sr# 300"};
			{ 7, "s968297",	"967527", "=q2=Wizard Wontons", "=ds=#sr# 300"};
			{ 8, "s968300",	"967530", "=q2=Jurassic Burger", "=ds=#sr# 300"};
			{ 9, "s968303",	"967533", "=q2=Rough-alo wings", "=ds=#sr# 300"};
			{ 10, "s968306", "967536", "=q2=The Whooper Sandwich", "=ds=#sr# 300"};
			{ 11, "s968309", "967539", "=q2=Vulture a la King", "=ds=#sr# 300"};
			{ 12, "s968312", "967542", "=q2=Scorching Hot Steak", "=ds=#sr# 300"};
			{ 13, "s968315", "967545", "=q2=Lively Stew", "=ds=#sr# 300"};
			{ 14, "s968318", "967548", "=q2=Crawling Steak", "=ds=#sr# 300"};
			{ 15, "s968321", "967551", "=q2=Breakonator Sandwich", "=ds=#sr# 300"};
			{ 16, "s968324", "967554", "=q2=Master Wontons", "=ds=#sr# 300"};
			{ 17, "s968327", "967557", "=q2=Big Whack Sandwich", "=ds=#sr# 300"};
			{ 18, "s968330", "967560", "=q2=Warping Wontons", "=ds=#sr# 300"};
			{ 19, "s968333", "967563", "=q2=Duck Stew", "=ds=#sr# 300"};
			{ 20, "s968336", "967566", "=q2=Mountainman Stew", "=ds=#sr# 300"};
			{ 21, "s968339", "967569", "=q2=Scorched Stew", "=ds=#sr# 300"};
			{ 22, "s968342", "967572", "=q2=Vulcan Wontons", "=ds=#sr# 300"};
			{ 23, "s968345", "967575", "=q2=Jurassic Soup", "=ds=#sr# 300"};
			{ 24, "s968348", "967578", "=q2=Heightened Wontons", "=ds=#sr# 300"};
			{ 25, "s968351", "967581", "=q2=Hearty Spirit Soup", "=ds=#sr# 300"};
			{ 26, "s968354", "967584", "=q2=Jurassic Steak", "=ds=#sr# 300"};
			{ 27, "s968357", "967587", "=q2=Stormwich Sandwich", "=ds=#sr# 300"};
			{ 28, "s968360", "967590", "=q2=Warding Wontons", "=ds=#sr# 300"};
			{ 29, "s968363", "967593", "=q2=Rolling Meatballs", "=ds=#sr# 300"};
			{ 30, "s968366", "967596", "=q2=Subtle Steak", "=ds=#sr# 300"};
		};
		{
			Name = "Common";
			{ 1, "s968369", "967599", "=q2=Subtle Sandwich", "=ds=#sr# 300"};
			{ 2, "s968372", "967602", "=q2=Subtle Wontons", "=ds=#sr# 300"};
			{ 3, "s968375", "967605", "=q2=Subtle Sulferous Soup", "=ds=#sr# 300"};
			{ 4, "s968378", "967608", "=q2=Strongman Stew", "=ds=#sr# 300"};
			{ 5, "s968381", "967611", "=q2=Mysterious Void Roast", "=ds=#sr# 300"};
			{ 6, "s968384", "967614", "=q2=Fire Charred Roast", "=ds=#sr# 300"};
			{ 7, "s968387", "967617", "=q2=Storm Fried Roast", "=ds=#sr# 300"};
			{ 8, "s968390", "967620", "=q2=Winter Roast", "=ds=#sr# 300"};
			{ 9, "s968393", "967623", "=q2=Blackened Roast", "=ds=#sr# 300"};
			{ 10, "s968396", "967626", "=q2=Dino Delight", "=ds=#sr# 300"};
			{ 11, "s968399", "967629", "=q2=Slick-fil-A Sandwich", "=ds=#sr# 300"};
			{ 13, "s968646", "967703", "=q2=Tempting Bait", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968280",	"967510", "=q3=Animated Soup for the Soul", "=ds=#sr# 300"};
			{ 2, "s968283",	"967513", "=q3=Volcanic Sandwich", "=ds=#sr# 300"};
			{ 3, "s968286",	"967516", "=q3=Winter Wontons", "=ds=#sr# 300"};
			{ 4, "s968289",	"967519", "=q3=Storm Steak", "=ds=#sr# 300"};
			{ 5, "s968292",	"967522", "=q3=Void Touched Stew", "=ds=#sr# 300"};
			{ 6, "s968295",	"967525", "=q3=Spicy Vulture Steak", "=ds=#sr# 300"};
			{ 7, "s968298",	"967528", "=q3=Wizard Wontons", "=ds=#sr# 300"};
			{ 8, "s968301",	"967531", "=q3=Jurassic Burger", "=ds=#sr# 300"};
			{ 9, "s968304",	"967534", "=q3=Rough-alo wings", "=ds=#sr# 300"};
			{ 10, "s968307", "967537", "=q3=The Whooper Sandwich", "=ds=#sr# 300"};
			{ 11, "s968310", "967540", "=q3=Vulture a la King", "=ds=#sr# 300"};
			{ 12, "s968313", "967543", "=q3=Scorching Hot Steak", "=ds=#sr# 300"};
			{ 13, "s968316", "967546", "=q3=Lively Stew", "=ds=#sr# 300"};
			{ 14, "s968319", "967549", "=q3=Crawling Steak", "=ds=#sr# 300"};
			{ 15, "s968322", "967552", "=q3=Breakonator Sandwich", "=ds=#sr# 300"};
			{ 16, "s968325", "967555", "=q3=Master Wontons", "=ds=#sr# 300"};
			{ 17, "s968328", "967558", "=q3=Big Whack Sandwich", "=ds=#sr# 300"};
			{ 18, "s968331", "967561", "=q3=Warping Wontons", "=ds=#sr# 300"};
			{ 19, "s968334", "967564", "=q3=Duck Stew", "=ds=#sr# 300"};
			{ 20, "s968337", "967567", "=q3=Mountainman Stew", "=ds=#sr# 300"};
			{ 21, "s968340", "967570", "=q3=Scorched Stew", "=ds=#sr# 300"};
			{ 22, "s968343", "967573", "=q3=Vulcan Wontons", "=ds=#sr# 300"};
			{ 23, "s968346", "967576", "=q3=Jurassic Soup", "=ds=#sr# 300"};
			{ 24, "s968349", "967579", "=q3=Heightened Wontons", "=ds=#sr# 300"};
			{ 25, "s968352", "967582", "=q3=Hearty Spirit Soup", "=ds=#sr# 300"};
			{ 26, "s968355", "967585", "=q3=Jurassic Steak", "=ds=#sr# 300"};
			{ 27, "s968358", "967588", "=q3=Stormwich Sandwich", "=ds=#sr# 300"};
			{ 28, "s968361", "967591", "=q3=Warding Wontons", "=ds=#sr# 300"};
			{ 29, "s968364", "967594", "=q3=Rolling Meatballs", "=ds=#sr# 300"};
			{ 30, "s968367",	"967597", "=q3=Subtle Steak", "=ds=#sr# 300"};
		};
		{
			Name = "Rare";
			{ 1, "s968370",	"967600",	"=q3=Subtle Sandwich", "=ds=#sr# 300"};
			{ 2, "s968373",	"967603",	"=q3=Subtle Wontons", "=ds=#sr# 300"};
			{ 3, "s968376",	"967606",	"=q3=Subtle Sulferous Soup", "=ds=#sr# 300"};
			{ 4, "s968379",	"967609",	"=q3=Strongman Stew", "=ds=#sr# 300"};
			{ 5, "s968382",	"967612",	"=q3=Mysterious Void Roast", "=ds=#sr# 300"};
			{ 6, "s968385",	"967615",	"=q3=Fire Charred Roast", "=ds=#sr# 300"};
			{ 7, "s968388",	"967618",	"=q3=Storm Fried Roast", "=ds=#sr# 300"};
			{ 8, "s968391",	"967621",	"=q3=Winter Roast", "=ds=#sr# 300"};
			{ 9, "s968394",	"967624",	"=q3=Blackened Roast", "=ds=#sr# 300"};
			{ 10, "s968397",	"967627",	"=q3=Dino Delight", "=ds=#sr# 300"};
			{ 11, "s968400",	"967630",	"=q3=Slick-fil-A Sandwich", "=ds=#sr# 300"};
			{ 13, "s968647",	"967704",	"=q3=Alluring Bait", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968281",	"967511",  "=q4=Animated Soup for the Soul", "=ds=#sr# 300"};
			{ 2, "s968284",	"967514", "=q4=Volcanic Sandwich", "=ds=#sr# 300"};
			{ 3, "s968287",	"967517", "=q4=Winter Wontons", "=ds=#sr# 300"};
			{ 4, "s968290",	"967520", "=q4=Storm Steak", "=ds=#sr# 300"};
			{ 5, "s968293",	"967523", "=q4=Void Touched Stew", "=ds=#sr# 300"};
			{ 6, "s968296",	"967526", "=q4=Spicy Vulture Steak", "=ds=#sr# 300"};
			{ 7, "s968299",	"967529", "=q4=Wizard Wontons", "=ds=#sr# 300"};
			{ 8, "s968302",	"967532", "=q4=Jurassic Burger", "=ds=#sr# 300"};
			{ 9, "s968305",	"967535", "=q4=Rough-alo wings", "=ds=#sr# 300"};
			{ 10, "s968308", "967538", "=q4=The Whooper Sandwich", "=ds=#sr# 300"};
			{ 11, "s968311", "967541", "=q4=Vulture a la King", "=ds=#sr# 300"};
			{ 12, "s968314", "967542", "=q4=Scorching Hot Steak", "=ds=#sr# 300"};
			{ 13, "s968317", "967547", "=q4=Lively Stew", "=ds=#sr# 300"};
			{ 14, "s968320", "967550", "=q4=Crawling Steak", "=ds=#sr# 300"};
			{ 15, "s968323", "967553", "=q4=Breakonator Sandwich", "=ds=#sr# 300"};
			{ 16, "s968326", "967556", "=q4=Master Wontons", "=ds=#sr# 300"};
			{ 17, "s968329", "967559", "=q4=Big Whack Sandwich", "=ds=#sr# 300"};
			{ 18, "s968332", "967562", "=q4=Warping Wontons", "=ds=#sr# 300"};
			{ 19, "s968335", "967565", "=q4=Duck Stew", "=ds=#sr# 300"};
			{ 20, "s968338", "967568", "=q4=Mountainman Stew", "=ds=#sr# 300"};
			{ 21, "s968341", "967571", "=q4=Scorched Stew", "=ds=#sr# 300"};
			{ 22, "s968344", "967574", "=q4=Vulcan Wontons", "=ds=#sr# 300"};
			{ 23, "s968347", "967577", "=q4=Jurassic Soup", "=ds=#sr# 300"};
			{ 24, "s968350", "967580", "=q4=Heightened Wontons", "=ds=#sr# 300"};
			{ 25, "s968353", "967583", "=q4=Hearty Spirit Soup", "=ds=#sr# 300"};
			{ 26, "s968356", "967586", "=q4=Jurassic Steak", "=ds=#sr# 300"};
			{ 27, "s968359", "967589", "=q4=Stormwich Sandwich", "=ds=#sr# 300"};
			{ 28, "s968362", "967592", "=q4=Warding Wontons", "=ds=#sr# 300"};
			{ 29, "s968365", "967595", "=q4=Rolling Meatballs", "=ds=#sr# 300"};
			{ 30, "s968368", "967598", "=q4=Subtle Steak", "=ds=#sr# 300"};
		};
		{
			Name = "Epic";
			{ 1, "s968371", "967601", "=q4=Subtle Sandwich", "=ds=#sr# 300"};
			{ 2, "s968374", "967604", "=q4=Subtle Wontons", "=ds=#sr# 300"};
			{ 3, "s968377", "967607", "=q4=Subtle Sulferous Soup", "=ds=#sr# 300"};
			{ 4, "s968380", "967610", "=q4=Strongman Stew", "=ds=#sr# 300"};
			{ 5, "s968383", "967613", "=q4=Mysterious Void Roast", "=ds=#sr# 300"};
			{ 6, "s968386", "967616", "=q4=Fire Charred Roast", "=ds=#sr# 300"};
			{ 7, "s968389", "967619", "=q4=Storm Fried Roast", "=ds=#sr# 300"};
			{ 8, "s968392", "967622", "=q4=Winter Roast", "=ds=#sr# 300"};
			{ 9, "s968395", "967625", "=q4=Blackened Roast", "=ds=#sr# 300"};
			{ 10, "s968398", "967628", "=q4=Dino Delight", "=ds=#sr# 300"};
			{ 11, "s968401", "967631", "=q4=Slick-fil-A Sandwich", "=ds=#sr# 300"};
			{ 13, "s968648", "967705", "=q4=Irresistible Bait", "=ds=#sr# 300"};
		};
	};
