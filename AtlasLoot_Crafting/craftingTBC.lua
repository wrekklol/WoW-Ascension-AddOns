local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")
local WHITE = "|cffFFFFFF";

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
	Type = "CraftingNoBF";
	{
		Name = AL["Battle Elixirs"];
		{ 1, "s28558", "22835", "=q1=Elixir of Major Shadow Power", };
		{ 2, "s28556", "22833", "=q1=Elixir of Major Firepower", };
		{ 3, "s38960", "31679", "=q1=Fel Strength Elixir",  };
		{ 4, "s28553", "22831", "=q1=Elixir of Major Agility", };
		{ 5, "s28549", "22827", "=q1=Elixir of Major Frost Power",  };
		{ 6, "s33741", "28104", "=q1=Elixir of Mastery",  };
		{ 7, "s28545", "22825", "=q1=Elixir of Healing Power",  };
		{ 8, "s28544", "22824", "=q1=Elixir of Major Strength",  };
		{ 9, "s33740", "28103", "=q1=Adept's Elixir",  };
		{ 10, "s33738", "28102", "=q1=Onslaught Elixir",  };
	};
	{
		Name = AL["Guardian Elixirs"];
		{ 1, "s28578", "22848", "=q1=Elixir of Empowerment",  };
		{ 2, "s28570", "22840", "=q1=Elixir of Major Mageblood",  };
		{ 3, "s28557", "22834", "=q1=Elixir of Major Defense",  };
		{ 4, "s39639", "32068", "=q1=Elixir of Ironskin",  };
		{ 5, "s39637", "32063", "=q1=Earthen Elixir", };
		{ 6, "s39638", "32067", "=q1=Elixir of Draenic Wisdom",  };
		{ 7, "s39636", "32062", "=q1=Elixir of Major Fortitude",  };
	};
	{
		Name = AL["Potions"];
		{ 1, "s28586", "22850", "=q1=Super Rejuvenation Potion",  };
		{ 2, "s38961", "31677", "=q1=Fel Mana Potion",  };
		{ 3, "s28579", "22849", "=q1=Ironshield Potion", };
		{ 4, "s28575", "22845", "=q1=Major Arcane Protection Potion",  };
		{ 5, "s28571", "22841", "=q1=Major Fire Protection Potion",  };
		{ 6, "s28572", "22842", "=q1=Major Frost Protection Potion", };
		{ 7, "s28577", "22847", "=q1=Major Holy Protection Potion",  };
		{ 8, "s28573", "22844", "=q1=Major Nature Protection Potion", };
		{ 9, "s28576", "22846", "=q1=Major Shadow Protection Potion",  };
		{ 10, "s28565", "22839", "=q1=Destruction Potion",  };
		{ 11, "s28564", "22838", "=q1=Haste Potion",  };
		{ 12, "s28563", "22837", "=q1=Heroic Potion",  };
		{ 13, "s28562", "22836", "=q1=Major Dreamless Sleep Potion",  };
		{ 14, "s38962", "31676", "=q1=Fel Regeneration Potion",  };
		{ 15, "s28555", "22832", "=q1=Super Mana Potion",  };
		{ 16, "s28554", "22871", "=q1=Shrouding Potion",  };
		{ 17, "s45061", "34440", "=q1=Mad Alchemist's Potion",  };
		{ 18, "s28551", "22829", "=q1=Super Healing Potion",  };
		{ 19, "s28550", "22828", "=q1=Insane Strength Potion",  };
		{ 20, "s28546", "22826", "=q1=Sneaking Potion",  };
		{ 21, "s33733", "28101", "=q1=Unstable Mana Potion",  };
		{ 22, "s33732", "28100", "=q1=Volatile Healing Potion",  };
	};
	{
		Name = AL["Flasks"];
		{ 1, "s42736", "33208", "=q1=Flask of Chromatic Wonder", };
		{ 2, "s28590", "22861", "=q1=Flask of Blinding Light",  };
		{ 3, "s28587", "22851", "=q1=Flask of Fortification",  };
		{ 4, "s28588", "22853", "=q1=Flask of Mighty Restoration",  };
		{ 5, "s28591", "22866", "=q1=Flask of Pure Death",  };
		{ 6, "s28589", "22854", "=q1=Flask of Relentless Assault",  };
	};
	{
		Name = AL["Transmutes"];
		{ 1, "s29688", "23571", "=q3=Transmute: Primal Might",  };
		{ 2, "s32765", "25867", "=q3=Transmute: Earthstorm Diamond", };
		{ 3, "s32766", "25868", "=q3=Transmute: Skyfire Diamond", };
		{ 4, "s28585", "21886", "=q2=Transmute: Primal Earth to Life",  };
		{ 5, "s28583", "22457", "=q2=Transmute: Primal Fire to Mana",  };
		{ 6, "s28584", "22452", "=q2=Transmute: Primal Life to Earth",  };
		{ 7, "s28582", "21884", "=q2=Transmute: Primal Mana to Fire",  };
		{ 8, "s28580", "21885", "=q2=Transmute: Primal Shadow to Water",  };
		{ 9, "s28581", "22456", "=q2=Transmute: Primal Water to Shadow",  };
		{ 10, "s28566", "21884", "=q2=Transmute: Primal Air to Fire", };
		{ 11, "s28567", "21885", "=q2=Transmute: Primal Earth to Water", };
		{ 12, "s28568", "22452", "=q2=Transmute: Primal Fire to Earth", };
		{ 13, "s28569", "22451", "=q2=Transmute: Primal Water to Air", };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s24266", "19931", "=q3=Gurubashi Mojo Madness",  };
		{ 2, "s11460", "9154", "=q1=Elixir of Detect Undead",  };
		{ 3, "s22808", "18294", "=q1=Elixir of Greater Water Breathing",  };
		{ 4, "s11456", "9061", "=q1=Goblin Rocket Fuel",  };
		{ 5, "s11451", "8956", "=q1=Oil of Immolation",  };
		{ 6, "s12609", "10592", "=q1=Catseye Elixir",  };
		{ 7, "s3454", "3829", "=q1=Frost Oil",  };
		{ 8, "s11459", "9149", "=q1=Philosopher's Stone",  };
		{ 9, "s3453", "3828", "=q1=Elixir of Detect Lesser Invisibility",  };
		{ 10, "s3449", "3824", "=q1=Shadow Oil",  };
		{ 11, "s7837", "6371", "=q1=Fire Oil",  };
		{ 12, "s7179", "5996", "=q1=Elixir of Water Breathing",  };
		{ 13, "s7836", "6370", "=q1=Blackmouth Oil",  };
	};
};



---------------------
--- Blacksmithing ---
---------------------

