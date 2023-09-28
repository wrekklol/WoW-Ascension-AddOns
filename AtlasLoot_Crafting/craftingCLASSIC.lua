local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")
local WHITE = "|cffFFFFFF";

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
AtlasLoot_Data["AlchemyCLASSIC"] = {
	Name = ALCHEMY;
	Type = "CraftingNoBF";
	{
		Name = AL["Battle Elixirs"];
		{ 1, "s17573", "13454", "=q1=Greater Arcane Elixir", "" };
		{ 2, "s17571", "13452", "=q1=Elixir of the Mongoose", "" };
		{ 3, "s17557", "13453", "=q1=Elixir of Brute Force", "" };
		{ 4, "s11477", "9224", "=q1=Elixir of Demonslaying", "" };
		{ 5, "s26277", "21546", "=q1=Elixir of Greater Firepower", "" };
		{ 6, "s11476", "9264", "=q1=Elixir of Shadow Power", "" };
		{ 7, "s11472", "9206", "=q1=Elixir of Giants", "" };
		{ 8, "s11467", "9187", "=q1=Elixir of Greater Agility", "" };
		{ 9, "s11461", "9155", "=q1=Arcane Elixir", "" };
		{ 10, "s21923", "17708", "=q1=Elixir of Frost Power", "" };
		{ 11, "s11449", "8949", "=q1=Elixir of Agility", "" };
		{ 12, "s63732", "45621", "=q1=Elixir of Minor Accuracy", "" };
		{ 13, "s3188", "3391", "=q1=Elixir of Ogre's Strength", "" };
		{ 14, "s2333", "3390", "=q1=Elixir of Lesser Agility", "" };
		{ 15, "s7845", "6373", "=q1=Elixir of Firepower", "" };
		{ 16, "s8240", "6662", "=q1=Elixir of Giant Growth", "" };
		{ 17, "s3230", "2457", "=q1=Elixir of Minor Agility", "" };
		{ 18, "s2329", "2454", "=q1=Elixir of Lion's Strength", "" };
	};
	{
		Name = AL["Guardian Elixirs"];
		{ 1, "s24368", "20004", "=q1=Major Troll's Blood Elixir", "" };
		{ 2, "s24365", "20007", "=q1=Mageblood Elixir", "" };
		{ 3, "s17554", "13445", "=q1=Elixir of Superior Defense", "" };
		{ 4, "s17555", "13447", "=q1=Elixir of the Sages", "" };
		{ 5, "s11466", "9088", "=q1=Gift of Arthas", "" };
		{ 6, "s11465", "9179", "=q1=Elixir of Greater Intellect", "" };
		{ 7, "s11450", "8951", "=q1=Elixir of Greater Defense", "" };
		{ 8, "s3451", "3826", "=q1=Mighty Troll's Blood Elixir", "" };
		{ 9, "s3450", "3825", "=q1=Elixir of Fortitude", "" };
		{ 10, "s3177", "3389", "=q1=Elixir of Defense", "" };
		{ 11, "s3176", "3388", "=q1=Strong Troll's Blood Potion", "" };
		{ 12, "s3171", "3383", "=q1=Elixir of Wisdom", "" };
		{ 13, "s2334", "2458", "=q1=Elixir of Minor Fortitude", "" };
		{ 14, "s3170", "3382", "=q1=Weak Troll's Blood Elixir", "" };
		{ 15, "s7183", "5997", "=q1=Elixir of Minor Defense", "" };
	};
	{
		Name = AL["Potions"] .. " 1";
		{ 1, "s22732", "18253", "=q1=Major Rejuvenation Potion", "" };
		{ 2, "s17580", "13444", "=q1=Major Mana Potion", "" };
		{ 3, "s17577", "13461", "=q1=Greater Arcane Protection Potion", "" };
		{ 4, "s17574", "13457", "=q1=Greater Fire Protection Potion", "" };
		{ 5, "s17575", "13456", "=q1=Greater Frost Protection Potion", "" };
		{ 6, "s17576", "13458", "=q1=Greater Nature Protection Potion", "" };
		{ 7, "s17578", "13459", "=q1=Greater Shadow Protection Potion", "" };
		{ 8, "s24367", "20008", "=q1=Living Action Potion", "" };
		{ 9, "s17572", "13462", "=q1=Purification Potion", "" };
		{ 10, "s17570", "13455", "=q1=Greater Stoneshield Potion", "" };
		{ 11, "s24366", "20002", "=q1=Greater Dreamless Sleep Potion", "" };
		{ 12, "s17556", "13446", "=q1=Major Healing Potion", "" };
		{ 13, "s17553", "13443", "=q1=Superior Mana Potion", "" };
		{ 14, "s17552", "13442", "=q1=Mighty Rage Potion", "" };
		{ 15, "s3175", "3387", "=q1=Limited Invulnerability Potion", "" };
		{ 16, "s11464", "9172", "=q1=Invisibility Potion", "" };
		{ 17, "s15833", "12190", "=q1=Dreamless Sleep Potion", "" };
		{ 18, "s11458", "9144", "=q1=Wildvine Potion", "" };
		{ 19, "s4942", "4623", "=q1=Lesser Stoneshield Potion", "" };
		{ 20, "s11457", "3928", "=q1=Superior Healing Potion", "" };
		{ 21, "s11453", "9036", "=q1=Magic Resistance Potion", "" };
	};
	{
		Name = AL["Potions"] .. " 2";
		{ 1, "s11452", "9030", "=q1=Restorative Potion", "" };
		{ 2, "s11448", "6149", "=q1=Greater Mana Potion", "" };
		{ 3, "s7258", "6050", "=q1=Frost Protection Potion", "" };
		{ 4, "s7259", "6052", "=q1=Nature Protection Potion", "" };
		{ 5, "s6618", "5633", "=q1=Great Rage Potion", "" };
		{ 6, "s3448", "3823", "=q1=Lesser Invisibility Potion", "" };
		{ 7, "s7257", "6049", "=q1=Fire Protection Potion", "" };
		{ 8, "s3452", "3827", "=q1=Mana Potion", "" };
		{ 9, "s7181", "1710", "=q1=Greater Healing Potion", "" };
		{ 10, "s6624", "5634", "=q1=Free Action Potion", "" };
		{ 11, "s7256", "6048", "=q1=Shadow Protection Potion", "" };
		{ 12, "s3173", "3385", "=q1=Lesser Mana Potion", "" };
		{ 13, "s3174", "3386", "=q1=Potion of Curing", "" };
		{ 14, "s3447", "929", "=q1=Healing Potion", "" };
		{ 15, "s3172", "3384", "=q1=Minor Magic Resistance Potion", "" };
		{ 16, "s7255", "6051", "=q1=Holy Protection Potion", "" };
		{ 17, "s7841", "6372", "=q1=Swim Speed Potion", "" };
		{ 18, "s6617", "5631", "=q1=Rage Potion", "" };
		{ 19, "s2335", "2459", "=q1=Swiftness Potion", "" };
		{ 20, "s2337", "858", "=q1=Lesser Healing Potion", "" };
		{ 21, "s4508", "4596", "=q1=Discolored Healing Potion", "" };
		{ 22, "s2332", "2456", "=q1=Minor Rejuvenation Potion", "" };
		{ 23, "s2331", "2455", "=q1=Minor Mana Potion", "" };
		{ 24, "s2330", "118", "=q1=Minor Healing Potion", "" };
	};
	{
		Name = AL["Flasks"];
		{ 1, "s17638", "13513", "=q1=Flask of Chromatic Resistance", "" };
		{ 2, "s17636", "13511", "=q1=Flask of Distilled Wisdom", "" };
		{ 3, "s17634", "13506", "=q1=Flask of Petrification", "" };
		{ 4, "s17637", "13512", "=q1=Flask of Supreme Power", "" };
		{ 5, "s17635", "13510", "=q1=Flask of the Titans", "" };
	};
	{
		Name = AL["Transmutes"];
		{ 1, "s11479", "3577", "=q2=Transmute: Iron to Gold", "" };
		{ 2, "s11480", "6037", "=q2=Transmute: Mithril to Truesilver", "" };
		{ 3, "s17187", "12360", "=q2=Transmute: Arcanite Bar", "" };
		{ 4, "s17559", "7078", "=q2=Transmute: Air to Fire", "" };
		{ 5, "s17566", "12803", "=q2=Transmute: Earth to Life", "" };
		{ 6, "s17561", "7080", "=q2=Transmute: Earth to Water", "" };
		{ 7, "s17560", "7076", "=q2=Transmute: Fire to Earth", "" };
		{ 8, "s17565", "7076", "=q2=Transmute: Life to Earth", "" };
		{ 9, "s17563", "7080", "=q2=Transmute: Undeath to Water", "" };
		{ 10, "s17562", "7082", "=q2=Transmute: Water to Air", "" };
		{ 11, "s17564", "12808", "=q2=Transmute: Water to Undeath", "" };
		{ 12, "s25146", "7068", "=q1=Transmute: Elemental Fire", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s24266", "19931", "=q3=Gurubashi Mojo Madness", "" };
		{ 2, "s11460", "9154", "=q1=Elixir of Detect Undead", "" };
		{ 3, "s22808", "18294", "=q1=Elixir of Greater Water Breathing", "" };
		{ 4, "s11456", "9061", "=q1=Goblin Rocket Fuel", "" };
		{ 5, "s11451", "8956", "=q1=Oil of Immolation", "" };
		{ 6, "s12609", "10592", "=q1=Catseye Elixir", "" };
		{ 7, "s3454", "3829", "=q1=Frost Oil", "" };
		{ 8, "s11459", "9149", "=q1=Philosopher's Stone", "" };
		{ 9, "s3453", "3828", "=q1=Elixir of Detect Lesser Invisibility", "" };
		{ 10, "s3449", "3824", "=q1=Shadow Oil", "" };
		{ 11, "s7837", "6371", "=q1=Fire Oil", "" };
		{ 12, "s7179", "5996", "=q1=Elixir of Water Breathing", "" };
		{ 13, "s7836", "6370", "=q1=Blackmouth Oil", "" };
	};
};
---------------------
--- Blacksmithing ---
---------------------
AtlasLoot_Data["SmithingCLASSIC"] = {
	Name = BLACKSMITHING;
	Type = "Crafting";
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Chest";
		{ 1, "s28242", "22669", "=q4=Icebane Breastplate", "" };
		{ 2, "s16746", "12641", "=q4=Invulnerable Mail", "" };
		{ 3, "s27590", "22191", "=q4=Obsidian Mail Tunic", "" };
		{ 4, "s27587", "22196", "=q4=Thick Obsidian Breastplate", "" };
		{ 5, "s24136", "19690", "=q3=Bloodsoul Breastplate", "" };
		{ 6, "s24914", "20550", "=q3=Darkrune Breastplate", "" };
		{ 7, "s24139", "19693", "=q3=Darksoul Breastplate", "" };
		{ 8, "s28461", "22762", "=q3=Ironvine Breastplate", "" };
		{ 9, "s16745", "12618", "=q3=Enchanted Thorium Breastplate", "" };
		{ 10, "s16663", "12422", "=q2=Imperial Plate Chest", "" };
		{ 11, "s16731", "12613", "=q2=Runic Breastplate", "" };
		{ 12, "s16667", "12628", "=q3=Demon Forged Breastplate", "" };
		{ 13, "s15296", "11604", "=q3=Dark Iron Plate", "" };
		{ 14, "s16650", "12624", "=q3=Wildthorn Mail", "" };
		{ 15, "s16648", "12415", "=q2=Radiant Breastplate", "" };
		{ 16, "s16642", "12405", "=q2=Thorium Armor", "" };
		{ 17, "s9959", "7930", "=q2=Heavy Mithril Breastplate", "" };
		{ 18, "s9974", "7939", "=q3=Truesilver Breastplate", "" };
		{ 19, "s9916", "7963", "=q2=Steel Breastplate", "" };
		{ 20, "s3511", "3845", "=q2=Golden Scale Cuirass", "" };
		{ 21, "s3508", "3844", "=q3=Green Iron Hauberk", "" };
		{ 22, "s9813", "7914", "=q2=Barbaric Iron Breastplate", "" };
		{ 23, "s2675", "2870", "=q3=Shining Silver Breastplate", "" };
		{ 24, "s2673", "2869", "=q2=Silvered Bronze Breastplate", "" };
		{ 25, "s9972", "7935", "=q2=Ornate Mithril Breastplate", "" };
		{ 26, "s8367", "6731", "=q2=Ironforge Breastplate", "" };
		{ 27, "s2670", "2866", "=q1=Rough Bronze Cuirass", "" };
		{ 28, "s2667", "2864", "=q2=Runed Copper Breastplate", "" };
		{ 29, "s3321", "3471", "=q2=Copper Chain Vest", "" };
		{ 30, "s12260", "10421", "=q1=Rough Copper Vest", "" };
	};
	{ Name = BabbleInventory["Armor"] .. WHITE .. " - Feet";
		{ 1, "s24399", "20039", "=q4=Dark Iron Boots", "" };
		{ 2, "s23629", "19048", "=q3=Heavy Timbermaw Boots", "" };
		{ 3, "s16665", "12611", "=q2=Runic Plate Boots", "" };
		{ 4, "s16657", "12426", "=q2=Imperial Plate Boots", "" };
		{ 5, "s16656", "12419", "=q2=Radiant Boots", "" };
		{ 6, "s16652", "12409", "=q2=Thorium Boots", "" };
		{ 7, "s9979", "7936", "=q2=Ornate Mithril Boots", "" };
		{ 8, "s9968", "7933", "=q2=Heavy Mithril Boots", "" };
		{ 9, "s3515", "3847", "=q2=Golden Scale Boots", "" };
		{ 10, "s3513", "3846", "=q2=Polished Steel Boots", "" };
		{ 11, "s9818", "7916", "=q2=Barbaric Iron Boots", "" };
		{ 12, "s3334", "3484", "=q2=Green Iron Boots", "" };
		{ 13, "s3331", "3482", "=q2=Silvered Bronze Boots", "" };
		{ 14, "s7817", "6350", "=q1=Rough Bronze Boots", "" };
		{ 15, "s3319", "3469", "=q1=Copper Chain Boots", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Hands";
		{ 1, "s23637", "19164", "=q4=Dark Iron Gauntlets", "" };
		{ 2, "s28243", "22670", "=q4=Icebane Gauntlets", "" };
		{ 3, "s16741", "12639", "=q4=Stronghold Gauntlets", "" };
		{ 4, "s24138", "19692", "=q3=Bloodsoul Gauntlets", "" };
		{ 5, "s24912", "20549", "=q3=Darkrune Gauntlets", "" };
		{ 6, "s23633", "19057", "=q3=Gloves of the Dawn", "" };
		{ 7, "s28462", "22763", "=q3=Ironvine Gloves", "" };
		{ 8, "s27589", "22194", "=q4=Black Grasp of the Destroyer", "" };
		{ 9, "s16661", "12632", "=q3=Storm Gauntlets", "" };
		{ 10, "s16655", "12631", "=q3=Fiery Plate Gauntlets", "" };
		{ 11, "s9954", "7938", "=q3=Truesilver Gauntlets", "" };
		{ 12, "s16654", "12418", "=q2=Radiant Gloves", "" };
		{ 13, "s9950", "7927", "=q2=Ornate Mithril Gloves", "" };
		{ 14, "s11643", "9366", "=q2=Golden Scale Gauntlets", "" };
		{ 15, "s9928", "7919", "=q2=Heavy Mithril Gauntlet", "" };
		{ 16, "s9820", "7917", "=q2=Barbaric Iron Gloves", "" };
		{ 17, "s3336", "3485", "=q2=Green Iron Gauntlets", "" };
		{ 18, "s3333", "3483", "=q2=Silvered Bronze Gauntlets", "" };
		{ 19, "s3325", "3474", "=q2=Gemmed Copper Gauntlets", "" };
		{ 20, "s3323", "3472", "=q1=Runed Copper Gauntlets", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Head";
		{ 1, "s23636", "19148", "=q4=Dark Iron Helm", "" };
		{ 2, "s16729", "12640", "=q4=Lionheart Helm", "" };
		{ 3, "s24913", "20551", "=q3=Darkrune Helm", "" };
		{ 4, "s16742", "12620", "=q3=Enchanted Thorium Helm", "" };
		{ 5, "s16728", "12636", "=q3=Helm of the Great Chief", "" };
		{ 6, "s16724", "12633", "=q3=Whitesoul Helm", "" };
		{ 7, "s16726", "12612", "=q2=Runic Plate Helm", "" };
		{ 8, "s16658", "12427", "=q2=Imperial Plate Helm", "" };
		{ 9, "s16659", "12417", "=q2=Radiant Circlet", "" };
		{ 10, "s16653", "12410", "=q2=Thorium Helm", "" };
		{ 11, "s15293", "11606", "=q2=Dark Iron Mail", "" };
		{ 12, "s9980", "7937", "=q2=Ornate Mithril Helm", "" };
		{ 13, "s9970", "7934", "=q2=Heavy Mithril Helm", "" };
		{ 14, "s9961", "7931", "=q2=Mithril Coif", "" };
		{ 15, "s9935", "7922", "=q1=Steel Plate Helm", "" };
		{ 16, "s3503", "3837", "=q2=Golden Scale Coif", "" };
		{ 17, "s16726", "12612", "=q2=Runic Plate Helm", "" };
		{ 18, "s9814", "7915", "=q2=Barbaric Iron Helm", "" };
		{ 19, "s3502", "3836", "=q2=Green Iron Helm", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Legs";
		{ 1, "s20876", "17013", "=q4=Dark Iron Leggings", "" };
		{ 3, "s16662", "12414", "=q2=Thorium Leggings", "" };
		{ 2, "s27829", "22385", "=q4=Titanic Leggings", "" };
		{ 4, "s24140", "19694", "=q3=Darksoul Leggings", "" };
		{ 5, "s16744", "12619", "=q3=Enchanted Thorium Leggings", "" };
		{ 6, "s16730", "12429", "=q2=Imperial Plate Leggings", "" };
		{ 7, "s16725", "12420", "=q2=Radiant Leggings", "" };
		{ 8, "s16732", "12614", "=q2=Runic Plate Leggings", "" };
		{ 9, "s36122", "30069", "=q3=Earthforged Leggings", "" };
		{ 10, "s36124", "30070", "=q3=Windforged Leggings", "" };
		{ 11, "s9945", "7926", "=q2=Ornate Mithril Pants", "" };
		{ 12, "s9931", "7920", "=q2=Mithril Scale Pants", "" };
		{ 13, "s9933", "7921", "=q2=Heavy Mithril Pants", "" };
		{ 14, "s9957", "7929", "=q2=Orcish War Leggings", "" };
		{ 15, "s3507", "3843", "=q2=Golden Scale Leggings", "" };
		{ 16, "s3506", "3842", "=q2=Green Iron Leggings", "" };
		{ 17, "s12259", "10423", "=q2=Silvered Bronze Leggings", "" };
		{ 18, "s2668", "2865", "=q2=Rough Bronze Leggings", "" };
		{ 19, "s3324", "3473", "=q2=Runed Copper Pants", "" };
		{ 20, "s2662", "2852", "=q1=Copper Chain Pants", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s20873", "16988", "=q4=Fiery Chain Shoulders", "" };
		{ 2, "s24137", "19691", "=q3=Bloodsoul Shoulders", "" };
		{ 3, "s24141", "19695", "=q3=Darksoul Shoulders", "" };
		{ 4, "s16664", "12610", "=q2=Runic Plate Shoulders", "" };
		{ 5, "s16660", "12625", "=q3=Dawnbringer Shoulders", "" };
		{ 6, "s15295", "11605", "=q2=Dark Iron Shoulders", "" };
		{ 7, "s16646", "12428", "=q2=Imperial Plate Shoulders", "" };
		{ 8, "s9966", "7932", "=q2=Mithril Scale Shoulders", "" };
		{ 9, "s9952", "7928", "=q2=Ornate Mithril Shoulder", "" };
		{ 10, "s9926", "7918", "=q2=Heavy Mithril Shoulder", "" };
		{ 11, "s3505", "3841", "=q2=Golden Scale Shoulders", "" };
		{ 12, "s9811", "7913", "=q2=Barbaric Iron Shoulders", "" };
		{ 13, "s3504", "3840", "=q2=Green Iron Shoulders", "" };
		{ 14, "s3330", "3481", "=q2=Silvered Bronze Shoulders", "" };
		{ 15, "s3328", "3480", "=q1=Rough Bronze Shoulders", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Waist";
		{ 1, "s27585", "22197", "=q3=Heavy Obsidian Belt", "" };
		{ 2, "s28463", "22764", "=q3=Ironvine Belt", "" };
		{ 3, "s27588", "22195", "=q3=Light Obsidian Belt", "" };
		{ 4, "s20872", "16989", "=q4=Fiery Chain Girdle", "" };
		{ 5, "s23632", "19051", "=q3=Girdle of the Dawn", "" };
		{ 6, "s23628", "19043", "=q3=Heavy Timbermaw Belt", "" };
		{ 7, "s16647", "12424", "=q2=Imperial Plate Belt", "" };
		{ 8, "s16645", "12416", "=q2=Radiant Belt", "" };
		{ 9, "s16643", "12406", "=q2=Thorium Belt", "" };
		{ 10, "s2666", "2857", "=q1=Runed Copper Belt", "" };
		{ 11, "s2661", "2851", "=q1=Copper Chain Belt", "" };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Wrist";
		{ 1, "s28244", "22671", "=q4=Icebane Bracers", "" };
		{ 2, "s20874", "17014", "=q4=Dark Iron Bracers", "" };
		{ 3, "s16649", "12425", "=q2=Imperial Plate Bracers", "" };
		{ 4, "s16644", "12408", "=q2=Thorium Bracers", "" };
		{ 5, "s9937", "7924", "=q2=Mithril Scale Bracers", "" };
		{ 6, "s7223", "6040", "=q1=Golden Scale Bracers", "" };
		{ 7, "s3501", "3835", "=q1=Green Iron Bracers", "" };
		{ 8, "s2672", "2868", "=q2=Patterned Bronze Bracers", "" };
		{ 9, "s2664", "2854", "=q1=Runed Copper Bracers", "" };
		{ 10, "s2663", "2853", "=q1=Copper Bracers", "" };
	};
	{
		Name = "Weapon - One Handed";
		{ 1, "s23638", "19166", "=q4=Black Amnesty", "" };
		{ 2, "s23652", "19168", "=q4=Blackguard", "" };
		{ 3, "s23650", "19170", "=q4=Ebon Hand", "" };
		{ 4, "s27830", "22384", "=q4=Persuader", "" };
		{ 5, "s27832", "22383", "=q4=Sageblade", "" };
		{ 6, "s16991", "12798", "=q3=Annihilator", "" };
		{ 7, "s20897", "17016", "=q3=Dark Iron Destroyer", "" };
		{ 8, "s20890", "17015", "=q3=Dark Iron Reaver", "" };
		{ 9, "s16992", "12797", "=q3=Frostguard", "" };
		{ 10, "s16995", "12783", "=q3=Heartseeker", "" };
		{ 11, "s16993", "12794", "=q3=Masterwork Stormhammer", "" };
		{ 12, "s16983", "12781", "=q3=Serenity", "" };
		{ 13, "s16978", "12777", "=q3=Blazing Rapier", "" };
		{ 14, "s16970", "12774", "=q3=Dawn's Edge", "" };
		{ 15, "s36125", "30071", "=q3=Light Earthforged Blade", "" };
		{ 16, "s36128", "30073", "=q3=Light Emberforged Hammer", "" };
		{ 17, "s36126", "30072", "=q3=Light Skyforged Axe", "" };
		{ 18, "s10007", "7961", "=q3=Phantom Blade", "" };
		{ 19, "s10003", "7954", "=q3=The Shatterer", "" };
		{ 20, "s16984", "12792", "=q2=Volcanic Hammer", "" };
		{ 21, "s16969", "12773", "=q2=Ornate Thorium Handaxe", "" };
		{ 22, "s10013", "7947", "=q2=Ebon Shiv", "" };
		{ 23, "s10009", "7946", "=q2=Runed Mithril Hammer", "" };
		{ 24, "s10005", "7944", "=q2=Dazzling Mithril Rapier", "" };
		{ 25, "s10001", "7945", "=q2=Big Black Mace", "" };
		{ 26, "s9997", "7943", "=q2=Wicked Mithril Blade", "" };
		{ 27, "s9995", "7942", "=q2=Blue Glittering Axe", "" };
		{ 28, "s9993", "7941", "=q2=Heavy Mithril Axe", "" };
		{ 29, "s15973", "12260", "=q2=Searing Golden Blade", "" };
		{ 30, "s21913", "17704", "=q2=Edge of Winter", "" };
	};
	{
		Name = "Weapon - One Handed";
		{ 1, "s15972", "12259", "=q2=Glinting Steel Dagger", "" };
		{ 2, "s3493", "3850", "=q2=Jade Serpentblade", "" };
		{ 3, "s3492", "3849", "=q2=Hardened Iron Shortsword", "" };
		{ 4, "s3297", "3492", "=q2=Mighty Iron Hammer", "" };
		{ 5, "s6518", "5541", "=q2=Iridescent Hammer", "" };
		{ 6, "s3296", "3491", "=q2=Heavy Bronze Mace", "" };
		{ 7, "s3295", "3490", "=q2=Deadly Bronze Poniard", "" };
		{ 8, "s6517", "5540", "=q2=Pearl-handled Dagger", "" };
		{ 9, "s3491", "3848", "=q2=Big Bronze Knife", "" };
		{ 10, "s3294", "3489", "=q2=Thick War Axe", "" };
		{ 11, "s43549", "33791", "=q2=Heavy Copper Longsword", "" };
		{ 12, "s2742", "2850", "=q1=Bronze Shortsword", "" };
		{ 13, "s2741", "2849", "=q1=Bronze Axe", "" };
		{ 14, "s2740", "2848", "=q1=Bronze Mace", "" };
		{ 15, "s2738", "2845", "=q1=Copper Axe", "" };
		{ 16, "s2737", "2844", "=q1=Copper Mace", "" };
	};
	{
		Name = "Weapon - Two Handed";
		{ 1, "s23639", "19167", "=q4=Blackfury", "" };
		{ 2, "s23653", "19169", "=q4=Nightfall", "" };
		{ 3, "s21161", "17193", "=q4=Sulfuron Hammer", "" };
		{ 4, "s16990", "12790", "=q3=Arcanite Champion", "" };
		{ 5, "s16994", "12784", "=q3=Arcanite Reaper", "" };
		{ 6, "s16988", "12796", "=q3=Hammer of the Titans", "" };
		{ 7, "s16985", "12782", "=q3=Corruption", "" };
		{ 8, "s16973", "12776", "=q3=Enchanted Battlehammer", "" };
		{ 9, "s15294", "11607", "=q3=Dark Iron Sunderer", "" };
		{ 10, "s15292", "11608", "=q3=Dark Iron Pulverizer", "" };
		{ 11, "s10015", "7960", "=q3=Truesilver Champion", "" };
		{ 12, "s10011", "7959", "=q3=Blight", "" };
		{ 13, "s16971", "12775", "=q2=Huge Thorium Battleaxe", "" };
		{ 14, "s3500", "3856", "=q2=Shadow Crescent Axe", "" };
		{ 15, "s3497", "3854", "=q2=Frost Tiger Blade", "" };
		{ 16, "s3498", "3855", "=q2=Massive Iron Axe", "" };
		{ 17, "s3496", "3853", "=q2=Moonsteel Broadsword", "" };
		{ 18, "s3495", "3852", "=q2=Golden Iron Destroyer", "" };
		{ 19, "s3494", "3851", "=q2=Solid Iron Maul", "" };
		{ 20, "s3292", "3487", "=q2=Heavy Copper Broadsword", "" };
		{ 21, "s3293", "3488", "=q2=Copper Battle Axe", "" };
		{ 22, "s9987", "7958", "=q1=Bronze Battle Axe", "" };
		{ 23, "s9986", "7957", "=q1=Bronze Greatsword", "" };
		{ 24, "s9985", "7956", "=q1=Bronze Warhammer", "" };
		{ 25, "s7408", "6214", "=q1=Heavy Copper Maul", "" };
		{ 26, "s9983", "7955", "=q1=Copper Claymore", "" };
		{ 27, "s8880", "7166", "=q1=Copper Dagger", "" };
		{ 28, "s2739", "2847", "=q1=Copper Shortsword", "" };

	};
	{
		Name = "Weapon " .. WHITE .." - Thrown";
		{ 1, "s34979", "29201", "=q2=Thick Bronze Darts", "" };
		{ 2, "s34982", "29203", "=q2=Enchanted Thorium Blades", "" };
		{ 3, "s34981", "29202", "=q2=Whirling Steel Axes", "" };
	};
	{
		Name = "Shield";
		{ 1, "s27586", "22198", "=q4=Jagged Obsidian Shield", "" };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s16641", "12404", "=q1=Dense Sharpening Stone", "" };
		{ 2, "s16640", "12643", "=q1=Dense Weightstone", "" };
		{ 3, "s9918", "7964", "=q1=Solid Sharpening Stone", "" };
		{ 4, "s9921", "7965", "=q1=Solid Weightstone", "" };
		{ 5, "s7224", "6041", "=q1=Steel Weapon Chain", "" };
		{ 6, "s7222", "6043", "=q1=Iron Counterweight", "" };
		{ 7, "s7221", "6042", "=q1=Iron Shield Spike", "" };
		{ 8, "s2674", "2871", "=q1=Heavy Sharpening Stone", "" };
		{ 9, "s3117", "3241", "=q1=Heavy Weightstone", "" };
		{ 10, "s2665", "2863", "=q1=Coarse Sharpening Stone", "" };
		{ 11, "s3116", "3240", "=q1=Coarse Weightstone", "" };
		{ 12, "s2660", "2862", "=q1=Rough Sharpening Stone", "" };
		{ 13, "s3115", "3239", "=q1=Rough Weightstone", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s59406", "43853", "=q2=Titanium Skeleton Key", "" };
		{ 2, "s59405", "43854", "=q2=Cobalt Skeleton Key", "" };
		{ 3, "s19669", "15872", "=q2=Arcanite Skeleton Key", "" };
		{ 4, "s19668", "15871", "=q2=Truesilver Skeleton Key", "" };
		{ 5, "s19667", "15870", "=q2=Golden Skeleton Key", "" };
		{ 6, "s19666", "15869", "=q2=Silver Skeleton Key", "" };
		{ 7, "s55732", "41745", "=q1=Titanium Rod", "" };
		{ 8, "s32657", "25845", "=q1=Eternium Rod", "=ds=#sr# 360" };
		{ 9, "s32656", "25844", "=q1=Adamantite Rod", "=ds=#sr# 350" };
		{ 10, "s32655", "25843", "=q1=Fel Iron Rod", "" };
		{ 11, "s20201", "16206", "=q1=Arcanite Rod", "" };
		{ 12, "s16639", "12644", "=q1=Dense Grinding Stone", "" };
		{ 13, "s11454", "9060", "=q1=Inlaid Mithril Cylinder", "" };
		{ 14, "s14380", "11144", "=q1=Truesilver Rod", "" };
		{ 15, "s9920", "7966", "=q1=Solid Grinding Stone", "" };
		{ 16, "s14379", "11128", "=q1=Golden Rod", "" };
		{ 17, "s8768", "7071", "=q1=Iron Buckle", "" };
		{ 18, "s3337", "3486", "=q1=Heavy Grinding Stone", "" };
		{ 19, "s7818", "6338", "=q1=Silver Rod", "" };
		{ 20, "s3326", "3478", "=q1=Coarse Grinding Stone", "" };
		{ 21, "s3320", "3470", "=q1=Rough Grinding Stone", "" };
	};
	{
		Name = ARMORSMITH;
		{ 1, "s36122", "30069", "=q3=Earthforged Leggings", "" };
		{ 2, "s36124", "30070", "=q3=Windforged Leggings", "" };
	};
	{
		Name = WEAPONSMITH;
		{ 1, "s36125", "30071", "=q3=Light Earthforged Blade", "" };
		{ 2, "s36128", "30073", "=q3=Light Emberforged Hammer", "" };
		{ 3, "s36126", "30072", "=q3=Light Skyforged Axe", "" };
	};
};
---------------
--- Cooking ---
---------------

AtlasLoot_Data["CookingCLASSIC"] = {
	Name = COOKING;
	Type = "CraftingNoBF";
	{
		Name = "Page 1";
		{ 1, "s25659", "21023", "=q1=Dirge's Kickin' Chimaerok Chops", "" };
		{ 2, "s966455", "100626", "=q1=Azerothian Schmorgus Boards", "" };
		{ 3, "s966436", "100609", "=q1=Chilled Lava Eels", "" };
		{ 4, "s966435", "100608", "=q1=Chillwind Flank Steaks", "" };
		{ 5, "s966434", "100607", "=q1=Hippogryph Steaks", "" };
		{ 6, "s966433", "100606", "=q1=Steamed Makrinni Claws", "" };
		{ 7, "s966432", "100605", "=q1=Rubbed Ravasaur Ribss", "" };
		{ 8, "s966431", "100604", "=q1=Hearty Stegodon Stews", "" };
		{ 9, "s966430", "100603", "=q1=Crispy Pterrordax Wings", "" };
		{ 10, "s966429", "100602", "=q1=Spicy Dino Jerkys", "" };
		{ 11, "s966428", "100601", "=q1=Dirge's Nevermelt Ice Creams", "" };
		{ 12, "s966427", "100599", "=q1=Silithid Snacks", "" };
		{ 13, "s966426", "100598", "=q1=Hydra Scale Soups", "" };
		{ 14, "s966425", "100597", "=q1=Ghostly Goulashs", "" };
		{ 15, "s966398", "100583", "=q1=Seared Cunning Carps", "" };
	};
	{
		Name = "Page 2";
		{ 1, "s24801", "20452", "=q1=Smoked Desert Dumplings", "" };
		{ 2, "s18247", "13935", "=q1=Baked Salmon", "" };
		{ 3, "s18245", "13933", "=q1=Lobster Stew", "" };
		{ 4, "s18246", "13934", "=q1=Mightfish Steak", "" };
		{ 5, "s22761", "18254", "=q1=Runn Tum Tuber Surprise", "" };
		{ 6, "s46684", "35563", "=q1=Charred Bear Kabobs", "" };
		{ 7, "s46688", "35565", "=q1=Juicy Bear Burger", "" };
		{ 8, "s18243", "13931", "=q1=Nightfin Soup", "" };
		{ 9, "s18244", "13932", "=q1=Poached Sunscale Salmon", "" };
		{ 10, "s18240", "13928", "=q1=Grilled Squid", "" };
		{ 11, "s18242", "13929", "=q1=Hot Smoked Bass", "" };
		{ 12, "s64054", "INV_Misc_Shell_03", "=q1=Clamlette Magnifique", "" };
		{ 13, "s18239", "13927", "=q1=Cooked Glossy Mightfish", "" };
		{ 14, "s18241", "13930", "=q1=Filet of Redgill", "" };
		{ 15, "s15933", "12218", "=q1=Monster Omelet", "" };
		{ 16, "s15915", "12216", "=q1=Spiced Chili Crab", "" };
		{ 17, "s18238", "6887", "=q1=Spotted Yellowtail", "" };
		{ 18, "s22480", "18045", "=q1=Tender Wolf Steak", "" };
		{ 19, "s20626", "16766", "=q1=Undermine Clam Chowder", "" };
		{ 20, "s15906", "12217", "=q1=Dragonbreath Chili", "" };
		{ 21, "s15910", "12215", "=q1=Heavy Kodo Stew", "" };
		{ 22, "s21175", "17222", "=q1=Spider Sausage", "" };
		{ 23, "s4094", "4457", "=q1=Barbecued Buzzard Wing", "" };
		{ 24, "s15863", "12213", "=q1=Carrion Surprise", "" };
		{ 25, "s7213", "6038", "=q1=Giant Clam Scorcho", "" };
		{ 26, "s13028", "10841", "=q1=Goldthorn Tea", "" };
		{ 27, "s15856", "13851", "=q1=Hot Wolf Ribs", "" };
	};
	{
		Name = "Page 3";
		{ 1, "s15861", "12212", "=q1=Jungle Stew", "" };
		{ 2, "s20916", "8364", "=q1=Mithril Head Trout", "" };
		{ 3, "s15865", "12214", "=q1=Mystery Stew", "" };
		{ 4, "s15855", "12210", "=q1=Roast Raptor", "" };
		{ 5, "s7828", "4594", "=q1=Rockscale Cod", "" };
		{ 6, "s25954", "21217", "=q1=Sagefish Delight", "" };
		{ 7, "s3400", "3729", "=q1=Soothing Turtle Bisque", "" };
		{ 8, "s24418", "20074", "=q1=Heavy Crocolisk Stew", ""};
		{ 9, "s3399", "3728", "=q1=Tasty Lion Steak", "" };
		{ 10, "s3376", "3665", "=q1=Curiously Tasty Omelet", "" };
		{ 11, "s6500", "5527", "=q1=Goblin Deviled Clams", "" };
		{ 12, "s3398", "3727", "=q1=Hot Lion Chops", "" };
		{ 13, "s15853", "12209", "=q1=Lean Wolf Steak", "" };
		{ 14, "s3373", "3664", "=q1=Crocolisk Gumbo", "" };
		{ 15, "s3397", "3726", "=q1=Big Bear Steak", "" };
		{ 16, "s3377", "3666", "=q1=Gooey Spider Cake", "" };
		{ 17, "s6419", "5480", "=q1=Lean Venison", "" };
		{ 18, "s2548", "2685", "=q1=Succulent Pork Ribs", "" };
		{ 19, "s7755", "4593", "=q1=Bristle Whisker Catfish", "" };
		{ 20, "s45695", "34832", "=q1=Captain Rumsey's Lager", "" };
		{ 21, "s6418", "5479", "=q1=Crispy Lizard Tail", "" };
		{ 22, "s2547", "1082", "=q1=Redridge Goulash", "" };
		{ 23, "s2549", "1017", "=q1=Seasoned Wolf Kabob", "" };
		{ 24, "s6501", "5526", "=q1=Clam Chowder", "" };
		{ 25, "s6417", "5478", "=q1=Dig Rat Stew", "" };
		{ 26, "s3372", "3663", "=q1=Murloc Fin Soup", "" };
		{ 27, "s2545", "2682", "=q1=Cooked Crab Claw", "" };
		{ 28, "s8238", "6657", "=q1=Savory Deviate Delight", "" };
		{ 29, "s3370", "3662", "=q1=Crocolisk Steak", "" };
		{ 30, "s8607", "6890", "=q1=Smoked Bear Meat", "" };
	};
	{
		Name = "Page 4";
		{ 1, "s2546", "2687", "=q1=Dry Pork Ribs", "" };
		{ 2, "s25704", "21072", "=q1=Smoked Sagefish", "" };
		{ 3, "s2544", "2683", "=q1=Crab Cake", "" };
		{ 4, "s62050", "44837", "=q1=Cornbread Stuffing", "" };
		{ 5, "s2543", "733", "=q1=Westfall Stew", "" };
		{ 6, "s3371", "3220", "=q1=Blood Sausage", "" };
		{ 7, "s28267", "22645", "=q1=Crunchy Spider Surprise", "" };
		{ 8, "s9513", "7676", "=q1=Thistle Tea", "" };
		{ 9, "s33278", "27636", "=q1=Bat Bites", "" };
		{ 10, "s6499", "5525", "=q1=Boiled Clams", "" };
		{ 11, "s2541", "2684", "=q1=Coyote Steak", "" };
		{ 12, "s6415", "5476", "=q1=Fillet of Frenzy", "" };
		{ 13, "s2542", "724", "=q1=Goretusk Liver Pie", "" };
		{ 14, "s7754", "6316", "=q1=Loch Frenzy Delight", "" };
		{ 15, "s7753", "4592", "=q1=Longjaw Mud Snapper", "" };
		{ 16, "s7827", "5095", "=q1=Rainbow Fin Albacore", "" };
		{ 17, "s62045", "34112", "=q1=Roasted Turkey", "" };
		{ 18, "s6416", "5477", "=q1=Strider Stew", "" };
		{ 19, "s62044", "1645", "=q1=Tasty Cranberries", "" };
		{ 20, "s62051", "44839", "=q1=Candied Yam", "" };
		{ 21, "s21144", "17198", "=q1=Egg Nog", "" };
		{ 22, "s6414", "5474", "=q1=Roasted Kodo Meat", "" };
		{ 23, "s62049", "44840", "=q1=Cranberry Chutney", "" };
		{ 24, "s6413", "5473", "=q1=Scorpid Surprise", "" };
		{ 25, "s2795", "2888", "=q1=Beer Basted Boar Ribs", "" };
		{ 26, "s6412", "5472", "=q1=Kaldorei Spider Kabob", "" };
		{ 27, "s2539", "2680", "=q1=Spiced Wolf Meat", "" };
		{ 28, "s7751", "6290", "=q1=Brilliant Smallfish", "" };
		{ 29, "s2538", "2679", "=q1=Charred Wolf Meat", "" };
		{ 30, "s33276", "27635", "=q1=Lynx Steak", "" };
	};
	{
		Name = "Page 5";
		{ 1, "s15935", "12224", "=q1=Crispy Bat Wing", "" };
		{ 2, "s43779", "33924", "=q1=Delicious Chocolate Cake", "" };
		{ 3, "s21143", "17197", "=q1=Gingerbread Cookie", "" };
		{ 4, "s8604", "6888", "=q1=Herb Baked Egg", "" };
		{ 5, "s2540", "2681", "=q1=Roasted Boar Meat", "" };
		{ 6, "s33277", "24105", "=q1=Roasted Moongraze Tenderloin", "" };
		{ 7, "s7752", "787", "=q1=Slitherskin Mackerel", "" };
		{ 8, "s37836", "30816", "=q1=Spice Bread", "" };
		{ 9, "s65454", "46691", "=q1=Bread of the Dead", "" };
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
		{ 1, "s20023", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Agility", "" };
		{ 2, "s20024", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Spirit", "" };
		{ 3, "s20020", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Greater Stamina", "" };
		{ 4, "s63746", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Accuracy", "" };
		{ 5, "s13935", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Agility", "" };
		{ 6, "s13890", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Speed", "" };
		{ 16, "s13836", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Stamina", "" };
		{ 17, "s13687", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Spirit", "" };
		{ 18, "s13644", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Stamina", "" };
		{ 19, "s13637", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Lesser Agility", "" };
		{ 20, "s7867", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Agility", "" };
		{ 21, "s7863", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Minor Stamina", "" };
	};
	{
		Name = AL["Enchant Bracer"];
		{ 1, "s23802", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Healing Power", "" };
		{ 2, "s20011", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Stamina", "" };
		{ 3, "s20010", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Strength", "" };
		{ 4, "s23801", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Mana Regeneration", "" };
		{ 5, "s20009", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Spirit", "" };
		{ 6, "s20008", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Intellect", "" };
		{ 7, "s13939", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Strength", "" };
		{ 8, "s13945", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Stamina", "" };
		{ 9, "s13931", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Deflection", "" };
		{ 10, "s13846", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Greater Spirit", "" };
		{ 11, "s13822", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Intellect", "" };
		{ 12, "s13661", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Strength", "" };
		{ 13, "s13646", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Deflection", "" };
		{ 14, "s13648", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Stamina", "" };
		{ 15, "s13642", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Spirit", "" };
		{ 16, "s13622", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Intellect", "" };
		{ 17, "s13536", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Strength", "" };
		{ 18, "s13501", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Stamina", "" };
		{ 19, "s7859", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Lesser Spirit", "" };
		{ 20, "s7779", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Agility", "" };
		{ 21, "s7782", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Strength", "" };
		{ 22, "s7457", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Stamina", "" };
		{ 23, "s7766", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Spirit", "" };
		{ 24, "s7418", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Health", "" };
		{ 25, "s7428", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Minor Deflection", "" };
	};
	{
		Name = AL["Enchant Chest"];
		{ 1, "s20025", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Stats", "" };
		{ 2, "s33991", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Restore Mana Prime", "" };
		{ 3, "s20028", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Mana", "" };
		{ 4, "s20026", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Health", "" };
		{ 5, "s13941", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Stats", "" };
		{ 6, "s13917", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Mana", "" };
		{ 7, "s13858", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Superior Health", "" };
		{ 8, "s13700", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Stats", "" };
		{ 9, "s13663", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Mana", "" };
		{ 10, "s13640", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Greater Health", "" };
		{ 11, "s13626", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Stats", "" };
		{ 12, "s13607", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Mana", "" };
		{ 13, "s13538", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Absorption", "" };
		{ 14, "s7857", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Health", "" };
		{ 15, "s7776", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Mana", "" };
		{ 16, "s7748", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Lesser Health", "" };
		{ 17, "s7443", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Mana", "" };
		{ 18, "s7420", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Health", "" };
	};
	{
		Name = AL["Enchant Cloak"];
		{ 1, "s25081", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Fire Resistance", "" };
		{ 2, "s20015", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Superior Defense", "" };
		{ 3, "s20014", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Resistance", "" };
		{ 4, "s13882", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Agility", "" };
		{ 5, "s13746", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Defense", "" };
		{ 6, "s13794", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Resistance", "" };
		{ 7, "s13657", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Fire Resistance", "" };
		{ 8, "s13635", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Defense", "" };
		{ 9, "s13522", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Shadow Resistance", "" };
		{ 10, "s7861", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Fire Resistance", "" };
		{ 11, "s13419", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Agility", "" };
		{ 12, "s13421", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Lesser Protection", "" };
		{ 13, "s7771", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Protection", "" };
		{ 14, "s7454", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Minor Resistance", "" };
		{ 15, "s7426", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Minor Absorption", "" };
	};
	{
		Name = AL["Enchant Gloves"];
		{ 1, "s25078", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fire Power", "" };
		{ 2, "s25074", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Frost Power", "" };
		{ 3, "s25079", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Healing Power", "" };
		{ 4, "s25073", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Shadow Power", "" };
		{ 5, "s25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility", "" };
		{ 6, "s25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat", "" };
		{ 7, "s20013", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Strength", "" };
		{ 8, "s20012", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Greater Agility", "" };
		{ 9, "s13948", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Minor Haste", "" };
		{ 10, "s13947", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Riding Skill", "" };
		{ 11, "s13868", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Herbalism", "" };
		{ 12, "s13887", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Strength", "" };
		{ 13, "s13841", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Advanced Mining", "" };
		{ 14, "s13815", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Agility", "" };
		{ 15, "s13698", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Skinning", "" };
		{ 16, "s13620", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Fishing", "" };
		{ 17, "s13617", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Herbalism", "" };
		{ 18, "s13612", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Mining", "" };
	};
	{
		Name = AL["Enchant Shield"];
		{ 1, "s20016", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Superior Spirit", "" };
		{ 2, "s20017", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Stamina", "" };
		{ 3, "s13933", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Frost Resistance", "" };
		{ 4, "s13905", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Greater Spirit", "" };
		{ 5, "s13817", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Stamina", "" };
		{ 6, "s13689", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Block", "" };
		{ 7, "s13659", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Spirit", "" };
		{ 8, "s13631", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Stamina", "" };
		{ 9, "s13485", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Spirit", "" };
		{ 10, "s13464", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Lesser Protection", "" };
		{ 11, "s13378", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Minor Stamina", "" };
	};
	{
		Name = AL["Enchant 2H Weapon"];
		{ 1, "s20036", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Intellect", "" };
		{ 2, "s20035", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Spirit", "" };
		{ 3, "s20030", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Superior Impact", "" };
		{ 4, "s27837", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Agility", "" };
		{ 5, "s13937", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Greater Impact", "" };
		{ 6, "s13695", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Impact", "" };
		{ 7, "s13529", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Impact", "" };
		{ 8, "s13380", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Spirit", "" };
		{ 9, "s7793", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Lesser Intellect", "" };
		{ 10, "s7745", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Minor Impact", "" };
	};
	{
		Name = AL["Enchant Weapon"];
		{ 1, "s20034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Crusader", "" };
		{ 2, "s22750", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Healing Power", "" };
		{ 3, "s20032", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lifestealing", "" };
		{ 4, "s23804", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Intellect", "" };
		{ 5, "s23803", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mighty Spirit", "" };
		{ 6, "s22749", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spell Power", "" };
		{ 7, "s20031", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Superior Striking", "" };
		{ 8, "s20033", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Unholy Weapon", "" };
		{ 9, "s23800", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Agility", "" };
		{ 10, "s23799", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Strength", "" };
		{ 11, "s20029", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Icy Chill", "" };
		{ 12, "s13898", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Fiery Weapon", "" };
		{ 13, "s13943", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Striking", "" };
		{ 14, "s13915", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Demonslaying", "" };
		{ 15, "s13693", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Striking", "" };
		{ 16, "s21931", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Winter's Might", "" };
		{ 17, "s13655", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Elemental Slayer", "" };
		{ 18, "s13653", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Beastslayer", "" };
		{ 19, "s13503", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Lesser Striking", "" };
		{ 20, "s7786", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Beastslayer", "" };
		{ 21, "s7788", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Minor Striking", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s25130", "20748", "=q1=Brilliant Mana Oil", "" };
		{ 2, "s25129", "20749", "=q1=Brilliant Wizard Oil", "" };
		{ 3, "s32664", "22461", "=q1=Runed Fel Iron Rod", "" };
		{ 4, "s20051", "16207", "=q1=Runed Arcanite Rod", "" };
		{ 5, "s25128", "20750", "=q1=Wizard Oil", "" };
		{ 6, "s17180", "12655", "=q1=Enchanted Thorium", "" };
		{ 7, "s25127", "20747", "=q1=Lesser Mana Oil", "" };
		{ 8, "s17181", "12810", "=q1=Enchanted Leather", "" };
		{ 9, "s25126", "20746", "=q1=Lesser Wizard Oil", "" };
		{ 10, "s13702", "11145", "=q1=Runed Truesilver Rod", "" };
		{ 11, "s25125", "20745", "=q1=Minor Mana Oil", "" };
		{ 12, "s13628", "11130", "=q1=Runed Golden Rod", "" };
		{ 13, "s7795", "6339", "=q1=Runed Silver Rod", "" };
		{ 14, "s25124", "20744", "=q1=Minor Wizard Oil", "" };
		{ 15, "s7421", "6218", "=q1=Runed Copper Rod", "" };
		{ 16, "s14810", "11290", "=q2=Greater Mystic Wand", "" };
		{ 17, "s14809", "11289", "=q2=Lesser Mystic Wand", "" };
		{ 18, "s14807", "11288", "=q2=Greater Magic Wand", "" };
		{ 19, "s14293", "11287", "=q2=Lesser Magic Wand", "" };
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
		{ 1, 18042, "", "=q2=Thorium Headed Arrow", "Quest See Tooltip", "", quest = {14183,14182, text = "Trade Thorium Shells for Arrows"}};
		{ 2, "s19800", "15997", "=q2=Thorium Shells", "" };
		{ 3, "s12621", "10513", "=q2=Mithril Gyro-Shot", "" };
		{ 4, "s12596", "10512", "=q2=Hi-Impact Mithril Slugs", "" };
		{ 5, "s3947", "8069", "=q1=Crafted Solid Shot", "" };
		{ 6, "s3930", "8068", "=q1=Crafted Heavy Shot", "" };
		{ 7, "s3920", "8067", "=q1=Crafted Light Shot", "" };
	};
	{
		Name = BabbleInventory["Armor"];
		{ 1, "s19830", "16022", "=q3=Arcanite Dragonling", "" };
		{ 2, "s24356", "19999", "=q3=Bloodvine Goggles", "" };
		{ 3, "s24357", "19998", "=q3=Bloodvine Lens", "" };
		{ 4, "s23082", "18639", "=q3=Ultra-Flash Shadow Reflector", "" };
		{ 5, "s23081", "18638", "=q3=Hyper-Radiant Flame Reflector", "" };
		{ 6, "s23077", "18634", "=q3=Gyrofreeze Ice Reflector", "" };
		{ 7, "s12622", "10504", "=q3=Green Lens", "" };
		{ 8, "s19825", "16008", "=q2=Master Engineer's Goggles", "" };
		{ 9, "s19819", "16009", "=q2=Voice Amplification Modulator", "" };
		{ 10, "s23079", "18637", "=q2=Major Recombobulator", "" };
		{ 11, "s19794", "15999", "=q2=Spellpower Goggles Xtreme Plus", "" };
		{ 12, "s12624", "10576", "=q2=Mithril Mechanical Dragonling", "" };
		{ 13, "s12617", "10506", "=q2=Deepdive Helmet", "" };
		{ 14, "s12618", "10503", "=q2=Rose Colored Goggles", "" };
		{ 15, "s12616", "10518", "=q2=Parachute Cloak", "" };
		{ 16, "s12615", "10502", "=q2=Spellpower Goggles Xtreme", "" };
		{ 17, "s12607", "10501", "=q2=Catseye Ultra Goggles", "" };
		{ 18, "s12594", "10500", "=q2=Fire Goggles", "" };
		{ 19, "s3969", "4396", "=q1=Mechanical Dragonling", "" };
		{ 20, "s3966", "4393", "=q2=Craftsman's Monocle", "" };
		{ 21, "s12587", "10499", "=q2=Bright-Eye Goggles", "" };
		{ 22, "s3956", "4385", "=q2=Green Tinted Goggles", "" };
		{ 23, "s3952", "4381", "=q2=Minor Recombobulator", "" };
		{ 24, "s3940", "4373", "=q2=Shadow Goggles", "" };
		{ 25, "s3934", "4368", "=q2=Flying Tiger Goggles", "" };
	};
	{
		Name = AL["Explosives"];
		{ 1, "s19831", "16040", "=q1=Arcane Bomb", "" };
		{ 2, "s19799", "16005", "=q1=Dark Iron Bomb", "" };
		{ 3, "s23080", "18594", "=q1=Powerful Seaforium Charge", "" };
		{ 4, "s19790", "15993", "=q1=Thorium Grenade", "" };
		{ 5, "s23070", "18641", "=q1=Dense Dynamite", "" };
		{ 6, "s12619", "10562", "=q1=Hi-Explosive Bomb", "" };
		{ 7, "s12754", "10586", "=q1=The Big One", "" };
		{ 8, "s12603", "10514", "=q1=Mithril Frag Bomb", "" };
		{ 9, "s12716", "10577", "=q1=Goblin Mortar", "" };
		{ 10, "s12760", "10646", "=q1=Goblin Sapper Charge", "" };
		{ 11, "s13240", "10577", "=q1=The Mortar: Reloaded", "" };
		{ 12, "s23069", "18588", "=q1=EZ-Thro Dynamite II", "" };
		{ 13, "s3972", "4398", "=q1=Large Seaforium Charge", "" };
		{ 14, "s3968", "4395", "=q1=Goblin Land Mine", "" };
		{ 15, "s3967", "4394", "=q1=Big Iron Bomb", "" };
		{ 16, "s3962", "4390", "=q1=Iron Grenade", "" };
		{ 17, "s12586", "10507", "=q1=Solid Dynamite", "" };
		{ 18, "s3960", "4403", "=q1=Portable Bronze Mortar", "" };
		{ 19, "s3950", "4380", "=q1=Big Bronze Bomb", "" };
		{ 20, "s3946", "4378", "=q1=Heavy Dynamite", "" };
		{ 21, "s3941", "4374", "=q1=Small Bronze Bomb", "" };
		{ 22, "s3937", "4370", "=q1=Large Copper Bomb", "" };
		{ 23, "s8339", "6714", "=q1=EZ-Thro Dynamite", "" };
		{ 24, "s3933", "4367", "=q1=Small Seaforium Charge", "" };
		{ 25, "s3931", "4365", "=q1=Coarse Dynamite", "" };
		{ 26, "s3923", "4360", "=q1=Rough Copper Bomb", "" };
		{ 27, "s3919", "4358", "=q1=Rough Dynamite", "" };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s22793", "18283", "=q3=Biznicks 247x128 Accurascope", "" };
		{ 2, "s12620", "10548", "=q1=Sniper Scope", "" };
		{ 3, "s12597", "10546", "=q1=Deadly Scope", "" };
		{ 4, "s3979", "4407", "=q2=Accurate Scope", "" };
		{ 5, "s3978", "4406", "=q1=Standard Scope", "" };
		{ 6, "s3977", "4405", "=q1=Crude Scope", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s22704", "18232", "=q1=Field Repair Bot 74A", "" };
		{ 2, "s30573", "23832", "=q1=Gnomish Tonk Controller", "" };
		{ 3, "s30561", "23831", "=q1=Goblin Tonk Controller", "" };
		{ 4, "s26443", "21570", "=q1=Firework Cluster Launcher", "" };
		{ 5, "s19814", "16023", "=q1=Masterwork Target Dummy", "" };
		{ 6, "s26426", "21714", "=q1=Large Blue Rocket Cluster", "" };
		{ 7, "s26427", "21716", "=q1=Large Green Rocket Cluster", "" };
		{ 8, "s26428", "21718", "=q1=Large Red Rocket Cluster", "" };
		{ 9, "s23096", "18645", "=q1=Alarm-O-Bot", "" };
		{ 10, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "" };
		{ 11, "s19793", "15996", "=q1=Lifelike Mechanical Toad", "" };
		{ 12, "s19567", "15846", "=q1=Salt Shaker", "" };
		{ 13, "s26011", "21277", "=q1=Tranquil Mechanical Yeti", "" };
		{ 14, "s23507", "19026", "=q1=Snake Burst Firework", "" };
		{ 15, "s26442", "21569", "=q1=Firework Launcher", "" };
		{ 16, "s26423", "21571", "=q1=Blue Rocket Cluster", "" };
		{ 17, "s26424", "21574", "=q1=Green Rocket Cluster", "" };
		{ 18, "s26425", "21576", "=q1=Red Rocket Cluster", "" };
		{ 19, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "" };
		{ 20, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "" };
		{ 21, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "" };
		{ 22, "s15633", "11826", "=q1=Lil' Smoky", "" };
		{ 23, "s15628", "11825", "=q1=Pet Bombling", "" };
		{ 24, "s15255", "11590", "=q1=Mechanical Repair Kit", "" };
		{ 25, "s21940", "17716", "=q1=Snowmaster 9000", "" };
		{ 26, "s3965", "4392", "=q1=Advanced Target Dummy", "" };
		{ 27, "s8243", "4852", "=q1=Flash Bomb", "" };
		{ 28, "s26420", "21589", "=q1=Large Blue Rocket", "" };
		{ 29, "s26421", "21590", "=q1=Large Green Rocket", "" };
		{ 30, "s26422", "21592", "=q1=Large Red Rocket", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s3963", "4391", "=q1=Compact Harvest Reaper Kit", "" };
		{ 2, "s9273", "7148", "=q1=Goblin Jumper Cables", "" };
		{ 3, "s3959", "4388", "=q1=Discombobulator Ray", "" };
		{ 4, "s3957", "4386", "=q1=Ice Deflector", "" };
		{ 5, "s3955", "4384", "=q1=Explosive Sheep", "" };
		{ 6, "s9271", "6533", "=q1=Aquadynamic Fish Attractor", "" };
		{ 7, "s23067", "9312", "=q1=Blue Firework", "" };
		{ 8, "s23068", "9313", "=q1=Green Firework", "" };
		{ 9, "s23066", "9318", "=q1=Red Firework", "" };
		{ 10, "s6458", "5507", "=q1=Ornate Spyglass", "" };
		{ 11, "s26416", "21558", "=q1=Small Blue Rocket", "" };
		{ 12, "s26417", "21559", "=q1=Small Green Rocket", "" };
		{ 13, "s26418", "21557", "=q1=Small Red Rocket", "" };
		{ 14, "s3944", "4376", "=q1=Flame Deflector", "" };
		{ 15, "s8334", "6712", "=q1=Practice Lock", "" };
		{ 16, "s3932", "4366", "=q1=Target Dummy", "" };
		{ 17, "s3928", "4401", "=q1=Mechanical Squirrel", "" };
	};
	{
		Name = AL["Reagents"];
		{ 1, "s19815", "16006", "=q1=Delicate Arcanite Converter", "" };
		{ 2, "s19795", "16000", "=q1=Thorium Tube", "" };
		{ 3, "s39895", "7191", "=q1=Fused Wiring", "" };
		{ 4, "s19791", "15994", "=q1=Thorium Widget", "" };
		{ 5, "s23071", "18631", "=q1=Truesilver Transformer", "" };
		{ 6, "s19788", "15992", "=q1=Dense Blasting Powder", "" };
		{ 7, "s12599", "10561", "=q1=Mithril Casing", "" };
		{ 8, "s12591", "10560", "=q1=Unstable Trigger", "" };
		{ 9, "s12589", "10559", "=q1=Mithril Tube", "" };
		{ 10, "s12590", "10498", "=q1=Gyromatic Micro-Adjustor", "" };
		{ 11, "s12585", "10505", "=q1=Solid Blasting Powder", "" };
		{ 12, "s3961", "4389", "=q1=Gyrochronatom", "" };
		{ 13, "s3958", "4387", "=q1=Iron Strut", "" };
		{ 14, "s12584", "10558", "=q1=Gold Power Core", "" };
		{ 15, "s3953", "4382", "=q1=Bronze Framework", "" };
		{ 16, "s3942", "4375", "=q1=Whirring Bronze Gizmo", "" };
		{ 17, "s3945", "4377", "=q1=Heavy Blasting Powder", "" };
		{ 18, "s3938", "4371", "=q1=Bronze Tube", "" };
		{ 19, "s3973", "4404", "=q1=Silver Contact", "" };
		{ 20, "s3929", "4364", "=q1=Coarse Blasting Powder", "" };
		{ 21, "s3926", "4363", "=q1=Copper Modulator", "" };
		{ 22, "s3924", "4361", "=q1=Copper Tube", "" };
		{ 23, "s3922", "4359", "=q1=Handful of Copper Bolts", "" };
		{ 24, "s3918", "4357", "=q1=Rough Blasting Powder", "" };
	};
	{
		Name = BabbleInventory["Weapon"];
		{ 1, "s22795", "18282", "=q4=Core Marksman Rifle", "" };
		{ 2, "s19833", "16007", "=q3=Flawless Arcanite Rifle", "" };
		{ 3, "s19796", "16004", "=q3=Dark Iron Rifle", "" };
		{ 4, "s19792", "15995", "=q2=Thorium Rifle", "" };
		{ 5, "s12614", "10510", "=q2=Mithril Heavy-bore Rifle", "" };
		{ 6, "s12595", "10508", "=q2=Mithril Blunderbuss", "" };
		{ 7, "s3954", "4383", "=q2=Moonsight Rifle", "" };
		{ 8, "s3949", "4379", "=q2=Silver-plated Shotgun", "" };
		{ 9, "s3939", "4372", "=q2=Lovingly Crafted Boomstick", "" };
		{ 10, "s3936", "4369", "=q2=Deadly Blunderbuss", "" };
		{ 11, "s3925", "4362", "=q2=Rough Boomstick", "" };
		{ 12, "s7430", "6219", "=q1=Arclight Spanner", "" };
	};
	{
		Name = GNOMISH;
		{ 1, "s23489", "18986", "=q2=Ultrasafe Transporter - Gadgetzan", "" };
		{ 2, "s23129", "18660", "=q2=World Enlarger", "" };
		{ 3, "s12907", "10726", "=q2=Gnomish Mind Control Cap", "" };
		{ 4, "s12905", "10724", "=q2=Gnomish Rocket Boots", "" };
		{ 5, "s12903", "10721", "=q2=Gnomish Harm Prevention Belt", "" };
		{ 6, "s12897", "10545", "=q2=Gnomish Goggles", "" };
		{ 7, "s30568", "23841", "=q1=Gnomish Flame Turret", "" };
		{ 8, "s23096", "18645", "=q1=Alarm-O-Bot", "" };
		{ 9, "s12759", "10645", "=q1=Gnomish Death Ray", "" };
		{ 10, "s12906", "10725", "=q1=Gnomish Battle Chicken", "" };
		{ 11, "s12902", "10720", "=q1=Gnomish Net-o-Matic Projector", "" };
		{ 12, "s12899", "10716", "=q1=Gnomish Shrink Ray", "" };
		{ 13, "s12895", "10713", "=q1=Inlaid Mithril Cylinder Plans", "" };
		{ 14, "s3971", "4397", "=q1=Gnomish Cloaking Device", "" };
		{ 15, "s9269", "7506", "=q2=Gnomish Universal Remote", "" };
	};
	{
		Name = GOBLIN;
		{ 1, "s23486", "18984", "=q2=Dimensional Ripper - Everlook", "" };
		{ 2, "s12758", "10588", "=q2=Goblin Rocket Helmet", "" };
		{ 3, "s8895", "7189", "=q2=Goblin Rocket Boots", "" };
		{ 4, "s12718", "10543", "=q2=Goblin Construction Helmet", "" };
		{ 5, "s12717", "10542", "=q2=Goblin Mining Helmet", "" };
		{ 6, "s30560", "23827", "=q1=Super Sapper Charge", "" };
		{ 7, "s30558", "23826", "=q1=The Bigger One", "" };
		{ 8, "s23078", "18587", "=q1=Goblin Jumper Cables XL", "" };
		{ 9, "s12908", "10727", "=q1=Goblin Dragon Gun", "" };
		{ 10, "s12754", "10586", "=q1=The Big One", "" };
		{ 11, "s12755", "10587", "=q1=Goblin Bomb Dispenser", "" };
		{ 12, "s12716", "10577", "=q1=Goblin Mortar", "" };
		{ 13, "s12715", "10644", "=q1=Goblin Rocket Fuel Recipe", "" };
		{ 14, "s12760", "10646", "=q1=Goblin Sapper Charge", "" };
		{ 15, "s13240", "10577", "=q1=The Mortar: Reloaded", "" };
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
		{ 1, "s23787", "19440", "=q1=Powerful Anti-Venom", "" };
		{ 2, "s18630", "14530", "=q1=Heavy Runecloth Bandage", "" };
		{ 3, "s18629", "14529", "=q1=Runecloth Bandage", "" };
		{ 4, "s10841", "8545", "=q1=Heavy Mageweave Bandage", "" };
		{ 5, "s10840", "8544", "=q1=Mageweave Bandage", "" };
		{ 6, "s7929", "6451", "=q1=Heavy Silk Bandage", "" };
		{ 7, "s7928", "6450", "=q1=Silk Bandage", "" };
		{ 8, "s7935", "6453", "=q1=Strong Anti-Venom", "" };
		{ 9, "s3278", "3531", "=q1=Heavy Wool Bandage", "" };
		{ 10, "s3277", "3530", "=q1=Wool Bandage", "" };
		{ 11, "s7934", "6452", "=q1=Anti-Venom", "" };
		{ 12, "s3276", "2581", "=q1=Heavy Linen Bandage", "" };
		{ 13, "s3275", "1251", "=q1=Linen Bandage", "" };
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
		{ 1, "s59498", "44210", "=q4=Faces of Doom", "" };
		{ 2, "s59497", "38322", "=q4=Iron-bound Tome", "" };
		{ 3, "s64051", "45854", "=q3=Rituals of the New Moon", "" };
		{ 4, "s64053", "45849", "=q3=Twilight Tome", "" };
		{ 5, "s59496", "43667", "=q3=Book of Clever Tricks", "" };
		{ 6, "s59495", "43666", "=q3=Hellfire Tome", "" };
		{ 7, "s59494", "43664", "=q3=Manual of Clouds", "" };
		{ 8, "s59493", "43663", "=q3=Stormbound Tome", "" };
		{ 9, "s59490", "43661", "=q3=Book of Stars", "" };
		{ 10, "s59489", "43660", "=q3=Fire Eater's Guide", "" };
		{ 11, "s59486", "43657", "=q3=Royal Guide of Escape Routes", "" };
		{ 12, "s59484", "43656", "=q3=Tome of Kings", "" };
		{ 13, "s59478", "43655", "=q3=Book of Survival", "" };
		{ 14, "s59475", "43654", "=q3=Tome of the Dawn", "" };
		{ 15, "s58565", "43515", "=q3=Mystic Tome", "" };
	};
	{
		Name = AL["Reagents"];
		{ 1, "s57716", "43127", "=q2=Snowfall Ink", "" };
		{ 2, "s57714", "43125", "=q2=Darkflame Ink", "" };
		{ 3, "s57712", "43123", "=q2=Ink of the Sky", "" };
		{ 4, "s57710", "43121", "=q2=Fiery Ink", "" };
		{ 5, "s57708", "43119", "=q2=Royal Ink", "" };
		{ 6, "s57706", "43117", "=q2=Dawnstar Ink", "" };
		{ 7, "s57703", "43115", "=q2=Hunter's Ink", "" };
		{ 8, "s57715", "43126", "=q1=Ink of the Sea", "" };
		{ 9, "s57713", "43124", "=q1=Ethereal Ink", "" };
		{ 10, "s57711", "43122", "=q1=Shimmering Ink", "" };
		{ 11, "s57709", "43120", "=q1=Celestial Ink", "" };
		{ 12, "s57707", "43118", "=q1=Jadefire Ink", "" };
		{ 13, "s57704", "43116", "=q1=Lion's Ink", "" };
		{ 14, "s53462", "39774", "=q1=Midnight Ink", "" };
		{ 15, "s52843", "39469", "=q1=Moonglow Ink", "" };
		{ 16, "s52738", "37101", "=q1=Ivory Ink", "" };
	};
	{
		Name = AL["Scrolls"];
		{ 1, "s69385", "49632", "=q1=Runescroll of Fortitude", "" };
		{ 3, "s60337", "44315", "=q1=Scroll of Recall III", "" };
		{ 4, "s60336", "44314", "=q1=Scroll of Recall II", "" };
		{ 5, "s48248", "37118", "=q1=Scroll of Recall", "" };
		{ 6, "s58483", "3012", "=q1=Scroll of Agility VIII", "" };
		{ 7, "s58482", "3012", "=q1=Scroll of Agility VII", "" };
		{ 8, "s58481", "3012", "=q1=Scroll of Agility VI", "" };
		{ 9, "s58480", "3012", "=q1=Scroll of Agility V", "" };
		{ 10, "s58478", "3012", "=q1=Scroll of Agility IV", "" };
		{ 11, "s58476", "3012", "=q1=Scroll of Agility III", "" };
		{ 12, "s58473", "3012", "=q1=Scroll of Agility II", "" };
		{ 13, "s58472", "3012", "=q1=Scroll of Agility", "" };
		{ 14, "s50604", "955", "=q1=Scroll of Intellect VIII", "" };
		{ 15, "s50603", "955", "=q1=Scroll of Intellect VII", "" };
		{ 16, "s50602", "955", "=q1=Scroll of Intellect VI", "" };
		{ 17, "s50601", "955", "=q1=Scroll of Intellect V", "" };
		{ 18, "s50600", "955", "=q1=Scroll of Intellect IV", "" };
		{ 19, "s50599", "955", "=q1=Scroll of Intellect III", "" };
		{ 20, "s50598", "955", "=q1=Scroll of Intellect II", "" };
		{ 21, "s48114", "955", "=q1=Scroll of Intellect", "" };
		{ 23, "s50611", "955", "=q1=Scroll of Spirit VIII", "" };
		{ 24, "s50610", "955", "=q1=Scroll of Spirit VII", "" };
		{ 25, "s50609", "955", "=q1=Scroll of Spirit VI", "" };
		{ 26, "s50608", "955", "=q1=Scroll of Spirit V", "" };
		{ 27, "s50607", "955", "=q1=Scroll of Spirit IV", "" };
		{ 28, "s50606", "955", "=q1=Scroll of Spirit III", "" };
		{ 29, "s50605", "955", "=q1=Scroll of Spirit II", "" };
		{ 30, "s48116", "955", "=q1=Scroll of Spirit", "" };
	};
	{
		Name = AL["Scrolls"];
		{ 1, "s50620", "1180", "=q1=Scroll of Stamina VIII", "" };
		{ 2, "s50619", "1180", "=q1=Scroll of Stamina VII", "" };
		{ 3, "s50618", "1180", "=q1=Scroll of Stamina VI", "" };
		{ 4, "s50617", "1180", "=q1=Scroll of Stamina V", "" };
		{ 5, "s50616", "1180", "=q1=Scroll of Stamina IV", "" };
		{ 6, "s50614", "1180", "=q1=Scroll of Stamina III", "" };
		{ 7, "s50612", "1180", "=q1=Scroll of Stamina II", "" };
		{ 8, "s45382", "1180", "=q1=Scroll of Stamina", "" };
		{ 16, "s58491", "3012", "=q1=Scroll of Strength VIII", "" };
		{ 17, "s58490", "3012", "=q1=Scroll of Strength VII", "" };
		{ 18, "s58489", "3012", "=q1=Scroll of Strength VI", "" };
		{ 19, "s58488", "3012", "=q1=Scroll of Strength V", "" };
		{ 20, "s58487", "3012", "=q1=Scroll of Strength IV", "" };
		{ 21, "s58486", "3012", "=q1=Scroll of Strength III", "" };
		{ 22, "s58485", "3012", "=q1=Scroll of Strength II", "" };
		{ 23, "s58484", "3012", "=q1=Scroll of Strength", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s59504", "INV_Feather_05", "=ds=Darkmoon Card of the North", "" };
		{ 2, "s59503", "INV_Feather_05", "=ds=Greater Darkmoon Card", "" };
		{ 3, "s59502", "INV_Feather_05", "=ds=Darkmoon Card", "" };
		{ 4, "s59491", "INV_Feather_05", "=ds=Shadowy Tarot", "" };
		{ 5, "s59487", "INV_Feather_05", "=ds=Arcane Tarot", "" };
		{ 6, "s48247", "INV_Feather_05", "=ds=Mysterious Tarot", "" .. "" };
		{ 7, "s59480", "INV_Feather_05", "=ds=Strange Tarot", "" };
		{ 9, "s61117", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Axe", "" };
		{ 10, "s61118", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Crag", "" };
		{ 11, "s61119", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Pinnacle", "" };
		{ 12, "s61120", "INV_Inscription_Tradeskill01", "=ds=Master's Inscription of the Storm", "" };
		{ 14, "s52175", "INV_Misc_Book_11", "=ds=Decipher", "" };
		{ 16, "s59500", "43145", "=q1=Armor Vellum III", "" };
		{ 17, "s59499", "37602", "=q1=Armor Vellum II", "" };
		{ 18, "s52739", "38682", "=q1=Armor Vellum", "" };
		{ 20, "s59501", "43146", "=q1=Weapon Vellum III", "" };
		{ 21, "s59488", "39350", "=q1=Weapon Vellum II", "" };
		{ 22, "s52840", "39349", "=q1=Weapon Vellum", "" };
		{ 24, "s59387", "43850", "=q1=Certificate of Ownership", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"];
		{ 1, "s57207", "43533", "=q1=Glyph of Anti-Magic Shell", "" };
		{ 2, "s59339", "43826", "=q1=Glyph of Blood Strike", "" };
		{ 3, "s57210", "43536", "=q1=Glyph of Bone Shield", "" };
		{ 4, "s57211", "43537", "=q1=Glyph of Chains of Ice", "" };
		{ 5, "s64297", "45799", "=q1=Glyph of Dancing Rune Weapon", "" };
		{ 6, "s57212", "43538", "=q1=Glyph of Dark Command", "" };
		{ 7, "s64266", "45804", "=q1=Glyph of Dark Death", "" };
		{ 8, "s57214", "43542", "=q1=Glyph of Death and Decay", "" };
		{ 9, "s57213", "43541", "=q1=Glyph of Death Grip", "" };
		{ 10, "s59340", "43827", "=q1=Glyph of Death Strike", "" };
		{ 11, "s64267", "45805", "=q1=Glyph of Disease", "" };
		{ 12, "s57216", "43543", "=q1=Glyph of Frost Strike", "" };
		{ 13, "s57208", "43534", "=q1=Glyph of Heart Strike", "" };
		{ 14, "s64300", "45806", "=q1=Glyph of Howling Blast", "" };
		{ 15, "s64298", "45800", "=q1=Glyph of Hungering Cold", "" };
		{ 16, "s57218", "43545", "=q1=Glyph of Icebound Fortitude", "" };
		{ 17, "s57219", "43546", "=q1=Glyph of Icy Touch", "" };
		{ 18, "s57220", "43547", "=q1=Glyph of Obliterate", "" };
		{ 19, "s57221", "43548", "=q1=Glyph of Plague Strike", "" };
		{ 20, "s57223", "43550", "=q1=Glyph of Rune Strike", "" };
		{ 21, "s59338", "43825", "=q1=Glyph of Rune Tap", "" };
		{ 22, "s57224", "43551", "=q1=Glyph of Scourge Strike", "" };
		{ 23, "s57225", "43552", "=q1=Glyph of Strangulate", "" };
		{ 24, "s57222", "43549", "=q1=Glyph of the Ghoul", "" };
		{ 25, "s57226", "43553", "=q1=Glyph of Unbreakable Armor", "" };
		{ 26, "s64299", "45803", "=q1=Glyph of Unholy Blight", "" };
		{ 27, "s57227", "43554", "=q1=Glyph of Vampiric Blood", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"];
		{ 1, "s57209", "43535", "=q1=Glyph of Blood Tap", "" };
		{ 2, "s57229", "43671", "=q1=Glyph of Corpse Explosion", "" };
		{ 3, "s57215", "43539", "=q1=Glyph of Death's Embrace", "" };
		{ 4, "s57217", "43544", "=q1=Glyph of Horn of Winter", "" };
		{ 5, "s57230", "43672", "=q1=Glyph of Pestilence", "" };
		{ 6, "s57228", "43673", "=q1=Glyph of Raise Dead", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. AL["Druid"];
		{ 1, "s64256", "45623", "=q1=Glyph of Barkskin", "" };
		{ 2, "s64268", "45601", "=q1=Glyph of Berserk", "" };
		{ 3, "s67600", "48720", "=q1=Glyph of Claw", "" };
		{ 4, "s48121", "40924", "=q1=Glyph of Entangling Roots", "" };
		{ 5, "s62162", "44928", "=q1=Glyph of Focus", "" };
		{ 6, "s56943", "40896", "=q1=Glyph of Frenzied Regeneration", "" };
		{ 7, "s56944", "40899", "=q1=Glyph of Growl", "" };
		{ 8, "s56945", "40914", "=q1=Glyph of Healing Touch", "" };
		{ 9, "s56946", "40920", "=q1=Glyph of Hurricane", "" };
		{ 10, "s56947", "40908", "=q1=Glyph of Innervate", "" };
		{ 11, "s56948", "40919", "=q1=Glyph of Insect Swarm", "" };
		{ 12, "s56949", "40915", "=q1=Glyph of Lifebloom", "" };
		{ 13, "s56950", "40900", "=q1=Glyph of Mangle", "" };
		{ 14, "s56961", "40897", "=q1=Glyph of Maul", "" };
		{ 15, "s64258", "45622", "=q1=Glyph of Monsoon", "" };
		{ 16, "s56951", "40923", "=q1=Glyph of Moonfire", "" };
		{ 17, "s64313", "45603", "=q1=Glyph of Nourish", "" };
		{ 18, "s56952", "40903", "=q1=Glyph of Rake", "" };
		{ 19, "s71015", "50125", "=q1=Glyph of Rapid Rejuvenation", "" };
		{ 20, "s56953", "40909", "=q1=Glyph of Rebirth", "" };
		{ 21, "s56954", "40912", "=q1=Glyph of Regrowth", "" };
		{ 22, "s56955", "40913", "=q1=Glyph of Rejuvenation", "" };
		{ 23, "s56956", "40902", "=q1=Glyph of Rip", "" };
		{ 24, "s64307", "45604", "=q1=Glyph of Savage Roar", "" };
		{ 25, "s56957", "40901", "=q1=Glyph of Shred", "" };
		{ 26, "s56958", "40921", "=q1=Glyph of Starfall", "" };
		{ 27, "s56959", "40916", "=q1=Glyph of Starfire", "" };
		{ 28, "s65245", "46372", "=q1=Glyph of Survival Instincts", "" };
		{ 29, "s56960", "40906", "=q1=Glyph of Swiftmend", "" };
		{ 30, "s56963", "40922", "=q1=Glyph of WRATH", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. AL["Druid"];
		{ 1, "s64270", "45602", "=q1=Glyph of Wild Growth", "" };
		{ 2, "s58286", "43316", "=q1=Glyph of Aquatic Form", "" };
		{ 3, "s58287", "43334", "=q1=Glyph of Challenging Roar", "" };
		{ 4, "s59315", "43674", "=q1=Glyph of Dash", "" };
		{ 5, "s58296", "43335", "=q1=Glyph of the Wild", "" };
		{ 6, "s58289", "43332", "=q1=Glyph of Thorns", "" };
		{ 7, "s56965", "44922", "=q1=Glyph of Typhoon", "" };
		{ 8, "s58288", "43331", "=q1=Glyph of Unburdened Rebirth", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["HUNTER"];
		{ 1, "s56994", "42897", "=q1=Glyph of Aimed Shot", "" };
		{ 2, "s56995", "42898", "=q1=Glyph of Arcane Shot", "" };
		{ 3, "s56996", "42899", "=q1=Glyph of Aspect of the Beast", "" };
		{ 4, "s56997", "42900", "=q1=Glyph of Aspect of the Monkey", "" };
		{ 5, "s56998", "42901", "=q1=Glyph of Aspect of the Viper", "" };
		{ 6, "s56999", "42902", "=q1=Glyph of Beastial WRATH", "" };
		{ 7, "s64271", "45625", "=q1=Glyph of Chimera Shot", "" };
		{ 8, "s57000", "42903", "=q1=Glyph of Deterrence", "" };
		{ 9, "s57001", "42904", "=q1=Glyph of Disengage", "" };
		{ 10, "s64273", "45731", "=q1=Glyph of Explosive Shot", "" };
		{ 11, "s64253", "45733", "=q1=Glyph of Explosive Trap", "" };
		{ 12, "s57002", "42905", "=q1=Glyph of Freezing Trap", "" };
		{ 13, "s57003", "42906", "=q1=Glyph of Frost Trap", "" };
		{ 14, "s57004", "42907", "=q1=Glyph of Hunter's Mark", "" };
		{ 15, "s57005", "42908", "=q1=Glyph of Immolation Trap", "" };
		{ 16, "s57006", "42909", "=q1=Glyph of Improved Aspect of the Hawk", "" };
		{ 17, "s64304", "45732", "=q1=Glyph of Kill Shot", "" };
		{ 18, "s57007", "42910", "=q1=Glyph of Multi-Shot", "" };
		{ 19, "s57008", "42911", "=q1=Glyph of Rapid Fire", "" };
		{ 20, "s64246", "45735", "=q1=Glyph of Raptor Strike", "" };
		{ 21, "s64249", "45734", "=q1=Glyph of Scatter Shot", "" };
		{ 22, "s57009", "42912", "=q1=Glyph of Serpent Sting", "" };
		{ 23, "s57010", "42913", "=q1=Glyph of Snake Trap", "" };
		{ 24, "s57011", "42914", "=q1=Glyph of Steady Shot", "" };
		{ 25, "s57012", "42915", "=q1=Glyph of Trueshot Aura", "" };
		{ 26, "s57013", "42916", "=q1=Glyph of Volley", "" };
		{ 27, "s57014", "42917", "=q1=Glyph of Wyvern Sting", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["HUNTER"];
		{ 1, "s58302", "43351", "=q1=Glyph of Feign Death", "" };
		{ 2, "s58301", "43350", "=q1=Glyph of Mend Pet", "" };
		{ 3, "s58300", "43354", "=q1=Glyph of Possessed Strength", "" };
		{ 4, "s58299", "43338", "=q1=Glyph of Revive Pet", "" };
		{ 5, "s58298", "43356", "=q1=Glyph of Scare Beast", "" };
		{ 6, "s58297", "43355", "=q1=Glyph of the Pack", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["MAGE"];
		{ 1, "s64276", "45738", "=q1=Glyph of Arcane Barrage", "" };
		{ 2, "s56991", "44955", "=q1=Glyph of Arcane Blast", "" };
		{ 3, "s56968", "42734", "=q1=Glyph of Arcane Explosion", "" };
		{ 4, "s56971", "42735", "=q1=Glyph of Arcane Missiles", "" };
		{ 5, "s56972", "42736", "=q1=Glyph of Arcane Power", "" };
		{ 6, "s56973", "42737", "=q1=Glyph of Blink", "" };
		{ 7, "s64274", "45736", "=q1=Glyph of Deep Freeze", "" };
		{ 8, "s71101", "50045", "=q1=Glyph of Eternal Water", "" };
		{ 9, "s56974", "42738", "=q1=Glyph of Evocation", "" };
		{ 10, "s57719", "42740", "=q1=Glyph of Fire Blast", "" };
		{ 11, "s56975", "42739", "=q1=Glyph of Fireball", "" };
		{ 12, "s56976", "42741", "=q1=Glyph of Frost Nova", "" };
		{ 13, "s56977", "42742", "=q1=Glyph of Frostbolt", "" };
		{ 14, "s61677", "44684", "=q1=Glyph of Frostfire", "" };
		{ 15, "s56978", "42743", "=q1=Glyph of Ice Armor", "" };
		{ 16, "s64257", "45740", "=q1=Glyph of Ice Barrier", "" };
		{ 17, "s56979", "42744", "=q1=Glyph of Ice Block", "" };
		{ 18, "s56980", "42745", "=q1=Glyph of Ice Lance", "" };
		{ 19, "s56981", "42746", "=q1=Glyph of Icy Veins", "" };
		{ 20, "s56982", "42747", "=q1=Glyph of Improved Scorch", "" };
		{ 21, "s56983", "42748", "=q1=Glyph of Invisibility", "" };
		{ 22, "s64275", "45737", "=q1=Glyph of Living Bomb", "" };
		{ 23, "s56984", "42749", "=q1=Glyph of Mage Armor", "" };
		{ 24, "s56985", "42750", "=q1=Glyph of Mana Gem", "" };
		{ 25, "s64314", "45739", "=q1=Glyph of Mirror Image", "" };
		{ 26, "s56986", "42751", "=q1=Glyph of Molten Armor", "" };
		{ 27, "s56987", "42752", "=q1=Glyph of Polymorph", "" };
		{ 28, "s56988", "42753", "=q1=Glyph of Remove Curse", "" };
		{ 29, "s56989", "42754", "=q1=Glyph of Water Elemental", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["MAGE"];
		{ 1, "s58303", "43339", "=q1=Glyph of Arcane Intellect", "" };
		{ 2, "s56990", "44920", "=q1=Glyph of Blast Wave", "" };
		{ 3, "s58305", "43357", "=q1=Glyph of Fire Ward", "" };
		{ 4, "s58306", "43359", "=q1=Glyph of Frost Armor", "" };
		{ 5, "s58307", "43360", "=q1=Glyph of Frost Ward", "" };
		{ 6, "s58308", "43364", "=q1=Glyph of Slow Fall", "" };
		{ 7, "s58310", "43361", "=q1=Glyph of the Penguin", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
		{ 1, "s57019", "41101", "=q1=Glyph of Avenger's Shield", "" };
		{ 2, "s57021", "41107", "=q1=Glyph of Avenging WRATH", "" };
		{ 3, "s64277", "45741", "=q1=Glyph of Beacon of Light", "" };
		{ 4, "s57020", "41104", "=q1=Glyph of Cleansing", "" };
		{ 5, "s57023", "41099", "=q1=Glyph of Consecration", "" };
		{ 6, "s57024", "41098", "=q1=Glyph of Crusader Strike", "" };
		{ 7, "s64305", "45745", "=q1=Glyph of Divine Plea", "" };
		{ 8, "s64279", "45743", "=q1=Glyph of Divine Storm", "" };
		{ 9, "s57031", "41108", "=q1=Glyph of Divinity", "" };
		{ 10, "s57025", "41103", "=q1=Glyph of Exorcism", "" };
		{ 11, "s57026", "41105", "=q1=Glyph of Flash of Light", "" };
		{ 12, "s57027", "41095", "=q1=Glyph of Hammer of Justice", "" };
		{ 13, "s64278", "45742", "=q1=Glyph of Hammer of the Righteous", "" };
		{ 14, "s57028", "41097", "=q1=Glyph of Hammer of WRATH", "" };
		{ 15, "s57029", "41106", "=q1=Glyph of Holy Light", "" };
		{ 16, "s64254", "45746", "=q1=Glyph of Holy Shock", "" };
		{ 17, "s57030", "41092", "=q1=Glyph of Judgement", "" };
		{ 18, "s57032", "41100", "=q1=Glyph of Righteous Defense", "" };
		{ 19, "s64251", "45747", "=q1=Glyph of Salvation", "" };
		{ 20, "s59559", "43867", "=q1=Glyph of Seal of Blood", "" };
		{ 21, "s57033", "41094", "=q1=Glyph of Seal of Command", "" };
		{ 22, "s57034", "41110", "=q1=Glyph of Seal of Light", "" };
		{ 23, "s59560", "43868", "=q1=Glyph of Seal of Righteousness", "" };
		{ 24, "s59561", "43869", "=q1=Glyph of Seal of Vengeance", "" };
		{ 25, "s57035", "41109", "=q1=Glyph of Seal of Wisdom", "" };
		{ 26, "s64308", "45744", "=q1=Glyph of Shield of Righteousness", "" };
		{ 27, "s57022", "41096", "=q1=Glyph of Spiritual Attunement", "" };
		{ 28, "s57036", "41102", "=q1=Glyph of Turn Evil", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["PALADIN"];
		{ 1, "s58311", "43365", "=q1=Glyph of Blessing of Kings", "" };
		{ 2, "s58314", "43340", "=q1=Glyph of Blessing of Might", "" };
		{ 3, "s58312", "43366", "=q1=Glyph of Blessing of Wisdom", "" };
		{ 4, "s58313", "43367", "=q1=Glyph of Lay on Hands", "" };
		{ 5, "s58315", "43368", "=q1=Glyph of Sense Undead", "" };
		{ 6, "s58316", "43369", "=q1=Glyph of the Wise", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
		{ 1, "s57181", "42396", "=q1=Glyph of Circle of Healing", "" };
		{ 2, "s57183", "42397", "=q1=Glyph of Dispel Magic", "" };
		{ 3, "s64280", "45753", "=q1=Glyph of Dispersion", "" };
		{ 4, "s57184", "42398", "=q1=Glyph of Fade", "" };
		{ 5, "s57185", "42399", "=q1=Glyph of Fear Ward", "" };
		{ 6, "s57186", "42400", "=q1=Glyph of Flash Heal", "" };
		{ 7, "s64281", "45755", "=q1=Glyph of Guardian Spirit", "" };
		{ 8, "s57187", "42401", "=q1=Glyph of Holy Nova", "" };
		{ 9, "s64283", "45758", "=q1=Glyph of Hymn of Hope", "" };
		{ 10, "s57188", "42402", "=q1=Glyph of Inner Fire", "" };
		{ 11, "s57189", "42403", "=q1=Glyph of Lightwell", "" };
		{ 12, "s57190", "42404", "=q1=Glyph of Mass Dispel", "" };
		{ 13, "s57191", "42405", "=q1=Glyph of Mind Control", "" };
		{ 14, "s57192", "42406", "=q1=Glyph of Mind Flay", "" };
		{ 15, "s64309", "45757", "=q1=Glyph of Mind Sear", "" };
		{ 16, "s64259", "45760", "=q1=Glyph of Pain Suppression", "" };
		{ 17, "s64282", "45756", "=q1=Glyph of Penance", "" };
		{ 18, "s57194", "42408", "=q1=Glyph of Power Word: Shield", "" };
		{ 19, "s57195", "42409", "=q1=Glyph of Prayer of Healing", "" };
		{ 20, "s57196", "42410", "=q1=Glyph of Psychic Scream", "" };
		{ 21, "s57197", "42411", "=q1=Glyph of Renew", "" };
		{ 22, "s57198", "42412", "=q1=Glyph of Scourge Imprisonment", "" };
		{ 23, "s57193", "42407", "=q1=Glyph of Shadow", "" };
		{ 24, "s57199", "42414", "=q1=Glyph of Shadow Word: Death", "" };
		{ 25, "s57200", "42415", "=q1=Glyph of Shadow Word: Pain", "" };
		{ 26, "s57201", "42416", "=q1=Glyph of Smite", "" };
		{ 27, "s57202", "42417", "=q1=Glyph of Spirit of Redemption", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["PRIEST"];
		{ 1, "s58317", "43342", "=q1=Glyph of Fading", "" };
		{ 2, "s58318", "43371", "=q1=Glyph of Fortitude", "" };
		{ 3, "s58319", "43370", "=q1=Glyph of Levitate", "" };
		{ 4, "s58320", "43373", "=q1=Glyph of Shackle Undead", "" };
		{ 5, "s58321", "43372", "=q1=Glyph of Shadow Protection", "" };
		{ 6, "s58322", "43374", "=q1=Glyph of Shadowfiend", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["ROGUE"];
		{ 1, "s57112", "42954", "=q1=Glyph of Adrenaline Rush", "" };
		{ 2, "s57113", "42955", "=q1=Glyph of Ambush", "" };
		{ 3, "s57114", "42956", "=q1=Glyph of Backstab", "" };
		{ 4, "s57115", "42957", "=q1=Glyph of Blade Flurry", "" };
		{ 5, "s64303", "45769", "=q1=Glyph of Cloak of Shadows", "" };
		{ 6, "s57116", "42958", "=q1=Glyph of Crippling Poison", "" };
		{ 7, "s57117", "42959", "=q1=Glyph of Deadly Throw", "" };
		{ 8, "s57119", "42960", "=q1=Glyph of Evasion", "" };
		{ 9, "s57120", "42961", "=q1=Glyph of Eviscerate", "" };
		{ 10, "s57121", "42962", "=q1=Glyph of Expose Armor", "" };
		{ 11, "s64315", "45766", "=q1=Glyph of Fan of Knives", "" };
		{ 12, "s57122", "42963", "=q1=Glyph of Feint", "" };
		{ 13, "s57123", "42964", "=q1=Glyph of Garrote", "" };
		{ 14, "s57124", "42965", "=q1=Glyph of Ghostly Strike", "" };
		{ 15, "s57125", "42966", "=q1=Glyph of Gouge", "" };
		{ 16, "s57126", "42967", "=q1=Glyph of Hemorrhage", "" };
		{ 17, "s64284", "45761", "=q1=Glyph of Hunger for Blood", "" };
		{ 18, "s64285", "45762", "=q1=Glyph of Killing Spree", "" };
		{ 19, "s64260", "45768", "=q1=Glyph of Mutilate", "" };
		{ 20, "s57127", "42968", "=q1=Glyph of Preparation", "" };
		{ 21, "s57128", "42969", "=q1=Glyph of Rupture", "" };
		{ 22, "s57129", "42970", "=q1=Glyph of Sap", "" };
		{ 23, "s64286", "45764", "=q1=Glyph of Shadow Dance", "" };
		{ 24, "s57131", "42972", "=q1=Glyph of Sinister Strike", "" };
		{ 25, "s57132", "42973", "=q1=Glyph of Slice and Dice", "" };
		{ 26, "s57133", "42974", "=q1=Glyph of Sprint", "" };
		{ 27, "s64310", "45767", "=q1=Glyph of Tricks of the Trade", "" };
		{ 28, "s57130", "42971", "=q1=Glyph of Vigor", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["ROGUE"];
		{ 1, "s58323", "43379", "=q1=Glyph of Blurred Speed", "" };
		{ 2, "s58324", "43376", "=q1=Glyph of Distract", "" };
		{ 3, "s58325", "43377", "=q1=Glyph of Pick Lock", "" };
		{ 4, "s58326", "43343", "=q1=Glyph of Pick Pocket", "" };
		{ 5, "s58327", "43378", "=q1=Glyph of Safe Fall", "" };
		{ 6, "s58328", "43380", "=q1=Glyph of Vanish", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
		{ 1, "s57232", "41517", "=q1=Glyph of Chain Heal", "" };
		{ 2, "s57233", "41518", "=q1=Glyph of Chain Lightning", "" };
		{ 3, "s64261", "45775", "=q1=Glyph of Earth Shield", "" };
		{ 4, "s57235", "41526", "=q1=Glyph of Earth Shock", "" };
		{ 5, "s57236", "41527", "=q1=Glyph of Earthliving Weapon", "" };
		{ 6, "s57250", "41552", "=q1=Glyph of Elemental Mastery", "" };
		{ 7, "s64288", "45771", "=q1=Glyph of Feral Spirit", "" };
		{ 8, "s57237", "41529", "=q1=Glyph of Fire Elemental Totem", "" };
		{ 9, "s57238", "41530", "=q1=Glyph of Fire Nova Totem", "" };
		{ 10, "s57239", "41531", "=q1=Glyph of Flame Shock", "" };
		{ 11, "s57240", "41532", "=q1=Glyph of Flametongue Weapon", "" };
		{ 12, "s57241", "41547", "=q1=Glyph of Frost Shock", "" };
		{ 13, "s57242", "41533", "=q1=Glyph of Healing Stream Totem", "" };
		{ 14, "s57243", "41534", "=q1=Glyph of Healing Wave", "" };
		{ 15, "s64316", "45777", "=q1=Glyph of Hex", "" };
		{ 16, "s57234", "41524", "=q1=Glyph of Lava", "" };
		{ 17, "s57249", "41540", "=q1=Glyph of Lava Lash", "" };
		{ 18, "s57244", "41535", "=q1=Glyph of Lesser Healing Wave", "" };
		{ 19, "s57245", "41536", "=q1=Glyph of Lightning Bolt", "" };
		{ 20, "s57246", "41537", "=q1=Glyph of Lightning Shield", "" };
		{ 21, "s57247", "41538", "=q1=Glyph of Mana Tide Totem", "" };
		{ 22, "s64289", "45772", "=q1=Glyph of Riptide", "" };
		{ 23, "s64247", "45778", "=q1=Glyph of Stoneclaw Totem", "" };
		{ 24, "s57248", "41539", "=q1=Glyph of Stormstrike", "" };
		{ 25, "s64287", "45770", "=q1=Glyph of Thunder", "" };
		{ 26, "s64262", "45776", "=q1=Glyph of Totem of WRATH", "" };
		{ 27, "s57251", "41541", "=q1=Glyph of Water Mastery", "" };
		{ 28, "s57252", "41542", "=q1=Glyph of Windfury Weapon", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["SHAMAN"];
		{ 1, "s58329", "43381", "=q1=Glyph of Astral Recall", "" };
		{ 2, "s59326", "43725", "=q1=Glyph of Ghost Wolf", "" };
		{ 3, "s58330", "43385", "=q1=Glyph of Renewed Life", "" };
		{ 4, "s57253", "44923", "=q1=Glyph of Thunderstorm", "" };
		{ 5, "s58331", "43344", "=q1=Glyph of Water Breathing", "" };
		{ 6, "s58332", "43386", "=q1=Glyph of Water Shield", "" };
		{ 7, "s58333", "43388", "=q1=Glyph of Water Walking", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
		{ 1, "s64294", "45781", "=q1=Glyph of Chaos Bolt", "" };
		{ 2, "s57258", "42454", "=q1=Glyph of Conflagrate", "" };
		{ 3, "s57259", "42455", "=q1=Glyph of Corruption", "" };
		{ 4, "s57260", "42456", "=q1=Glyph of Curse of Agony", "" };
		{ 5, "s57261", "42457", "=q1=Glyph of Death Coil", "" };
		{ 6, "s64317", "45782", "=q1=Glyph of Demonic Circle", "" };
		{ 7, "s57262", "42458", "=q1=Glyph of Fear", "" };
		{ 8, "s57263", "42459", "=q1=Glyph of Felguard", "" };
		{ 9, "s57264", "42460", "=q1=Glyph of Felhunter", "" };
		{ 10, "s64291", "45779", "=q1=Glyph of Haunt", "" };
		{ 11, "s57265", "42461", "=q1=Glyph of Health Funnel", "" };
		{ 12, "s57266", "42462", "=q1=Glyph of Healthstone", "" };
		{ 13, "s57267", "42463", "=q1=Glyph of Howl of Terror", "" };
		{ 14, "s57268", "42464", "=q1=Glyph of Immolate", "" };
		{ 15, "s57269", "42465", "=q1=Glyph of Imp", "" };
		{ 16, "s57257", "42453", "=q1=Glyph of Incinerate", "" };
		{ 17, "s64248", "45785", "=q1=Glyph of Life Tap", "" };
		{ 18, "s64318", "45780", "=q1=Glyph of Metamorphosis", "" };
		{ 19, "s71102", "50077", "=q1=Glyph of Quick Decay", "" };
		{ 20, "s57270", "42466", "=q1=Glyph of Searing Pain", "" };
		{ 21, "s57271", "42467", "=q1=Glyph of Shadow Bolt", "" };
		{ 22, "s57272", "42468", "=q1=Glyph of Shadowburn", "" };
		{ 23, "s64311", "45783", "=q1=Glyph of Shadowflame", "" };
		{ 24, "s57273", "42469", "=q1=Glyph of Siphon Life", "" };
		{ 25, "s64250", "45789", "=q1=Glyph of Soul Link", "" };
		{ 26, "s57274", "42470", "=q1=Glyph of Soulstone", "" };
		{ 27, "s57275", "42471", "=q1=Glyph of Succubus", "" };
		{ 28, "s57276", "42472", "=q1=Glyph of Unstable Affliction", "" };
		{ 29, "s57277", "42473", "=q1=Glyph of Voidwalker", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["WARLOCK"];
		{ 1, "s58338", "43392", "=q1=Glyph of Curse of Exhaustion", "" };
		{ 2, "s58337", "43390", "=q1=Glyph of Drain Soul", "" };
		{ 3, "s58339", "43393", "=q1=Glyph of Enslave Demon", "" };
		{ 4, "s58340", "43391", "=q1=Glyph of Kilrogg", "" };
		{ 5, "s58341", "43394", "=q1=Glyph of Souls", "" };
		{ 6, "s58336", "43389", "=q1=Glyph of Unending Breath", "" };
	};
	{
		Name = AL["Major Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
		{ 1, "s57151", "43420", "=q1=Glyph of Barbaric Insults", "" };
		{ 2, "s64295", "45790", "=q1=Glyph of Bladestorm", "" };
		{ 3, "s57152", "43425", "=q1=Glyph of Blocking", "" };
		{ 4, "s57153", "43412", "=q1=Glyph of Bloodthirst", "" };
		{ 5, "s57154", "43414", "=q1=Glyph of Cleaving", "" };
		{ 6, "s57155", "43415", "=q1=Glyph of Devastate", "" };
		{ 7, "s64312", "45794", "=q1=Glyph of Enraged Regeneration", "" };
		{ 8, "s57156", "43416", "=q1=Glyph of Execution", "" };
		{ 9, "s57157", "43417", "=q1=Glyph of Hamstring", "" };
		{ 10, "s57158", "43418", "=q1=Glyph of Heroic Strike", "" };
		{ 11, "s57159", "43419", "=q1=Glyph of Intervene", "" };
		{ 12, "s57166", "43426", "=q1=Glyph of Last Stand", "" };
		{ 13, "s57160", "43421", "=q1=Glyph of Mortal Strike", "" };
		{ 14, "s57161", "43422", "=q1=Glyph of Overpower", "" };
		{ 15, "s57162", "43413", "=q1=Glyph of Rapid Charge", "" };
		{ 16, "s57163", "43423", "=q1=Glyph of Rending", "" };
		{ 17, "s57164", "43430", "=q1=Glyph of Resonating Power", "" };
		{ 18, "s57165", "43424", "=q1=Glyph of Revenge", "" };
		{ 19, "s64252", "45797", "=q1=Glyph of Shield Wall", "" };
		{ 20, "s64296", "45792", "=q1=Glyph of Shockwave", "" };
		{ 21, "s64302", "45795", "=q1=Glyph of Spell Reflection", "" };
		{ 22, "s57167", "43427", "=q1=Glyph of Sunder Armor", "" };
		{ 23, "s57168", "43428", "=q1=Glyph of Sweeping Strikes", "" };
		{ 24, "s57169", "43429", "=q1=Glyph of Taunt", "" };
		{ 25, "s57170", "43431", "=q1=Glyph of Victory Rush", "" };
		{ 26, "s64255", "45793", "=q1=Glyph of Vigilance", "" };
		{ 27, "s57172", "43432", "=q1=Glyph of Whirlwind", "" };
	};
	{
		Name = AL["Minor Glyph"] .. " - " .. LOCALIZED_CLASS_NAMES_MALE["WARRIOR"];
		{ 1, "s58342", "43395", "=q1=Glyph of Battle", "" };
		{ 2, "s58343", "43396", "=q1=Glyph of Bloodrage", "" };
		{ 3, "s58344", "43397", "=q1=Glyph of Charge", "" };
		{ 4, "s68166", "49084", "=q1=Glyph of Command", "" };
		{ 5, "s58347", "43400", "=q1=Glyph of Enduring Victory", "" };
		{ 6, "s58345", "43398", "=q1=Glyph of Mocking Blow", "" };
		{ 7, "s58346", "43399", "=q1=Glyph of Thunder Clap", "" };
	};
};

----------------------
--- Leatherworking ---
----------------------

AtlasLoot_Data["LeatherworkingCLASSIC"] = {
	Name = LEATHERWORKING;
	Type = "Crafting";
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Back";
		{ 1, "s22926", "18509", "=q4=Chromatic Cloak", "" };
		{ 2, "s22928", "18511", "=q4=Shifting Cloak", "" };
		{ 3, "s22927", "18510", "=q4=Hide of the Wild", "" };
		{ 4, "s19093", "15138", "=q3=Onyxia Scale Cloak", "" };
		{ 5, "s10574", "8215", "=q2=Wild Leather Cloak", "" };
		{ 6, "s10562", "8216", "=q2=Big Voodoo Cloak", "" };
		{ 7, "s7153", "5965", "=q2=Guardian Cloak", "" };
		{ 8, "s9198", "7377", "=q2=Frost Leather Cloak", "" };
		{ 9, "s9070", "7283", "=q2=Black Whelp Cloak", "" };
		{ 10, "s7953", "6466", "=q2=Deviate Scale Cloak", "" };
		{ 11, "s2159", "2308", "=q2=Fine Leather Cloak", "" };
		{ 12, "s3760", "3719", "=q1=Hillman's Cloak", "" };
		{ 13, "s2168", "2316", "=q1=Dark Leather Cloak", "" };
		{ 14, "s2162", "2310", "=q1=Embossed Leather Cloak", "" };
		{ 15, "s9058", "7276", "=q1=Handstitched Leather Cloak", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Chest";
		{ 1, "s28219", "22661", "=q4=Polar Tunic", "" };
		{ 2, "s19095", "15059", "=q3=Living Breastplate", "" };
		{ 3, "s24121", "19685", "=q3=Primal Batskin Jerkin", "" };
		{ 4, "s24124", "19688", "=q3=Blood Tiger Breastplate", "" };
		{ 5, "s19104", "15068", "=q2=Frostsaber Tunic", "" };
		{ 6, "s19102", "15090", "=q2=Runic Leather Armor", "" };
		{ 7, "s19098", "15085", "=q2=Wicked Leather Armor", "" };
		{ 8, "s19081", "15075", "=q2=Chimeric Vest", "" };
		{ 9, "s19086", "15066", "=q3=Ironfeather Breastplate", "" };
		{ 10, "s19079", "15056", "=q3=Stormshroud Armor", "" };
		{ 11, "s19076", "15053", "=q2=Volcanic Breastplate", "" };
		{ 12, "s19068", "15064", "=q3=Warbear Harness", "" };
		{ 13, "s10647", "8349", "=q3=Feathered Breastplate", "" };
		{ 14, "s10630", "8346", "=q3=Gauntlets of the Sea", "" };
		{ 15, "s10544", "8211", "=q2=Wild Leather Vest", "" };
		{ 16, "s10520", "8200", "=q2=Big Voodoo Robe", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Chest";
		{ 1, "s10499", "8175", "=q2=Nightscape Tunic", "" };
		{ 2, "s6661", "5739", "=q1=Barbaric Harness", "" };
		{ 3, "s9196", "7374", "=q2=Dusky Leather Armor", "" };
		{ 4, "s9197", "7375", "=q2=Green Whelp Armor", "" };
		{ 5, "s3773", "4256", "=q2=Guardian Armor", "" };
		{ 6, "s6704", "5782", "=q2=Thick Murloc Armor", "" };
		{ 7, "s4096", "4455", "=q2=Raptor Hide Harness", "" };
		{ 8, "s2166", "2314", "=q1=Toughened Leather Armor", "" };
		{ 9, "s24940", "20575", "=q2=Black Whelp Tunic", "" };
		{ 10, "s2169", "2317", "=q2=Dark Leather Tunic", "" };
		{ 11, "s3762", "4244", "=q2=Hillman's Leather Vest", "" };
		{ 12, "s6703", "5781", "=q2=Murloc Scale Breastplate", "" };
		{ 13, "s8322", "6709", "=q2=Moonglow Vest", "" };
		{ 14, "s3761", "4243", "=q2=Fine Leather Tunic", "" };
		{ 15, "s2160", "2300", "=q2=Embossed Leather Vest", "" };
		{ 16, "s2163", "2311", "=q1=White Leather Jerkin", "" };
		{ 17, "s7126", "5957", "=q1=Handstitched Leather Vest", "" };
	};

	{
		Name = AL["Leather Armor"] .. WHITE .. " - Feet";
		{ 1, "s28473", "22760", "=q3=Bramblewood Boots", "" };
		{ 2, "s22922", "18506", "=q3=Mongoose Boots", "" };
		{ 3, "s20853", "16982", "=q4=Corehound Boots", "" };
		{ 4, "s23705", "19052", "=q3=Dawn Treaders", "" };
		{ 5, "s44953", "34086", "=q1=Winter Boots", "" };
		{ 6, "s19063", "15073", "=q2=Chimeric Boots", "" };
		{ 7, "s19066", "15071", "=q2=Frostsaber Boots", "" };
		{ 8, "s10566", "8213", "=q2=Wild Leather Boots", "" };
		{ 9, "s10558", "8197", "=q2=Nightscape Boots", "" };
		{ 10, "s9207", "7390", "=q2=Dusky Boots", "" };
		{ 11, "s9208", "7391", "=q2=Swift Boots", "" };
		{ 12, "s2167", "2315", "=q1=Dark Leather Boots", "" };
		{ 13, "s2158", "2307", "=q1=Fine Leather Boots", "" };
		{ 14, "s2161", "2309", "=q2=Embossed Leather Boots", "" };
		{ 15, "s2149", "2302", "=q1=Handstitched Leather Boots", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Hands";
		{ 1, "s28220", "22662", "=q4=Polar Gloves", "" };
		{ 2, "s24122", "19686", "=q3=Primal Batskin Gloves", "" };
		{ 3, "s26279", "21278", "=q3=Stormshroud Gloves", "" };
		{ 4, "s19087", "15070", "=q2=Frostsaber Gloves", "" };
		{ 5, "s19084", "15063", "=q3=Devilsaur Gauntlets", "" };
		{ 6, "s19055", "15091", "=q2=Runic Leather Gauntlets", "" };
		{ 7, "s19053", "15074", "=q2=Chimeric Gloves", "" };
		{ 8, "s19049", "15083", "=q2=Wicked Leather Gauntlets", "" };
		{ 9, "s22711", "18238", "=q3=Shadowskin Gloves", "" };
		{ 10, "s21943", "17721", "=q2=Gloves of the Greatfather", "" };
		{ 11, "s7156", "5966", "=q1=Guardian Gloves", "" };
		{ 12, "s3771", "4254", "=q2=Barbaric Gloves", "" };
		{ 13, "s9149", "7359", "=q2=Heavy Earthen Gloves", "" };
		{ 14, "s3764", "4247", "=q2=Hillman's Leather Gloves", "" };
		{ 15, "s9148", "7358", "=q2=Pilferer's Gloves", "" };
		{ 16, "s3770", "4253", "=q3=Toughened Leather Gloves", "" };
		{ 17, "s9146", "7349", "=q2=Herbalist's Gloves", "" };
		{ 18, "s9145", "7348", "=q2=Fletcher's Gloves", "" };
		{ 19, "s3765", "4248", "=q2=Dark Leather Gloves", "" };
		{ 20, "s9074", "7285", "=q2=Nimble Leather Gloves", "" };
		{ 21, "s9072", "7284", "=q2=Red Whelp Gloves", "" };
		{ 22, "s7954", "6467", "=q2=Deviate Scale Gloves", "" };
		{ 23, "s2164", "2312", "=q2=Fine Leather Gloves", "" };
		{ 24, "s3756", "4239", "=q1=Embossed Leather Gloves", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Head";
		{ 1, "s20854", "16983", "=q4=Molten Helm", "" };
		{ 2, "s28472", "22759", "=q3=Bramblewood Helm", "" };
		{ 3, "s19082", "15094", "=q2=Runic Leather Headband", "" };
		{ 4, "s19071", "15086", "=q2=Wicked Leather Headband", "" };
		{ 5, "s10632", "8348", "=q3=Helm of Fire", "" };
		{ 6, "s10546", "8214", "=q2=Wild Leather Helmet", "" };
		{ 7, "s10621", "8345", "=q3=Wolfshead Helm", "" };
		{ 8, "s10531", "8201", "=q2=Big Voodoo Mask", "" };
		{ 9, "s10507", "8176", "=q2=Nightscape Headband", "" };
		{ 10, "s10490", "8174", "=q2=Comfortable Leather Hat", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Legs";
		{ 1, "s19091", "15095", "=q2=Runic Leather Pants", "" };
		{ 2, "s19097", "15062", "=q3=Devilsaur Leggings", "" };
		{ 3, "s19083", "15087", "=q2=Wicked Leather Pants", "" };
		{ 4, "s19074", "15069", "=q2=Frostsaber Leggings", "" };
		{ 5, "s19080", "15065", "=q3=Warbear Woolies", "" };
		{ 6, "s19078", "15060", "=q3=Living Leggings", "" };
		{ 7, "s19073", "15072", "=q2=Chimeric Leggings", "" };
		{ 8, "s19067", "15057", "=q3=Stormshroud Pants", "" };
		{ 9, "s19059", "15054", "=q2=Volcanic Leggings", "" };
		{ 10, "s36074", "29964", "=q3=Blackstorm Leggings", "" };
		{ 11, "s36075", "29970", "=q3=Wildfeather Leggings", "" };
		{ 12, "s10572", "8212", "=q2=Wild Leather Leggings", "" };
		{ 13, "s10560", "8202", "=q2=Big Voodoo Pants", "" };
		{ 14, "s10548", "8193", "=q2=Nightscape Pants", "" };
		{ 15, "s7149", "5963", "=q2=Barbaric Leggings", "" };
		{ 16, "s9195", "7373", "=q2=Dusky Leather Leggings", "" };
		{ 17, "s7147", "5962", "=q2=Guardian Pants", "" };
		{ 18, "s3772", "4255", "=q2=Green Leather Armor", "" };
		{ 19, "s7133", "5958", "=q2=Fine Leather Pants", "" };
		{ 20, "s7135", "5961", "=q2=Dark Leather Pants", "" };
		{ 21, "s9068", "7282", "=q2=Light Leather Pants", "" };
		{ 22, "s3759", "4242", "=q2=Embossed Leather Pants", "" };
		{ 23, "s9064", "7280", "=q2=Rugged Leather Pants", "" };
		{ 24, "s2153", "2303", "=q1=Handstitched Leather Pants", "" };

	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s23704", "19049", "=q3=Timbermaw Brawlers", "" };
		{ 2, "s24125", "19689", "=q3=Blood Tiger Shoulders", "" };
		{ 3, "s23706", "19058", "=q3=Golden Mantle of the Dawn", "" };
		{ 4, "s19103", "15096", "=q2=Runic Leather Shoulders", "" };
		{ 5, "s19101", "15055", "=q2=Volcanic Shoulders", "" };
		{ 6, "s19090", "15058", "=q3=Stormshroud Shoulders", "" };
		{ 7, "s23703", "19044", "=q3=Might of the Timbermaw", "" };
		{ 8, "s19062", "15067", "=q3=Ironfeather Shoulders", "" };
		{ 9, "s19061", "15061", "=q3=Living Shoulders", "" };
		{ 10, "s10529", "8210", "=q2=Wild Leather Shoulders", "" };
		{ 11, "s10516", "8192", "=q2=Nightscape Shoulders", "" };
		{ 12, "s7151", "5964", "=q2=Barbaric Shoulders", "" };
		{ 13, "s3769", "4252", "=q2=Dark Leather Shoulders", "" };
		{ 14, "s9147", "7352", "=q2=Earthen Leather Shoulders", "" };
		{ 15, "s3768", "4251", "=q2=Hillman's Shoulders", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Waist";
		{ 1, "s23709", "19162", "=q4=Corehound Belt", "" };
		{ 2, "s23707", "19149", "=q4=Lava Belt", "" };
		{ 3, "s23710", "19163", "=q4=Molten Belt", "" };
		{ 4, "s22921", "18504", "=q3=Girdle of Insight", "" };
		{ 5, "s28474", "22761", "=q3=Bramblewood Belt", "" };
		{ 6, "s19092", "15088", "=q2=Wicked Leather Belt", "" };
		{ 7, "s19072", "15093", "=q2=Runic Leather Belt", "" };
		{ 8, "s3779", "4264", "=q2=Barbaric Belt", "" };
		{ 9, "s9206", "7387", "=q2=Dusky Belt", "" };
		{ 10, "s3778", "4262", "=q3=Gem-studded Leather Belt", "" };
		{ 11, "s3775", "4258", "=q2=Guardian Belt", "" };
		{ 12, "s4097", "4456", "=q2=Raptor Hide Belt", "" };
		{ 13, "s3774", "4257", "=q2=Green Leather Belt", "" };
		{ 14, "s3766", "4249", "=q2=Dark Leather Belt", "" };
		{ 15, "s3767", "4250", "=q2=Hillman's Belt", "" };
		{ 16, "s7955", "6468", "=q3=Deviate Scale Belt", "" };
		{ 17, "s6702", "5780", "=q2=Murloc Scale Belt", "" };
		{ 18, "s3763", "4246", "=q1=Fine Leather Belt", "" };
		{ 19, "s3753", "4237", "=q1=Handstitched Leather Belt", "" };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Wrist";
		{ 1, "s28221", "22663", "=q4=Polar Bracers", "" };
		{ 2, "s24123", "19687", "=q3=Primal Batskin Bracers", "" };
		{ 3, "s19065", "15092", "=q2=Runic Leather Bracers", "" };
		{ 4, "s19052", "15084", "=q2=Wicked Leather Bracers", "" };
		{ 5, "s3777", "4260", "=q2=Guardian Leather Bracers", "" };
		{ 6, "s9202", "7386", "=q2=Green Whelp Bracers", "" };
		{ 7, "s6705", "5783", "=q2=Murloc Scale Bracers", "" };
		{ 8, "s9201", "7378", "=q2=Dusky Bracers", "" };
		{ 9, "s3776", "4259", "=q2=Green Leather Bracers", "" };
		{ 10, "s23399", "18948", "=q3=Barbaric Bracers", "" };
		{ 11, "s9065", "7281", "=q1=Light Leather Bracers", "" };
		{ 12, "s9059", "7277", "=q1=Handstitched Leather Bracers", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Chest";
		{ 1, "s28222", "22664", "=q4=Icy Scale Breastplate", "" };
		{ 2, "s24703", "20380", "=q4=Dreamscale Breastplate", "" };
		{ 3, "s24851", "20478", "=q3=Sandstalker Breastplate", "" };
		{ 4, "s24848", "20479", "=q3=Spitfire Breastplate", "" };
		{ 5, "s19054", "15047", "=q3=Red Dragonscale Breastplate", "" };
		{ 6, "s19085", "15050", "=q3=Black Dragonscale Breastplate", "" };
		{ 7, "s19077", "15048", "=q3=Blue Dragonscale Breastplate", "" };
		{ 8, "s19050", "15045", "=q3=Green Dragonscale Breastplate", "" };
		{ 9, "s19051", "15076", "=q2=Heavy Scorpid Vest", "" };
		{ 10, "s10650", "8367", "=q3=Dragonscale Breastplate", "" };
		{ 11, "s10525", "8203", "=q2=Tough Scorpid Breastplate", "" };
		{ 12, "s10511", "8189", "=q2=Turtle Scale Breastplate", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Feet";
		{ 1, "s20855", "16984", "=q4=Black Dragonscale Boots", "" };
		{ 2, "s10554", "8209", "=q2=Tough Scorpid Boots", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Hands";
		{ 1, "s28223", "22666", "=q4=Icy Scale Gauntlets", "" };
		{ 2, "s23708", "19157", "=q4=Chromatic Gauntlets", "" };
		{ 3, "s24850", "20477", "=q3=Sandstalker Gauntlets", "" };
		{ 4, "s24847", "20480", "=q3=Spitfire Gauntlets", "" };
		{ 5, "s24655", "20296", "=q3=Green Dragonscale Gauntlets", "" };
		{ 6, "s19064", "15078", "=q2=Heavy Scorpid Gauntlets", "" };
		{ 7, "s10619", "8347", "=q3=Dragonscale Gauntlets", "" };
		{ 8, "s10542", "8204", "=q2=Tough Scorpid Gloves", "" };
		{ 9, "s10509", "8187", "=q2=Turtle Scale Gloves", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Head";
		{ 1, "s19088", "15080", "=q2=Heavy Scorpid Helm", "" };
		{ 2, "s10570", "8208", "=q2=Tough Scorpid Helm", "" };
		{ 3, "s10552", "8191", "=q2=Turtle Scale Helm", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Legs";
		{ 1, "s24654", "20295", "=q3=Blue Dragonscale Leggings", "" };
		{ 2, "s19107", "15052", "=q3=Black Dragonscale Leggings", "" };
		{ 3, "s19075", "15079", "=q2=Heavy Scorpid Leggings", "" };
		{ 4, "s19060", "15046", "=q3=Green Dragonscale Leggings", "" };
		{ 5, "s36076", "29971", "=q3=Dragonstrike Leggings", "" };
		{ 6, "s10568", "8206", "=q2=Tough Scorpid Leggings", "" };
		{ 7, "s10556", "8185", "=q2=Turtle Scale Leggings", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s19094", "15051", "=q3=Black Dragonscale Shoulders", "" };
		{ 2, "s19100", "15081", "=q2=Heavy Scorpid Shoulders", "" };
		{ 3, "s19089", "15049", "=q3=Blue Dragonscale Shoulders", "" };
		{ 4, "s10564", "8207", "=q2=Tough Scorpid Shoulders", "" };

	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Waist";
		{ 1, "s19070", "15082", "=q2=Heavy Scorpid Belt", "" };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Wrist";
		{ 1, "s28224", "22665", "=q4=Icy Scale Bracers", "" };
		{ 2, "s22923", "18508", "=q3=Swift Flight Bracers", "" };
		{ 3, "s24849", "20476", "=q3=Sandstalker Bracers", "" };
		{ 4, "s24846", "20481", "=q3=Spitfire Bracers", "" };
		{ 5, "s19048", "15077", "=q2=Heavy Scorpid Bracers", "" };
		{ 6, "s10533", "8205", "=q2=Tough Scorpid Bracers", "" };
		{ 7, "s10518", "8198", "=q2=Turtle Scale Bracers", "" };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s19058", "15564", "=q1=Rugged Armor Kit", "" };
		{ 2, "s10487", "8173", "=q1=Thick Armor Kit", "" };
		{ 3, "s3780", "4265", "=q1=Heavy Armor Kit", "" };
		{ 4, "s2165", "2313", "=q1=Medium Armor Kit", "" };
		{ 5, "s2152", "2304", "=q1=Light Armor Kit", "" };
	};
	{
		Name = AL["Quivers and Ammo Pouches"];
		{ 1, "s14930", "8217", "=q2=Quickdraw Quiver", "" };
		{ 2, "s14932", "8218", "=q2=Thick Leather Ammo Pouch", "" };
		{ 3, "s9194", "7372", "=q2=Heavy Leather Ammo Pouch", "" };
		{ 4, "s9193", "7371", "=q2=Heavy Quiver", "" };
		{ 5, "s9060", "7278", "=q1=Light Leather Quiver", "" };
		{ 6, "s9062", "7279", "=q1=Small Leather Ammo Pouch", "" };
	};
	{
		Name = AL["Drums, Bags and Misc."];
		{ 1, "s22815", "18258", "=q2=Gordok Ogre Suit", "" };
		{ 2, "s23190", "18662", "=q1=Heavy Leather Ball", "" };
		{ 3, "s5244", "5081", "=q1=Kodo Hide Bag", "" };
	};
	{
		Name = BabbleInventory["Leather"];
		{ 1, "s22331", "8170", "=q1=Rugged Leather", "" };
		{ 2, "s19047", "15407", "=q1=Cured Rugged Hide", "" };
		{ 3, "s20650", "4304", "=q1=Thick Leather", "" };
		{ 4, "s10482", "8172", "=q1=Cured Thick Hide", "" };
		{ 5, "s20649", "4234", "=q1=Heavy Leather", "" };
		{ 6, "s3818", "4236", "=q1=Cured Heavy Hide", "" };
		{ 7, "s20648", "2319", "=q1=Medium Leather", "" };
		{ 8, "s3817", "4233", "=q1=Cured Medium Hide", "" };
		{ 9, "s3816", "4231", "=q1=Cured Light Hide", "" };
		{ 10, "s2881", "2318", "=q1=Light Leather", "" };
	};
	{
		Name = DRAGONSCALE;
		{ 1, "s24654", "20295", "=q3=Blue Dragonscale Leggings", "" };
		{ 2, "s24655", "20296", "=q3=Green Dragonscale Gauntlets", "" };
		{ 3, "s36076", "29971", "=q3=Dragonstrike Leggings", "" };
		{ 4, "s10650", "8367", "=q3=Dragonscale Breastplate", "" };
		{ 5, "s10619", "8347", "=q3=Dragonscale Gauntlets", "" };
	};
	{
		Name = ELEMENTAL;
		{ 3, "s10630", "8346", "=q3=Gauntlets of the Sea", "" };
		{ 2, "s10632", "8348", "=q3=Helm of Fire", "" };
		{ 1, "s36074", "29964", "=q3=Blackstorm Leggings", "" };
	};
	{
		Name = TRIBAL;
		{ 3, "s10621", "8345", "=q3=Wolfshead Helm", "" };
		{ 2, "s10647", "8349", "=q3=Feathered Breastplate", "" };
		{ 1, "s36075", "29970", "=q3=Wildfeather Leggings", "" };
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
		{ 1, "s22967", "17771", "=q5=Smelt Elementium", "" };
		{ 2, "s70524", "12655", "=q1=Enchanted Thorium", "" };
		{ 3, "s16153", "12359", "=q1=Smelt Thorium", "" };
		{ 4, "s14891", "11371", "=q1=Smelt Dark Iron", "" };
		{ 5, "s10098", "6037", "=q2=Smelt Truesilver", "" };
		{ 6, "s10097", "3860", "=q1=Smelt Mithril", "" };
		{ 7, "s3569", "3859", "=q1=Smelt Steel", "" };
		{ 8, "s3308", "3577", "=q2=Smelt Gold", "" };
		{ 9, "s3307", "3575", "=q1=Smelt Iron", "" };
		{ 10, "s2658", "2842", "=q2=Smelt Silver", "" };
		{ 11, "s2659", "2841", "=q1=Smelt Bronze", "" };
		{ 12, "s3304", "3576", "=q1=Smelt Tin", "" };
		{ 13, "s2657", "2840", "=q1=Smelt Copper", "" };
	};
};

-----------------
--- Tailoring ---
-----------------

AtlasLoot_Data["TailoringCLASSIC"] = {
	Name = TAILORING;
	Type = "Crafting";
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Back";
		{ 1, "s28208", "22658", "=q4=Glacial Cloak", "" };
		{ 2, "s28210", "22660", "=q3=Gaea's Embrace", "" };
		{ 3, "s22870", "18413", "=q3=Cloak of Warding", "" };
		{ 4, "s23662", "19047", "=q3=Wisdom of the Timbermaw", "" };
		{ 5, "s18422", "14134", "=q3=Cloak of Fire", "" };
		{ 6, "s18409", "13860", "=q2=Runecloth Cloak", "" };
		{ 7, "s3862", "4327", "=q3=Icy Cloak", "" };
		{ 8, "s63742", "45626", "=q3=Spidersilk Drape", "" };
		{ 9, "s18420", "14103", "=q2=Brightcloth Cloak", "" };
		{ 10, "s18418", "14044", "=q2=Cindercloth Cloak", "" };
		{ 11, "s3861", "4326", "=q2=Long Silken Cloak", "" };
		{ 12, "s8789", "7056", "=q2=Crimson Silk Cloak", "" };
		{ 13, "s8786", "7053", "=q2=Azure Silk Cloak", "" };
		{ 14, "s8780", "7047", "=q2=Hands of Darkness", "" };
		{ 15, "s3844", "4311", "=q2=Heavy Woolen Cloak", "" };
		{ 16, "s6521", "5542", "=q2=Pearl-clasped Cloak", "" };
		{ 17, "s2402", "2584", "=q1=Woolen Cape", "" };
		{ 18, "s2397", "2580", "=q1=Reinforced Linen Cape", "" };
		{ 19, "s2387", "2570", "=q1=Linen Cloak", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Chest 1";
		{ 1, "s23666", "19156", "=q4=Flarecore Robe", "" };
		{ 2, "s28207", "22652", "=q4=Glacial Vest", "" };
		{ 3, "s18457", "14152", "=q4=Robe of the Archmage", "" };
		{ 4, "s18458", "14153", "=q4=Robe of the Void", "" };
		{ 5, "s18456", "14154", "=q4=Truefaith Vestments", "" };
		{ 6, "s24091", "19682", "=q3=Bloodvine Vest", "" };
		{ 7, "s22902", "18486", "=q3=Mooncloth Robe", "" };
		{ 8, "s18447", "14138", "=q3=Mooncloth Vest", "" };
		{ 9, "s28480", "22756", "=q3=Sylvan Vest", "" };
		{ 10, "s18451", "14106", "=q2=Felcloth Robe", "" };
		{ 11, "s18446", "14128", "=q2=Wizardweave Robe", "" };
		{ 12, "s18436", "14136", "=q3=Robe of Winter Night", "" };
		{ 13, "s12070", "10021", "=q3=Dreamweave Vest", "" };
		{ 14, "s18416", "14141", "=q2=Ghostweave Vest", "" };
		{ 15, "s22813", "18258", "=q2=Gordok Ogre Suit", "" };
		{ 16, "s18414", "14100", "=q2=Brightcloth Robe", "" };
		{ 17, "s18408", "14042", "=q2=Cindercloth Vest", "" };
		{ 18, "s18406", "13858", "=q2=Runecloth Robe", "" };
		{ 19, "s18407", "13857", "=q2=Runecloth Tunic", "" };
		{ 20, "s18404", "13868", "=q2=Frostweave Robe", "" };
		{ 21, "s18403", "13869", "=q2=Frostweave Tunic", "" };
		{ 22, "s26407", "21542", "=q1=Festive Red Pant Suit", "" };
		{ 23, "s26403", "21154", "=q1=Festival Dress", "" };
		{ 24, "s12093", "10036", "=q1=Tuxedo Jacket", "" };
		{ 25, "s44950", "34087", "=q1=Green Winter Clothes", "" };
		{ 26, "s44958", "34085", "=q1=Red Winter Clothes", "" };
		{ 27, "s12091", "10040", "=q1=White Wedding Dress", "" };
		{ 28, "s50644", "38277", "=q1=Haliscan Jacket", "" };
		{ 29, "s12077", "10053", "=q1=Simple Black Dress", "" };
		{ 30, "s12069", "10042", "=q2=Cindercloth Robe", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Chest 2";
		{ 1, "s12056", "10007", "=q2=Red Mageweave Vest", "" };
		{ 2, "s12055", "10004", "=q2=Shadoweave Robe", "" };
		{ 3, "s12050", "10001", "=q2=Black Mageweave Robe", "" };
		{ 4, "s12048", "9998", "=q2=Black Mageweave Vest", "" };
		{ 5, "s8802", "7063", "=q2=Crimson Silk Robe", "" };
		{ 12, "s8770", "7054", "=q3=Robe of Power", "" };
		{ 6, "s8791", "7058", "=q1=Crimson Silk Vest", "" };
		{ 7, "s8764", "7051", "=q2=Earthen Vest", "" };
		{ 8, "s8784", "7065", "=q2=Green Silk Armor", "" };
		{ 9, "s3859", "4324", "=q2=Azure Silk Vest", "" };
		{ 10, "s6692", "5770", "=q2=Robes of Arcana", "" };
		{ 11, "s6690", "5766", "=q2=Lesser Wizard's Robe", "" };
		{ 12, "s7643", "6264", "=q2=Greater Adept's Robe", "" };
		{ 13, "s8467", "6787", "=q1=White Woolen Dress", "" };
		{ 14, "s2403", "2585", "=q2=Gray Woolen Robe", "" };
		{ 15, "s7639", "6263", "=q2=Blue Overalls", "" };
		{ 16, "s2399", "2582", "=q1=Green Woolen Vest", "" };
		{ 17, "s2395", "2578", "=q2=Barbaric Linen Vest", "" };
		{ 18, "s7633", "6242", "=q2=Blue Linen Robe", "" };
		{ 19, "s7630", "6240", "=q2=Blue Linen Vest", "" };
		{ 20, "s7629", "6239", "=q2=Red Linen Vest", "" };
		{ 21, "s8465", "6786", "=q1=Simple Dress", "" };
		{ 22, "s2389", "2572", "=q2=Red Linen Robe", "" };
		{ 23, "s7623", "6238", "=q2=Brown Linen Robe", "" };
		{ 24, "s7624", "6241", "=q2=White Linen Robe", "" };
		{ 25, "s2385", "2568", "=q1=Brown Linen Vest", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Feet";
		{ 1, "s24093", "19684", "=q3=Bloodvine Boots", "" };
		{ 2, "s24903", "20537", "=q3=Runed Stygian Boots", "" };
		{ 3, "s19435", "15802", "=q3=Mooncloth Boots", "" };
		{ 4, "s23664", "19056", "=q3=Argent Boots", "" };
		{ 5, "s18437", "14108", "=q2=Felcloth Boots", "" };
		{ 6, "s18423", "13864", "=q2=Runecloth Boots", "" };
		{ 7, "s12088", "10044", "=q2=Cindercloth Boots", "" };
		{ 8, "s12082", "10031", "=q2=Shadoweave Boots", "" };
		{ 9, "s12073", "10026", "=q2=Black Mageweave Boots", "" };
		{ 10, "s3860", "4325", "=q2=Boots of the Enchanter", "" };
		{ 11, "s3856", "4321", "=q2=Spider Silk Slippers", "" };
		{ 12, "s3855", "4320", "=q3=Spidersilk Boots", "" };
		{ 13, "s3847", "4313", "=q2=Red Woolen Boots", "" };
		{ 14, "s2401", "2583", "=q2=Woolen Boots", "" };
		{ 15, "s3845", "4312", "=q2=Soft-soled Linen Boots", "" };
		{ 16, "s2386", "2569", "=q1=Linen Boots", "" };
		{ 17, "s12045", "10046", "=q1=Simple Linen Boots", "" };
		{ 18, "s49677", "6836", "=q1=Dress Shoes", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Hands";
		{ 1, "s20849", "16979", "=q4=Flarecore Gloves", "" };
		{ 2, "s28205", "22654", "=q4=Glacial Gloves", "" };
		{ 3, "s18454", "14146", "=q4=Gloves of Spell Mastery", "" };
		{ 4, "s22867", "18407", "=q3=Felcloth Gloves", "" };
		{ 5, "s22868", "18408", "=q3=Inferno Gloves", "" };
		{ 6, "s22869", "18409", "=q3=Mooncloth Gloves", "" };
		{ 7, "s12067", "10019", "=q3=Dreamweave Gloves", "" };
		{ 8, "s18417", "13863", "=q2=Runecloth Gloves", "" };
		{ 9, "s18415", "14101", "=q2=Brightcloth Gloves", "" };
		{ 10, "s18412", "14043", "=q2=Cindercloth Gloves", "" };
		{ 11, "s18413", "14142", "=q2=Ghostweave Gloves", "" };
		{ 12, "s18411", "13870", "=q2=Frostweave Gloves", "" };
		{ 13, "s12066", "10018", "=q2=Red Mageweave Gloves", "" };
		{ 14, "s12071", "10023", "=q2=Shadoweave Gloves", "" };
		{ 15, "s12053", "10003", "=q2=Black Mageweave Gloves", "" };
		{ 16, "s8804", "7064", "=q2=Crimson Silk Gloves", "" };
		{ 17, "s8782", "7049", "=q2=Truefaith Gloves", "" };
		{ 18, "s3854", "4319", "=q2=Azure Silk Gloves", "" };
		{ 19, "s3852", "4318", "=q2=Gloves of Meditation", "" };
		{ 20, "s3868", "4331", "=q2=Phoenix Gloves", "" };
		{ 21, "s3843", "4310", "=q2=Heavy Woolen Gloves", "" };
		{ 22, "s3840", "4307", "=q1=Heavy Linen Gloves", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Head";
		{ 1, "s18452", "14140", "=q3=Mooncloth Circlet", "" };
		{ 2, "s28481", "22757", "=q3=Sylvan Crown", "" };
		{ 3, "s18450", "14130", "=q2=Wizardweave Turban", "" };
		{ 4, "s18444", "13866", "=q2=Runecloth Headband", "" };
		{ 5, "s18442", "14111", "=q2=Felcloth Hood", "" };
		{ 6, "s12092", "10041", "=q3=Dreamweave Circlet", "" };
		{ 7, "s12086", "10025", "=q2=Shadoweave Mask", "" };
		{ 8, "s12081", "10030", "=q2=Admiral's Hat", "" };
		{ 9, "s12084", "10033", "=q2=Red Mageweave Headband", "" };
		{ 10, "s12072", "10024", "=q2=Black Mageweave Headband", "" };
		{ 11, "s12059", "10008", "=q2=White Bandit Mask", "" };
		{ 12, "s3858", "4323", "=q2=Shadow Hood", "" };
		{ 13, "s3857", "4322", "=q2=Enchanter's Cowl", "" };
		{ 14, "s8762", "7050", "=q1=Silk Headband", "" };
		{ 15, "s8760", "7048", "=q1=Azure Silk Hood", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Legs";
		{ 1, "s23667", "19165", "=q4=Flarecore Leggings", "" };
		{ 2, "s24092", "19683", "=q3=Bloodvine Leggings", "" };
		{ 3, "s24901", "20538", "=q3=Runed Stygian Leggings", "" };
		{ 4, "s18440", "14137", "=q3=Mooncloth Leggings", "" };
		{ 5, "s18439", "14104", "=q2=Brightcloth Pants", "" };
		{ 6, "s18441", "14144", "=q2=Ghostweave Pants", "" };
		{ 7, "s18438", "13865", "=q2=Runecloth Pants", "" };
		{ 8, "s18434", "14045", "=q2=Cindercloth Pants", "" };
		{ 9, "s18424", "13871", "=q2=Frostweave Pants", "" };
		{ 10, "s18419", "14107", "=q2=Felcloth Pants", "" };
		{ 11, "s18421", "14132", "=q2=Wizardweave Leggings", "" };
		{ 12, "s12089", "10035", "=q1=Tuxedo Pants", "" };
		{ 13, "s50647", "38278", "=q1=Haliscan Pantaloons", "" };
		{ 14, "s12060", "10009", "=q2=Red Mageweave Pants", "" };
		{ 15, "s12052", "10002", "=q2=Shadoweave Pants", "" };
		{ 16, "s12049", "9999", "=q2=Black Mageweave Leggings", "" };
		{ 17, "s8758", "7046", "=q2=Azure Silk Pants", "" };
		{ 18, "s3851", "4317", "=q2=Phoenix Pants", "" };
		{ 19, "s12047", "10048", "=q2=Colorful Kilt", "" };
		{ 20, "s3850", "4316", "=q2=Heavy Woolen Pants", "" };
		{ 21, "s12046", "10047", "=q1=Simple Kilt", "" };
		{ 22, "s3842", "4309", "=q2=Handstitched Linen Britches", "" };
		{ 23, "s3914", "4343", "=q1=Brown Linen Pants", "" };
		{ 24, "s12044", "10045", "=q1=Simple Linen Pants", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s20848", "16980", "=q4=Flarecore Mantle", "" };
		{ 2, "s23665", "19059", "=q3=Argent Shoulders", "" };
		{ 3, "s23663", "19050", "=q3=Mantle of the Timbermaw", "" };
		{ 4, "s18448", "14139", "=q3=Mooncloth Shoulders", "" };
		{ 5, "s28482", "22758", "=q3=Sylvan Shoulders", "" };
		{ 6, "s18453", "14112", "=q2=Felcloth Shoulders", "" };
		{ 7, "s18449", "13867", "=q2=Runecloth Shoulders", "" };
		{ 8, "s12078", "10029", "=q2=Red Mageweave Shoulders", "" };
		{ 9, "s12076", "10028", "=q2=Shadoweave Shoulders", "" };
		{ 10, "s12074", "10027", "=q2=Black Mageweave Shoulders", "" };
		{ 11, "s8799", "7062", "=q1=Crimson Silk Pantaloons", "" };
		{ 12, "s8795", "7060", "=q2=Azure Shoulders", "" };
		{ 13, "s8793", "7059", "=q2=Crimson Silk Shoulders", "" };
		{ 14, "s8774", "7057", "=q2=Green Silken Shoulders", "" };
		{ 15, "s3849", "4315", "=q1=Reinforced Woolen Shoulders", "" };
		{ 16, "s3848", "4314", "=q1=Double-stitched Woolen Shoulders", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Waist";
		{ 1, "s22866", "18405", "=q4=Belt of the Archmage", "" };
		{ 2, "s24902", "20539", "=q3=Runed Stygian Belt", "" };
		{ 3, "s18410", "14143", "=q2=Ghostweave Belt", "" };
		{ 4, "s18402", "13856", "=q2=Runecloth Belt", "" };
		{ 5, "s3864", "4329", "=q2=Star Belt", "" };
		{ 6, "s8797", "7061", "=q2=Earthen Silk Belt", "" };
		{ 7, "s3863", "4328", "=q2=Spider Belt", "" };
		{ 8, "s8766", "7052", "=q2=Azure Silk Belt", "" };
		{ 9, "s8772", "7055", "=q2=Crimson Silk Belt", "" };
		{ 10, "s8776", "7026", "=q1=Linen Belt", "" };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Wrist";
		{ 1, "s22759", "18263", "=q4=Flarecore Wraps", "" };
		{ 2, "s28209", "22655", "=q4=Glacial Wrists", "" };
		{ 3, "s3841", "4308", "=q1=Green Linen Bracers", "" };
	};
	{
		Name = AL["Bags"];
		{ 1, "s26087", "21342", "=q4=Core Felcloth Bag", "" };
		{ 2, "s18455", "14156", "=q3=Bottomless Bag", "" };
		{ 3, "s26086", "21341", "=q3=Felcloth Bag", "" };
		{ 4, "s27660", "22249", "=q2=Big Bag of Enchantment", "" };
		{ 5, "s18445", "14155", "=q2=Mooncloth Bag", "" };
		{ 6, "s27725", "22252", "=q2=Satchel of Cenarius", "" };
		{ 7, "s27659", "22248", "=q2=Enchanted Runecloth Bag", "" };
		{ 8, "s27724", "22251", "=q2=Cenarion Herb Bag", "" };
		{ 9, "s26085", "21340", "=q2=Soul Pouch", "" };
		{ 10, "s27658", "22246", "=q2=Enchanted Mageweave Pouch", "" };
		{ 11, "s18405", "14046", "=q1=Runecloth Bag", "" };
		{ 12, "s12079", "10051", "=q1=Red Mageweave Bag", "" };
		{ 13, "s12065", "10050", "=q1=Mageweave Bag", "" };
		{ 14, "s6695", "5765", "=q1=Black Silk Pack", "" };
		{ 15, "s6693", "5764", "=q1=Green Silk Pack", "" };
		{ 16, "s3813", "4245", "=q1=Small Silk Pack", "" };
		{ 17, "s6688", "5763", "=q1=Red Woolen Bag", "" };
		{ 18, "s3758", "4241", "=q1=Green Woolen Bag", "" };
		{ 19, "s3757", "4240", "=q1=Woolen Bag", "" };
		{ 20, "s6686", "5762", "=q1=Red Linen Bag", "" };
		{ 21, "s3755", "4238", "=q1=Linen Bag", "" };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s18560", "14342", "=q1=Mooncloth", "" };
		{ 2, "s18401", "14048", "=q1=Bolt of Runecloth", "" };
		{ 3, "s3865", "4339", "=q1=Bolt of Mageweave", "" };
		{ 4, "s3839", "4305", "=q1=Bolt of Silk Cloth", "" };
		{ 5, "s2964", "2997", "=q1=Bolt of Woolen Cloth", "" };
		{ 6, "s2963", "2996", "=q1=Bolt of Linen Cloth", "" };
	};
	{
		Name = AL["Shirts"];
		{ 1, "s12085", "10034", "=q1=Tuxedo Shirt", "" };
		{ 2, "s12080", "10055", "=q1=Pink Mageweave Shirt", "" };
		{ 3, "s12075", "10054", "=q1=Lavender Mageweave Shirt", "" };
		{ 4, "s12064", "10052", "=q1=Orange Martial Shirt", "" };
		{ 5, "s12061", "10056", "=q1=Orange Mageweave Shirt", "" };
		{ 6, "s3873", "4336", "=q1=Black Swashbuckler's Shirt", "" };
		{ 7, "s21945", "17723", "=q1=Green Holiday Shirt", "" };
		{ 8, "s3872", "4335", "=q1=Rich Purple Silk Shirt", "" };
		{ 9, "s8489", "6796", "=q1=Red Swashbuckler's Shirt", "" };
		{ 10, "s3871", "4334", "=q1=Formal White Shirt", "" };
		{ 11, "s8483", "6795", "=q1=White Swashbuckler's Shirt", "" };
		{ 12, "s3870", "4333", "=q1=Dark Silk Shirt", "" };
		{ 13, "s3869", "4332", "=q1=Bright Yellow Shirt", "" };
		{ 14, "s7892", "6384", "=q1=Stylish Blue Shirt", "" };
		{ 15, "s7893", "6385", "=q1=Stylish Green Shirt", "" };
		{ 16, "s3866", "4330", "=q1=Stylish Red Shirt", "" };
		{ 17, "s2406", "2587", "=q1=Gray Woolen Shirt", "" };
		{ 18, "s2396", "2579", "=q1=Green Linen Shirt", "" };
		{ 19, "s2394", "2577", "=q1=Blue Linen Shirt", "" };
		{ 20, "s2392", "2575", "=q1=Red Linen Shirt", "" };
		{ 21, "s2393", "2576", "=q1=White Linen Shirt", "" };
		{ 22, "s3915", "4344", "=q1=Brown Linen Shirt", "" };
	};
};

--------------------------------
--- Daily Profession Rewards ---
--------------------------------

---------------
--- Cooking ---
---------------

AtlasLoot_Data["CookingDaily1"] = {
	{ 1, 33925, "", "=q3=Recipe: Delicious Chocolate Cake", "=ds=#p3# (1)", "", "" };
	{ 2, 33871, "", "=q3=Recipe: Stormchops", "=ds=#p3# (300)", "", "" };
	{ 3, 33869, "", "=q3=Recipe: Broiled Bloodfin", "=ds=#p3# (300)", "", "" };
	{ 4, 33875, "", "=q2=Recipe: Kibler's Bits", "=ds=#p3# (300)", "", "" };
	{ 5, 33870, "", "=q2=Recipe: Skullfish Soup", "=ds=#p3# (325)", "", "" };
	{ 6, 33873, "", "=q2=Recipe: Spicy Hot Talbuk", "=ds=#p3# (300)", "", "" };
};

AtlasLoot_Data["CookingDaily2"] = {
	{ 1, 43035, "", "=q2=Recipe: Blackened Dragonfin", "=ds=#p3# (400)" };
	{ 2, 43032, "", "=q2=Recipe: Blackened Worg Steak", "=ds=#p3# (400)" };
	{ 3, 43029, "", "=q2=Recipe: Critter Bites", "=ds=#p3# (400)" };
	{ 4, 43033, "", "=q2=Recipe: Cuttlesteak", "=ds=#p3# (400)" };
	{ 5, 43036, "", "=q2=Recipe: Dragonfin Filet", "=ds=#p3# (400)" };
	{ 6, 43024, "", "=q2=Recipe: Firecracker Salmon", "=ds=#p3# (400)" };
	{ 7, 43030, "", "=q2=Recipe: Hearty Rhino", "=ds=#p3# (400)" };
	{ 8, 43026, "", "=q2=Recipe: Imperial Manta Steak", "=ds=#p3# (400)" };
	{ 9, 43018, "", "=q2=Recipe: Mega Mammoth Meal", "=ds=#p3# (400)" };
	{ 10, 43022, "", "=q2=Recipe: Mighty Rhino Dogs", "=ds=#p3# (400)" };
	{ 11, 43023, "", "=q2=Recipe: Poached Northern Sculpin", "=ds=#p3# (400)" };
	{ 12, 43028, "", "=q2=Recipe: Rhinolicious Wyrmsteak", "=ds=#p3# (400)" };
	{ 13, 43031, "", "=q2=Recipe: Snapper Extreme", "=ds=#p3# (400)" };
	{ 14, 43034, "", "=q2=Recipe: Spiced Mammoth Treats", "=ds=#p3# (400)" };
	{ 15, 43020, "", "=q2=Recipe: Spiced Wyrm Burger", "=ds=#p3# (400)" };
	{ 16, 43025, "", "=q2=Recipe: Spicy Blue Nettlefish", "=ds=#p3# (400)" };
	{ 17, 43027, "", "=q2=Recipe: Spicy Fried Herring", "=ds=#p3# (400)" };
	{ 18, 43019, "", "=q2=Recipe: Tender Shoveltusk Steak", "=ds=#p3# (400)" };
	{ 19, 43037, "", "=q2=Recipe: Tracker Snacks", "=ds=#p3# (400)" };
	{ 20, 43021, "", "=q2=Recipe: Very Burnt Worg", "=ds=#p3# (400)" };
	{ 22, 46349, "", "=q3=Chef's Hat", "=ds=#s1#" };
	{ 23, 43007, "", "=q1=Northern Spices", "=ds=#e8#" };
	{ 25, 0, "inv_misc_bag_11", "=q6=" .. AL["Small Spice Bag"], "" };
	{ 26, 33925, "", "=q3=Recipe: Delicious Chocolate Cake", "=ds=#p3# (1)", "", "" };
	{ 27, 33871, "", "=q3=Recipe: Stormchops", "=ds=#p3# (300)", "", "" };
	{ 28, 44228, "", "=q1=Baby Spice", "", "", "" };
	{ 29, 44114, "", "=q1=Old Spices", "", "", "" };
};

---------------
--- Fishing ---
---------------

AtlasLoot_Data["FishingDaily1"] = {
	{ 1, 34837, "", "=q4=The 2 Ring", "=ds=#s13#", "", "" };
	{ 2, 33820, "", "=q3=Weather-Beaten Fishing Hat", "=ds=#s1#, #a1#", "", "" };
	{ 3, 35350, "", "=q3=Chuck's Bucket", "=ds=#e13#", "", "" };
	{ 4, 33818, "", "=q3=Muckbreath's Bucket", "=ds=#e13#", "", "" };
	{ 5, 35349, "", "=q3=Snarly's Bucket", "=ds=#e13#", "", "" };
	{ 6, 33816, "", "=q3=Toothy's Bucket", "=ds=#e13#", "", "" };
	{ 7, 34831, "", "=q3=Eye of the Sea", "=ds=#e7#", "", "" };
	{ 8, 34834, "", "=q2=Recipe: Captain Rumsey's Lager", "=ds=#p3# (100)", "", "" };
	{ 9, 34836, "", "=q2=Spun Truesilver Fishing Line", "=ds=#p24# #e17#", "", "" };
	{ 16, 34827, "", "=q1=Noble's Monocle", "=ds=#s1#", "", "" };
	{ 17, 34828, "", "=q1=Antique Silver Cufflinks", "=ds=#s8#", "", "" };
	{ 18, 34826, "", "=q1=Gold Wedding Band", "=ds=#s13#", "", "" };
	{ 19, 34829, "", "=q1=Ornate Drinking Stein", "=ds=#s15#", "", "" };
	{ 20, 34859, "", "=q1=Razor Sharp Fillet Knife", "=ds=#h1#, #w4#", "", "" };
	{ 21, 34109, "", "=q1=Weather-Beaten Journal", "=ds=#e10#", "", "" };
	{ 22, 8827, "", "=q1=Elixir of Water Walking", "=ds=#e2#", "", "" };
	{ 23, 34861, "", "=q1=Sharpened Fish Hook", "=ds=#e24#", "", "" };
};

AtlasLoot_Data["FishingDaily2"] = {
	{ 1, 45862, "", "=q4=Bold Stormjewel", "=ds=#e7#", "", "" };
	{ 2, 45882, "", "=q4=Brilliant Stormjewel", "=ds=#e7#", "", "" };
	{ 3, 45879, "", "=q4=Delicate Stormjewel", "=ds=#e7#", "", "" };
	{ 4, 45987, "", "=q4=Rigid Stormjewel", "=ds=#e7#", "", "" };
	{ 5, 45883, "", "=q4=Runed Stormjewel", "=ds=#e7#", "", "" };
	{ 6, 45880, "", "=q4=Solid Stormjewel", "=ds=#e7#", "", "" };
	{ 7, 45881, "", "=q4=Sparkling Stormjewel", "=ds=#e7#", "", "" };
	{ 8, 33820, "", "=q3=Weather-Beaten Fishing Hat", "=ds=#s1#, #a1#", "", "" };
	{ 9, 45991, "", "=q3=Bone Fishing Pole", "=ds=#e20#", "", "" };
	{ 10, 45992, "", "=q3=Jeweled Fishing Pole", "=ds=#e20#", "", "" };
	{ 11, 44983, "", "=q3=Strand Crawler", "=ds=#e13#", "", "" };
	{ 12, 36784, "", "=q3=Siren's Tear", "=ds=#e7#", "", "" };
	{ 13, 45986, "", "=q3=Titanium Lockbox", "", "", "" };
	{ 14, 34834, "", "=q2=Recipe: Captain Rumsey's Lager", "=ds=#p3# (100)", "", "" };
	{ 15, 19971, "", "=q2=High Test Eternium Fishing Line", "=ds=#p24# #e17#", "", "" };
	{ 16, 45998, "", "=q1=Battered Jungle Hat", "=ds=#s1#", "", "" };
	{ 17, 45861, "", "=q1=Diamond-tipped Cane", "=ds=#h2#", "", "" };
	{ 18, 46006, "", "=q1=Glow Worm", "=ds=#e24#", "", "" };
	{ 19, 45984, "", "=q1=Unusual Compass", "", "", "" };
	{ 20, 40195, "", "=q1=Pygmy Oil", "=ds=#e2#", "", "" };
	{ 21, 8827, "", "=q1=Elixir of Water Walking", "=ds=#e2#", "", "" };
	{ 22, 46004, "", "=q1=Sealed Vial of Poison", "=ds=#m2#", "", "" };
	{ 23, 48679, "", "=q1=Waterlogged Recipe", "=ds=#m2# #p3# (350)", "", "" };
};

---------------------
---   High Risk   ---
---------------------

AtlasLoot_Data["AlchemyHighRiskCLASSIC"] = {
	Name = ALCHEMY .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968403", "967444", "=q3=Potent Flask of Manifesting Power", "" };
		{ 2, "s968406", "967447", "=q3=Potent Flask of the Warsong", "" };
		{ 3, "s968409", "967450", "=q3=Potent Flask of the Kirin Tor", "" };
		{ 4, "s968412", "967453", "=q3=Potent Flask of Butchery", "" };
		{ 5, "s968415", "967456", "=q3=Potent Flask of the Unyielding", "" };
		{ 6, "s968418", "967459", "=q3=Potent Flask of Unrelenting Power", "" };
		{ 7, "s968421", "967462", "=q3=Potent Flask of Savage Assault", "" };
		{ 8, "s968424", "967465", "=q3=Potent Flask of Shattering Thunder", "" };
		{ 9, "s968427", "967468", "=q3=Potent Flask of the Executioner", "" };
		{ 10, "s968430", "967471", "=q3=Potent Flask of Deep Meditation", "" };
		{ 11, "s968433", "967474", "=q3=Potent Flask of Adept Striking", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968404", "967445", "=q4=Distilled Flask of Manifesting Power", "" };
		{ 2, "s968407", "967448", "=q4=Distilled Flask of the Warsong", "" };
		{ 3, "s968410", "967451", "=q4=Distilled Flask of the Kirin Tor", "" };
		{ 4, "s968413", "967454", "=q4=Distilled Flask of Butchery", "" };
		{ 5, "s968416", "967457", "=q4=Distilled Flask of the Unyielding", "" };
		{ 6, "s968419", "967460", "=q4=Distilled Flask of Unrelenting Power", "" };
		{ 7, "s968422", "967463", "=q4=Distilled Flask of Savage Assault", "" };
		{ 8, "s968425", "967466", "=q4=Distilled Flask of Shattering Thunder", "" };
		{ 9, "s968428", "967469", "=q4=Distilled Flask of the Executioner", "" };
		{ 10, "s968431", "967472", "=q4=Distilled Flask of Deep Meditation", "" };
		{ 11, "s968434", "967475", "=q4=Distilled Flask of Adept Striking", "" };
	};
};

AtlasLoot_Data["SmithingHighRiskCLASSIC"] = {
	Name = BLACKSMITHING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968019", "967173", "=q3=Sturdy Living Belt Buckle", "" };
		{ 2, "s968022", "967176", "=q3=Sturdy Deflecting Belt Buckle", "" };
		{ 3, "s968025", "967179", "=q3=Sturdy Roguish Belt Buckle", "" };
		{ 4, "s968028", "967182", "=q3=Sturdy Dancing Belt Buckle", "" };
		{ 5, "s968031", "967185", "=q3=Sturdy Magus Belt Buckle", "" };
		{ 6, "s968034", "967188", "=q3=Sturdy Cleric's Belt Buckle", "" };
		{ 7, "s968037", "967191", "=q3=Sturdy Warlord's Belt Buckle", "" };
		{ 8, "s968040", "967194", "=q3=Sturdy Gaurdian's Belt Buckle", "" };
		{ 10, "s968481", "967681", "=q3=Homicite Key", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968020", "967174", "=q4=Mastercraft Living Belt Buckle", "" };
		{ 2, "s968023", "967177", "=q4=Mastercraft Deflecting Belt Buckle", "" };
		{ 3, "s968026", "967180", "=q4=Mastercraft Roguish Belt Buckle", "" };
		{ 4, "s968029", "967183", "=q4=Mastercraft Dancing Belt Buckle", "" };
		{ 5, "s968032", "967186", "=q4=Mastercraft Magus Belt Buckle", "" };
		{ 6, "s968035", "967189", "=q4=Mastercraft Cleric's Belt Buckle", "" };
		{ 7, "s968038", "967192", "=q4=Mastercraft Warlord's Belt Buckle", "" };
		{ 8, "s968041", "967195", "=q4=Mastercraft Gaurdian's Belt Buckle", "" };
		{ 10, "s968482", "967682", "=q4=Homicite Key", "" };
	};
};

AtlasLoot_Data["LeatherworkingHighRiskCLASSIC"] = {
	Name = LEATHERWORKING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968001", "967155", "=q3=Sturdy Yeti Gambeson", "" };
		{ 2, "s968004", "967158", "=q3=Sturdy Devilsaur Gambeson", "" };
		{ 3, "s968007", "967161", "=q3=Sturdy Plaguebat Gambeson", "" };
		{ 4, "s968010", "967164", "=q3=Sturdy Sandworm Gambeson", "" };
		{ 5, "s968013", "967167", "=q3=Sturdy Black Scale Gambeson", "" };
		{ 6, "s968016", "967170", "=q3=Sturdy Blue Scale Gambeson", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968002", "967156", "=q4=Mastercraft Yeti Gambeson", "" };
		{ 2, "s968005", "967159", "=q4=Mastercraft Devilsaur Gambeson", "" };
		{ 3, "s968008", "967162", "=q4=Mastercraft Plaguebat Gambeson", "" };
		{ 4, "s968011", "967165", "=q4=Mastercraft Sandworm Gambeson", "" };
		{ 5, "s968014", "967168", "=q4=Mastercraft Black Scale Gambeson", "" };
		{ 6, "s968017", "967171", "=q4=Mastercraft Blue Scale Gambeson", "" };
	};
};

AtlasLoot_Data["EngineeringHighRiskCLASSIC"] = {
	Name = ENGINEERING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968043", "967197", "=q3=Focused Gnomish Magnifying Lense", "" };
		{ 2, "s968046", "967200", "=q3=Focused Gnomish Focusing Lense", "" };
		{ 3, "s968049", "967203", "=q3=Focused Gnomish Prismatic Lense", "" };
		{ 4, "s968052", "967206", "=q3=Focused Hipfire Scope", "" };
		{ 5, "s968055", "967209", "=q3=Focused Precision Scope", "" };
		{ 6, "s968058", "967212", "=q3=Focused Reflex Scope", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968044", "967198", "=q4=Polished Gnomish Magnifying Lense", "" };
		{ 2, "s968047", "967201", "=q4=Polished Gnomish Focusing Lense", "" };
		{ 3, "s968050", "967204", "=q4=Polished Gnomish Prismatic Lense", "" };
		{ 4, "s968053", "967207", "=q4=Polished Hipfire Scope", "" };
		{ 5, "s968056", "967210", "=q4=Polished Precision Scope", "" };
		{ 6, "s968059", "967213", "=q4=Polished Reflex Scope", "" };
	};
};

AtlasLoot_Data["EnchantingHighRiskCLASSIC"] = {
	Name = ENCHANTING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968677", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Unstoppable Assault", "" };
		{ 2, "s968680", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Lucid Assault", "" };
		{ 3, "s968683", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Spellbinder's Rage", "" };
		{ 4, "s968686", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Ninja's Focus", "" };
		{ 5, "s968689", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Grovewarden's Blessing", "" };
		{ 6, "s968692", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Viscious Assault", "" };
		{ 7, "s968695", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Dexterity", "" };
		{ 8, "s968698", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Artillery", "" };
		{ 9, "s968701", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Arcane Precision", "" };
		{ 10, "s968770", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Crusader II", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968678", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Unstoppable Assault", "" };
		{ 2, "s968681", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Lucid Assualt", "" };
		{ 3, "s968684", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Spellbinder's Rage", "" };
		{ 4, "s968687", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Ninja's Focus", "" };
		{ 5, "s968690", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Grovewarden's Blessing", "" };
		{ 6, "s968693", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Viscious Assault", "" };
		{ 7, "s968696", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Dexterity", "" };
		{ 8, "s968699", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Artillery", "" };
		{ 9, "s968702", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Greater Arcane Precision", "" };
		{ 10, "s968771", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Crusader III", "" };
	};
};

AtlasLoot_Data["TailoringHighRiskCLASSIC"] = {
	Name = TAILORING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968061", "967215", "=q3=Heavy Dragonweave Cloak Lining", "" };
		{ 2, "s968064", "967218", "=q3=Heavy Twilight Cloak Lining", "" };
		{ 3, "s968067", "967221", "=q3=Heavy Scarlet Cloak Lining", "" };
		{ 4, "s968070", "967224", "=q3=Heavy Rampager's Cloak Lining", "" };
		{ 5, "s968073", "967227", "=q3=Heavy Deadwind Cloak Lining", "" };
		{ 6, "s968076", "967230", "=q3=Heavy Slippery Cloak Lining", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968062", "967216", "=q4=Illustrious Dragonweave Cloak Lining", "" };
		{ 2, "s968065", "967219", "=q4=Illustrious Twilight Cloak Lining", "" };
		{ 3, "s968068", "967222", "=q4=Illustrious Scarlet Cloak Lining", "" };
		{ 4, "s968071", "967225", "=q4=Illustrious Rampager's Cloak Lining", "" };
		{ 5, "s968074", "967228", "=q4=Illustrious Deadwind Cloak Lining", "" };
		{ 6, "s968077", "967231", "=q4=Illustrious Slippery Cloak Lining", "" };
	};
};

AtlasLoot_Data["CookingHighRiskCLASSIC"] = {
	Name = COOKING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s968280", "967510", "=q3=Animated Soup for the Soul", "" };
		{ 2, "s968283", "967513", "=q3=Volcanic Sandwich", "" };
		{ 3, "s968286", "967516", "=q3=Winter Wontons", "" };
		{ 4, "s968289", "967519", "=q3=Storm Steak", "" };
		{ 5, "s968292", "967522", "=q3=Void Touched Stew", "" };
		{ 6, "s968295", "967525", "=q3=Spicy Vulture Steak", "" };
		{ 7, "s968298", "967528", "=q3=Wizard Wontons", "" };
		{ 8, "s968301", "967531", "=q3=Jurassic Burger", "" };
		{ 9, "s968304", "967534", "=q3=Rough-alo wings", "" };
		{ 10, "s968307", "967537", "=q3=The Whooper Sandwich", "" };
		{ 11, "s968310", "967540", "=q3=Vulture a la King", "" };
		{ 12, "s968313", "967543", "=q3=Scorching Hot Steak", "" };
		{ 13, "s968316", "967546", "=q3=Lively Stew", "" };
		{ 14, "s968319", "967549", "=q3=Crawling Steak", "" };
		{ 15, "s968322", "967552", "=q3=Breakonator Sandwich", "" };
		{ 16, "s968325", "967555", "=q3=Master Wontons", "" };
		{ 17, "s968328", "967558", "=q3=Big Whack Sandwich", "" };
		{ 18, "s968331", "967561", "=q3=Warping Wontons", "" };
		{ 19, "s968334", "967564", "=q3=Duck Stew", "" };
		{ 20, "s968337", "967567", "=q3=Mountainman Stew", "" };
		{ 21, "s968340", "967570", "=q3=Scorched Stew", "" };
		{ 22, "s968343", "967573", "=q3=Vulcan Wontons", "" };
		{ 23, "s968346", "967576", "=q3=Jurassic Soup", "" };
		{ 24, "s968349", "967579", "=q3=Heightened Wontons", "" };
		{ 25, "s968352", "967582", "=q3=Hearty Spirit Soup", "" };
		{ 26, "s968355", "967585", "=q3=Jurassic Steak", "" };
		{ 27, "s968358", "967588", "=q3=Stormwich Sandwich", "" };
		{ 28, "s968361", "967591", "=q3=Warding Wontons", "" };
		{ 29, "s968364", "967594", "=q3=Rolling Meatballs", "" };
		{ 30, "s968367", "967597", "=q3=Subtle Steak", "" };
	};
	{
		Name = "Rare";
		{ 1, "s968370", "967600", "=q3=Subtle Sandwich", "" };
		{ 2, "s968373", "967603", "=q3=Subtle Wontons", "" };
		{ 3, "s968376", "967606", "=q3=Subtle Sulferous Soup", "" };
		{ 4, "s968379", "967609", "=q3=Strongman Stew", "" };
		{ 5, "s968382", "967612", "=q3=Mysterious Void Roast", "" };
		{ 6, "s968385", "967615", "=q3=Fire Charred Roast", "" };
		{ 7, "s968388", "967618", "=q3=Storm Fried Roast", "" };
		{ 8, "s968391", "967621", "=q3=Winter Roast", "" };
		{ 9, "s968394", "967624", "=q3=Blackened Roast", "" };
		{ 10, "s968397", "967627", "=q3=Dino Delight", "" };
		{ 11, "s968400", "967630", "=q3=Slick-fil-A Sandwich", "" };
		{ 13, "s968647", "967704", "=q3=Alluring Bait", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968281", "967511", "=q4=Animated Soup for the Soul", "" };
		{ 2, "s968284", "967514", "=q4=Volcanic Sandwich", "" };
		{ 3, "s968287", "967517", "=q4=Winter Wontons", "" };
		{ 4, "s968290", "967520", "=q4=Storm Steak", "" };
		{ 5, "s968293", "967523", "=q4=Void Touched Stew", "" };
		{ 6, "s968296", "967526", "=q4=Spicy Vulture Steak", "" };
		{ 7, "s968299", "967529", "=q4=Wizard Wontons", "" };
		{ 8, "s968302", "967532", "=q4=Jurassic Burger", "" };
		{ 9, "s968305", "967535", "=q4=Rough-alo wings", "" };
		{ 10, "s968308", "967538", "=q4=The Whooper Sandwich", "" };
		{ 11, "s968311", "967541", "=q4=Vulture a la King", "" };
		{ 12, "s968314", "967542", "=q4=Scorching Hot Steak", "" };
		{ 13, "s968317", "967547", "=q4=Lively Stew", "" };
		{ 14, "s968320", "967550", "=q4=Crawling Steak", "" };
		{ 15, "s968323", "967553", "=q4=Breakonator Sandwich", "" };
		{ 16, "s968326", "967556", "=q4=Master Wontons", "" };
		{ 17, "s968329", "967559", "=q4=Big Whack Sandwich", "" };
		{ 18, "s968332", "967562", "=q4=Warping Wontons", "" };
		{ 19, "s968335", "967565", "=q4=Duck Stew", "" };
		{ 20, "s968338", "967568", "=q4=Mountainman Stew", "" };
		{ 21, "s968341", "967571", "=q4=Scorched Stew", "" };
		{ 22, "s968344", "967574", "=q4=Vulcan Wontons", "" };
		{ 23, "s968347", "967577", "=q4=Jurassic Soup", "" };
		{ 24, "s968350", "967580", "=q4=Heightened Wontons", "" };
		{ 25, "s968353", "967583", "=q4=Hearty Spirit Soup", "" };
		{ 26, "s968356", "967586", "=q4=Jurassic Steak", "" };
		{ 27, "s968359", "967589", "=q4=Stormwich Sandwich", "" };
		{ 28, "s968362", "967592", "=q4=Warding Wontons", "" };
		{ 29, "s968365", "967595", "=q4=Rolling Meatballs", "" };
		{ 30, "s968368", "967598", "=q4=Subtle Steak", "" };
	};
	{
		Name = "Epic";
		{ 1, "s968371", "967601", "=q4=Subtle Sandwich", "" };
		{ 2, "s968374", "967604", "=q4=Subtle Wontons", "" };
		{ 3, "s968377", "967607", "=q4=Subtle Sulferous Soup", "" };
		{ 4, "s968380", "967610", "=q4=Strongman Stew", "" };
		{ 5, "s968383", "967613", "=q4=Mysterious Void Roast", "" };
		{ 6, "s968386", "967616", "=q4=Fire Charred Roast", "" };
		{ 7, "s968389", "967619", "=q4=Storm Fried Roast", "" };
		{ 8, "s968392", "967622", "=q4=Winter Roast", "" };
		{ 9, "s968395", "967625", "=q4=Blackened Roast", "" };
		{ 10, "s968398", "967628", "=q4=Dino Delight", "" };
		{ 11, "s968401", "967631", "=q4=Slick-fil-A Sandwich", "" };
		{ 13, "s968648", "967705", "=q4=Irresistible Bait", "" };
	};
};