AtlasLoot_Data["SmithingTBC"] = {
	Name = BLACKSMITHING;
	Type = "Crafting";
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Chest";
		{ 1, "s34534", "28484", "=q4=Bulwark of Kings",  };
		{ 2, "s36257", "28485", "=q4=Bulwark of the Ancient Kings",  };
		{ 3, "s36256", "23565", "=q4=Embrace of the Twisting Nether",  };
		{ 4, "s38477", "31369", "=q4=Iceguard Breastplate",  };
		{ 5, "s34530", "23564", "=q4=Twisting Nether Chain Shirt",  };
		{ 6, "s38473", "31364", "=q4=Wildguard Breastplate",  };
		{ 7, "s46144", "34377", "=q4=Hard Khorium Battleplate",  };
		{ 8, "s46142", "34379", "=q4=Sunblessed Breastplate",  };
		{ 9, "s29649", "23527", "=q3=Earthpeace Breastplate",  };
		{ 10, "s29645", "23522", "=q3=Ragesteel Breastplate",  };
		{ 11, "s29617", "23513", "=q3=Flamebane Breastplate",  };
		{ 12, "s29610", "23509", "=q3=Enchanted Adamantite Breastplate",  };
		{ 13, "s34533", "28483", "=q4=Breastplate of Kings",  };
		{ 14, "s34529", "23563", "=q4=Nether Chain Shirt",  };
		{ 15, "s29606", "23507", "=q3=Adamantite Breastplate",  };
		{ 16, "s36129", "30074", "=q3=Heavy Earthforged Breastplate",  };
		{ 17, "s36130", "30076", "=q3=Stormforged Hauberk",  };
		{ 18, "s29550", "23489", "=q2=Fel Iron Breastplate",  };
		{ 19, "s29556", "23490", "=q2=Fel Iron Chain Tunic",  };
	};
	{ Name = BabbleInventory["Armor"] .. WHITE .. " - Feet";
		{ 1, "s36391", "30033", "=q4=Boots of the Protector",  };
		{ 2, "s36392", "30031", "=q4=Red Havoc Boots",  };
		{ 3, "s40033", "32402", "=q4=Shadesteel Sabots",  };
		{ 4, "s29630", "23525", "=q3=Khorium Boots",  };
		{ 5, "s29611", "23511", "=q3=Enchanted Adamantite Boots",  };
		{ 6, "s29548", "23487", "=q2=Fel Iron Plate Boots",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Hands";
		{ 1, "s29648", "23526", "=q3=Swiftsteel Gloves",  };
		{ 2, "s29658", "23531", "=q4=Felfury Gauntlets",  };
		{ 3, "s29622", "23532", "=q4=Gauntlets of the Iron Tower",  };
		{ 4, "s29662", "23533", "=q4=Steelgrip Gauntlets",  };
		{ 5, "s46140", "34380", "=q4=Sunblessed Gauntlets",  };
		{ 6, "s46141", "34378", "=q4=Hard Khorium Battlefists",  };
		{ 7, "s29642", "23520", "=q3=Ragesteel Gloves",  };
		{ 8, "s29619", "23517", "=q3=Felsteel Gloves",  };
		{ 9, "s29616", "23514", "=q3=Flamebane Gloves",  };
		{ 10, "s29605", "23508", "=q3=Adamantite Plate Gloves",  };
		{ 11, "s29552", "23491", "=q2=Fel Iron Chain Gloves",  };
		{ 12, "s29545", "23482", "=q2=Fel Iron Plate Gloves",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Head";
		{ 1, "s38479", "31371", "=q4=Iceguard Helm",  };
		{ 2, "s38476", "31368", "=q4=Wildguard Helm",  };
		{ 3, "s29664", "23535", "=q4=Helm of the Stalwart Defender",  };
		{ 4, "s29668", "23536", "=q4=Oathkeeper's Helm",  };
		{ 5, "s29663", "23534", "=q4=Storm Helm",  };
		{ 6, "s29621", "23519", "=q3=Felsteel Helm",  };
		{ 7, "s29643", "23521", "=q3=Ragesteel Helm",  };
		{ 8, "s29615", "23516", "=q3=Flamebane Helm",  };
		{ 9, "s29551", "23493", "=q2=Fel Iron Chain Coif",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Legs";
		{ 1, "s38478", "31370", "=q4=Iceguard Leggings",  };
		{ 2, "s40035", "32404", "=q4=Shadesteel Greaves",  };
		{ 3, "s38475", "31367", "=q4=Wildguard Leggings",  };
		{ 4, "s29613", "23512", "=q3=Enchanted Adamantite Leggings",  };
		{ 5, "s29620", "23518", "=q3=Felsteel Leggings",  };
		{ 6, "s29629", "23523", "=q3=Khorium Pants",  };
		{ 7, "s29549", "23488", "=q2=Fel Iron Plate Pants",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s41135", "32573", "=q4=Dawnsteel Shoulders",  };
		{ 2, "s42662", "33173", "=q3=Ragesteel Shoulders",  };
		{ 3, "s41133", "32570", "=q4=Swiftsteel Shoulders",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Waist";
		{ 1, "s36389", "30034", "=q4=Belt of the Guardian",  };
		{ 2, "s36390", "30032", "=q4=Red Belt of Battle",  };
		{ 3, "s40036", "32401", "=q4=Shadesteel Girdle",  };
		{ 4, "s29628", "23524", "=q3=Khorium Belt",  };
		{ 5, "s29608", "23510", "=q3=Enchanted Adamantite Belt",  };
		{ 6, "s29547", "23484", "=q2=Fel Iron Plate Belt",  };
	};
	{
		Name = BabbleInventory["Armor"] .. WHITE .. " - Wrist";
		{ 1, "s41134", "32571", "=q4=Dawnsteel Bracers",  };
		{ 2, "s40034", "32403", "=q4=Shadesteel Bracers",  };
		{ 3, "s41132", "32568", "=q4=Swiftsteel Bracers",  };
		{ 4, "s29669", "23537", "=q4=Black Felsteel Bracers",  };
		{ 5, "s29672", "23539", "=q4=Blessed Bracers",  };
		{ 6, "s29671", "23538", "=q4=Bracers of the Green Fortress",  };
		{ 7, "s29614", "23515", "=q3=Flamebane Bracers",  };
		{ 8, "s29603", "23506", "=q3=Adamantite Plate Bracers",  };
		{ 9, "s29553", "23494", "=q2=Fel Iron Chain Bracers",  };
	};
	{
		Name = "Weapon " .. WHITE .." - OneHanded";
		{ 1, "s34542", "28432", "=q4=Black Planar Edge",  };
		{ 2, "s36258", "28427", "=q4=Blazefury",  };
		{ 3, "s34537", "28426", "=q4=Blazeguard",  };
		{ 4, "s34546", "28438", "=q4=Dragonmaw",  };
		{ 5, "s36262", "28439", "=q4=Dragonstrike",  };
		{ 6, "s36260", "28433", "=q4=Wicked Edge of the Planes",  };
		{ 7, "s29699", "23555", "=q4=Dirge",  };
		{ 8, "s29698", "23554", "=q4=Eternium Runed Blade",  };
		{ 9, "s29694", "23542", "=q4=Fel Edged Battleaxe",  };
		{ 10, "s29692", "23540", "=q4=Felsteel Longblade",  };
		{ 11, "s29700", "23556", "=q4=Hand of Eternity",  };
		{ 12, "s29696", "23544", "=q4=Runic Hammer",  };
		{ 13, "s34545", "28437", "=q4=Drakefist Hammer",  };
		{ 14, "s34535", "28425", "=q4=Fireguard",  };
		{ 15, "s34541", "28431", "=q4=The Planar Edge",  };
		{ 16, "s34983", "29204", "=q3=Felsteel Whisper Knives",  };
		{ 17, "s36136", "30089", "=q3=Lavaforged Warhammer",  };
		{ 18, "s36134", "30087", "=q3=Stormforged Axe",  };
		{ 19, "s36131", "30077", "=q3=Windforged Rapier",  };
		{ 20, "s29571", "23505", "=q2=Adamantite Rapier",  };
		{ 21, "s29569", "23504", "=q2=Adamantite Dagger",  };
		{ 22, "s29558", "23498", "=q2=Fel Iron Hammer",  };
		{ 23, "s29557", "23497", "=q2=Fel Iron Hatchet",  };
	};
	{
		Name = "Weapon " .. WHITE .." - TwoHanded";
		{ 1, "s36261", "28436", "=q4=Bloodmoon",  };
		{ 2, "s34548", "28441", "=q4=Deep Thunder",  };
		{ 3, "s34540", "28429", "=q4=Lionheart Champion",  };
		{ 4, "s36259", "28430", "=q4=Lionheart Executioner",  };
		{ 5, "s34544", "28435", "=q4=Mooncleaver",  };
		{ 6, "s36263", "28442", "=q4=Stormherald",  };
		{ 7, "s29697", "23546", "=q4=Fel Hardened Maul",  };
		{ 8, "s29695", "23543", "=q4=Felsteel Reaper",  };
		{ 9, "s43846", "32854", "=q4=Hammer of Righteous Might",  };
		{ 10, "s29693", "23541", "=q4=Khorium Champion",  };
		{ 11, "s34538", "28428", "=q4=Lionheart Blade",  };
		{ 12, "s34543", "28434", "=q4=Lunar Crescent",  };
		{ 13, "s34547", "28440", "=q4=Thunder",  };
		{ 14, "s36137", "30093", "=q3=Great Earthforged Hammer",  };
		{ 15, "s36135", "30088", "=q3=Skyforged Great Axe",  };
		{ 16, "s36133", "30086", "=q3=Stoneforged Claymore",  };
		{ 17, "s29568", "23503", "=q2=Adamantite Cleaver",  };
		{ 18, "s29566", "23502", "=q2=Adamantite Maul",  };
		{ 19, "s29565", "23499", "=q2=Fel Iron Greatsword",  };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s29657", "23530", "=q2=Felsteel Shield Spike",  };
		{ 2, "s29656", "23529", "=q2=Adamantite Sharpening Stone",  };
		{ 3, "s34608", "28421", "=q2=Adamantite Weightstone",  };
		{ 4, "s42688", "33185", "=q2=Adamantite Weapon Chain",  };
		{ 5, "s22757", "18262", "=q2=Elemental Sharpening Stone",  };
		{ 6, "s16651", "12645", "=q2=Thorium Shield Spike",  };
		{ 7, "s9964", "7969", "=q2=Mithril Spurs",  };
		{ 8, "s9939", "7967", "=q2=Mithril Shield Spike",  };
		{ 9, "s29729", "23576", "=q1=Greater Ward of Shielding",  };
		{ 10, "s32285", "25521", "=q1=Greater Rune of Warding",  };
		{ 11, "s29728", "23575", "=q1=Lesser Ward of Shielding",  };
		{ 12, "s32284", "23559", "=q1=Lesser Rune of Warding",  };
		{ 13, "s29654", "23528", "=q1=Fel Sharpening Stone",  };
		{ 14, "s34607", "28420", "=q1=Fel Weightstone",  };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s59406", "43853", "=q2=Titanium Skeleton Key",  };
		{ 2, "s59405", "43854", "=q2=Cobalt Skeleton Key",  };
		{ 3, "s19669", "15872", "=q2=Arcanite Skeleton Key",  };
		{ 4, "s19668", "15871", "=q2=Truesilver Skeleton Key",  };
		{ 5, "s19667", "15870", "=q2=Golden Skeleton Key",  };
		{ 6, "s19666", "15869", "=q2=Silver Skeleton Key",  };
		{ 7, "s55732", "41745", "=q1=Titanium Rod",  };
		{ 8, "s32657", "25845", "=q1=Eternium Rod",  };
		{ 9, "s32656", "25844", "=q1=Adamantite Rod",  };
		{ 10, "s32655", "25843", "=q1=Fel Iron Rod",  };
		{ 11, "s20201", "16206", "=q1=Arcanite Rod",  };
		{ 12, "s16639", "12644", "=q1=Dense Grinding Stone",  };
		{ 13, "s11454", "9060", "=q1=Inlaid Mithril Cylinder",  };
		{ 14, "s14380", "11144", "=q1=Truesilver Rod",  };
		{ 15, "s9920", "7966", "=q1=Solid Grinding Stone",  };
		{ 16, "s14379", "11128", "=q1=Golden Rod",  };
		{ 17, "s8768", "7071", "=q1=Iron Buckle",  };
		{ 18, "s3337", "3486", "=q1=Heavy Grinding Stone",  };
		{ 19, "s7818", "6338", "=q1=Silver Rod",  };
		{ 20, "s3326", "3478", "=q1=Coarse Grinding Stone",  };
		{ 21, "s3320", "3470", "=q1=Rough Grinding Stone",  };
	};
	{
		Name = ARMORSMITH;
		{ 8, "s36129", "30074", "=q3=Heavy Earthforged Breastplate",  };
		{ 7, "s36130", "30076", "=q3=Stormforged Hauberk",  };
		{ 6, "s34533", "28483", "=q4=Breastplate of Kings",  };
		{ 5, "s34529", "23563", "=q4=Nether Chain Shirt",  };
		{ 4, "s34534", "28484", "=q4=Bulwark of Kings",  };
		{ 3, "s36257", "28485", "=q4=Bulwark of the Ancient Kings",  };
		{ 2, "s36256", "23565", "=q4=Embrace of the Twisting Nether",  };
		{ 1, "s34530", "23564", "=q4=Twisting Nether Chain Shirt",  };
	};
	{
		Name = WEAPONSMITH;
		{ 1, "s36125", "30071", "=q3=Light Earthforged Blade",  };
		{ 2, "s36128", "30073", "=q3=Light Emberforged Hammer",  };
		{ 3, "s36126", "30072", "=q3=Light Skyforged Axe",  };
	};
	{
		Name = AXESMITH;
		{ 8, "s36135", "30088", "=q3=Skyforged Great Axe",  };
		{ 7, "s36134", "30087", "=q3=Stormforged Axe",  };
		{ 6, "s34543", "28434", "=q4=Lunar Crescent",  };
		{ 5, "s34541", "28431", "=q4=The Planar Edge",  };
		{ 4, "s34542", "28432", "=q4=Black Planar Edge",  };
		{ 3, "s36261", "28436", "=q4=Bloodmoon",  };
		{ 2, "s34544", "28435", "=q4=Mooncleaver",  };
		{ 1, "s36260", "28433", "=q4=Wicked Edge of the Planes",  };
	};
	{
		Name = HAMMERSMITH;
		{ 8, "s36137", "30093", "=q3=Great Earthforged Hammer",  };
		{ 7, "s36136", "30089", "=q3=Lavaforged Warhammer",  };
		{ 6, "s34545", "28437", "=q4=Drakefist Hammer",  };
		{ 5, "s34547", "28440", "=q4=Thunder",  };
		{ 4, "s34548", "28441", "=q4=Deep Thunder",  };
		{ 3, "s34546", "28438", "=q4=Dragonmaw",  };
		{ 2, "s36262", "28439", "=q4=Dragonstrike",  };
		{ 1, "s36263", "28442", "=q4=Stormherald",  };
	};
	{
		Name = SWORDSMITH;
		{ 8, "s36133", "30086", "=q3=Stoneforged Claymore",  };
		{ 7, "s36131", "30077", "=q3=Windforged Rapier",  };
		{ 6, "s34535", "28425", "=q4=Fireguard",  };
		{ 5, "s34538", "28428", "=q4=Lionheart Blade",  };
		{ 4, "s36258", "28427", "=q4=Blazefury",  };
		{ 3, "s34537", "28426", "=q4=Blazeguard",  };
		{ 2, "s34540", "28429", "=q4=Lionheart Champion",  };
		{ 1, "s36259", "28430", "=q4=Lionheart Executioner",  };
	};
};

---------------
--- Cooking ---
---------------

AtlasLoot_Data["CookingTBC"] = {
	Name = COOKING;
	Type = "CraftingNoBF";
	{
		Name = "Page 1";
		{ 1, "s42302", "33052", "=q1=Fisherman's Feast",  };
		{ 2, "s45561", "34760", "=q1=Grilled Bonescale",  };
		{ 3, "s45563", "34762", "=q1=Grilled Sculpin",  };
		{ 4, "s58525", "43492", "=q1=Haunted Herring",  };
		{ 5, "s42305", "33053", "=q1=Hot Buttered Trout",  };
		{ 6, "s58521", "43488", "=q1=Last Week's Mammoth",  };
		{ 7, "s45549", "34748", "=q1=Mammoth Meal",  };
		{ 8, "s57421", "34747", "=q1=Northern Stew",  };
		{ 9, "s45566", "34765", "=q1=Pickled Fangtooth",  };
		{ 10, "s45565", "34764", "=q1=Poached Nettlefish",  };
		{ 11, "s45553", "34752", "=q1=Rhino Dogs",  };
		{ 12, "s45552", "34751", "=q1=Roasted Worg",  };
		{ 13, "s45562", "34761", "=q1=Sauteed Goby",  };
		{ 14, "s45550", "34749", "=q1=Shoveltusk Steak",  };
		{ 15, "s45560", "34759", "=q1=Smoked Rockfin",  };
		{ 16, "s45564", "34763", "=q1=Smoked Salmon",  };
		{ 17, "s33296", "27667", "=q1=Spicy Crawdad",  };
		{ 18, "s58512", "43490", "=q1=Tasty Cupcake",  };
		{ 19, "s45551", "34750", "=q1=Wyrm Delight",  };
		{ 20, "s38868", "31673", "=q1=Crunchy Serpent",  };
		{ 21, "s38867", "31672", "=q1=Mok'Nathal Shortribs",  };
		{ 22, "s33295", "27666", "=q1=Golden Fish Sticks",  };
		{ 23, "s45022", "34411", "=q1=Hot Apple Cider",  };
		{ 24, "s33287", "27658", "=q1=Roasted Clefthoof",  };
		{ 25, "s43707", "33825", "=q1=Skullfish Soup",  };
		{ 26, "s43765", "33872", "=q1=Spicy Hot Talbuk",  };
		{ 27, "s33289", "27660", "=q1=Talbuk Steak",  };
		{ 28, "s33288", "27659", "=q1=Warp Burger",  };
		{ 29, "s33293", "27664", "=q1=Grilled Mudfish",  };
		{ 30, "s33294", "27665", "=q1=Poached Bluefish",  };

	};
	{
		Name = "Page 2";
		{ 1, "s42296", "33048", "=q1=Stewed Trout",  };
		{ 2, "s33286", "27657", "=q1=Blackened Basilisk",  };
		{ 3, "s33292", "27663", "=q1=Blackened Sporefish",  };
		{ 4, "s33285", "27656", "=q1=Sporeling Snack",  };
		{ 5, "s33290", "27661", "=q1=Blackened Trout",  };
		{ 6, "s43761", "33867", "=q1=Broiled Bloodfin",  };
		{ 7, "s33279", "27651", "=q1=Buzzard Bites",  };
		{ 8, "s36210", "30155", "=q1=Clam Bar",  };
		{ 9, "s25659", "21023", "=q1=Dirge's Kickin' Chimaerok Chops",  };
		{ 10, "s966455", "100626", "=q1=Azerothian Schmorgus Boards",  };
		{ 11, "s966436", "100609", "=q1=Chilled Lava Eels",  };
		{ 12, "s966435", "100608", "=q1=Chillwind Flank Steaks",  };
		{ 13, "s966434", "100607", "=q1=Hippogryph Steaks",  };
		{ 14, "s966433", "100606", "=q1=Steamed Makrinni Claws",  };
		{ 15, "s966432", "100605", "=q1=Rubbed Ravasaur Ribss",  };
		{ 16, "s966431", "100604", "=q1=Hearty Stegodon Stews",  };
		{ 17, "s966430", "100603", "=q1=Crispy Pterrordax Wings",  };
		{ 18, "s966429", "100602", "=q1=Spicy Dino Jerkys",  };
		{ 19, "s966428", "100601", "=q1=Dirge's Nevermelt Ice Creams",  };
		{ 20, "s966427", "100599", "=q1=Silithid Snacks",  };
		{ 21, "s966426", "100598", "=q1=Hydra Scale Soups",  };
		{ 22, "s966425", "100597", "=q1=Ghostly Goulashs",  };
		{ 23, "s966398", "100583", "=q1=Seared Cunning Carps",  };
		{ 24, "s43772", "33874", "=q1=Kibler's Bits",  };
		{ 25, "s33284", "27655", "=q1=Ravager Dog",  };
		{ 26, "s43758", "33866", "=q1=Stormchops",  };
	};
};

------------------
--- Enchanting ---
------------------

AtlasLoot_Data["EnchantingTBC"] = {
	Name = ENCHANTING;
	Type = "CraftingNoBF";
	{
		Name = AL["Enchant Boots"];
		{ 1, "s27954", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Surefooted",  };
		{ 2, "s34008", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Boar's Speed",  };
		{ 3, "s34007", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Cat's Swiftness",  };
		{ 4, "s27951", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Dexterity",  };
		{ 5, "s27950", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Fortitude",  };
		{ 6, "s27948", "Spell_Holy_GreaterHeal", "=ds=Enchant Boots - Vitality",  };
	};
	{
		Name = AL["Enchant Bracer"];
		{ 1, "s27917", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Spellpower",  };
		{ 2, "s27914", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Fortitude",  };
		{ 3, "s27913", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Restore Mana Prime",  };
		{ 4, "s27911", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Superior Healing",  };
		{ 5, "s27906", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Defense",  };
		{ 6, "s27905", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Stats",  };
		{ 7, "s27899", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Brawn",  };
		{ 8, "s34001", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Major Intellect",  };
		{ 9, "s34002", "Spell_Holy_GreaterHeal", "=ds=Enchant Bracers - Assault",  };
	};
	{
		Name = AL["Enchant Chest"];
		{ 1, "s46594", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Defense",  };
		{ 2, "s27960", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Stats",  };
		{ 3, "s33992", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Resilience",  };
		{ 4, "s33990", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Major Spirit",  };
		{ 5, "s27957", "Spell_Holy_GreaterHeal", "=ds=Enchant Chest - Exceptional Health",  };
	};
	{
		Name = AL["Enchant Cloak"];
		{ 1, "s47051", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Steelweave",  };
		{ 2, "s351501", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Crushing Wave",  };
		{ 3, "s351530", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Phoenix Fire",  };
		{ 4, "s34005", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Arcane Resistance",  };
		{ 5, "s34006", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Shadow Resistance",  };
		{ 6, "s27962", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Major Resistance",  };
		{ 7, "s34003", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Spell Penetration",  };
		{ 8, "s34004", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Agility",  };
		{ 9, "s27961", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Major Armor",  };
		{ 10, "s25082", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Greater Nature Resistance",  };
		{ 11, "s25083", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Stealth",  };
		{ 12, "s25084", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Subtlety",  };
		{ 13, "s25086", "Spell_Holy_GreaterHeal", "=ds=Enchant Cloak - Dodge",  };
	};
	{
		Name = AL["Enchant Gloves"];
		{ 1, "s33997", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Spellpower",  };
		{ 2, "s33994", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Spell Strike",  };
		{ 3, "s33999", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Healing",  };
		{ 4, "s33995", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Major Strength",  };
		{ 5, "s33996", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Assault",  };
		{ 6, "s33993", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Blasting",  };
		{ 7, "s25080", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Superior Agility",  };
		{ 8, "s25072", "Spell_Holy_GreaterHeal", "=ds=Enchant Gloves - Threat",  };
	};
	{
		Name = AL["Enchant Ring"];
		{ 1, "s27927", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Stats",  };
		{ 2, "s27926", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Healing Power",  };
		{ 3, "s27924", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Spellpower",  };
		{ 4, "s27920", "Spell_Holy_GreaterHeal", "=ds=Enchant Ring - Striking",  };
	};
	{
		Name = AL["Enchant Shield"];
		{ 1, "s27947", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Resistance",  };
		{ 2, "s27946", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Shield Block",  };
		{ 3, "s44383", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Resilience",  };
		{ 4, "s27945", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Intellect",  };
		{ 5, "s34009", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Major Stamina",  };
		{ 6, "s27944", "Spell_Holy_GreaterHeal", "=ds=Enchant Shield - Tough Shield",  };
	};
	{
		Name = AL["Enchant 2H Weapon"];
		{ 1, "s27977", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Major Agility",  };
		{ 2, "s27971", "Spell_Holy_GreaterHeal", "=ds=Enchant 2H Weapon - Savagery",  };
	};
	{
		Name = AL["Enchant Weapon"];
		{ 1, "s351535", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Witchdoctor",  };
		{ 2, "s42974", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Executioner",  };
		{ 3, "s820034", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Undaunted Might",  };
		{ 4, "s359012", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Faith",  };
		{ 5, "s27984", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Mongoose",  };
		{ 6, "s27982", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Soulfrost",  };
		{ 7, "s27981", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Sunfire",  };
		{ 8, "s28004", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Battlemaster",  };
		{ 9, "s28003", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Spellsurge",  };
		{ 10, "s46578", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Deathfrost",  };
		{ 11, "s34010", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Healing",  };
		{ 12, "s27975", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Spellpower",  };
		{ 13, "s27972", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Potency",  };
		{ 14, "s42620", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Greater Agility",  };
		{ 15, "s27968", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Intellect",  };
		{ 16, "s27967", "Spell_Holy_GreaterHeal", "=ds=Enchant Weapon - Major Striking",  };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s32667", "22463", "=q3=Runed Eternium Rod",  };
		{ 2, "s45765", "22449", "=q3=Void Shatter",  };
		{ 3, "s42615", "22448", "=q3=Small Prismatic Shard",  };
		{ 4, "s28022", "22449", "=q3=Large Prismatic Shard",  };
		{ 5, "s28027", "22460", "=q3=Prismatic Sphere",  };
		{ 6, "s42613", "22448", "=q3=Nexus Transformation",  };
		{ 7, "s15596", "11811", "=q3=Smoking Heart of the Mountain",  };
		{ 8, "s32665", "22462", "=q2=Runed Adamantite Rod",  };
		{ 9, "s28019", "22522", "=q1=Superior Wizard Oil",  };
		{ 10, "s28016", "22521", "=q1=Superior Mana Oil",  };
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
		{ 1, "s43676", "20475", "=q1=Adamantite Arrow Maker",  };
		{ 2, "s30347", "34504", "=q1=Adamantite Shell Machine",  };
		{ 3, "s30346", "23772", "=q2=Fel Iron Shells",  };
	};
	{
		Name = BabbleInventory["Armor"];
		{ 1, "s46111", "34847", "=q4=Annihilator Holo-Gogs",  };
		{ 2, "s30565", "23838", "=q4=Foreman's Enchanted Helmet",  };
		{ 3, "s30566", "23839", "=q4=Foreman's Reinforced Helmet",  };
		{ 4, "s30575", "23829", "=q4=Gnomish Battle Goggles",  };
		{ 5, "s30574", "23828", "=q4=Gnomish Power Goggles",  };
		{ 6, "s46115", "34357", "=q4=Hard Khorium Goggles",  };
		{ 7, "s46109", "35182", "=q4=Hyper-Magnified Moon Specs",  };
		{ 8, "s46107", "35185", "=q4=Justicebringer 3000 Specs",  };
		{ 9, "s46112", "34355", "=q4=Lightning Etched Specs",  };
		{ 10, "s46114", "34354", "=q4=Mayhem Projection Goggles",  };
		{ 11, "s46108", "35181", "=q4=Powerheal 9000 Lens",  };
		{ 12, "s46110", "35184", "=q4=Primal-Attuned Goggles",  };
		{ 13, "s46116", "34353", "=q4=Quad Deathblow X44 Goggles",  };
		{ 14, "s46113", "34356", "=q4=Surestrike Goggles v3.0",  };
		{ 15, "s46106", "35183", "=q4=Wonderheal XT68 Shades",  };
		{ 16, "s41317", "32478", "=q4=Deathblow X11 Goggles",  };
		{ 17, "s41320", "32494", "=q4=Destruction Holo-gogs",  };
		{ 18, "s40274", "32461", "=q4=Furious Gizmatic Goggles",  };
		{ 19, "s41315", "32476", "=q4=Gadgetstorm Goggles",  };
		{ 20, "s41311", "32472", "=q4=Justicebringer 2000 Specs",  };
		{ 21, "s41316", "32475", "=q4=Living Replicator Specs",  };
		{ 22, "s41319", "32480", "=q4=Magnified Moon Specs",  };
		{ 23, "s41312",	"32473", "=q4=Tankatronic Goggles",}
	};
	{
		Name = BabbleInventory["Armor"];
		{ 1, "s30325", "23763", "=q3=Hyper-Vision Goggles",  };
		{ 2, "s30556", "23824", "=q3=Rocket Boots Xtreme",  };
		{ 3, "s46697", "35581", "=q3=Rocket Boots Xtreme Lite",  };
		{ 4, "s30563", "23836", "=q3=Goblin Rocket Launcher",  };
		{ 5, "s30570", "23825", "=q3=Nigh-Invulnerability Belt",  };
		{ 6, "s30318", "23762", "=q3=Ultra-Spectropic Detection Goggles",  };
		{ 7, "s30316", "23758", "=q3=Cogspinner Goggles",  };
		{ 8, "s30569", "23835", "=q3=Gnomish Poultryizer",  };
		{ 9, "s30317", "23761", "=q3=Power Amplification Goggles",  };
	};
	{
		Name = AL["Explosives"];
		{ 1, "s30547", "23819", "=q1=Elemental Seaforium Charge",  };
		{ 2, "s30560", "23827", "=q1=Super Sapper Charge",  };
		{ 3, "s30311", "23737", "=q1=Adamantite Grenade",  };
		{ 4, "s30558", "23826", "=q1=The Bigger One",  };
		{ 5, "s30310", "23736", "=q1=Fel Iron Bomb",  };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s30334", "23766", "=q3=Stabilized Eternium Scope",  };
		{ 2, "s30332", "23765", "=q3=Khorium Scope",  };
		{ 3, "s30329", "23764", "=q2=Adamantite Scope",  };
		{ 4, "s22793", "18283", "=q3=Biznicks 247x128 Accurascope",  };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s44157", "34061", "=q4=Turbo-Charged Flying Machine",  };
		{ 2, "s44155", "34060", "=q3=Flying Machine",  };
		{ 3, "s30348", "23774", "=q2=Fel Iron Toolbox",  };
		{ 4, "s30337", "23767", "=q2=Crashin' Thrashin' Robot",  };
		{ 5, "s44391", "34113", "=q1=Field Repair Bot 110G",  };
		{ 6, "s30552", "33093", "=q1=Mana Potion Injector",  };
		{ 7, "s30344", "23771", "=q1=Green Smoke Flare",  };
		{ 8, "s32814", "25886", "=q1=Purple Smoke Flare",  };
		{ 9, "s30341", "23768", "=q1=White Smoke Flare",  };
		{ 10, "s30551", "33092", "=q1=Healing Potion Injector",  };
		{ 11, "s30568", "23841", "=q1=Gnomish Flame Turret",  };
		{ 12, "s30548", "23821", "=q1=Zapthrottle Mote Extractor",  };
	};
	{
		Name = AL["Reagents"];
		{ 1, "s30309", "23787", "=q1=Felsteel Stabilizer",  };
		{ 2, "s30307", "23785", "=q1=Hardened Adamantite Tube",  };
		{ 3, "s30308", "23786", "=q1=Khorium Power Core",  };
		{ 4, "s39971", "32423", "=q1=Icy Blasting Primers",  };
		{ 5, "s30306", "23784", "=q1=Adamantite Frame",  };
		{ 6, "s30305", "23783", "=q1=Handful of Fel Iron Bolts",  };
		{ 7, "s30303", "23781", "=q1=Elemental Blasting Powder",  };
		{ 8, "s30304", "23782", "=q1=Fel Iron Casing",  };
	};
	{
		Name = BabbleInventory["Weapon"];
		{ 1, "s41307", "32756", "=q4=Gyro-balanced Khorium Destroyer",  };
		{ 2, "s30315", "23748", "=q3=Ornate Khorium Rifle",  };
		{ 3, "s30314", "23747", "=q3=Felsteel Boomstick",  };
		{ 4, "s30313", "23746", "=q2=Adamantite Rifle",  };
		{ 5, "s30312", "23742", "=q2=Fel Iron Musket",  };
	};
	{
		Name = GNOMISH;
		{ 1, "s30570", "23825", "=q3=Nigh-Invulnerability Belt",  };
		{ 2, "s30569", "23835", "=q3=Gnomish Poultryizer",  };
		{ 3, "s36955", "30544", "=q2=Ultrasafe Transporter - Toshley's Station",  };
	};
	{
		Name = GOBLIN;
		{ 1, "s30563", "23836", "=q3=Goblin Rocket Launcher",  };
		{ 2, "s36954", "30542", "=q2=Dimensional Ripper - Area 52",  };
	};
};

-----------------
--- First Aid ---
-----------------

AtlasLoot_Data["FirstAid"] = {
	Name = FIRSTAID;
	{
		Name = FIRSTAID;
		{ 1, "s45546", "34722", "=q1=Heavy Frostweave Bandage",  };
		{ 2, "s45545", "34721", "=q1=Frostweave Bandage",  };
		{ 3, "s27033", "21991", "=q1=Heavy Netherweave Bandage",  };
		{ 4, "s27032", "21990", "=q1=Netherweave Bandage",  };
		{ 5, "s23787", "19440", "=q1=Powerful Anti-Venom",  };
		{ 6, "s18630", "14530", "=q1=Heavy Runecloth Bandage",  };
		{ 7, "s18629", "14529", "=q1=Runecloth Bandage",  };
		{ 8, "s10841", "8545", "=q1=Heavy Mageweave Bandage",  };
		{ 9, "s10840", "8544", "=q1=Mageweave Bandage",  };
		{ 10, "s7929", "6451", "=q1=Heavy Silk Bandage",  };
		{ 11, "s7928", "6450", "=q1=Silk Bandage",  };
		{ 12, "s7935", "6453", "=q1=Strong Anti-Venom",  };
		{ 13, "s3278", "3531", "=q1=Heavy Wool Bandage",  };
		{ 14, "s3277", "3530", "=q1=Wool Bandage",  };
		{ 15, "s7934", "6452", "=q1=Anti-Venom",  };
		{ 16, "s3276", "2581", "=q1=Heavy Linen Bandage",  };
		{ 17, "s3275", "1251", "=q1=Linen Bandage",  };
	};
};

---------------------
--- Jewelcrafting ---
---------------------

AtlasLoot_Data["JewelcraftingTBC"] = {
	Name = JEWELCRAFTING;
	Type = "CraftingNoBF";
	{
		Name = AL["Red Gems"];
		{ 1, "s39705", "32193", "=q4=Bold Crimson Spinel",  };
		{ 2, "s39712", "32197", "=q4=Bright Crimson Spinel",  };
		{ 3, "s39706", "32194", "=q4=Delicate Crimson Spinel",  };
		{ 4, "s39714", "32199", "=q4=Flashing Crimson Spinel",  };
		{ 5, "s39711", "32196", "=q4=Runed Crimson Spinel",  };
		{ 6, "s39713", "32198", "=q4=Subtle Crimson Spinel",  };
		{ 7, "s39710", "32195", "=q4=Teardrop Crimson Spinel",  };
		{ 8, "s42589", "33131", "=q4=Crimson Sun",  };
		{ 9, "s42558", "33133", "=q4=Don Julio's Heart",  };
		{ 10, "s42588", "33134", "=q4=Kailee's Rose",  };
		{ 16, "s31084", "24027", "=q3=Bold Living Ruby",  };
		{ 17, "s31089", "24031", "=q3=Bright Living Ruby",  };
		{ 18, "s31085", "24028", "=q3=Delicate Living Ruby",  };
		{ 19, "s31091", "24036", "=q3=Flashing Living Ruby",  };
		{ 20, "s31088", "24030", "=q3=Runed Living Ruby",  };
		{ 21, "s31090", "24032", "=q3=Subtle Living Ruby",  };
		{ 22, "s31087", "24029", "=q3=Teardrop Living Ruby",  };
		{ 23, "s28907", "23097", "=q2=Delicate Blood Garnet",  };
		{ 24, "s28906", "23096", "=q2=Runed Blood Garnet",  };
		{ 25, "s28905", "23095", "=q2=Bold Blood Garnet",  };
		{ 26, "s34590", "28595", "=q2=Bright Blood Garnet",  };
		{ 27, "s28903", "23094", "=q2=Teardrop Blood Garnet",  };
	};
	{
		Name = AL["Blue Gems"];
		{ 1, "s39717", "32202", "=q4=Lustrous Empyrean Sapphire",  };
		{ 2, "s39715", "32200", "=q4=Solid Empyrean Sapphire",  };
		{ 3, "s39716", "32201", "=q4=Sparkling Empyrean Sapphire",  };
		{ 4, "s39718", "32203", "=q4=Stormy Empyrean Sapphire",  };
		{ 5, "s42590", "33135", "=q4=Falling Star",  };
		{ 6, "s31094", "24037", "=q3=Lustrous Star of Elune",  };
		{ 7, "s31092", "24033", "=q3=Solid Star of Elune",  };
		{ 8, "s31149", "24035", "=q3=Sparkling Star of Elune",  };
		{ 9, "s31095", "24039", "=q3=Stormy Star of Elune",  };
		{ 10, "s28957", "23121", "=q2=Lustrous Azure Moonstone",  };
		{ 11, "s28955", "23120", "=q2=Stormy Azure Moonstone",  };
		{ 12, "s28953", "23119", "=q2=Sparkling Azure Moonstone",  };
		{ 13, "s28950", "23118", "=q2=Solid Azure Moonstone",  };
	};
	{
		Name = AL["Yellow Gems"];
		{ 1, "s39719", "32204", "=q4=Brilliant Lionseye",  };
		{ 2, "s39722", "32207", "=q4=Gleaming Lionseye",  };
		{ 3, "s39725", "32210", "=q4=Great Lionseye",  };
		{ 4, "s39724", "32209", "=q4=Mystic Lionseye",  };
		{ 5, "s47056", "35761", "=q4=Quick Lionseye",  };
		{ 6, "s39721", "32206", "=q4=Rigid Lionseye",  };
		{ 7, "s39720", "32205", "=q4=Smooth Lionseye",  };
		{ 8, "s39723", "32208", "=q4=Thick Lionseye",  };
		{ 9, "s42592", "33140", "=q4=Blood of Amber",  };
		{ 10, "s42593", "33144", "=q4=Facet of Eternity",  };
		{ 11, "s42591", "33143", "=q4=Stone of Blades",  };
		{ 16, "s31096", "24047", "=q3=Brilliant Dawnstone",  };
		{ 17, "s31099", "24050", "=q3=Gleaming Dawnstone",  };
		{ 18, "s39452", "31861", "=q3=Great Dawnstone",  };
		{ 19, "s31101", "24053", "=q3=Mystic Dawnstone",  };
		{ 20, "s46403", "35315", "=q3=Quick Dawnstone",  };
		{ 21, "s31098", "24051", "=q3=Rigid Dawnstone",  };
		{ 22, "s31097", "24048", "=q3=Smooth Dawnstone",  };
		{ 23, "s31100", "24052", "=q3=Thick Dawnstone",  };
		{ 24, "s39451", "31860", "=q2=Great Golden Draenite",  };
		{ 25, "s28948", "23116", "=q2=Rigid Golden Draenite",  };
		{ 26, "s34069", "28290", "=q2=Smooth Golden Draenite",  };
		{ 27, "s28947", "23115", "=q2=Thick Golden Draenite",  };
		{ 28, "s28944", "23114", "=q2=Gleaming Golden Draenite",  };
		{ 29, "s28938", "23113", "=q2=Brilliant Golden Draenite",  };
	};
	{
		Name = AL["Green Gems"];
		{ 1, "s39741", "32225", "=q4=Dazzling Seaspray Emerald",  };
		{ 2, "s39739", "32223", "=q4=Enduring Seaspray Emerald",  };
		{ 3, "s47053", "35759", "=q4=Forceful Seaspray Emerald",  };
		{ 4, "s39742", "32226", "=q4=Jagged Seaspray Emerald",  };
		{ 5, "s39740", "32224", "=q4=Radiant Seaspray Emerald",  };
		{ 6, "s47054", "35758", "=q4=Steady Seaspray Emerald",  };
		{ 7, "s31112", "24065", "=q3=Dazzling Talasite",  };
		{ 8, "s31110", "24062", "=q3=Enduring Talasite",  };
		{ 9, "s46405", "35318", "=q3=Forceful Talasite",  };
		{ 10, "s31113", "24067", "=q3=Jagged Talasite",  };
		{ 11, "s31111", "24066", "=q3=Radiant Talasite",  };
		{ 12, "s43493", "33782", "=q3=Steady Talasite",  };
		{ 16, "s28924", "23106", "=q2=Dazzling Deep Peridot",  };
		{ 17, "s28918", "23105", "=q2=Enduring Deep Peridot",  };
		{ 18, "s28917", "23104", "=q2=Jagged Deep Peridot",  };
		{ 19, "s28916", "23103", "=q2=Radiant Deep Peridot",  };
	};
	{
		Name = AL["Orange Gems"];
		{ 1, "s39736", "32220", "=q4=Glinting Pyrestone",  };
		{ 2, "s39733", "32217", "=q4=Inscribed Pyrestone",  };
		{ 3, "s39735", "32219", "=q4=Luminous Pyrestone",  };
		{ 4, "s39734", "32218", "=q4=Potent Pyrestone",  };
		{ 5, "s47055", "35760", "=q4=Reckless Pyrestone",  };
		{ 6, "s39737", "32221", "=q4=Veiled Pyrestone",  };
		{ 7, "s39738", "32222", "=q4=Wicked Pyrestone",  };
		{ 8, "s31109", "24061", "=q3=Glinting Noble Topaz",  };
		{ 9, "s31106", "24058", "=q3=Inscribed Noble Topaz",  };
		{ 10, "s31108", "24060", "=q3=Luminous Noble Topaz",  };
		{ 11, "s31107", "24059", "=q3=Potent Noble Topaz",  };
		{ 12, "s46404", "35316", "=q3=Reckless Noble Topaz",  };
		{ 13, "s39470", "31867", "=q3=Veiled Noble Topaz",  };
		{ 14, "s39471", "31868", "=q3=Wicked Noble Topaz",  };
		{ 21, "s28915", "23101", "=q2=Potent Flame Spessarite",  };
		{ 16, "s39466", "31866", "=q2=Veiled Flame Spessarite",  };
		{ 17, "s39467", "31869", "=q2=Wicked Flame Spessarite",  };
		{ 18, "s28914", "23100", "=q2=Glinting Flame Spessarite",  };
		{ 19, "s28912", "23099", "=q2=Luminous Flame Spessarite",  };
		{ 20, "s28910", "23098", "=q2=Inscribed Flame Spessarite",  };
	};
	{
		Name = AL["Purple Gems"];
		{ 1, "s39729", "32213", "=q4=Balanced Shadowsong Amethyst",  };
		{ 2, "s39731", "32215", "=q4=Glowing Shadowsong Amethyst",  };
		{ 3, "s39730", "32214", "=q4=Infused Shadowsong Amethyst",  };
		{ 4, "s48789", "37503", "=q4=Purified Shadowsong Amethyst",  };
		{ 5, "s39732", "32216", "=q4=Royal Shadowsong Amethyst",  };
		{ 6, "s39728", "32212", "=q4=Shifting Shadowsong Amethyst",  };
		{ 7, "s39727", "32211", "=q4=Sovereign Shadowsong Amethyst",  };
		{ 8, "s39463", "31863", "=q3=Balanced Nightseye",  };
		{ 9, "s31104", "24056", "=q3=Glowing Nightseye",  };
		{ 10, "s39462", "31865", "=q3=Infused Nightseye",  };
		{ 11, "s46803", "35707", "=q3=Regal Nightseye",  };
		{ 12, "s31105", "24057", "=q3=Royal Nightseye",  };
		{ 13, "s31103", "24055", "=q3=Shifting Nightseye",  };
		{ 14, "s31102", "24054", "=q3=Sovereign Nightseye",  };
		{ 15, "s41429", "32836", "=q3=Purified Shadow Pearl",  };
		{ 16, "s39455", "31862", "=q2=Balanced Shadow Draenite",  };
		{ 17, "s39458", "31864", "=q2=Infused Shadow Draenite",  };
		{ 18, "s28936", "23111", "=q2=Sovereign Shadow Draenite",  };
		{ 19, "s28933", "23110", "=q2=Shifting Shadow Draenite",  };
		{ 20, "s28927", "23109", "=q2=Royal Shadow Draenite",  };
		{ 21, "s28925", "23108", "=q2=Glowing Shadow Draenite",  };
	};
	{
		Name = AL["Meta Gems"];
		{ 1, "s46601", "35503", "=q3=Ember Skyfire Diamond",  };
		{ 2, "s44794", "34220", "=q3=Chaotic Skyfire Diamond",  };
		{ 3, "s32871", "25890", "=q3=Destructive Skyfire Diamond",  };
		{ 4, "s32874", "25895", "=q3=Enigmatic Skyfire Diamond",  };
		{ 5, "s32872", "25893", "=q3=Mystical Skyfire Diamond",  };
		{ 6, "s32873", "25894", "=q3=Swift Skyfire Diamond",  };
		{ 7, "s39963", "32410", "=q3=Thundering Skyfire Diamond",  };
		{ 16, "s46597", "35501", "=q3=Eternal Earthstorm Diamond",  };
		{ 17, "s32867", "25897", "=q3=Bracing Earthstorm Diamond",  };
		{ 18, "s32869", "25899", "=q3=Brutal Earthstorm Diamond",  };
		{ 19, "s32870", "25901", "=q3=Insightful Earthstorm Diamond",  };
		{ 20, "s32866", "25896", "=q3=Powerful Earthstorm Diamond",  };
		{ 21, "s39961", "32409", "=q3=Relentless Earthstorm Diamond",  };
		{ 22, "s32868", "25898", "=q3=Tenacious Earthstorm Diamond",  };
	};
	{
		Name = AL["Prismatic Gems"];
		{ 1, "s28028", "22459", "=q4=Void Sphere",  };
		{ 2, "s56531", "42702", "=q3=Enchanted Tear",  };
		{ 3, "s28027", "22460", "=q3=Prismatic Sphere",  };
		{ 4, "s56530", "42701", "=q2=Enchanted Pearl",  };
		{ 5, "s62941", "42701", "=q2=Prismatic Black Diamond",  };
	};
	{
		Name = AL["Trinkets"];
		{ 1, "s46777", "35700", "=q4=Figurine - Crimson Serpent",  };
		{ 2, "s46775", "35693", "=q4=Figurine - Empyrean Tortoise",  };
		{ 3, "s46776", "35694", "=q4=Figurine - Khorium Boar",  };
		{ 4, "s46779", "35703", "=q4=Figurine - Seaspray Albatross",  };
		{ 5, "s46778", "35702", "=q4=Figurine - Shadowsong Panther",  };
		{ 6, "s56203", "42418", "=q3=Figurine - Emerald Boar",  };
		{ 7, "s59759", "44063", "=q3=Figurine - Monarch Crab",  };
		{ 8, "s56199", "42341", "=q3=Figurine - Ruby Hare",  };
		{ 9, "s56202", "42413", "=q3=Figurine - Sapphire Owl",  };
		{ 10, "s56201", "42395", "=q3=Figurine - Twilight Serpent",  };
		{ 11, "s31080", "24125", "=q3=Figurine - Dawnstone Crab",  };
		{ 12, "s31079", "24124", "=q3=Figurine - Felsteel Boar",  };
		{ 13, "s31081", "24126", "=q3=Figurine - Living Ruby Serpent",  };
		{ 14, "s31083", "24128", "=q3=Figurine - Nightseye Panther",  };
		{ 15, "s31082", "24127", "=q3=Figurine - Talasite Owl",  };
		{ 16, "s26912", "21784", "=q3=Figurine - Black Diamond Crab",  };
		{ 17, "s26914", "21789", "=q3=Figurine - Dark Iron Scorpid",  };
		{ 18, "s26909", "21777", "=q2=Figurine - Emerald Owl",  };
		{ 19, "s26900", "21769", "=q2=Figurine - Ruby Serpent",  };
		{ 20, "s26882", "21763", "=q2=Figurine - Truesilver Boar",  };
		{ 21, "s26881", "21760", "=q2=Figurine - Truesilver Crab",  };
		{ 22, "s26873", "21756", "=q2=Figurine - Golden Hare",  };
		{ 23, "s26872", "21748", "=q2=Figurine - Jade Owl",  };
		{ 24, "s26875", "21758", "=q2=Figurine - Black Pearl Panther",  };
	};
	{
		Name = AL["Rings"];
		{ 1, "s31057", "24086", "=q3=Arcane Khorium Band",  };
		{ 2, "s31061", "24089", "=q3=Blazing Eternium Band",  };
		{ 3, "s31056", "24085", "=q3=Khorium Band of Leaves",  };
		{ 4, "s37855", "30825", "=q3=Ring of Arcane Shielding",  };
		{ 5, "s31060", "24088", "=q3=Delicate Eternium Ring",  };
		{ 6, "s31054", "24080", "=q3=Khorium Band of Frost",  };
		{ 7, "s31055", "24082", "=q3=Khorium Inferno Band",  };
		{ 8, "s31053", "24079", "=q3=Khorium Band of Shadows",  };
		{ 9, "s31058", "24087", "=q3=Heavy Felsteel Ring",  };
		{ 10, "s41415", "32774", "=q3=The Black Pearl",  };
		{ 11, "s41414", "32772", "=q3=Brilliant Pearl Band",  };
		{ 12, "s26916", "21779", "=q3=Band of Natural Fire",  };
		{ 13, "s26903", "21768", "=q3=Sapphire Signet",  };
		{ 14, "s26896", "21753", "=q3=Gem Studded Band",  };
		{ 15, "s26874", "20964", "=q3=Aquamarine Signet",  };
		{ 16, "s34959", "29158", "=q3=Truesilver Commander's Ring",  };
		{ 17, "s34955", "29157", "=q3=Golden Ring of Power",  };
		{ 18, "s37818", "30804", "=q3=Bronze Band of Force",  };
		{ 19, "s25305", "20826", "=q3=Heavy Silver Ring",  };
		{ 20, "s58146", "43249", "=q2=Shadowmight Ring",  };
		{ 21, "s58145", "43248", "=q2=Stoneguard Band",  };
		{ 22, "s56193", "42336", "=q2=Bloodstone Band",  };
		{ 23, "s56194", "42337", "=q2=Sun Rock Ring",  };
		{ 24, "s31052", "24078", "=q2=Heavy Adamantite Ring",  };
		{ 25, "s31050", "24076", "=q2=Azure Moonstone Ring",  };
		{ 26, "s31048", "24074", "=q2=Fel Iron Blood Ring",  };
		{ 27, "s31049", "24075", "=q2=Golden Draenite Ring",  };
		{ 28, "s34961", "29160", "=q2=Emerald Lion Ring",  };
		{ 29, "s26910", "21778", "=q2=Ring of Bitter Shadows",  };
		{ 30, "s34960", "29159", "=q2=Glowing Thorium Band",  };

	};
	{
		Name = AL["Rings"];
		{ 1, "s26907", "21775", "=q2=Onslaught Ring",  };
		{ 2, "s36526", "30422", "=q2=Diamond Focus Ring",  };
		{ 3, "s26902", "21767", "=q2=Simple Opal Ring",  };
		{ 4, "s26887", "21754", "=q2=The Aquamarine Ward",  };
		{ 5, "s26885", "21765", "=q2=Truesilver Healing Ring",  };
		{ 6, "s36525", "30421", "=q2=Red Ring of Destruction",  };
		{ 7, "s25621", "20961", "=q2=Citrine Ring of Rapid Healing",  };
		{ 8, "s25620", "20960", "=q2=Engraved Truesilver Ring",  };
		{ 9, "s25619", "20959", "=q2=The Jade Eye",  };
		{ 10, "s25617", "20958", "=q2=Blazing Citrine Ring",  };
		{ 11, "s25613", "20955", "=q2=Golden Dragon Ring",  };
		{ 12, "s25323", "20833", "=q2=Wicked Moonstone Ring",  };
		{ 13, "s36524", "30420", "=q2=Heavy Jade Ring",  };
		{ 14, "s25318", "20828", "=q2=Ring of Twilight Shadows",  };
		{ 15, "s25317", "20827", "=q2=Ring of Silver Might",  };
		{ 16, "s25287", "20823", "=q2=Gloom Band",  };
		{ 17, "s25284", "20820", "=q2=Simple Pearl Ring",  };
		{ 18, "s25490", "20907", "=q2=Solid Bronze Ring",  };
		{ 19, "s25280", "20818", "=q2=Elegant Silver Ring",  };
		{ 20, "s25283", "20821", "=q2=Inlaid Malachite Ring",  };
		{ 21, "s32179", "25439", "=q2=Tigerseye Band",  };
		{ 22, "s26926", "21932", "=q2=Heavy Copper Ring",  };
		{ 23, "s25493", "20906", "=q2=Braided Copper Ring",  };
		{ 24, "s26925", "21931", "=q2=Woven Copper Ring",  };
	};
	{
		Name = AL["Necks"];
		{ 1, "s31072", "24117", "=q3=Embrace of the Dawn",  };
		{ 2, "s31070", "24114", "=q3=Braided Eternium Chain",  };
		{ 3, "s31071", "24116", "=q3=Eye of the Night",  };
		{ 4, "s31062", "24092", "=q3=Pendant of Frozen Flame",  };
		{ 5, "s31065", "24097", "=q3=Pendant of Shadow's End",  };
		{ 6, "s31063", "24093", "=q3=Pendant of Thawing",  };
		{ 7, "s31066", "24098", "=q3=Pendant of the Null Rune",  };
		{ 8, "s31064", "24095", "=q3=Pendant of Withering",  };
		{ 9, "s31068", "24110", "=q3=Living Ruby Pendant",  };
		{ 10, "s31067", "24106", "=q3=Thick Felsteel Necklace",  };
		{ 11, "s40514", "32508", "=q3=Necklace of the Deep",  };
		{ 12, "s26915", "21792", "=q3=Necklace of the Diamond Tower",  };
		{ 13, "s26911", "21791", "=q3=Living Emerald Pendant",  };
		{ 14, "s26897", "21766", "=q3=Opal Necklace of Impact",  };
		{ 15, "s63743", "45627", "=q3=Amulet of Truesight",  };
		{ 16, "s58142", "43245", "=q2=Crystal Chalcedony Amulet",  };
		{ 17, "s58141", "43244", "=q2=Crystal Citrine Necklace",  };
		{ 18, "s31051", "24077", "=q2=Thick Adamantite Necklace",  };
		{ 19, "s26908", "21790", "=q2=Sapphire Pendant of Winter Night",  };
	};
	{
		Name = AL["Necks"];
		{ 1, "s26883", "21764", "=q2=Ruby Pendant of Fire",  };
		{ 2, "s26876", "21755", "=q2=Aquamarine Pendant of the Warrior",  };
		{ 3, "s25622", "20967", "=q2=Citrine Pendant of Golden Healing",  };
		{ 4, "s25618", "20966", "=q2=Jade Pendant of Blasting",  };
		{ 5, "s25320", "20831", "=q2=Heavy Golden Necklace of Battle",  };
		{ 6, "s25610", "20950", "=q2=Pendant of the Agate Shield",  };
		{ 7, "s25339", "20830", "=q2=Amulet of the Moon",  };
		{ 8, "s25498", "20909", "=q2=Barbaric Iron Collar",  };
		{ 9, "s38175", "31154", "=q2=Bronze Torc",  };
		{ 10, "s36523", "30419", "=q2=Brilliant Necklace",  };
		{ 11, "s26927", "21933", "=q2=Thick Bronze Necklace",  };
		{ 12, "s26928", "21934", "=q2=Ornate Tigerseye Necklace",  };
		{ 13, "s32178", "25438", "=q2=Malachite Pendant",  };
	};
	{
		Name = AL["Miscellaneous"];
		{ 1, "s31078", "24123", "=q4=Circlet of Arcane Might",  };
		{ 2, "s31077", "24122", "=q4=Coronet of the Verdant Flame",  };
		{ 4, "s41418", "32776", "=q3=Crown of the Sea Witch",  };
		{ 5, "s47280", "35945", "=q3=Brilliant Glass",  };
		{ 6, "s38068", "31079", "=q3=Mercurial Adamantite",  };
		{ 7, "s26906", "21774", "=q3=Emerald Crown of Destruction",  };
		{ 8, "s26878", "20969", "=q3=Ruby Crown of Restoration",  };
		{ 9, "s25321", "20832", "=q3=Moonsoul Crown",  };
		{ 10, "s56208", "42421", "=q2=Shadow Jade Focusing Lens",  };
		{ 11, "s56206", "42420", "=q2=Shadow Crystal Focusing Lens",  };
		{ 12, "s56205", "41367", "=q2=Dark Jade Focusing Lens",  };
		{ 13, "s25612", "20954", "=q2=Heavy Iron Knuckles",  };
		{ 14, "s26880", "21752", "=q1=Thorium Setting",  };
		{ 15, "s32809", "25883", "=q1=Dense Stone Statue",  };
		{ 16, "s32808", "25882", "=q1=Solid Stone Statue",  };
		{ 17, "s25615", "20963", "=q1=Mithril Filigree",  };
		{ 18, "s32807", "25881", "=q1=Heavy Stone Statue",  };
		{ 19, "s25278", "20817", "=q1=Bronze Setting",  };
		{ 20, "s32801", "25880", "=q1=Coarse Stone Statue",  };
		{ 21, "s25255", "20816", "=q1=Delicate Copper Wire",  };
		{ 22, "s32259", "25498", "=q1=Rough Stone Statue",  };
	};
};

----------------------
--- Leatherworking ---
----------------------
AtlasLoot_Data["LeatherworkingTBC"] = {
	Name = LEATHERWORKING;
	Type = "Crafting";
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Back";
		{ 1, "s42546", "33122", "=q4=Cloak of Darkness",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Chest";
		{ 1, "s35589", "29525", "=q4=Primalstrike Vest",  };
		{ 2, "s35585", "29522", "=q4=Windhawk Hauberk",  };
		{ 3, "s46138", "34369", "=q4=Carapace of Sun and Shadow",  };
		{ 4, "s46136", "34371", "=q4=Leather Chestguard of the Sun",  };
		{ 5, "s42731", "33204", "=q4=Shadowprowler's Chestguard",  };
		{ 6, "s32495", "25689", "=q3=Heavy Clefthoof Vest",  };
		{ 7, "s36078", "29974", "=q3=Living Crystal Breastplate",  };
		{ 8, "s36077", "29973", "=q3=Primalstorm Breastplate",  };
		{ 9, "s32473", "25671", "=q2=Thick Draenic Vest",  };
		{ 10, "s32481", "25676", "=q2=Wild Draenish Vest",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Feet";
		{ 1, "s36355", "30041", "=q4=Boots of Natural Grace",  };
		{ 2, "s36357", "30039", "=q4=Boots of Utter Darkness",  };
		{ 3, "s40003", "32394", "=q4=Redeemed Soul Moccasins",  };
		{ 4, "s40003", "32394", "=q4=Redeemed Soul Moccasins",  };
		{ 5, "s32497", "25691", "=q3=Heavy Clefthoof Boots",  };
		{ 6, "s35536", "29499", "=q3=Blastguard Boots",  };
		{ 7, "s35534", "29497", "=q3=Enchanted Clefthoof Boots",  };
		{ 8, "s32493", "25686", "=q3=Fel Leather Boots",  };
		{ 9, "s32472", "25668", "=q2=Thick Draenic Boots",  };
		{ 10, "s32478", "25673", "=q2=Wild Draenish Boots",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Hands";
		{ 1, "s35559", "29503", "=q4=Cobrascale Gloves",  };
		{ 2, "s46134", "34370", "=q4=Gloves of Immortal Dusk",  };
		{ 3, "s35562", "29506", "=q4=Gloves of the Living Touch",  };
		{ 4, "s46132", "34372", "=q4=Leather Gauntlets of the Sun",  };
		{ 5, "s35563", "29507", "=q4=Windslayer Wraps",  };
		{ 6, "s35533", "29496", "=q3=Enchanted Clefthoof Gloves",  };
		{ 7, "s32490", "25685", "=q3=Fel Leather Gloves",  };
		{ 8, "s32479", "25674", "=q2=Wild Draenish Gloves",  };
		{ 9, "s32470", "25669", "=q2=Thick Draenic Gloves",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Head";
		{ 1, "s35558", "29502", "=q4=Cobrascale Hood",  };
		{ 2, "s35561", "29505", "=q4=Hood of Primal Life",  };
		{ 3, "s35560", "29504", "=q4=Windscale Hood",  };
		{ 4, "s32489", "25682", "=q3=Stylin' Jungle Hat",  };
		{ 5, "s32485", "25680", "=q3=Stylin' Purple Hat",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Legs";
		{ 1, "s40005", "32396", "=q4=Redeemed Soul Legguards",  };
		{ 2, "s32496", "25690", "=q3=Heavy Clefthoof Leggings",  };
		{ 3, "s35535", "29498", "=q3=Blastguard Pants",  };
		{ 4, "s35532", "29495", "=q3=Enchanted Clefthoof Leggings",  };
		{ 5, "s32494", "25687", "=q3=Fel Leather Leggings",  };
		{ 6, "s32480", "25675", "=q2=Wild Draenish Leggings",  };
		{ 7, "s32471", "25670", "=q2=Thick Draenic Pants",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s41157", "32583", "=q4=Shoulderpads of Renewed Life",  };
		{ 2, "s41160", "32581", "=q4=Swiftstrike Shoulders",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Waist";
		{ 1, "s36351", "30040", "=q4=Belt of Deep Shadow",  };
		{ 2, "s36349", "30042", "=q4=Belt of Natural Power",  };
		{ 3, "s35590", "29526", "=q4=Primalstrike Belt",  };
		{ 4, "s40006", "32393", "=q4=Redeemed Soul Cinch",  };
		{ 5, "s35587", "29524", "=q4=Windhawk Belt",  };
	};
	{
		Name = AL["Leather Armor"] .. WHITE .. " - Wrist";
		{ 1, "s41156", "32582", "=q4=Bracers of Renewed Life",  };
		{ 2, "s35591", "29527", "=q4=Primalstrike Bracers",  };
		{ 3, "s40004", "32395", "=q4=Redeemed Soul Wristguards",  };
		{ 4, "s41158", "32580", "=q4=Swiftstrike Bracers",  };
		{ 5, "s35588", "29523", "=q4=Windhawk Bracers",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Chest";
		{ 1, "s35580", "29519", "=q4=Netherstrike Breastplate",  };
		{ 2, "s35575", "29515", "=q4=Ebon Netherscale Breastplate",  };
		{ 3, "s46137", "34373", "=q4=Embrace of the Phoenix",  };
		{ 4, "s46139", "34375", "=q4=Sun-Drenched Scale Chestguard",  };
		{ 5, "s35574", "29514", "=q4=Thick Netherscale Breastplate",  };
		{ 6, "s32500", "25696", "=q3=Felstalker Breastplate",  };
		{ 7, "s36079", "29975", "=q3=Golden Dragonstrike Breastplate",  };
		{ 8, "s32465", "25657", "=q2=Felscale Breastplate",  };
		{ 9, "s32468", "25660", "=q2=Scaled Draenic Vest",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Feet";
		{ 1, "s36359", "30043", "=q4=Hurricane Boots",  };
		{ 2, "s39997", "32398", "=q4=Boots of Shackled Souls",  };
		{ 3, "s36358", "30045", "=q4=Boots of the Crimson Hawk",  };
		{ 4, "s35567", "29512", "=q4=Earthen Netherscale Boots",  };
		{ 5, "s35528", "29493", "=q3=Flamescale Boots",  };
		{ 6, "s32503", "25693", "=q3=Netherfury Boots",  };
		{ 7, "s35527", "29491", "=q3=Enchanted Felscale Boots",  };
		{ 8, "s32469", "25659", "=q2=Scaled Draenic Boots",  };
		{ 9, "s32463", "25655", "=q2=Felscale Boots",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Hands";
		{ 1, "s46135", "34376", "=q4=Sun-Drenched Scale Gloves",  };
		{ 2, "s46133", "34374", "=q4=Fletcher's Gloves of the Phoenix",  };
		{ 3, "s35568", "29509", "=q4=Windstrike Gloves",  };
		{ 4, "s35573", "29511", "=q4=Netherdrake Gloves",  };
		{ 5, "s32467", "25661", "=q2=Scaled Draenic Gloves",  };
		{ 6, "s32462", "25654", "=q2=Felscale Gloves",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Head";
		{ 1, "s35564", "29508", "=q4=Living Dragonscale Helm",  };
		{ 2, "s35572", "29510", "=q4=Netherdrake Helm",  };
		{ 3, "s32487", "25681", "=q3=Stylin' Adventure Hat",  };
		{ 4, "s32488", "25683", "=q3=Stylin' Crimson Hat",  };
		{ 5, "s35526", "29490", "=q3=Enchanted Felscale Gloves",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Legs";
		{ 1, "s40001", "32400", "=q4=Greaves of Shackled Souls",  };
		{ 2, "s35529", "29492", "=q3=Flamescale Leggings",  };
		{ 3, "s35525", "29489", "=q3=Enchanted Felscale Leggings",  };
		{ 4, "s32502", "25692", "=q3=Netherfury Leggings",  };
		{ 5, "s32464", "25656", "=q2=Felscale Pants",  };
		{ 6, "s32466", "25662", "=q2=Scaled Draenic Pants",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s41162", "32575", "=q4=Shoulders of Lightning Reflexes",  };
		{ 2, "s41164", "32579", "=q4=Living Earth Shoulders",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Waist";
		{ 1, "s40002", "32397", "=q4=Waistguard of Shackled Souls",  };
		{ 2, "s35582", "29520", "=q4=Netherstrike Belt",  };
		{ 3, "s36353", "30044", "=q4=Monsoon Belt",  };
		{ 4, "s35576", "29516", "=q4=Ebon Netherscale Belt",  };
		{ 5, "s36352", "30046", "=q4=Belt of the Black Eagle",  };
		{ 6, "s32498", "25695", "=q3=Felstalker Belt",  };
		{ 7, "s35531", "29494", "=q3=Flamescale Belt",  };
		{ 8, "s35537", "29500", "=q3=Blastguard Belt",  };
		{ 9, "s32501", "25694", "=q3=Netherfury Belt",  };
	};
	{
		Name = AL["Mail Armor"] .. WHITE .. " - Wrist";
		{ 1, "s35584", "29521", "=q4=Netherstrike Bracers",  };
		{ 2, "s52733", "32399", "=q4=Bracers of Shackled Souls",  };
		{ 3, "s35577", "29517", "=q4=Ebon Netherscale Bracers",  };
		{ 4, "s41163", "32577", "=q4=Living Earth Bindings",  };
		{ 5, "s41161", "32574", "=q4=Bindings of Lightning Reflexes",  };
		{ 6, "s32499", "25697", "=q3=Felstalker Bracer",  };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s35557", "29536", "=q4=Nethercleft Leg Armor",  };
		{ 2, "s35554", "29535", "=q4=Nethercobra Leg Armor",  };
		{ 3, "s35555", "29534", "=q3=Clefthide Leg Armor",  };
		{ 4, "s35549", "29533", "=q3=Cobrahide Leg Armor",  };
		{ 5, "s22727", "18251", "=q3=Core Armor Kit",  };
		{ 6, "s50963", "38376", "=q2=Heavy Borean Armor Kit",  };
		{ 7, "s44770", "34207", "=q2=Glove Reinforcements",  };
		{ 8, "s35524", "29488", "=q2=Arcane Armor Kit",  };
		{ 9, "s35521", "29485", "=q2=Flame Armor Kit",  };
		{ 10, "s35522", "29486", "=q2=Frost Armor Kit",  };
		{ 11, "s35523", "29487", "=q2=Nature Armor Kit",  };
		{ 12, "s35520", "29483", "=q2=Shadow Armor Kit",  };
		{ 13, "s50962", "38375", "=q1=Borean Armor Kit",  };
		{ 14, "s44970", "34330", "=q1=Heavy Knothide Armor Kit",  };
		{ 15, "s32458", "25652", "=q1=Magister's Armor Kit",  };
		{ 16, "s32457", "25651", "=q1=Vindicator's Armor Kit",  };
		{ 17, "s32456", "25650", "=q1=Knothide Armor Kit",  };
		{ 18, "s32482", "25679", "=q1=Comfortable Insoles",  };
	};
	{
		Name = AL["Quivers and Ammo Pouches"];
		{ 1, "s44768", "34106", "=q3=Netherscale Ammo Pouch",  };
		{ 2, "s44359", "34105", "=q3=Quiver of a Thousand Feathers",  };
		{ 3, "s44343", "34099", "=q2=Knothide Ammo Pouch",  };
		{ 4, "s44344", "34100", "=q2=Knothide Quiver",  };
	};
	{
		Name = AL["Drums, Bags and Misc."];
		{ 1, "s35543", "29529", "=q3=Drums of Battle",  };
		{ 2, "s45117", "34490", "=q3=Bag of Many Hides",  };
		{ 3, "s32461", "25653", "=q3=Riding Crop",  };
		{ 4, "s35538", "29532", "=q2=Drums of Panic",  };
		{ 5, "s35539", "29531", "=q2=Drums of Restoration",  };
		{ 6, "s35544", "29530", "=q2=Drums of Speed",  };
		{ 7, "s35540", "29528", "=q2=Drums of War",  };
		{ 8, "s35530", "29540", "=q2=Reinforced Mining Bag",  };
		{ 9, "s45100", "34482", "=q2=Leatherworker's Satchel",  };
	};
	{
		Name = BabbleInventory["Leather"];
		{ 1, "s32455", "23793", "=q1=Heavy Knothide Leather",  };
		{ 2, "s32454", "21887", "=q1=Knothide Leather",  };
	};
	{
		Name = DRAGONSCALE;
		{ 1, "s35576", "29516", "=q4=Ebon Netherscale Belt",  };
		{ 2, "s35577", "29517", "=q4=Ebon Netherscale Bracers",  };
		{ 3, "s35575", "29515", "=q4=Ebon Netherscale Breastplate",  };
		{ 4, "s35582", "29520", "=q4=Netherstrike Belt",  };
		{ 5, "s35584", "29521", "=q4=Netherstrike Bracers",  };
		{ 6, "s35580", "29519", "=q4=Netherstrike Breastplate",  };
		{ 7, "s36079", "29975", "=q3=Golden Dragonstrike Breastplate",  };
	};
	{
		Name = ELEMENTAL;
		{ 1, "s35590", "29526", "=q4=Primalstrike Belt",  };
		{ 2, "s35591", "29527", "=q4=Primalstrike Bracers",  };
		{ 3, "s35589", "29525", "=q4=Primalstrike Vest",  };
		{ 4, "s36077", "29973", "=q3=Primalstorm Breastplate",  };
	};
	{
		Name = TRIBAL;
		{ 1, "s35587", "29524", "=q4=Windhawk Belt",  };
		{ 2, "s35588", "29523", "=q4=Windhawk Bracers",  };
		{ 3, "s35585", "29522", "=q4=Windhawk Hauberk",  };
		{ 4, "s36078", "29974", "=q3=Living Crystal Breastplate",  };
	};
};

AtlasLoot_Data["MiningTBC"] = {
	Name = MINING;
	{
		Name = MINING;
		{ 1, "s46353", "35128", "=q2=Smelt Hardened Khorium",  };
		{ 2, "s29686", "23573", "=q1=Smelt Hardened Adamantite",  };
		{ 3, "s29361", "23449", "=q2=Smelt Khorium",  };
		{ 4, "s29360", "23448", "=q2=Smelt Felsteel",  };
		{ 5, "s29359", "23447", "=q2=Smelt Eternium",  };
		{ 6, "s29358", "23446", "=q1=Smelt Adamantite",  };
		{ 7, "s29356", "23445", "=q1=Smelt Fel Iron",  };
		{ 8, "s35751", "22574", "=q1=Fire Sunder",  };
		{ 9, "s35750", "22573", "=q1=Earth Shatter",  };
	};
};

AtlasLoot_Data["FirstAidTBC"] = {
	Name = FIRSTAID;
	{
		Name = FIRSTAID;
		{ 1, "s27033", "21991", "=q1=Heavy Netherweave Bandage",  };
		{ 2, "s27032", "21990", "=q1=Netherweave Bandage",  };
	};
};
-----------------
--- Tailoring ---
-----------------



AtlasLoot_Data["TailoringTBC"] = {
	Name = TAILORING;
	Type = "Crafting";
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Back";
		{ 1, "s40060", "32420", "=q4=Night's End",  };
		{ 2, "s31450", "24260", "=q4=Manaweave Cloak",  };
		{ 3, "s31449", "24259", "=q4=Vengeance Wrap",  };
		{ 4, "s37873", "30831", "=q3=Cloak of Arcane Evasion",  };
		{ 5, "s31440", "24253", "=q3=Cloak of Eternity",  };
		{ 6, "s31438", "24252", "=q3=Cloak of the Black Void",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Chest";
		{ 1, "s26758", "21871", "=q4=Frozen Shadoweave Robe",  };
		{ 2, "s26762", "21875", "=q4=Primal Mooncloth Robe",  };
		{ 3, "s26781", "21865", "=q4=Soulcloth Vest",  };
		{ 4, "s26754", "21848", "=q4=Spellfire Robe",  };
		{ 5, "s46131", "34365", "=q4=Robe of Eternal Light",  };
		{ 6, "s46130", "34364", "=q4=Sunfire Robe",  };
		{ 7, "s26784", "21868", "=q3=Arcanoweave Robe",  };
		{ 8, "s37884", "30839", "=q3=Flameheart Vest",  };
		{ 9, "s26777", "21861", "=q3=Imbued Netherweave Robe",  };
		{ 10, "s26778", "21862", "=q3=Imbued Netherweave Tunic",  };
		{ 11, "s26774", "21855", "=q2=Netherweave Tunic",  };
		{ 12, "s26773", "21854", "=q2=Netherweave Robe",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Feet";
		{ 1, "s36317", "30037", "=q4=Boots of Blasting",  };
		{ 2, "s36318", "30035", "=q4=Boots of the Long Road",  };
		{ 3, "s40020", "32391", "=q4=Soulguard Slippers",  };
		{ 4, "s26757", "21870", "=q4=Frozen Shadoweave Boots",  };
		{ 5, "s26783", "21867", "=q3=Arcanoweave Boots",  };
		{ 6, "s26776", "21860", "=q3=Imbued Netherweave Boots",  };
		{ 7, "s26772", "21853", "=q2=Netherweave Boots",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Hands";
		{ 1, "s41207", "32584", "=q4=Swiftheal Wraps",  };
		{ 2, "s46129", "34367", "=q4=Hands of Eternal Light",  };
		{ 3, "s26753", "21847", "=q4=Spellfire Gloves",  };
		{ 4, "s46128", "34366", "=q4=Sunfire Handwraps",  };
		{ 5, "s26779", "21863", "=q4=Soulcloth Gloves",  };
		{ 6, "s37883", "30838", "=q3=Flameheart Gloves",  };
		{ 7, "s26770", "21851", "=q2=Netherweave Gloves",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Head";
		{ 1, "s31456", "24267", "=q4=Battlecast Hood",  };
		{ 2, "s31455", "24266", "=q4=Spellstrike Hood",  };
		{ 3, "s31454", "24264", "=q4=Whitemend Hood",  };
		{ 4, "s31448", "24258", "=q4=Resolute Cape",  };
		{ 5, "s31441", "24254", "=q3=White Remedy Cape",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Legs";
		{ 1, "s31453", "24263", "=q4=Battlecast Pants",  };
		{ 2, "s40023", "32389", "=q4=Soulguard Leggings",  };
		{ 3, "s31452", "24262", "=q4=Spellstrike Pants",  };
		{ 4, "s31451", "24261", "=q4=Whitemend Pants",  };
		{ 5, "s26775", "21859", "=q3=Imbued Netherweave Pants",  };
		{ 6, "s26771", "21852", "=q2=Netherweave Pants",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Shoulder";
		{ 1, "s41206", "32587", "=q4=Mantle of Nimble Thought",  };
		{ 2, "s41208", "32585", "=q4=Swiftheal Mantle",  };
		{ 3, "s26761", "21874", "=q4=Primal Mooncloth Shoulders",  };
		{ 4, "s26780", "21864", "=q4=Soulcloth Shoulders",  };
		{ 5, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Waist";
		{ 1, "s36315", "30038", "=q4=Belt of Blasting",  };
		{ 2, "s36316", "30036", "=q4=Belt of the Long Road",  };
		{ 3, "s40024", "32390", "=q4=Soulguard Girdle",  };
		{ 4, "s31444", "24257", "=q4=Black Belt of Knowledge",  };
		{ 5, "s31443", "24256", "=q4=Girdle of Ruination",  };
		{ 6, "s31442", "24255", "=q4=Unyielding Girdle",  };
		{ 7, "s26760", "21873", "=q4=Primal Mooncloth Belt",  };
		{ 8, "s26752", "21846", "=q4=Spellfire Belt",  };
		{ 9, "s26765", "21850", "=q2=Netherweave Belt",  };
	};
	{
		Name = AL["Cloth Armor"] .. WHITE .. " - Wrist";
		{ 1, "s41205", "32586", "=q4=Bracers of Nimble Thought",  };
		{ 2, "s40021", "32392", "=q4=Soulguard Bracers",  };
		{ 3, "s26782", "21866", "=q3=Arcanoweave Bracers",  };
		{ 4, "s31437", "24251", "=q3=Blackstrike Bracers",  };
		{ 5, "s37882", "30837", "=q3=Flameheart Bracers",  };
		{ 6, "s31434", "24249", "=q3=Unyielding Bracers",  };
		{ 7, "s31435", "24250", "=q3=Bracers of Havok",  };
		{ 8, "s26764", "21849", "=q2=Netherweave Bracers",  };
	};
	{
		Name = AL["Bags"];
		{ 1, "s26759", "21872", "=q3=Ebon Shadowbag",  };
		{ 2, "s50194", "38225", "=q3=Mycah's Botanical Bag",  };
		{ 3, "s26763", "21876", "=q3=Primal Mooncloth Bag",  };
		{ 4, "s26755", "21858", "=q3=Spellfire Bag",  };
		{ 5, "s18455", "14156", "=q3=Bottomless Bag",  };
		{ 6, "s26086", "21341", "=q3=Felcloth Bag",  };
		{ 7, "s56007", "41599", "=q2=Frostweave Bag",  };
		{ 8, "s31459", "24270", "=q2=Bag of Jewels",  };
		{ 9, "s26749", "21843", "=q2=Imbued Netherweave Bag",  };
		{ 10, "s26746", "21841", "=q2=Netherweave Bag",  };
	};
	{
		Name = AL["Item Enhancements"];
		{ 1, "s31433", "24276", "=q4=Golden Spellthread",  };
		{ 2, "s31432", "24274", "=q4=Runic Spellthread",  };
		{ 3, "s31430", "24273", "=q3=Mystic Spellthread",  };
		{ 4, "s31431", "24275", "=q3=Silver Spellthread",  };
	};
	{
		Name = "Cloth/" .. AL["Miscellaneous"];
		{ 1, "s26751", "21845", "=q3=Primal Mooncloth",  };
		{ 2, "s36686", "24272", "=q3=Shadowcloth",  };
		{ 3, "s31373", "24271", "=q3=Spellcloth",  };
		{ 4, "s26747", "21842", "=q2=Bolt of Imbued Netherweave",  };
		{ 5, "s26750", "21844", "=q1=Bolt of Soulcloth",  };
		{ 6, "s26745", "21840", "=q1=Bolt of Netherweave",  };
		{ 8, "s31460", "24268", "=q1=Netherweave Net",  };
	};
	{
		Name = MOONCLOTH;
		{ 1, "s26762", "21875", "=q4=Primal Mooncloth Robe",  };
		{ 2, "s26761", "21874", "=q4=Primal Mooncloth Shoulders",  };
		{ 3, "s26760", "21873", "=q4=Primal Mooncloth Belt",  };
	};
	{
		Name = SHADOWEAVE;
		{ 1, "s26758", "21871", "=q4=Frozen Shadoweave Robe",  };
		{ 2, "s26757", "21870", "=q4=Frozen Shadoweave Boots",  };
		{ 3, "s26756", "21869", "=q4=Frozen Shadoweave Shoulders",  };
	};
	{
		Name = SPELLFIRE;
		{ 1, "s26754", "21848", "=q4=Spellfire Robe",  };
		{ 2, "s26753", "21847", "=q4=Spellfire Gloves",  };
		{ 3, "s26752", "21846", "=q4=Spellfire Belt",  };
	};
};

--------------------------------
--- Daily Profession Rewards ---
--------------------------------

---------------
--- Cooking ---
---------------

AtlasLoot_Data["CookingDaily1"] = {
	{ 1, 33925, "", "=q3=Recipe: Delicious Chocolate Cake",  };
	{ 2, 33871, "", "=q3=Recipe: Stormchops",  };
	{ 3, 33869, "", "=q3=Recipe: Broiled Bloodfin",  };
	{ 4, 33875, "", "=q2=Recipe: Kibler's Bits",  };
	{ 5, 33870, "", "=q2=Recipe: Skullfish Soup",  };
	{ 6, 33873, "", "=q2=Recipe: Spicy Hot Talbuk",  };
	Next = "CookingDaily2";
	Back = "COOKINGDAILYMENU";
};

AtlasLoot_Data["CookingDaily2"] = {
	{ 1, 43035, "", "=q2=Recipe: Blackened Dragonfin",  };
	{ 2, 43032, "", "=q2=Recipe: Blackened Worg Steak",  };
	{ 3, 43029, "", "=q2=Recipe: Critter Bites",  };
	{ 4, 43033, "", "=q2=Recipe: Cuttlesteak",  };
	{ 5, 43036, "", "=q2=Recipe: Dragonfin Filet",  };
	{ 6, 43024, "", "=q2=Recipe: Firecracker Salmon",  };
	{ 7, 43030, "", "=q2=Recipe: Hearty Rhino",  };
	{ 8, 43026, "", "=q2=Recipe: Imperial Manta Steak",  };
	{ 9, 43018, "", "=q2=Recipe: Mega Mammoth Meal",  };
	{ 10, 43022, "", "=q2=Recipe: Mighty Rhino Dogs",  };
	{ 11, 43023, "", "=q2=Recipe: Poached Northern Sculpin",  };
	{ 12, 43028, "", "=q2=Recipe: Rhinolicious Wyrmsteak",  };
	{ 13, 43031, "", "=q2=Recipe: Snapper Extreme",  };
	{ 14, 43034, "", "=q2=Recipe: Spiced Mammoth Treats",  };
	{ 15, 43020, "", "=q2=Recipe: Spiced Wyrm Burger",  };
	{ 16, 43025, "", "=q2=Recipe: Spicy Blue Nettlefish",  };
	{ 17, 43027, "", "=q2=Recipe: Spicy Fried Herring",  };
	{ 18, 43019, "", "=q2=Recipe: Tender Shoveltusk Steak",  };
	{ 19, 43037, "", "=q2=Recipe: Tracker Snacks",  };
	{ 20, 43021, "", "=q2=Recipe: Very Burnt Worg",  };
	{ 22, 46349, "", "=q3=Chef's Hat",  };
	{ 23, 43007, "", "=q1=Northern Spices",  };
	{ 25, 0, "inv_misc_bag_11", "=q6=" .. AL["Small Spice Bag"], "" };
	{ 26, 33925, "", "=q3=Recipe: Delicious Chocolate Cake",  };
	{ 27, 33871, "", "=q3=Recipe: Stormchops",  };
	{ 28, 44228, "", "=q1=Baby Spice",  };
	{ 29, 44114, "", "=q1=Old Spices",  };
	Prev = "CookingDaily1";
	Back = "COOKINGDAILYMENU";
};

---------------
--- Fishing ---
---------------

AtlasLoot_Data["FishingDaily1"] = {
	{ 1, 34837, "", "=q4=The 2 Ring",  };
	{ 2, 33820, "", "=q3=Weather-Beaten Fishing Hat",  };
	{ 3, 35350, "", "=q3=Chuck's Bucket",  };
	{ 4, 33818, "", "=q3=Muckbreath's Bucket",  };
	{ 5, 35349, "", "=q3=Snarly's Bucket",  };
	{ 6, 33816, "", "=q3=Toothy's Bucket",  };
	{ 7, 34831, "", "=q3=Eye of the Sea",  };
	{ 8, 34834, "", "=q2=Recipe: Captain Rumsey's Lager",  };
	{ 9, 34836, "", "=q2=Spun Truesilver Fishing Line",  };
	{ 16, 34827, "", "=q1=Noble's Monocle",  };
	{ 17, 34828, "", "=q1=Antique Silver Cufflinks",  };
	{ 18, 34826, "", "=q1=Gold Wedding Band",  };
	{ 19, 34829, "", "=q1=Ornate Drinking Stein",  };
	{ 20, 34859, "", "=q1=Razor Sharp Fillet Knife",  };
	{ 21, 34109, "", "=q1=Weather-Beaten Journal",  };
	{ 22, 8827, "", "=q1=Elixir of Water Walking",  };
	{ 23, 34861, "", "=q1=Sharpened Fish Hook",  };
	Next = "FishingDaily2";
	Back = "FISHINGDAILYMENU";
};

AtlasLoot_Data["FishingDaily2"] = {
	{ 1, 45862, "", "=q4=Bold Stormjewel",  };
	{ 2, 45882, "", "=q4=Brilliant Stormjewel",  };
	{ 3, 45879, "", "=q4=Delicate Stormjewel",  };
	{ 4, 45987, "", "=q4=Rigid Stormjewel",  };
	{ 5, 45883, "", "=q4=Runed Stormjewel",  };
	{ 6, 45880, "", "=q4=Solid Stormjewel",  };
	{ 7, 45881, "", "=q4=Sparkling Stormjewel",  };
	{ 8, 33820, "", "=q3=Weather-Beaten Fishing Hat",  };
	{ 9, 45991, "", "=q3=Bone Fishing Pole",  };
	{ 10, 45992, "", "=q3=Jeweled Fishing Pole",  };
	{ 11, 44983, "", "=q3=Strand Crawler",  };
	{ 12, 36784, "", "=q3=Siren's Tear",  };
	{ 13, 45986, "", "=q3=Titanium Lockbox",  };
	{ 14, 34834, "", "=q2=Recipe: Captain Rumsey's Lager",  };
	{ 15, 19971, "", "=q2=High Test Eternium Fishing Line",  };
	{ 16, 45998, "", "=q1=Battered Jungle Hat",  };
	{ 17, 45861, "", "=q1=Diamond-tipped Cane",  };
	{ 18, 46006, "", "=q1=Glow Worm",  };
	{ 19, 45984, "", "=q1=Unusual Compass",  };
	{ 20, 40195, "", "=q1=Pygmy Oil",  };
	{ 21, 8827, "", "=q1=Elixir of Water Walking",  };
	{ 22, 46004, "", "=q1=Sealed Vial of Poison",  };
	{ 23, 48679, "", "=q1=Waterlogged Recipe",  };
	Prev = "FishingDaily1";
	Back = "FISHINGDAILYMENU";
};

---------------------
--- Jewelcrafting ---
---------------------

AtlasLoot_Data["JewelcraftingDaily1"] = {
	{ 1, 46917, "", "=q3=Design: Bold Cardinal Ruby",  };
	{ 2, 46919, "", "=q3=Design: Bright Cardinal Ruby",  };
	{ 3, 46918, "", "=q3=Design: Delicate Cardinal Ruby",  };
	{ 4, 46923, "", "=q3=Design: Flashing Cardinal Ruby",  };
	{ 5, 46921, "", "=q3=Design: Fractured Cardinal Ruby",  };
	{ 6, 46920, "", "=q3=Design: Precise Cardinal Ruby",  };
	{ 7, 46916, "", "=q3=Design: Runed Cardinal Ruby",  };
	{ 8, 46922, "", "=q3=Design: Subtle Cardinal Ruby",  };
	{ 9, 41576, "", "=q3=Design: Bold Scarlet Ruby",  };
	{ 10, 41577, "", "=q3=Design: Delicate Scarlet Ruby",  };
	{ 11, 41578, "", "=q3=Design: Flashing Scarlet Ruby",  };
	{ 16, 46930, "", "=q3=Design: Brilliant King's Amber",  };
	{ 17, 46932, "", "=q3=Design: Mystic King's Amber",  };
	{ 18, 46933, "", "=q3=Design: Quick King's Amber",  };
	{ 19, 46928, "", "=q3=Design: Rigid King's Amber",  };
	{ 20, 46929, "", "=q3=Design: Smooth King's Amber",  };
	{ 21, 46931, "", "=q3=Design: Thick King's Amber",  };
	{ 22, 41579, "", "=q3=Design: Quick Autumn's Glow",  };
	{ 23, 41580, "", "=q3=Design: Rigid Autumn's Glow",  };
	Next = "JewelcraftingDaily2";
	Back = "JEWELCRAFTINGDAILYMENU";
};

AtlasLoot_Data["JewelcraftingDaily2"] = {
	{ 1, 47010, "", "=q3=Design: Accurate Ametrine",  };
	{ 2, 47015, "", "=q3=Design: Champion's Ametrine",  };
	{ 3, 46949, "", "=q3=Design: Deadly Ametrine",  };
	{ 4, 47020, "", "=q3=Design: Deft Ametrine",  };
	{ 5, 46952, "", "=q3=Design: Durable Ametrine",  };
	{ 6, 47016, "", "=q3=Design: Empowered Ametrine",  };
	{ 7, 46953, "", "=q3=Design: Etched Ametrine",  };
	{ 8, 47019, "", "=q3=Design: Fierce Ametrine",  };
	{ 9, 47012, "", "=q3=Design: Glimmering Ametrine",  };
	{ 10, 47008, "", "=q3=Design: Glinting Ametrine",  };
	{ 11, 46948, "", "=q3=Design: Inscribed Ametrine",  };
	{ 12, 47021, "", "=q3=Design: Lucent Ametrine",  };
	{ 13, 46947, "", "=q3=Design: Luminous Ametrine",  };
	{ 14, 46950, "", "=q3=Design: Potent Ametrine",  };
	{ 15, 46956, "", "=q3=Design: Pristine Ametrine",  };
	{ 16, 47007, "", "=q3=Design: Reckless Ametrine",  };
	{ 17, 47022, "", "=q3=Design: Resolute Ametrine",  };
	{ 18, 47018, "", "=q3=Design: Resplendent Ametrine",  };
	{ 19, 47017, "", "=q3=Design: Stalwart Ametrine",  };
	{ 20, 47023, "", "=q3=Design: Stark Ametrine",  };
	{ 21, 46951, "", "=q3=Design: Veiled Ametrine",  };
	{ 22, 47011, "", "=q3=Design: Wicked Ametrine",  };
	{ 23, 41582, "", "=q3=Design: Glinting Monarch Topaz",  };
	{ 24, 41689, "", "=q3=Design: Luminous Monarch Topaz",  };
	{ 25, 41686, "", "=q3=Design: Potent Monarch Topaz",  };
	{ 26, 41690, "", "=q3=Design: Reckless Monarch Topaz",  };
	{ 27, 41687, "", "=q3=Design: Stark Monarch Topaz",  };
	{ 28, 41688, "", "=q3=Design: Veiled Monarch Topaz",  };
	Prev = "JewelcraftingDaily1";
	Next = "JewelcraftingDaily3";
	Back = "JEWELCRAFTINGDAILYMENU";
};

AtlasLoot_Data["JewelcraftingDaily3"] = {
	{ 1, 46900, "", "=q3=Design: Dazzling Eye of Zul",  };
	{ 2, 46897, "", "=q3=Design: Enduring Eye of Zul",  };
	{ 3, 46912, "", "=q3=Design: Energized Eye of Zul",  };
	{ 4, 46904, "", "=q3=Design: Forceful Eye of Zul",  };
	{ 5, 46910, "", "=q3=Design: Intricate Eye of Zul",  };
	{ 6, 46901, "", "=q3=Design: Jagged Eye of Zul",  };
	{ 7, 46909, "", "=q3=Design: Lambent Eye of Zul",  };
	{ 8, 46905, "", "=q3=Design: Misty Eye of Zul",  };
	{ 9, 46914, "", "=q3=Design: Opaque Eye of Zul",  };
	{ 10, 46911, "", "=q3=Design: Radiant Eye of Zul",  };
	{ 11, 46903, "", "=q3=Design: Seer's Eye of Zul",  };
	{ 12, 46913, "", "=q3=Design: Shattered Eye of Zul",  };
	{ 13, 46907, "", "=q3=Design: Shining Eye of Zul",  };
	{ 14, 46898, "", "=q3=Design: Steady Eye of Zul",  };
	{ 15, 46906, "", "=q3=Design: Sundered Eye of Zul",  };
	{ 16, 46908, "", "=q3=Design: Tense Eye of Zul",  };
	{ 17, 46902, "", "=q3=Design: Timeless Eye of Zul",  };
	{ 18, 46915, "", "=q3=Design: Turbid Eye of Zul",  };
	{ 19, 46899, "", "=q3=Design: Vivid Eye of Zul",  };
	{ 20, 41697, "", "=q3=Design: Enduring Forest Emerald",  };
	{ 21, 41692, "", "=q3=Design: Energized Forest Emerald",  };
	{ 22, 41693, "", "=q3=Design: Forceful Forest Emerald",  };
	{ 23, 41694, "", "=q3=Design: Intricate Forest Emerald",  };
	{ 24, 41696, "", "=q3=Design: Lambent Forest Emerald",  };
	{ 25, 41699, "", "=q3=Design: Seer's Forest Emerald",  };
	{ 26, 41698, "", "=q3=Design: Vivid Forest Emerald",  };
	Prev = "JewelcraftingDaily2";
	Next = "JewelcraftingDaily4";
	Back = "JEWELCRAFTINGDAILYMENU";
};

AtlasLoot_Data["JewelcraftingDaily4"] = {
	{ 1, 46934, "", "=q3=Design: Balanced Dreadstone",  };
	{ 2, 46941, "", "=q3=Design: Defender's Dreadstone",  };
	{ 3, 46936, "", "=q3=Design: Glowing Dreadstone",  };
	{ 4, 46942, "", "=q3=Design: Guardian's Dreadstone",  };
	{ 5, 46945, "", "=q3=Design: Infused Dreadstone",  };
	{ 6, 46943, "", "=q3=Design: Mysterious Dreadstone",  };
	{ 7, 46944, "", "=q3=Design: Puissant Dreadstone",  };
	{ 8, 46937, "", "=q3=Design: Purified Dreadstone",  };
	{ 9, 46940, "", "=q3=Design: Regal Dreadstone",  };
	{ 10, 46939, "", "=q3=Design: Royal Dreadstone",  };
	{ 11, 46938, "", "=q3=Design: Shifting Dreadstone",  };
	{ 12, 46935, "", "=q3=Design: Sovereign Dreadstone",  };
	{ 13, 46946, "", "=q3=Design: Tenuous Dreadstone",  };
	{ 14, 41702, "", "=q3=Design: Puissant Twilight Opal",  };
	{ 15, 41703, "", "=q3=Design: Regal Twilight Opal",  };
	{ 16, 41701, "", "=q3=Design: Royal Twilight Opal",  };
	Prev = "JewelcraftingDaily3";
	Next = "JewelcraftingDaily5";
	Back = "JEWELCRAFTINGDAILYMENU";
};

AtlasLoot_Data["JewelcraftingDaily5"] = {
	{ 1, 46927, "", "=q3=Design: Lustrous Majestic Zircon",  };
	{ 2, 46924, "", "=q3=Design: Solid Majestic Zircon",  };
	{ 3, 46925, "", "=q3=Design: Sparkling Majestic Zircon",  };
	{ 4, 46926, "", "=q3=Design: Stormy Majestic Zircon",  };
	{ 5, 41581, "", "=q3=Design: Lustrous Sky Sapphire",  };
	{ 6, 42138, "", "=q3=Design: Solid Sky Sapphire",  };
	{ 16, 41704, "", "=q3=Design: Chaotic Skyflare Diamond",  };
	{ 17, 41705, "", "=q3=Design: Effulgent Skyflare Diamond",  };
	{ 18, 41706, "", "=q3=Design: Ember Skyflare Diamond",  };
	{ 19, 41708, "", "=q3=Design: Insightful Earthsiege Diamond",  };
	{ 20, 41709, "", "=q3=Design: Invigorating Earthsiege Diamond",  };
	{ 21, 41710, "", "=q3=Design: Relentless Earthsiege Diamond",  };
	{ 22, 41707, "", "=q3=Design: Revitalizing Skyflare Diamond",  };
	{ 23, 41711, "", "=q3=Design: Trenchant Earthsiege Diamond",  };
	Prev = "JewelcraftingDaily4";
	Next = "JewelcraftingDaily6";
	Back = "JEWELCRAFTINGDAILYMENU";
};

AtlasLoot_Data["JewelcraftingDaily6"] = {
	{ 1, 42298, "", "=q3=Design: Bold Dragon's Eye",  };
	{ 2, 42299, "", "=q3=Design: Bright Dragon's Eye",  };
	{ 3, 42300, "", "=q3=Design: Brilliant Dragon's Eye",  };
	{ 4, 42301, "", "=q3=Design: Delicate Dragon's Eye",  };
	{ 5, 42302, "", "=q3=Design: Flashing Dragon's Eye",  };
	{ 6, 42303, "", "=q3=Design: Fractured Dragon's Eye",  };
	{ 7, 42304, "", "=q3=Design: Lustrous Dragon's Eye",  };
	{ 8, 42305, "", "=q3=Design: Mystic Dragon's Eye",  };
	{ 9, 42306, "", "=q3=Design: Precise Dragon's Eye",  };
	{ 10, 42307, "", "=q3=Design: Quick Dragon's Eye",  };
	{ 11, 42308, "", "=q3=Design: Rigid Dragon's Eye",  };
	{ 12, 42309, "", "=q3=Design: Runed Dragon's Eye",  };
	{ 13, 42310, "", "=q3=Design: Smooth Dragon's Eye",  };
	{ 14, 42311, "", "=q3=Design: Solid Dragon's Eye",  };
	{ 15, 42312, "", "=q3=Design: Sparkling Dragon's Eye",  };
	{ 16, 42313, "", "=q3=Design: Stormy Dragon's Eye",  };
	{ 17, 42314, "", "=q3=Design: Subtle Dragon's Eye",  };
	{ 18, 42315, "", "=q3=Design: Thick Dragon's Eye",  };
	{ 20, 42652, "", "=q4=Design: Titanium Earthguard Chain",  };
	{ 21, 42649, "", "=q4=Design: Titanium Earthguard Ring",  };
	{ 22, 42648, "", "=q4=Design: Titanium Impact Band",  };
	{ 23, 42651, "", "=q4=Design: Titanium Impact Choker",  };
	{ 24, 42653, "", "=q4=Design: Titanium Spellshock Necklace",  };
	{ 25, 42650, "", "=q4=Design: Titanium Spellshock Ring",  };
	Prev = "JewelcraftingDaily5";
	Back = "JEWELCRAFTINGDAILYMENU";
};

---------------------
---   High Risk   ---
---------------------

AtlasLoot_Data["AlchemyHighRiskTBC"] = {
	Name = ALCHEMY .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979362", "1203258", "=q3=Impure Flask of Manifesting Power", "" };
		{ 2, "s979364", "1203260", "=q3=Impure Flask of the Warsong", "" };
		{ 3, "s979366", "1203262", "=q3=Impure Flask of the Kirin Tor", "" };
		{ 4, "s979368", "1203264", "=q3=Impure Flask of Butchery", "" };
		{ 5, "s979370", "1203266", "=q3=Impure Flask of the Unyielding", "" };
		{ 6, "s979372", "1203268", "=q3=Impure Flask of Unrelenting Power", "" };
		{ 7, "s979374", "1203270", "=q3=Impure Flask of Savage Assault", "" };
		{ 8, "s979376", "1203272", "=q3=Impure Flask of Shattering Thunder", "" };
		{ 9, "s979378", "1203274", "=q3=Impure Flask of the Executioner", "" };
		{ 10, "s979380", "1203276", "=q3=Impure Flask of Deep Meditation", "" };
		{ 11, "s979382", "1203278", "=q3=Impure Flask of Adept Striking", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979363", "1203259", "=q4=Pure Flask of Manifesting Power", "" };
		{ 2, "s979365", "1203261", "=q4=Pure Flask of the Warsong", "" };
		{ 3, "s979367", "1203263", "=q4=Pure Flask of the Kirin Tor", "" };
		{ 4, "s979369", "1203265", "=q4=Pure Flask of Butchery", "" };
		{ 5, "s979371", "1203267", "=q4=Pure Flask of the Unyielding", "" };
		{ 6, "s979373", "1203269", "=q4=Pure Flask of Unrelenting Power", "" };
		{ 7, "s979375", "1203271", "=q4=Pure Flask of Savage Assault", "" };
		{ 8, "s979377", "1203273", "=q4=Pure Flask of Shattering Thunder", "" };
		{ 9, "s979379", "1203275", "=q4=Pure Flask of the Executioner", "" };
		{ 10, "s979381", "1203277", "=q4=Pure Flask of Deep Meditation", "" };
		{ 11, "s979383", "1203279", "=q4=Pure Flask of Adept Striking", "" };
	};
};

AtlasLoot_Data["SmithingHighRiskTBC"] = {
	Name = BLACKSMITHING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979534", "1204033", "=q3=Hulking Belt Buckle", "" };
		{ 2, "s979536", "1204035", "=q3=Blade Master's Belt Buckle", "" };
		{ 3, "s979538", "1204037", "=q3=Agile Belt Buckle", "" };
		{ 4, "s979540", "1204039", "=q3=Eluding Belt Buckle", "" };
		{ 5, "s979542", "1204041", "=q3=Scholar's Belt Buckle", "" };
		{ 6, "s979544", "1204043", "=q3=Priestly Belt Buckle", "" };
		{ 7, "s979546", "1204045", "=q3=Champion\'s Belt Buckle", "" };
		{ 8, "s979548", "1204047", "=q3=Guarded Belt Buckle", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979535", "1204034", "=q4=Mastercraft Hulking Belt Buckle", "" };
		{ 2, "s979537", "1204036", "=q4=Mastercraft Blade Master's Belt Buckle", "" };
		{ 3, "s979539", "1204038", "=q4=Mastercraft Agile Belt Buckle", "" };
		{ 4, "s979541", "1204040", "=q4=Mastercraft Eluding Belt Buckle", "" };
		{ 5, "s979543", "1204042", "=q4=Mastercraft Scholar's Belt Buckle", "" };
		{ 6, "s979545", "1204044", "=q4=Mastercraft Priestly Belt Buckle", "" };
		{ 7, "s979547", "1204046", "=q4=Mastercraft Champion\'s Belt Buckle", "" };
		{ 8, "s979549", "1204048", "=q4=Mastercraft Guarded Belt Buckle", "" };
	};
};

AtlasLoot_Data["LeatherworkingHighRiskTBC"] = {
	Name = LEATHERWORKING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979522", "1204021", "=q3=Cobra Strike Gambeson", "" };
		{ 2, "s979524", "1204023", "=q3=Fel Strike Gambeson", "" };
		{ 3, "s979526", "1204025", "=q3=Wind Gambeson", "" };
		{ 4, "s979528", "1204027", "=q3=True Strike Gambeson", "" };
		{ 5, "s979530", "1204029", "=q3=Clefthoof Gambeson", "" };
		{ 6, "s979532", "1204031", "=q3=Subtle Gambeson", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979523", "1204022", "=q4=Mastercraft Cobra Strike Gambeson", "" };
		{ 2, "s979525", "1204024", "=q4=Mastercraft Fel Strike Gambeson", "" };
		{ 3, "s979527", "1204026", "=q4=Mastercraft Wind Gambeson", "" };
		{ 4, "s979529", "1204028", "=q4=Mastercraft True Strike Gambeson", "" };
		{ 5, "s979531", "1204030", "=q4=Mastercraft Clefthoof Gambeson", "" };
		{ 6, "s979533", "1204032", "=q4=Mastercraft Subtle Gambeson", "" };
	};
};

AtlasLoot_Data["EngineeringHighRiskTBC"] = {
	Name = ENGINEERING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979550", "1204101", "=q3=Gnomish Magnification Polish", "" };
		{ 2, "s979552", "1204103", "=q3=Gnomish Sharpening Polish", "" };
		{ 3, "s979554", "1204105", "=q3=Gnomish Prismatic Polish", "" };
		{ 4, "s979556", "1204107", "=q3=Felfire Scope", "" };
		{ 5, "s979558", "1204109", "=q3=Sighted Scope", "" };
		{ 6, "s979560", "1204111", "=q3=Quickshot Scope", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979551", "1204102", "=q4=Fine Gnomish Magnification Polish", "" };
		{ 2, "s979553", "1204104", "=q4=Fine Gnomish Sharpening Polish", "" };
		{ 3, "s979555", "1204106", "=q4=Fine Gnomish Prismatic Polish", "" };
		{ 4, "s979557", "1204108", "=q4=Focused Felfire Scope", "" };
		{ 5, "s979559", "1204110", "=q4=Focused Sighted Scope", "" };
		{ 6, "s979561", "1204112", "=q4=Focused Quickshot Scope", "" };
	};
};

AtlasLoot_Data["EnchantingHighRiskTBC"] = {
	Name = ENCHANTING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s1968677", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Assault", "" };
		{ 2, "s1968680", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Assault", "" };
		{ 3, "s1968683", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Evoker", "" };
		{ 4, "s1968686", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Assault", "" };
		{ 5, "s1968689", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Channeler", "" };
		{ 6, "s1968692", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Omen Strikes", "" };
		{ 7, "s1968695", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Flows", "" };
		{ 8, "s1968698", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Void Blasting", "" };
		{ 9, "s1968701", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Dread Precision", "" };
		{ 10, "s1968770", "Spell_Holy_GreaterHeal", "=q3=Enchant Weapon - Twisted Crusader", "" };
	};
	{
		Name = "Epic";
		{ 1, "s1968678", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Assault","" };
		{ 2, "s1968681", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Assault","" };
		{ 3, "s1968684", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Evoker","" };
		{ 4, "s1968687", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Assault","" };
		{ 5, "s1968690", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Channeler","" };
		{ 6, "s1968693", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Omen Strikes","" };
		{ 7, "s1968696", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Flows", "" };
		{ 8, "s1968699", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Void Blasting","" };
		{ 9, "s1968702", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Dread Precision","" };
		{ 10, "s1968771", "Spell_Holy_GreaterHeal", "=q4=Enchant Weapon - Overpowering Twisted Crusader","" };
	};
};

AtlasLoot_Data["TailoringHighRiskTBC"] = {
	Name = TAILORING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979562", "1204061", "=q3=Armored Cloak Lining", "" };
		{ 2, "s979564", "1204063", "=q3=Chaneller\'s Cloak Lining", "" };
		{ 3, "s979566", "1204065", "=q3=Energizing Cloak Lining", "" };
		{ 4, "s979568", "1204067", "=q3=Rager\'s Cloak Lining", "" };
		{ 5, "s979570", "1204069", "=q3=Steadfast Cloak Lining", "" };
		{ 6, "s979572", "1204071", "=q3=Shifting Cloak Lining", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979563", "1204062", "=q4=Fitted Armored Cloak Lining", "" };
		{ 2, "s979565", "1204064", "=q4=Fitted Chaneller\'s Cloak Lining", "" };
		{ 3, "s979567", "1204066", "=q4=Fitted Energizing Cloak Lining", "" };
		{ 4, "s979569", "1204068", "=q4=Fitted Rager\'s Cloak Lining", "" };
		{ 5, "s979571", "1204070", "=q4=Fitted Steadfast Cloak Lining", "" };
		{ 6, "s979573", "1204072", "=q4=Fitted Shifting Cloak Lining", "" };
	};
};

AtlasLoot_Data["JewelcraftingHighRiskTBC"] = {
	Name = JEWELCRAFTING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979639", "1204165", "=q3=Deep Gold Twisted Pendant", "" };
		{ 2, "s979641", "1204167", "=q3=Bloodshadow Twisted Pendant", "" };
		{ 3, "s979643", "1204169", "=q3=Azureflame Twisted Pendant", "" };
		{ 4, "s979645", "1204171", "=q3=Shadowgold Dread Pendant", "" };
		{ 5, "s979647", "1204173", "=q3=Deep Azure Dread Pendant", "" };
		{ 6, "s979649", "1204175", "=q3=Bloodflame Dread Pendant", "" };
		{ 7, "s979651", "1204177", "=q3=Living Night Void Pendant", "" };
		{ 8, "s979653", "1204179", "=q3=Dawnstar Void Pendant", "" };
		{ 9, "s979655", "1204181", "=q3=Noble Talasite Void Pendant", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979640", "1204166", "=q4=Engraved Deep Gold Twisted Pendant", "" };
		{ 2, "s979642", "1204168", "=q4=Engraved Bloodshadow Twisted Pendant", "" };
		{ 3, "s979644", "1204170", "=q4=Engraved Azureflame Twisted Pendant", "" };
		{ 4, "s979646", "1204172", "=q4=Engraved Shadowgold Dread Pendant", "" };
		{ 5, "s979648", "1204174", "=q4=Engraved Deep Azure Dread Pendant", "" };
		{ 6, "s979650", "1204176", "=q4=Engraved Bloodflame Dread Pendant", "" };
		{ 7, "s979652", "1204178", "=q4=Engraved Living Night Void Pendant", "" };
		{ 8, "s979654", "1204180", "=q4=Engraved Dawnstar Void Pendant", "" };
		{ 9, "s979656", "1204182", "=q4=Engraved Noble Talasite Void Pendant", "" };
	};
};

AtlasLoot_Data["CookingHighRiskTBC"] = {
	Name = COOKING .. " High Risk";
	Type = "CraftingNoBF";
	{
		Name = "Rare";
		{ 1, "s979384", "1203280", "=q3=Infused Living Soup", "" };
		{ 2, "s979386", "1203282", "=q3=Infused Charred Steak", "" };
		{ 3, "s979388", "1203284", "=q3=Infused Steamed Wontons", "" };
		{ 4, "s979390", "1203286", "=q3=Infused Air Fried Chops", "" };
		{ 5, "s979392", "1203288", "=q3=Infused Rock\'s Stew (Airsick lowlander flavor text)", "" };
		{ 6, "s979394", "1203290", "=q3=Infused Clear-Cut Chops", "" };
		{ 7, "s979396", "1203292", "=q3=Infused Clear-Cut Wontons", "" };
		{ 8, "s979398", "1203294", "=q3=Infused Clear-Cut Steak", "" };
		{ 9, "s979463", "1203358", "=q3=Infused Bold Simmered Stew", "" };
		{ 10, "s979465", "1203360", "=q3=Infused Bold Duck Stew", "" };
		{ 11, "s979447", "1203338", "=q3=Infused Subtle Chops", "" };
		{ 12, "s979445", "1203340", "=q3=Infused Subtle Steak", "" };
		{ 13, "s979447", "1203342", "=q3=Infused Subtle Wontons", "" };
		{ 14, "s979449", "1203344", "=q3=Infused Subtle Soup", "" };
		{ 15, "s979451", "1203346", "=q3=Infused Bold Stew", "" };
		{ 16, "s979400", "1203296", "=q3=Infused Piercing Chops", "" };
		{ 17, "s979402", "1203298", "=q3=Infused Piercing Steak", "" };
		{ 18, "s979404", "1203300", "=q3=Infused Seared Wontons", "" };
		{ 19, "s979406", "1203302", "=q3=Infused Seared Chops", "" };
		{ 20, "s979421", "1203316", "=q3=Infused Duck Stew", "" };
		{ 21, "s979423", "1203318", "=q3=Infused Chunky Stew", "" };
		{ 22, "s979425", "1203320", "=q3=Infused Simmered Stew", "" };
		{ 23, "s979427", "1203322", "=q3=Infused Wizard Wontons", "" };
		{ 24, "s979429", "1203324", "=q3=Infused Wizard Soup", "" };
		{ 25, "s979431", "1203326", "=q3=Infused Heightened Wontons", "" };
		{ 26, "s979441", "1203336", "=q3=Infused Vibrant Chops", "" };
		{ 27, "s979408", "1203304", "=q3=Infused Savory Stew", "" };
		{ 28, "s979410", "1203306", "=q3=Infused Savory Chops", "" };
	};
	{
		Name = "Rare";
		{ 1, "s979413", "1203308", "=q3=Infused Savory Steak", "" };
		{ 2, "s979415", "1203310", "=q3=Infused Savory Wontons", "" };
		{ 3, "s979417", "1203312", "=q3=Infused Red-Hot Stew", "" };
		{ 4, "s979419", "1203314", "=q3=Infused Blazing Stew", "" };
		{ 5, "s979433", "1203328", "=q3=Infused Hearty Living Soup", "" };
		{ 6, "s979435", "1203330", "=q3=Infused Hearty Air Fried Chops", "" };
		{ 7, "s979437", "1203332", "=q3=Infused Hearty Charred Steak", "" };
		{ 8, "s979439", "1203334", "=q3=Infused Hearty Steamed Wontons", "" };
		{ 9, "s979453", "1203348", "=q3=Infused Mana Charged Roast", "" };
		{ 10, "s979455", "1203350", "=q3=Infused Sizzling Roast", "" };
		{ 11, "s979457", "1203352", "=q3=Infused Wild Roast", "" };
		{ 12, "s979459", "1203354", "=q3=Infused Winter Roast", "" };
		{ 13, "s979461", "1203356", "=q3=Infused Blackened Roast", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979385", "1203281", "=q4=Charged Living Soup", "" };
		{ 2, "s979387", "1203283", "=q4=Charged Charred Steak", "" };
		{ 3, "s979389", "1203285", "=q4=Charged Steamed Wontons", "" };
		{ 4, "s979391", "1203287", "=q4=Charged Air Fried Chops", "" };
		{ 5, "s979393", "1203289", "=q4=Charged Rock\'s Stew (Airsick lowlander flavor text)", "" };
		{ 6, "s979395", "1203291", "=q4=Charged Clear-Cut Chops", "" };
		{ 7, "s979397", "1203293", "=q4=Charged Clear-Cut Wontons", "" };
		{ 8, "s979399", "1203295", "=q4=Charged Clear-Cut Steak", "" };
		{ 9, "s979464", "1203359", "=q4=Charged Bold Simmered Stew", "" };
		{ 10, "s979466", "1203361", "=q4=Charged Bold Duck Stew", "" };
		{ 11, "s979444", "1203339", "=q4=Charged Subtle Chops", "" };
		{ 12, "s979446", "1203341", "=q4=Charged Subtle Steak", "" };
		{ 13, "s979448", "1203343", "=q4=Charged Subtle Wontons", "" };
		{ 14, "s979450", "1203345", "=q4=Charged Subtle Soup", "" };
		{ 15, "s979452", "1203347", "=q4=Charged Bold Stew", "" };
		{ 16, "s979401", "1203297", "=q4=Charged Piercing Chops", "" };
		{ 17, "s979403", "1203299", "=q4=Charged Piercing Steak", "" };
		{ 18, "s979405", "1203301", "=q4=Charged Seared Wontons", "" };
		{ 19, "s979407", "1203303", "=q4=Charged Seared Chops", "" };
		{ 20, "s979422", "1203317", "=q4=Charged Duck Stew", "" };
		{ 21, "s979424", "1203319", "=q4=Charged Chunky Stew", "" };
		{ 22, "s979426", "1203321", "=q4=Charged Simmered Stew", "" };
		{ 23, "s979428", "1203323", "=q4=Charged Wizard Wontons", "" };
		{ 24, "s979430", "1203325", "=q4=Charged Wizard Soup", "" };
		{ 25, "s979432", "1203327", "=q4=Charged Heightened Wontons", "" };
		{ 26, "s979442", "1203337", "=q4=Charged Vibrant Chops", "" };
		{ 27, "s979409", "1203305", "=q4=Charged Savory Stew", "" };
		{ 28, "s979412", "1203307", "=q4=Charged Savory Chops", "" };
	};
	{
		Name = "Epic";
		{ 1, "s979414", "1203309", "=q4=Charged Savory Steak", "" };
		{ 2, "s979416", "1203311", "=q4=Charged Savory Wontons", "" };
		{ 3, "s979418", "1203313", "=q4=Charged Red-Hot Stew", "" };
		{ 4, "s979420", "1203315", "=q4=Charged Blazing Stew", "" };
		{ 5, "s979434", "1203329", "=q4=Charged Hearty Living Soup", "" };
		{ 6, "s979436", "1203331", "=q4=Charged Hearty Air Fried Chops", "" };
		{ 7, "s979438", "1203333", "=q4=Charged Hearty Charred Steak", "" };
		{ 8, "s979440", "1203335", "=q4=Charged Hearty Steamed Wontons", "" };
		{ 9, "s979454", "1203349", "=q4=Charged Mana Charged Roast", "" };
		{ 10, "s979456", "1203351", "=q4=Charged Sizzling Roast", "" };
		{ 11, "s979458", "1203353", "=q4=Charged Wild Roast", "" };
		{ 12, "s979460", "1203355", "=q4=Charged Winter Roast", "" };
		{ 13, "s979462", "1203357", "=q4=Charged Blackened Roast", "" };
	};
};
