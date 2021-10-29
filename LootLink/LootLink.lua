--[[

	LootLink 4.00: An in-game item database


	- Watches all chat links you see to cache link color and link data
	- Automatically extracts data from items already in or added to your inventory
	- Automatically caches link data from items already in or added to your bank
	- Automatically inspects your target and extracts data for each of their equipped items
	- Automatically gets link data from your auction queries
	- Can perform a fully automatic scan of the entire auction house inventory
	- Provides a browsable, searchable window that allows you to find any item in the cache
	- Allows you to shift-click items in the browse window to insert links in the chat edit box
	
]]

--------------------------------------------------------------------------------------------------
-- Localizable strings
--------------------------------------------------------------------------------------------------

BINDING_HEADER_LOOTLINK = "LootLink Buttons";
BINDING_NAME_TOGGLELOOTLINK = "Toggle LootLink";

LOOTLINK_TITLE = "LootLink";
LOOTLINK_SEARCH_TITLE = "LootLink Search";
LOOTLINK_TITLE_FORMAT_SINGULAR = "LootLink - 1 item total";
LOOTLINK_TITLE_FORMAT_PLURAL = "LootLink - %d items total";
LOOTLINK_TITLE_FORMAT_PARTIAL_SINGULAR = "LootLink - 1 item found";
LOOTLINK_TITLE_FORMAT_PARTIAL_PLURAL = "LootLink - %d items found";
LOOTLINK_SEARCH_LABEL = "Search...";
LOOTLINK_REFRESH_LABEL = "Refresh";
LOOTLINK_RESET_LABEL = "Reset";
LOOTLINK_AUCTION_SCAN_START = "LootLink: scanning page 1...";
LOOTLINK_AUCTION_PAGE_N = "LootLink: scanning page %d of %d...";
LOOTLINK_AUCTION_SCAN_DONE = "LootLink: auction scanning finished";
LOOTLINK_SCHEDULED_AUCTION_SCAN = "LootLink: will perform a full auction scan the next time you talk to an auctioneer.";
LOOTLINK_ITEM_RENAMED = "<item was renamed since last seen>";

LOOTLINK_STATUS = "status";				-- must be lowercase; command to display status
LOOTLINK_AUTOCOMPLETE = "autocomplete";	-- must be lowercase; command to toggle autocompletion support
LOOTLINK_AUCTION = "auction";			-- must be lowercase; command to scan auctions
LOOTLINK_SCAN = "scan";					-- must be lowercase; alias for command to scan auctions

LOOTLINK_RESET_NEEDS_CONFIRM = "|cffff0000LootLink: Warning!  \n\nThis will irreversibly erase all LootLink data.";
LOOTLINK_RESET_DONE = "|cffffff00LootLink: All data erased.|r";
LOOTLINK_LIGHTMODE_NEEDS_CONFIRM = "|cffff0000LootLink: Warning!  \n\nThis will disable full-text search, losing known text for all items, but using less memory.";
LOOTLINK_LIGHTMODE_ABORTED = "|cff00ff00LootLink: Light mode was NOT confirmed and no changes will be made.|r";
LOOTLINK_LIGHTMODE_DONE = "|cffffff00LootLink: Light mode enabled.  Full-text search is disabled and memory is no longer used for item descriptions.|r";

LOOTLINK_STATUS_HEADER = "|cffffff00LootLink (version %.2f) status:|r";
LOOTLINK_DATA_VERSION = "LootLink: %d items known [%d on %s], data version %.2f";
LOOTLINK_FULL_MODE = "LootLink: full mode; full-text search is enabled";
LOOTLINK_LIGHT_MODE = "LootLink: light mode; full-text search is disabled";
LOOTLINK_AUTOCOMPLETE_ENABLED = "LootLink: chat autocomplete is enabled";
LOOTLINK_AUTOCOMPLETE_DISABLED = "LootLink: chat autocomplete is disabled";

LOOTLINK_DATA_UPGRADE_HELP_TEXT0 = "|cffffff00LootLink's data format has significantly changed and your existing data could not be upgraded.|r";
LOOTLINK_DATA_UPGRADE_HELP_TEXT1 = "|cffffff00LootLink's data format has changed; your existing data has been upgraded to the new format automatically.|r";

LOOTLINK_DATA_UPGRADE_HELP = {
	{ version = 110, text = LOOTLINK_DATA_UPGRADE_HELP_TEXT0, },
	{ version = 201, minVersion = 110, text = LOOTLINK_DATA_UPGRADE_HELP_TEXT1, },
};

LLS_TEXT = "All text:";
LLS_NAME = "Name:";
LLS_RARITY = "Rarity:";
LLS_BINDS = "Binds:";
LLS_UNIQUE = "Is Unique?";
LLS_CACHED = "Not Cached?";
LLS_USABLE = "Usable?";
LLS_LOCATION = "Equip location:";
LLS_MINIMUM_LEVEL = "Minimum level:";
LLS_MAXIMUM_LEVEL = "Maximum level:";
LLS_LEVEL_RANGE = "Level Range:";
LLS_MINIMUM_ILEVEL = "Minimum iLevel:";
LLS_MAXIMUM_ILEVEL = "Maximum iLevel:";
LLS_ILEVEL_RANGE = "iLevel Range:";
LLS_TYPE = "Type:";
LLS_SUBTYPE_ARMOR = "Armor subtype:";
LLS_SUBTYPE_GEM = "Slot type:";
LLS_SUBTYPE_GLYPH = "Glyph type:";
LLS_SUBTYPE_WEAPON = "Weapon subtype:";
LLS_SUBTYPE_SHIELD = "Shield subtype:";
LLS_SUBTYPE_RECIPE = "Recipe subtype:";
LLS_MINIMUM_DAMAGE = "Min. low damage:";
LLS_MAXIMUM_DAMAGE = "Min. high damage:";
LLS_DAMAGE_RANGE = "Damage Range:";
LLS_MINIMUM_SPEED = "Minimum speed:";
LLS_MAXIMUM_SPEED = "Maximum speed:";
LLS_SPEED_RANGE = "Speed Range:";
LLS_MINIMUM_DPS = "Minimum DPS:";
LLS_MINIMUM_ARMOR = "Minimum armor:";
LLS_MINIMUM_BLOCK = "Minimum block:";
LLS_MINIMUM_SLOTS = "Minimum slots:";
LLS_MINIMUM_SKILL = "Minimum skill:";
LLS_MAXIMUM_SKILL = "Maximum skill:";
LLS_SKILL_RANGE = "Skill Range:";
LLS_TEXT_DISABLED = "(full-text search is disabled)";

local LL = { };

LL.ANY = "Any";
LL.POOR = "Poor";
LL.COMMON = "Common";
LL.UNCOMMON = "Uncommon";
LL.RARE = "Rare";
LL.EPIC = "Epic";
LL.LEGENDARY = "Legendary";
LL.HEIRLOOM = "Heirloom";
LL.ARTIFACT = "Artifact";
LL.DOES_NOT = "Does Not";
LL.ON_EQUIP = "On Equip";
LL.ON_PICKUP = "On Pickup";
LL.ON_USE = "On Use";
LL.TO_ACCOUNT = "To Account";
LL.ARMOR = "Armor";
LL.WEAPON = "Weapon";
LL.SHIELD = "Shield";
LL.CONTAINER = "Container";
LL.OTHER = "Other";
LL.RECIPE = "Recipe";
LL.GEM = "Gem";
LL.GLYPH = "Glyph";
LL.CLOTH = "Cloth";
LL.LEATHER = "Leather";
LL.MAIL = "Mail";
LL.PLATE = "Plate";
LL.AXE = "Axe";
LL.BOW = "Bow";
LL.DAGGER = "Dagger";
LL.MACE = "Mace";
LL.STAFF = "Staff";
LL.SWORD = "Sword";
LL.GUN = "Gun";
LL.WAND = "Wand";
LL.POLEARM = "Polearm";
LL.FIST_WEAPON = "Fist Weapon";
LL.CROSSBOW = "Crossbow";
LL.THROWN = "Thrown";
LL.BUCKLER = "Buckler";
LL.ALCHEMY = "Alchemy";
LL.BLACKSMITHING = "Blacksmithing";
LL.COOKING = "Cooking";
LL.ENCHANTING = "Enchanting";
LL.ENGINEERING = "Engineering";
LL.LEATHERWORKING = "Leatherworking";
LL.TAILORING = "Tailoring";
LL.JEWELCRAFTING = "Jewelcrafting";
LL.INSCRIPTION = "Inscription";
LL.RED = "Red";
LL.YELLOW = "Yellow";
LL.BLUE = "Blue";
LL.META = "Meta";
LL.MAJOR = "Major";
LL.MINOR = "Minor";
LL.STRENGTH = "Strength";
LL.AGILITY = "Agility";
LL.STAMINA = "Stamina";
LL.INTELLECT = "Intellect";
LL.SPIRIT = "Spirit";
LL.ATTACK_POWER = "Attack Power";
LL.EXPERTISE_RATING = "Expertise Rating";
LL.ARMOR_PENETRATION_RATING = "Armor Penetration Rating";
LL.HIT_RATING = "Hit Rating";
LL.CRIT_RATING = "Crit Rating";
LL.HASTE_RATING = "Haste Rating";
LL.SPELL_POWER = "Spell Power";
LL.MANA_REGENERATION = "Mana per 5";
LL.SPELL_PENETRATION = "Spell Penetration";
LL.RESILIENCE_RATING = "Resilience Rating";
LL.DEFENSE_RATING = "Defense Rating";
LL.DODGE_RATING = "Dodge Rating";
LL.PARRY_RATING = "Parry Rating";
LL.BLOCK_RATING = "Block Rating";
LL.BLOCK_VALUE = "Block Value";

-- For sorting
LL.SORT_NAME = "Name";
LL.SORT_RARITY = "Rarity";
LL.SORT_ILEVEL = "iLevel";
LL.SORT_BINDS = "Binds";
LL.SORT_UNIQUE = "Unique";
LL.SORT_LOCATION = "Location";
LL.SORT_TYPE = "Type";
LL.SORT_SUBTYPE = "Subtype";
LL.SORT_MINDAMAGE = "Min Damage";
LL.SORT_MAXDAMAGE = "Max Damage";
LL.SORT_SPEED = "Speed";
LL.SORT_DPS = "DPS";
LL.SORT_ARMOR = "Armor";
LL.SORT_BLOCK = "Block";
LL.SORT_SLOTS = "Slots";
LL.SORT_LEVEL = "Level";
LL.SORT_SKILL = "Skill Level";

--------------------------------------------------------------------------------------------------
-- Local LootLink variables
--------------------------------------------------------------------------------------------------

-- The table of sorted indices for display
local DisplayIndices;

-- PanelLayout attributes for our frames
local LootLinkPanelLayout = {
	LootLinkFrame = { defined = true, enabled = true, area = "left", pushable = 11, whileDead = 1 },
	LootLinkSearchFrame = { defined = true, enabled = true, area = "center", pushable = 0, whileDead = 1 },
};

-- The SimpleDropDown library
local sdd = LibStub:GetLibrary("SimpleDropDown-1.0")

LL.STATE_NAME = 0;
LL.STATE_HEROIC = 1;
LL.STATE_BOUND = 2;
LL.STATE_UNIQUE = 3;
LL.STATE_LOCATION = 4;
LL.STATE_TYPE = 5;
LL.STATE_DAMAGE = 6;
LL.STATE_DPS = 7;
LL.STATE_ARMOR = 8;
LL.STATE_BLOCK = 9;
LL.STATE_GLYPH = 10;
LL.STATE_CONTAINER = 11;
LL.STATE_MATCHES = 12;
LL.STATE_REQUIRES = 13;
LL.STATE_FINISH = 14;

LL.STAT_STRENGTH = 0;
LL.STAT_AGILITY = 1;
LL.STAT_STAMINA = 2;
LL.STAT_INTELLECT = 3;
LL.STAT_SPIRIT = 4;
LL.STAT_ATTACK_POWER = 5;
LL.STAT_EXPERTISE_RATING = 6;
LL.STAT_ARMOR_PENETRATION_RATING = 7;
LL.STAT_HIT_RATING = 8;
LL.STAT_CRIT_RATING = 9;
LL.STAT_HASTE_RATING = 10;
LL.STAT_SPELL_POWER = 11;
LL.STAT_MANA_REGENERATION = 12;
LL.STAT_SPELL_PENETRATION = 13;
LL.STAT_RESILIENCE_RATING = 14;
LL.STAT_DEFENSE_RATING = 15;
LL.STAT_DODGE_RATING = 16;
LL.STAT_PARRY_RATING = 17;
LL.STAT_BLOCK_RATING = 18;
LL.STAT_BLOCK_VALUE = 19;

LL.BINDS_DOES_NOT_BIND = 0;
LL.BINDS_EQUIP = 1;
LL.BINDS_PICKUP = 2;
LL.BINDS_USED = 3; 
LL.BINDS_ACCOUNT = 4;

LL.UNIQUE_NOT_UNIQUE = 0;
LL.UNIQUE_GENERIC = 1;
LL.UNIQUE_EQUIPPED = 2;

LL.TYPE_ARMOR = 0;
LL.TYPE_WEAPON = 1;
LL.TYPE_SHIELD = 2;
LL.TYPE_RECIPE = 3;
LL.TYPE_CONTAINER = 4;
LL.TYPE_MISC = 5;
LL.TYPE_GEM = 6;
LL.TYPE_GLYPH = 7;

LL.SUBTYPE_ARMOR_CLOTH = 0;
LL.SUBTYPE_ARMOR_LEATHER = 1;
LL.SUBTYPE_ARMOR_MAIL = 2;
LL.SUBTYPE_ARMOR_PLATE = 3;

local lColorSortTable = { };
lColorSortTable["ffe6cc80"] = 1;	-- artifact, tan
lColorSortTable["ffe6cc80"] = 2;	-- heirloom, tan
lColorSortTable["ffff8000"] = 3;	-- legendary, orange
lColorSortTable["ffa335ee"] = 4;	-- epic, purple
lColorSortTable["ff0070dd"] = 5;	-- rare, blue
lColorSortTable["ff1eff00"] = 6;	-- uncommon, green
lColorSortTable["ffffffff"] = 7;	-- common, white
lColorSortTable["ff9d9d9d"] = 8;	-- poor, gray
lColorSortTable["ff40ffc0"] = 100;	-- unknown, teal

local ArmorSubtypes = { };
ArmorSubtypes["Cloth"] = LL.SUBTYPE_ARMOR_CLOTH;
ArmorSubtypes["Leather"] = LL.SUBTYPE_ARMOR_LEATHER;
ArmorSubtypes["Mail"] = LL.SUBTYPE_ARMOR_MAIL;
ArmorSubtypes["Plate"] = LL.SUBTYPE_ARMOR_PLATE;

LL.SUBTYPE_GEM_META = 0;
LL.SUBTYPE_GEM_RED = 1;
LL.SUBTYPE_GEM_YELLOW = 2;
LL.SUBTYPE_GEM_BLUE = 4;

local GemSubtypes = { };
GemSubtypes["Meta"] = LL.SUBTYPE_GEM_META;
GemSubtypes["Red"] = LL.SUBTYPE_GEM_RED;
GemSubtypes["Yellow"] = LL.SUBTYPE_GEM_YELLOW;
GemSubtypes["Blue"] = LL.SUBTYPE_GEM_BLUE;

LL.SUBTYPE_GLYPH_MAJOR = 0;
LL.SUBTYPE_GLYPH_MINOR = 1;

local GlyphSubtypes = { };
GlyphSubtypes["Major"] = LL.SUBTYPE_GLYPH_MAJOR;
GlyphSubtypes["Minor"] = LL.SUBTYPE_GLYPH_MINOR;

LL.SUBTYPE_WEAPON_AXE = 0;
LL.SUBTYPE_WEAPON_BOW = 1;
LL.SUBTYPE_WEAPON_DAGGER = 2;
LL.SUBTYPE_WEAPON_MACE = 3;
-- 4 is available
LL.SUBTYPE_WEAPON_STAFF = 5;
LL.SUBTYPE_WEAPON_SWORD = 6;
LL.SUBTYPE_WEAPON_GUN = 7;
LL.SUBTYPE_WEAPON_WAND = 8;
LL.SUBTYPE_WEAPON_THROWN = 9;
LL.SUBTYPE_WEAPON_POLEARM = 10;
LL.SUBTYPE_WEAPON_FIST_WEAPON = 11;
LL.SUBTYPE_WEAPON_CROSSBOW = 12;

local WeaponSubtypes = { };
WeaponSubtypes["Axe"] = LL.SUBTYPE_WEAPON_AXE;
WeaponSubtypes["Bow"] = LL.SUBTYPE_WEAPON_BOW;
WeaponSubtypes["Dagger"] = LL.SUBTYPE_WEAPON_DAGGER;
WeaponSubtypes["Mace"] = LL.SUBTYPE_WEAPON_MACE;
WeaponSubtypes["Staff"] = LL.SUBTYPE_WEAPON_STAFF;
WeaponSubtypes["Sword"] = LL.SUBTYPE_WEAPON_SWORD;
WeaponSubtypes["Gun"] = LL.SUBTYPE_WEAPON_GUN;
WeaponSubtypes["Wand"] = LL.SUBTYPE_WEAPON_WAND;
WeaponSubtypes["Thrown"] = LL.SUBTYPE_WEAPON_THROWN;
WeaponSubtypes["Polearm"] = LL.SUBTYPE_WEAPON_POLEARM;
WeaponSubtypes["Fist Weapon"] = LL.SUBTYPE_WEAPON_FIST_WEAPON;
WeaponSubtypes["Crossbow"] = LL.SUBTYPE_WEAPON_CROSSBOW;

LL.SUBTYPE_SHIELD_BUCKLER = 0;
LL.SUBTYPE_SHIELD_SHIELD = 1;

local ShieldSubtypes = { };
ShieldSubtypes["Buckler"] = LL.SUBTYPE_SHIELD_BUCKLER;
ShieldSubtypes["Shield"] = LL.SUBTYPE_SHIELD_SHIELD;

LL.SUBTYPE_RECIPE_ALCHEMY = 0;
LL.SUBTYPE_RECIPE_BLACKSMITHING = 1;
LL.SUBTYPE_RECIPE_COOKING = 2;
LL.SUBTYPE_RECIPE_ENCHANTING = 3;
LL.SUBTYPE_RECIPE_ENGINEERING = 4;
LL.SUBTYPE_RECIPE_LEATHERWORKING = 5;
LL.SUBTYPE_RECIPE_TAILORING = 6;
LL.SUBTYPE_RECIPE_FIRST_AID = 7;
LL.SUBTYPE_RECIPE_FISHING = 8;
LL.SUBTYPE_RECIPE_JEWELCRAFTING = 9;
LL.SUBTYPE_RECIPE_INSCRIPTION = 10;

local RecipeSubtypes = { };
RecipeSubtypes["Alchemy"] = LL.SUBTYPE_RECIPE_ALCHEMY;
RecipeSubtypes["Blacksmithing"] = LL.SUBTYPE_RECIPE_BLACKSMITHING;
RecipeSubtypes["Cooking"] = LL.SUBTYPE_RECIPE_COOKING;
RecipeSubtypes["Enchanting"] = LL.SUBTYPE_RECIPE_ENCHANTING;
RecipeSubtypes["Engineering"] = LL.SUBTYPE_RECIPE_ENGINEERING;
RecipeSubtypes["Leatherworking"] = LL.SUBTYPE_RECIPE_LEATHERWORKING;
RecipeSubtypes["Tailoring"] = LL.SUBTYPE_RECIPE_TAILORING;
RecipeSubtypes["First Aid"] = LL.SUBTYPE_RECIPE_FIRST_AID;
RecipeSubtypes["Fishing"] = LL.SUBTYPE_RECIPE_FISHING;
RecipeSubtypes["Jewelcrafting"] = LL.SUBTYPE_RECIPE_JEWELCRAFTING;
RecipeSubtypes["Inscription"] = LL.SUBTYPE_RECIPE_INSCRIPTION;

local lTypeAndSubtypeToSkill = { };
lTypeAndSubtypeToSkill[LL.TYPE_ARMOR] = { };
lTypeAndSubtypeToSkill[LL.TYPE_ARMOR][LL.SUBTYPE_ARMOR_CLOTH] = "Cloth";
lTypeAndSubtypeToSkill[LL.TYPE_ARMOR][LL.SUBTYPE_ARMOR_LEATHER] = "Leather";
lTypeAndSubtypeToSkill[LL.TYPE_ARMOR][LL.SUBTYPE_ARMOR_MAIL] = "Mail";
lTypeAndSubtypeToSkill[LL.TYPE_ARMOR][LL.SUBTYPE_ARMOR_PLATE] = "Plate Mail";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON] = { };
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_AXE] = { }
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_AXE][0] = "Axes";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_AXE][1] = "Two-Handed Axes";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_BOW] = "Bows";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_DAGGER] = "Daggers";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_MACE] = { }
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_MACE][0] = "Maces";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_MACE][1] = "Two-Handed Maces";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_STAFF] = "Staves";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_SWORD] = { };
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_SWORD][0] = "Swords";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_SWORD][1] = "Two-Handed Swords";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_GUN] = "Guns";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_WAND] = "Wands";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_THROWN] = "Thrown";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_POLEARM] = "Polearms";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_FIST_WEAPON] = "Fist Weapons";
lTypeAndSubtypeToSkill[LL.TYPE_WEAPON][LL.SUBTYPE_WEAPON_CROSSBOW] = "Crossbows";
lTypeAndSubtypeToSkill[LL.TYPE_SHIELD] = { };
lTypeAndSubtypeToSkill[LL.TYPE_SHIELD][LL.SUBTYPE_SHIELD_BUCKLER] = "Shield";			--@todo Telo: deprecated subtype, should remove
lTypeAndSubtypeToSkill[LL.TYPE_SHIELD][LL.SUBTYPE_SHIELD_SHIELD] = "Shield";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE] = { };
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_ALCHEMY] = "Alchemy";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_BLACKSMITHING] = "Blacksmithing";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_COOKING] = "Cooking";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_ENCHANTING] = "Enchanting";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_ENGINEERING] = "Engineering";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_LEATHERWORKING] = "Leatherworking";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_TAILORING] = "Tailoring";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_FIRST_AID] = "First Aid";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_FISHING] = "Fishing";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_JEWELCRAFTING] = "Jewelcrafting";
lTypeAndSubtypeToSkill[LL.TYPE_RECIPE][LL.SUBTYPE_RECIPE_INSCRIPTION] = "Inscription";

local LocationTypes = { };
LocationTypes["Held In Off-hand"]		= { i = 0, type = LL.TYPE_MISC };
LocationTypes["Back"]					= { i = 1, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["One-Hand"]				= { i = 2, type = LL.TYPE_WEAPON, subtypes = WeaponSubtypes };
LocationTypes["Two-Hand"]				= { i = 3, type = LL.TYPE_WEAPON, subtypes = WeaponSubtypes };
LocationTypes["Off Hand"]				= { i = 4, type = LL.TYPE_SHIELD, subtypes = ShieldSubtypes };
LocationTypes["Wrist"]					= { i = 5, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Chest"]					= { i = 6, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Legs"]					= { i = 7, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Feet"]					= { i = 8, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Shirt"]					= { i = 9, type = LL.TYPE_MISC };
LocationTypes["Ranged"]					= { i = 10, type = LL.TYPE_WEAPON, subtypes = WeaponSubtypes };
LocationTypes["Main Hand"]				= { i = 11, type = LL.TYPE_WEAPON, subtypes = WeaponSubtypes };
LocationTypes["Waist"]					= { i = 12, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Head"]					= { i = 13, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Gun"]					= { i = 14, type = LL.TYPE_WEAPON, subtype = LL.SUBTYPE_WEAPON_GUN };
LocationTypes["Finger"]					= { i = 15, type = LL.TYPE_MISC };
LocationTypes["Hands"]					= { i = 16, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Shoulder"]				= { i = 17, type = LL.TYPE_ARMOR, subtypes = ArmorSubtypes };
LocationTypes["Wand"]					= { i = 18, type = LL.TYPE_WEAPON, subtype = LL.SUBTYPE_WEAPON_WAND };
LocationTypes["Trinket"]				= { i = 19, type = LL.TYPE_MISC };
LocationTypes["Tabard"]					= { i = 20, type = LL.TYPE_MISC };
LocationTypes["Neck"]					= { i = 21, type = LL.TYPE_MISC };
LocationTypes["Thrown"]					= { i = 22, type = LL.TYPE_WEAPON, subtype = LL.SUBTYPE_WEAPON_THROWN };
LocationTypes["Crossbow"]				= { i = 23, type = LL.TYPE_WEAPON, subtype = LL.SUBTYPE_WEAPON_CROSSBOW };
LocationTypes["Relic"]					= { i = 24, type = LL.TYPE_MISC };

local INVENTORY_SLOT_LIST = {
	{ name = "HeadSlot" },
	{ name = "NeckSlot" },
	{ name = "ShoulderSlot" },
	{ name = "BackSlot" },
	{ name = "ChestSlot" },
	{ name = "ShirtSlot" },
	{ name = "TabardSlot" },
	{ name = "WristSlot" },
	{ name = "HandsSlot" },
	{ name = "WaistSlot" },
	{ name = "LegsSlot" },
	{ name = "FeetSlot" },
	{ name = "Finger0Slot" },
	{ name = "Finger1Slot" },
	{ name = "Trinket0Slot" },
	{ name = "Trinket1Slot" },
	{ name = "MainHandSlot" },
	{ name = "SecondaryHandSlot" },
	{ name = "RangedSlot" },
	{ name = "Bag0Slot" },
	{ name = "Bag1Slot" },
	{ name = "Bag2Slot" },
	{ name = "Bag3Slot" },
};

local ChatMessageTypes = {
	"CHAT_MSG_BATTLEGROUND",
	"CHAT_MSG_BATTLEGROUND_LEADER",
	"CHAT_MSG_BN_WHISPER",
	"CHAT_MSG_CHANNEL",
	"CHAT_MSG_GUILD",
	"CHAT_MSG_LOOT",
	"CHAT_MSG_OFFICER",
	"CHAT_MSG_PARTY",
	"CHAT_MSG_PARTY_LEADER",
	"CHAT_MSG_RAID",
	"CHAT_MSG_RAID_LEADER",
	"CHAT_MSG_RAID_WARNING",
	"CHAT_MSG_SAY",
	"CHAT_MSG_SYSTEM",
	"CHAT_MSG_TEXT_EMOTE",
	"CHAT_MSG_WHISPER",
	"CHAT_MSG_YELL",
};

local LOOTLINK_DROPDOWN_LIST = {
	{ name = LL.SORT_NAME, sortType = "name" },
	{ name = LL.SORT_RARITY, sortType = "rarity" },
	{ name = LL.SORT_ILEVEL, sortType = "iLevel" },
	{ name = LL.SORT_LOCATION, sortType = "location" },
	{ name = LL.SORT_TYPE, sortType = "type" },
	{ name = LL.SORT_SUBTYPE, sortType = "subtype" },
	{ name = LL.SORT_LEVEL, sortType = "level" },
	{ name = LL.SORT_BINDS, sortType = "binds" },
	{ name = LL.SORT_UNIQUE, sortType = "unique" },
	{ name = LL.SORT_ARMOR, sortType = "armor" },
	{ name = LL.SORT_BLOCK, sortType = "block" },
	{ name = LL.SORT_MINDAMAGE, sortType = "minDamage" },
	{ name = LL.SORT_MAXDAMAGE, sortType = "maxDamage" },
	{ name = LL.SORT_DPS, sortType = "DPS" },
	{ name = LL.SORT_SPEED, sortType = "speed" },
	{ name = LL.SORT_SLOTS, sortType = "slots" },
	{ name = LL.SORT_SKILL, sortType = "skill" }
};

local LLS_RARITY_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.POOR, value = "ff9d9d9d", r = 157 / 255, g = 157 / 255, b = 157 / 255 },
	{ name = LL.COMMON, value = "ffffffff", r = 1, g = 1, b = 1 },
	{ name = LL.UNCOMMON, value = "ff1eff00", r = 30 / 255, g = 1, b = 0 },
	{ name = LL.RARE, value = "ff0070dd", r = 0, g = 70 / 255, b = 221 / 255 },
	{ name = LL.EPIC, value = "ffa335ee", r = 163 / 255, g = 53 / 255, b = 238 / 255 },
	{ name = LL.LEGENDARY, value = "ffff8000", r = 1, g = 128 / 255, b = 0 },
	{ name = LL.HEIRLOOM, value = "ffe6cc80", r = 230 / 255, g = 204 / 255, b = 128 / 255 },
	{ name = LL.ARTIFACT, value = "ffe6cc80", r = 230 / 255, g = 204 / 255, b = 128 / 255 },
};

local LLS_BINDS_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.DOES_NOT, value = LL.BINDS_DOES_NOT_BIND },
	{ name = LL.ON_EQUIP, value = LL.BINDS_EQUIP },
	{ name = LL.ON_PICKUP, value = LL.BINDS_PICKUP },
	{ name = LL.ON_USE, value = LL.BINDS_USE },
	{ name = LL.TO_ACCOUNT, value = LL.BINDS_ACCOUNT },
};

local LLS_STAT_LIST = {
	{ name = LL.NONE, value = nil },
	{ name = LL.STRENGTH, value = "sg" },
	{ name = LL.AGILITY, value = "ag" },
	{ name = LL.STAMINA, value = "st" },
	{ name = LL.INTELLECT, value = "in" },
	{ name = LL.SPIRIT, value = "si" },
	{ name = LL.ATTACK_POWER, value = "ap" },
	{ name = LL.EXPERTISE_RATING, value = "er" },
	{ name = LL.ARMOR_PENETRATION_RATING, value = "am" },
	{ name = LL.HIT_RATING, value = "ht" },
	{ name = LL.CRIT_RATING, value = "cr" },
	{ name = LL.HASTE_RATING, value = "hr" },
	{ name = LL.SPELL_POWER, value = "sr" },
	{ name = LL.MANA_REGENERATION, value = "mr"},
	{ name = LL.SPELL_PENETRATION, value = "sn" },
	{ name = LL.RESILIENCE_RATING, value = "rr" },
	{ name = LL.DEFENSE_RATING, value = "dr" },
	{ name = LL.DODGE_RATING, value = "do" },
	{ name = LL.PARRY_RATING, value = "pr" },
	{ name = LL.BLOCK_RATING, value = "br" },
	{ name = LL.BLOCK_VALUE, value = "bv" },
};

local LLS_TYPE_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.ARMOR, value = LL.TYPE_ARMOR },
	{ name = LL.CONTAINER, value = LL.TYPE_CONTAINER },
	{ name = LL.GEM, value = LL.TYPE_GEM },
	{ name = LL.GLYPH, value = LL.TYPE_GLYPH },
	{ name = LL.OTHER, value = LL.TYPE_MISC },
	{ name = LL.RECIPE, value = LL.TYPE_RECIPE },
	{ name = LL.SHIELD, value = LL.TYPE_SHIELD },
	{ name = LL.WEAPON, value = LL.TYPE_WEAPON },
};


local LLS_SUBTYPE_ARMOR_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.CLOTH, value = LL.SUBTYPE_ARMOR_CLOTH },
	{ name = LL.LEATHER, value = LL.SUBTYPE_ARMOR_LEATHER },
	{ name = LL.MAIL, value = LL.SUBTYPE_ARMOR_MAIL },
	{ name = LL.PLATE, value = LL.SUBTYPE_ARMOR_PLATE },
};

local LLS_SUBTYPE_GEM_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.META, value = LL.SUBTYPE_GEM_META },
	{ name = LL.RED, value = LL.SUBTYPE_GEM_RED },
	{ name = LL.YELLOW, value = LL.SUBTYPE_GEM_YELLOW },
	{ name = LL.BLUE, value = LL.SUBTYPE_GEM_BLUE },
};

local LLS_SUBTYPE_GLYPH_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.MAJOR, value = LL.SUBTYPE_GLYPH_MAJOR },
	{ name = LL.MINOR, value = LL.SUBTYPE_GLYPH_MINOR },
};

local LLS_SUBTYPE_WEAPON_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.AXE, value = LL.SUBTYPE_WEAPON_AXE },
	{ name = LL.BOW, value = LL.SUBTYPE_WEAPON_BOW },
	{ name = LL.CROSSBOW, value = LL.SUBTYPE_WEAPON_CROSSBOW },
	{ name = LL.DAGGER, value = LL.SUBTYPE_WEAPON_DAGGER },
	{ name = LL.FIST_WEAPON, value = LL.SUBTYPE_WEAPON_FIST_WEAPON },
	{ name = LL.GUN, value = LL.SUBTYPE_WEAPON_GUN },
	{ name = LL.MACE, value = LL.SUBTYPE_WEAPON_MACE },
	{ name = LL.POLEARM, value = LL.SUBTYPE_WEAPON_POLEARM },
	{ name = LL.STAFF, value = LL.SUBTYPE_WEAPON_STAFF },
	{ name = LL.SWORD, value = LL.SUBTYPE_WEAPON_SWORD },
	{ name = LL.THROWN, value = LL.SUBTYPE_WEAPON_THROWN },
	{ name = LL.WAND, value = LL.SUBTYPE_WEAPON_WAND },
};

local LLS_SUBTYPE_SHIELD_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.BUCKLER, value = LL.SUBTYPE_SHIELD_BUCKLER },
	{ name = LL.SHIELD, value = LL.SUBTYPE_SHIELD_SHIELD },
};

local LLS_SUBTYPE_RECIPE_LIST = {
	{ name = LL.ANY, value = nil },
	{ name = LL.ALCHEMY, value = LL.SUBTYPE_RECIPE_ALCHEMY },
	{ name = LL.BLACKSMITHING, value = LL.SUBTYPE_RECIPE_BLACKSMITHING },
	{ name = LL.COOKING, value = LL.SUBTYPE_RECIPE_COOKING },
	{ name = LL.ENCHANTING, value = LL.SUBTYPE_RECIPE_ENCHANTING },
	{ name = LL.ENGINEERING, value = LL.SUBTYPE_RECIPE_ENGINEERING },
	{ name = LL.INSCRIPTION, value = LL.SUBTYPE_RECIPE_INSCRIPTION },
	{ name = LL.JEWELCRAFTING, value = LL.SUBTYPE_RECIPE_JEWELCRAFTING },
	{ name = LL.LEATHERWORKING, value = LL.SUBTYPE_RECIPE_LEATHERWORKING },
	{ name = LL.TAILORING, value = LL.SUBTYPE_RECIPE_TAILORING },
};

local LLS_LOCATION_LIST = {
	{ name = "Any", },
	{ name = "None", },
	{ name = "Back", },
	{ name = "Chest", },
--	{ name = "Crossbow", },
	{ name = "Feet", },
	{ name = "Finger", },
	{ name = "Hands", },
	{ name = "Head", },
	{ name = "Held In Off-hand", },
--	{ name = "Gun", },
	{ name = "Legs", },
	{ name = "Main Hand", },
	{ name = "Neck", },
	{ name = "Off Hand", },
	{ name = "One-Hand", },
	{ name = "Ranged", },
	{ name = "Relic", },
	{ name = "Shirt", },
	{ name = "Shoulder", },
	{ name = "Tabard", },
	{ name = "Thrown", },
	{ name = "Trinket", },
	{ name = "Two-Hand", },
	{ name = "Waist", },
	{ name = "Wand", },
	{ name = "Wrist", },
};

local lMagicCharacters = { };
lMagicCharacters["^"] = 1;
lMagicCharacters["$"] = 1;
lMagicCharacters["("] = 1;
lMagicCharacters[")"] = 1;
lMagicCharacters["%"] = 1;
lMagicCharacters["."] = 1;
lMagicCharacters["["] = 1;
lMagicCharacters["]"] = 1;
lMagicCharacters["*"] = 1;
lMagicCharacters["+"] = 1;
lMagicCharacters["-"] = 1;
lMagicCharacters["?"] = 1;

local lBankBagIDs = { BANK_CONTAINER, 5, 6, 7, 8, 9, 10, };

local LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT = 10;

-- Any UNIT_INVENTORY_CHANGED events after the first that happen within this time will be ignored
local LOOTLINK_SELF_SCAN_BUFFER_TIME = 5;

--------------------------------------------------------------------------------------------------
-- Global LootLink variables
--------------------------------------------------------------------------------------------------

LOOTLINK_VERSION = 400;	-- version 4.00
LOOTLINK_CURRENT_DATA_VERSION = 201; -- version 2.01

LOOTLINK_ITEM_HEIGHT = 16;
LOOTLINK_ITEMS_SHOWN = 23;

--------------------------------------------------------------------------------------------------
-- Options
--------------------------------------------------------------------------------------------------

function LootLinkOptions_Init()
    --Initialise all the check boxes on the options frame
--	LootLinkAuction:SetChecked(
	LootLinkAutocomplete:SetChecked(LootLinkState.AutoComplete);
    LootLinkLight:SetChecked(LootLinkState.LightMode);
--	print(LootLinkState.AutoComplete);
--	print(LootLinkState.LightMode);
end

function LootLink_AutoComplete_Toggle()
    if (LootLinkState.AutoComplete) then
        LootLinkState.AutoComplete = false;
    else
        LootLinkState.AutoComplete = true;
    end
    LootLinkOptions_Init();
end

function LootLink_LightMode_Toggle()
    if (LootLinkState.LightMode) then
        LootLinkState.LightMode = false;
    else
        StaticPopup_Show ("LOOTLINK_LIGHTTEXT_CONFIRM")
    end
    LootLinkOptions_Init();
end

StaticPopupDialogs["LOOTLINK_RESET_CONFIRM"] = {
	text = LOOTLINK_RESET_NEEDS_CONFIRM,
	button1 = TEXT("Reset"),
	button2 = TEXT("Cancel"),
	OnAccept = function()
		LootLink_Reset();
	end,
	timeout = 0,
	exclusive = 0,
	showAlert = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["LOOTLINK_LIGHTTEXT_CONFIRM"] = {
	text = LOOTLINK_LIGHTMODE_NEEDS_CONFIRM,
	button1 = TEXT("Confirm"),
	button2 = TEXT("Cancel"),
	OnAccept = function()
		LootLink_LightMode();
		LootLinkLight:SetChecked("true");
	end,
	timeout = 0,
	exclusive = 0,
	showAlert = 1,
	whileDead = 1,
	hideOnEscape = 1
}

--------------------------------------------------------------------------------------------------
-- Internal functions
--------------------------------------------------------------------------------------------------

--
-- Internal debugging functions
--

local function dlog(...)
	local str;
	local iParam;
	
	str = "";
	for iParam = 1, select('#', ...) do
		local param = select(iParam, ...);
		if( type(param) == "function" ) then
			str = str.."{function}";
		elseif( type(param) == "userdata" ) then
			str = str.."{userdata}";
		elseif( type(param) == "thread" ) then
			str = str.."{thread}";
		elseif( type(param) == "table" ) then
			str = str.."{table}";
		elseif( type(param) == "boolean" ) then
			if( param ) then
				str = str.."true";
			else
				str = str.."false";
			end
		elseif( type(param) == "nil" ) then
			str = str.."{nil}";
		else
			str = str..param;
		end
	end
	
	DEFAULT_CHAT_FRAME:AddMessage(string.gsub(str, "|", "||"));
end

--
-- Functions with no other functional dependencies
--

local function LootLink_MakeIntFromHexString(str)
	local remain = str;
	local amount = 0;
	while( remain ~= "" ) do
		amount = amount * 16;
		local byteVal = string.byte(strupper(strsub(remain, 1, 1)));
		if( byteVal >= string.byte("0") and byteVal <= string.byte("9") ) then
			amount = amount + (byteVal - string.byte("0"));
		elseif( byteVal >= string.byte("A") and byteVal <= string.byte("F") ) then
			amount = amount + 10 + (byteVal - string.byte("A"));
		end
		remain = strsub(remain, 2);
	end
	return amount;
end

local function LootLink_MakeHexStringFromInt(int)
	local reverse = "";
	
	repeat
		local remainder = mod(int, 16);
		if( remainder < 10 ) then
			reverse = reverse..string.char(string.byte("0") + remainder);
		else
			reverse = reverse..string.char(string.byte("A") + (remainder - 10));
		end
		int = floor(int / 16);
	until( int == 0 );
	
	local result = "";
	local index;
	
	for index = string.len(reverse), 1, -1 do
		result = result..string.sub(reverse, index, index);
	end
	
	return result;
end

local function LootLink_GetRGBFromHexColor(hexColor)
	local red = LootLink_MakeIntFromHexString(strsub(hexColor, 3, 4)) / 255;
	local green = LootLink_MakeIntFromHexString(strsub(hexColor, 5, 6)) / 255;
	local blue = LootLink_MakeIntFromHexString(strsub(hexColor, 7, 8)) / 255;
	local alpha = LootLink_MakeIntFromHexString(strsub(hexColor, 1, 2)) / 255;
	return red, green, blue, alpha;
end

local function LootLink_GetHexColorFromRGB(red, green, blue, alpha)
	local red = floor((min(max(0, red), 1) * 255) + 0.5);
	local green = floor((min(max(0, green), 1) * 255) + 0.5);
	local blue = floor((min(max(0, blue), 1) * 255) + 0.5);
	local alpha = floor((min(max(0, alpha), 1) * 255) + 0.5);
	
	local redString = LootLink_MakeHexStringFromInt(red);
	local greenString = LootLink_MakeHexStringFromInt(green);
	local blueString = LootLink_MakeHexStringFromInt(blue);
	local alphaString = LootLink_MakeHexStringFromInt(alpha);
	
	if( red < 16 ) then
		redString = "0"..redString;
	end
	if( green < 16 ) then
		greenString = "0"..greenString;
	end
	if( blue < 16 ) then
		blueString = "0"..blueString;
	end
	if( alpha < 16 ) then
		alphaString = "0"..alphaString;
	end
	
	return strlower(alphaString..redString..greenString..blueString);
end

local function LootLink_GetDataVersion()
	if( not LootLinkState or not LootLinkState.DataVersion ) then
		return 0;
	end
	return LootLinkState.DataVersion;
end

local function LootLink_SetDataVersion(version)
	if( not LootLinkState ) then
		LootLinkState = { };
	end
	if( not LootLinkState.DataVersion or LootLinkState.DataVersion < version ) then
		LootLinkState.DataVersion = version;
	end
end

local function LootLink_AddServer(name)
	if( not LootLinkState ) then
		LootLinkState = { };
	end
	
	if( not LootLinkState.Servers ) then
		LootLinkState.Servers = 0;
		LootLinkState.ServerNamesToIndices = { };
	end
	
	if( not LootLinkState.ServerNamesToIndices[name] ) then
		LootLinkState.ServerNamesToIndices[name] = LootLinkState.Servers;
		LootLinkState.Servers = LootLinkState.Servers + 1;
	end
	
	return LootLinkState.ServerNamesToIndices[name];
end

local function LootLink_ConvertServerFormat(item)
	if( item.servers ) then
		local i, v;
		local list;
		for i, v in pairs(item.servers) do
			if( not list ) then
				list = tostring(i);
			else
				list = list.." "..i;
			end
		end
		item.s = list;
		item.servers = nil;
	end
end

local function LootLink_CheckItemServerRaw(item, serverIndex)
	if( not serverIndex ) then
		return nil;
	end
	if( not item.s ) then
		return nil;
	end
	
	local server;
	for server in string.gmatch(item.s, "(%d+)") do
		if( tonumber(server) == serverIndex ) then
			return 1;
		end
	end

	return nil;
end

local function LootLink_AddItemServer(item, serverIndex)
	if( serverIndex ) then
		if( not item.s ) then
			item.s = tostring(serverIndex);
		elseif( not LootLink_CheckItemServerRaw(item, serverIndex) ) then
			item.s = item.s.." "..serverIndex;
		end
	end
end

local function LootLink_EscapeString(string)
	return string.gsub(string, "\"", "\\\"");
end

local function LootLink_UnescapeString(string)
	return string.gsub(string, "\\\"", "\"");
end

local function LootLink_EscapePattern(string)
	local result = "";
	local remain = string;
	local char;
	
	while( remain ~= "" ) do
		char = strsub(remain, 1, 1);
		if( lMagicCharacters[char] ) then
			result = result.."%"..char;
		else
			result = result..char;
		end
		remain = strsub(remain, 2);
	end
	
	return result;
end

local function LootLink_CheckNumeric(string)
	local remain = string;
	local hasNumber;
	local hasPeriod;
	local char;
	
	while( remain ~= "" ) do
		char = strsub(remain, 1, 1);
		if( char >= "0" and char <= "9" ) then
			hasNumber = 1;
		elseif( char == "." and not hasPeriod ) then
			hasPeriod = 1;
		else
			return nil;
		end
		remain = strsub(remain, 2);
	end
	
	return hasNumber;
end

local function LootLink_MatchType(left, right)
	local lt = LocationTypes[left];
	local _type;
	local subtype;
	
	if( lt ) then
		local subtypes;
		
		-- Check for weapon override of base type
		if( WeaponSubtypes[right] ) then
			_type = LL.TYPE_WEAPON;
			subtypes = WeaponSubtypes;
		else
			_type = lt.type;
			subtypes = lt.subtypes;
		end
		
		if( subtypes ) then
			subtype = subtypes[right];
		else
			subtype = lt.subtype;
		end
		return nil, lt.i, _type, subtype;
	end
	
	return 1, nil, LL.TYPE_MISC, nil;
end

--
-- Functions that are dependent on preceding local functions, ordered appropriately
--

local function LootLink_InitSizes(serverIndex)
	local index;
	local value;

	LL.lItemLinksSizeTotal = 0;
	LL.lItemLinksSizeServer = 0;
	
	for index, value in pairs(ItemLinks) do
		LL.lItemLinksSizeTotal = LL.lItemLinksSizeTotal + 1;
		if( LootLink_CheckItemServer(value, serverIndex) ) then
			LL.lItemLinksSizeServer = LL.lItemLinksSizeServer + 1;
		end
	end
end

local function LootLink_GetSize(serverIndex)
	if( not serverIndex ) then
		return LL.lItemLinksSizeTotal;
	end
	return LL.lItemLinksSizeServer;
end

local function LootLink_Status()
	DEFAULT_CHAT_FRAME:AddMessage(format(LOOTLINK_STATUS_HEADER, LOOTLINK_VERSION / 100));
	if( LootLinkState ) then
		DEFAULT_CHAT_FRAME:AddMessage(format(LOOTLINK_DATA_VERSION, LootLink_GetSize(), LootLink_GetSize(LL.lServerIndex), LL.lServer, LootLink_GetDataVersion() / 100));
		if( LootLinkState.LightMode ) then
			DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_LIGHT_MODE);
		else
			DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_FULL_MODE);
		end
		if( LootLinkState.AutoComplete ) then
			DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_AUTOCOMPLETE_ENABLED);
		else
			DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_AUTOCOMPLETE_DISABLED);
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_INFO_SHOWN);
	end
	if( LL.lScanAuction ) then
		DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_SCHEDULED_AUCTION_SCAN);
	end
end

local function LootLink_UpgradeLink(itemLink)
		if( string.find(itemLink.i, "^%d+:%d+:%d+:%d+$") ) then
			-- Upgrade old links, removing instance-specific data
			item = string.gsub(itemLink.i, "^(%d+):(%d+):(%d+):(%d+)$", "%1:0:0:0:0:0:%3:%4:0");
		elseif( string.find(itemLink.i, "^%d+:%d+:%d+:%d+:%d+:%d+:%d+:%d+$") ) then
			-- Upgrade old V2.x links, 
			item = string.gsub(itemLink.i, "^(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)$", "%1:0:0:0:0:%6:%7:%8:0");
		else
			-- Remove instance-specific data that we captured from the link we return (2nd is enchantment, 3rd-5th are sockets, 9th is the linking character's level)
			item = string.gsub(itemLink.i, "(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+)", "%1:0:0:0:0:%6:%7:%8:0");
		end
end

local function LootLink_GetHyperlink(llid)
	local itemLink = ItemLinks[llid];
	if( itemLink and itemLink.i and LootLink_CheckItemServer(itemLink, LL.lServerIndex) ) then
		LootLink_UpgradeLink(itemLink);
		return "item:"..itemLink.i;
	end
	return nil;
end

local function LootLink_GetLink(llid)
	local itemLink = ItemLinks[llid];
	if( itemLink and itemLink.c and LootLink_CheckItemServer(itemLink, LL.lServerIndex) ) then
		local hyperlink = LootLink_GetHyperlink(llid);
		if( hyperlink ) then
			local link = "|c"..itemLink.c.."|H"..hyperlink.."|h["..LootLink_GetName(llid).."]|h|r";
			return link;
		end
	end
	return nil;
end

local function LootLink_BuildSearchData(llid, value)
	local itemLink;
	local state = LL.STATE_NAME;
	local loop;
	local index;
	local field;
	local left;
	local right;
	local iStart;
	local iEnd;
	local val1;
	local val2;
	local val3;
	local _type;
	local subtype;
	
	value.d = "";
	if( not LootLinkState.LightMode ) then
		value.t = "";
	end
	
	itemLink = LootLink_GetHyperlink(llid);
	if( not itemLink ) then
		return nil;
	end
	
	local _, _, _, iLevel = GetItemInfo(itemLink);
	if( iLevel ) then
		value.d = value.d.."il"..iLevel.."·";
	end
	
	local _, _, _, _, _, itemType = GetItemInfo(itemLink);
	if (itemType == "Armor" or itemType == "Weapon") then
		itemStats = GetItemStats(itemLink);
		if itemStats then
		local val1 = itemStats["ITEM_MOD_STRENGTH_SHORT"];
		if (val1) then
			value.d = value.d.."sg"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_AGILITY_SHORT"];
		if (val1) then
			value.d = value.d.."ag"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_STAMINA_SHORT"];
		if (val1) then
			value.d = value.d.."st"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_INTELLECT_SHORT"];
		if (val1) then
			value.d = value.d.."in"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_SPIRIT_SHORT"];
		if (val1) then
			value.d = value.d.."si"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_ATTACK_POWER_SHORT"];
		if (val1) then
			value.d = value.d.."ap"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_EXPERTISE_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."er"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."am"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_HIT_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."ht"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_CRIT_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."cr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_HASTE_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."hr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_SPELL_POWER_SHORT"];
		if (val1) then
			value.d = value.d.."sr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_POWER_REGEN0_SHORT"];
		if (val1) then
			value.d = value.d.."mr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_SPELL_PENETRATION_SHORT"];
		if (val1) then
			value.d = value.d.."sn"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_RESILIENCE_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."rr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_DEFENSE_SKILL_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."dr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_DODGE_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."do"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_PARRY_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."pr"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_BLOCK_RATING_SHORT"];
		if (val1) then
			value.d = value.d.."br"..val1.."·";
		end
		local val1 = itemStats["ITEM_MOD_BLOCK_VALUE_SHORT"];
		if (val1) then
			value.d = value.d.."bv"..val1.."·";
		end	
		end
	end
	
	-- We'll use our own tooltip to parse the information to avoid
	-- picking up any changes made by other mods to the tooltip text
	LLHiddenTooltip:SetOwner(UIParent, "ANCHOR_NONE");
	LLHiddenTooltip:SetHyperlink(itemLink);
	
	for index = 1, 30 do
		field = _G["LLHiddenTooltipTextLeft"..index];
		if( field and field:IsShown() ) then
			left = field:GetText();
		else
			left = nil;
		end
		
		field = _G["LLHiddenTooltipTextRight"..index];
		if( field and field:IsShown() ) then
			right = field:GetText();
		else
			right = nil;
		end
		
		if( left ) then
			if( not LootLinkState.LightMode ) then
				value.t = value.t..left.."·";
			end
		else
			left = "";
		end
		if( right ) then
			if( not LootLinkState.LightMode ) then
				value.t = value.t..right.."·";
			end
		else
			right = "";
		end
		
		loop = 1;
		while( loop ) do
			if( state == LL.STATE_NAME ) then
				state = LL.STATE_HEROIC;
				loop = nil;
			elseif( state == LL.STATE_HEROIC ) then
				if( string.find(left, "Heroic") ) then
					value.d = value.d.."he1·"
					loop = nil;
				end
				state = LL.STATE_BOUND;
			elseif( state == LL.STATE_BOUND ) then
				iStart, iEnd, val1 = string.find(left, "Binds (.+)");
				if( val1 ) then
					if( val1 == "when equipped" ) then
						value.d = value.d.."bi"..LL.BINDS_EQUIP.."·";
					elseif( val1 == "when picked up" ) then
						value.d = value.d.."bi"..LL.BINDS_PICKUP.."·";
					elseif( val1 == "when used" ) then
						value.d = value.d.."bi"..LL.BINDS_USED.."·";
					elseif( val1 == "to account" ) then
						value.d = value.d.."bi"..LL.BINDS_ACCOUNT.."·";
					end
					loop = nil;
				else
					value.d = value.d.."bi"..LL.BINDS_DOES_NOT_BIND.."·";
				end
				state = LL.STATE_UNIQUE;
			elseif( state == LL.STATE_UNIQUE ) then
				if( string.find(left, "Unique-Equipped") ) then
					value.d = value.d.."un"..LL.UNIQUE_EQUIPPED.."·";
					loop = nil;
				elseif( string.find(left, "Unique") ) then
					value.d = value.d.."un"..LL.UNIQUE_GENERIC.."·";
					loop = nil;
				end
				state = LL.STATE_LOCATION;
			elseif( state == LL.STATE_LOCATION ) then
				local location;
				loop, location, _type, subtype = LootLink_MatchType(left, right);
				if( location ) then
					value.d = value.d.."lo"..location.."·";
				end
				if( _type == LL.TYPE_WEAPON ) then
					state = LL.STATE_DAMAGE;
				elseif( _type == LL.TYPE_ARMOR or _type == LL.TYPE_SHIELD ) then
					state = LL.STATE_ARMOR;
				else
					state = LL.STATE_GLYPH;
				end
			elseif( state == LL.STATE_DAMAGE ) then
				iStart, iEnd, val1, val2 = string.find(left, "(%d+) %- (%d+) Damage");
				if( val1 and val2 ) then
					value.d = value.d.."mi"..val1.."·ma"..val2.."·";
				end
				iStart, iEnd, val1 = string.find(right, "Speed (.+)");
				if( val1 ) then
					value.d = value.d.."sp"..val1.."·";
				end
				state = LL.STATE_DPS;
				loop = nil;
			elseif( state == LL.STATE_DPS ) then
				iStart, iEnd, val1 = string.find(left, "%((.+) damage per second%)");
				if( val1 ) then
					value.d = value.d.."dp"..val1.."·";
				end
				state = LL.STATE_MATCHES;
				loop = nil;
			elseif( state == LL.STATE_ARMOR ) then
				iStart, iEnd, val1 = string.find(left, "(%d+) Armor");
				if( val1 ) then
					value.d = value.d.."ar"..val1.."·";
				end
				if( _type == LL.TYPE_SHIELD ) then
					state = LL.STATE_BLOCK;
				else
					state = LL.STATE_MATCHES;
				end
				loop = nil;
			elseif( state == LL.STATE_BLOCK ) then
				iStart, iEnd, val1 = string.find(left, "(%d+) Block");
				if( val1 ) then
					value.d = value.d.."bl"..val1.."·";
				end
				state = LL.STATE_MATCHES;
				loop = nil;
			elseif( state == LL.STATE_GLYPH ) then
				iStart, iEnd, val1 = string.find(left, "(.*) Glyph");
				if( val1 ) then
					_type = LL.TYPE_GLYPH;
					subtype = GlyphSubtypes[val1];
					loop = nil;
				end
				state = LL.STATE_CONTAINER;
			elseif( state == LL.STATE_CONTAINER ) then
				iStart, iEnd, val1 = string.find(left, "(%d+) Slot Container");
				if( val1 ) then
					_type = LL.TYPE_CONTAINER;
					value.d = value.d.."sl"..val1.."·";
					loop = nil;
				end
				state = LL.STATE_MATCHES;
			elseif( state == LL.STATE_MATCHES ) then
				if( _type == LL.TYPE_MISC ) then
					val1 = string.match(left, "^\"Matches a (.*) Socket.\"$");
					if( val1 ) then
						_type = LL.TYPE_GEM;
						val2 = 0;
						if( string.match(val1, "Red") ) then
							val2 = val2 + LL.SUBTYPE_GEM_RED;
						end
						if( string.match(val1, "Yellow") ) then
							val2 = val2 + LL.SUBTYPE_GEM_YELLOW;
						end
						if( string.match(val1, "Blue") ) then
							val2 = val2 + LL.SUBTYPE_GEM_BLUE;
						end
						subtype = val2;
						loop = nil;
					else
						val1 = string.match(left, "^\"Only fits in a meta gem slot.\"$");
						if( val1 ) then
							_type = LL.TYPE_GEM;
							subtype = LL.SUBTYPE_GEM_META;
							loop = nil;
						end
					end
				end
				state = LL.STATE_REQUIRES;
			elseif( state == LL.STATE_REQUIRES ) then
				iStart, iEnd, val1 = string.find(left, "Requires (.+)");
				if( val1 ) then
					iStart, iEnd, val2 = string.find(val1, "Level (%d+)");
					if( val2 ) then
						value.d = value.d.."le"..val2.."·";
					else
						iStart, iEnd, val2, val3 = string.find(val1, "(.+) %((%d+)%)");
						if( val2 and val3 ) then
							val1 = RecipeSubtypes[val2];
							if( val1 and _type == LL.TYPE_MISC ) then
								_type = LL.TYPE_RECIPE;
								subtype = val1;
								value.d = value.d.."sk"..val3.."·";
							end
						end
					end
				end
				state = LL.STATE_MATCHES;
				loop = nil;
			elseif( state == LL.STATE_FINISH ) then
				loop = nil;
			end
		end
	end

	if( _type ) then
		value.d = value.d.."ty".._type.."·";
	end
	if( subtype ) then
		value.d = value.d.."su"..subtype.."·";
	end
	
	LLHiddenTooltip:Hide();

	return 1;
end

local function LootLink_InternalAddItem(itemid, name, color, itemString)
	local llid = itemid..":"..name;
	if( not ItemLinks[llid] ) then
		ItemLinks[llid] = { };
		LL.lItemLinksSizeTotal = LL.lItemLinksSizeTotal + 1;
	else
		ItemLinks[llid].d = nil;
		ItemLinks[llid].t = nil;
	end
	ItemLinks[llid].c = color;
	ItemLinks[llid].i = itemString;

	if( not LootLink_CheckItemServerRaw(ItemLinks[llid], LL.lServerIndex) ) then
		LootLink_AddItemServer(ItemLinks[llid], LL.lServerIndex);
		LL.lItemLinksSizeServer = LL.lItemLinksSizeServer + 1;
	end
	
	LootLink_BuildSearchData(llid, ItemLinks[llid]);
	
	return llid;
end

local function BuildUsabilityData(data)
	local nSkills;
	local iSkill;
	local HeaderData = { };
	local name, header, isExpanded, rank;
	local Collapse = { };
	local nToCollapse = 0;
	local iCollapse;

	data.class = UnitClass("player");
	data.race = UnitRace("player");
	data.level = UnitLevel("player");
	data.skills = { };
	
	-- We need to expand all of the skills, but first want to save off their state
	nSkills = GetNumSkillLines();
	for iSkill = 1, nSkills do
		local name, header, isExpanded, rank = GetSkillLineInfo(iSkill);
		if( header and not isExpanded ) then
			-- Since we don't know the final index for this item yet, we'll store it by name
			HeaderData[name] = 0;
		end
	end
	
	-- Now expand everything and save off our known skills
	ExpandSkillHeader(0);
	nSkills = GetNumSkillLines()
	for iSkill = 1, nSkills do
		local name, header, isExpanded, rank = GetSkillLineInfo(iSkill);
		if( not header ) then
			data.skills[name] = rank;
		elseif( HeaderData[name] ) then
			-- We now know the final index for this header item
			HeaderData[name] = iSkill;
		end
	end
	
	-- Finally, return the skills page to its original state
	for name, iSkill in pairs(HeaderData) do
		Collapse[nToCollapse + 1] = iSkill;
		nToCollapse = nToCollapse + 1;
	end
	if( nToCollapse > 0 ) then
		table.sort(Collapse);
		for iCollapse = nToCollapse, 1, -1 do
			CollapseSkillHeader(Collapse[iCollapse]);
		end
	end
end

local function LootLink_GetSkillRank(ud, _type, subtype, location)
	-- If this type doesn't have a matching skill,
	-- return 0 so that it doesn't get filtered out
	if( type(lTypeAndSubtypeToSkill[_type]) ~= "table" ) then
		return 0;
	end

	local entry = lTypeAndSubtypeToSkill[_type][subtype];

	if( type(entry) == "table" ) then
		-- Two-handed vs. One-handed weapon
		if( location ) then
			if( location == 3 ) then
				return ud.skills[entry[1]];
			else
				return ud.skills[entry[0]];
			end
		else
			return nil;
		end
	elseif( not entry ) then
		-- No matching skill for this subtype,
		-- return 0 so we don't filter it out
		return 0;
	else
		-- Everything else
		return ud.skills[entry];
	end
end

local function LootLink_SetTitle()
	local lootLinkTitle = _G["LootLinkTitleText"];
	local total = LootLink_GetSize(LL.lServerIndex);
	local size;
	
	if( not DisplayIndices ) then
		size = total;
	else
		size = DisplayIndices.onePastEnd - 1;
	end
	if( size < total ) then
		if( size == 1 ) then
			lootLinkTitle:SetText(LOOTLINK_TITLE_FORMAT_PARTIAL_SINGULAR);
		else
			lootLinkTitle:SetText(format(LOOTLINK_TITLE_FORMAT_PARTIAL_PLURAL, size));
		end
	else
		if( size == 1 ) then
			lootLinkTitle:SetText(LOOTLINK_TITLE_FORMAT_SINGULAR);
		else
			lootLinkTitle:SetText(format(LOOTLINK_TITLE_FORMAT_PLURAL, size));
		end
	end
end

local function LootLink_MatchesSearch(llid, value, ud)
	if( not value or not LootLink_CheckItemServer(value, LL.lServerIndex) ) then
		return nil;
	end
	if( not LootLinkFrame.SearchParams or not llid ) then
		return 1;
	end
	
	if( value.d ) then
		local sp = LootLinkFrame.SearchParams; 
		
		if( sp.text ) then
			if( not value.t ) then
				return nil;
			end
			if( not string.find(string.lower(value.t), string.lower(sp.text), 1, sp.plain) ) then
				return nil;
			end
		end
		
		if( sp.name ) then
			if( not string.find(string.lower(LootLink_GetName(llid)), string.lower(sp.name), 1, sp.plain) ) then
				return nil;
			end
		end
		
		if( sp.rarity ) then
			if( LLS_RARITY_LIST[sp.rarity].value ~= value.c ) then
				return nil;
			end
		end
		
		if( sp.binds ) then
			if( LLS_BINDS_LIST[sp.binds].value ~= LootLink_SearchData(value, "bi") ) then
				return nil;
			end
		end
		
		if( sp.unique ) then
			if( not LootLink_SearchData(value, "un") ) then
				return nil;
			end
		end

		if( sp.cached ) then
			if( GetItemInfo(LootLink_GetItemId(llid)) ) then
				return nil;
			end
		end	

		if( sp.usable ) then
			local _type = LootLink_SearchData(value, "ty");
			local subtype = LootLink_SearchData(value, "su");
			local level = LootLink_SearchData(value, "le");
			local skill = LootLink_SearchData(value, "sk");
			
			-- Check for the required skill
			if( _type ) then
				if( subtype ) then
					local rank = LootLink_GetSkillRank(ud, _type, subtype, LootLink_SearchData(value, "lo"));
					if( not rank or (skill and skill > rank) ) then
						return nil;
					end
				end
			end
			
			-- Check for the required class
			if( value.t and string.find(value.t, "·Class") and not string.find(value.t, "·Class.*"..UnitClass("player")) ) then
				return nil;
			end
			
			-- Check level requirement
			if( level and level > ud.level ) then
				return nil;
			end
		end
		
		if( sp.location ) then
			local location = LootLink_SearchData(value, "lo");
		
			if( sp.location == 2 ) then
				if( location ) then
					return nil;
				end
			elseif( sp.location ~= 1 ) then
				if( LocationTypes[LLS_LOCATION_LIST[sp.location].name].i ~= location ) then
					return nil;
				end
			end
		end
		
		if( sp.stat1 ) then
--				print(LLS_STAT_LIST[sp.stat].value)
			if( sp.minStat1 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat1].value);
				if( not level or level < sp.minStat1 ) then
					return nil;
				end
			end
		
			if( sp.maxStat1 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat1].value);
				if( level and level > sp.maxStat1 ) then
					return nil;
				end
			end		
		end
		
		if( sp.stat2 ) then
--				print(LLS_STAT_LIST[sp.stat].value)
			if( sp.minStat2 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat2].value);
				if( not level or level < sp.minStat2 ) then
					return nil;
				end
			end
		
			if( sp.maxStat2 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat2].value);
				if( level and level > sp.maxStat2 ) then
					return nil;
				end
			end		
		end		
		
		if( sp.stat3 ) then
--				print(LLS_STAT_LIST[sp.stat].value)
			if( sp.minStat3 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat3].value);
				if( not level or level < sp.minStat3 ) then
					return nil;
				end
			end
		
			if( sp.maxStat3 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat3].value);
				if( level and level > sp.maxStat3 ) then
					return nil;
				end
			end		
		end
			
		if( sp.stat4 ) then
--				print(LLS_STAT_LIST[sp.stat].value)
			if( sp.minStat4 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat4].value);
				if( not level or level < sp.minStat4 ) then
					return nil;
				end
			end
		
			if( sp.maxStat4 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat4].value);
				if( level and level > sp.maxStat4 ) then
					return nil;
				end
			end		
		end		
			
		if( sp.stat5 ) then
--				print(LLS_STAT_LIST[sp.stat].value)
			if( sp.minStat5 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat5].value);
				if( not level or level < sp.minStat5 ) then
					return nil;
				end
			end
		
			if( sp.maxStat5 ) then
				local level = LootLink_SearchData(value, LLS_STAT_LIST[sp.stat5].value);
				if( level and level > sp.maxStat5 ) then
					return nil;
				end
			end		
		end	
		
		if( sp.minLevel ) then
			local level = LootLink_SearchData(value, "le");
			if( not level or level < sp.minLevel ) then
				return nil;
			end
		end
		
		if( sp.maxLevel ) then
			local level = LootLink_SearchData(value, "le");
			if( level and level > sp.maxLevel ) then
				return nil;
			end
		end
		
		if( sp.miniLevel ) then
			local iLevel = LootLink_SearchData(value, "il");
			if( not iLevel or iLevel < sp.miniLevel ) then
				return nil;
			end
		end
		
		if( sp.maxiLevel ) then
			local iLevel = LootLink_SearchData(value, "il");
			if( iLevel and iLevel > sp.maxiLevel ) then
				return nil;
			end
		end
		
		if( sp.type ) then
			local _type = LLS_TYPE_LIST[sp.type].value;
			if( _type ~= LootLink_SearchData(value, "ty") ) then
				return nil;
			end
			if( sp.subtype ) then
				local subtype;
				if( _type == LL.TYPE_ARMOR ) then
					subtype = LLS_SUBTYPE_ARMOR_LIST[sp.subtype].value;
				elseif( _type == LL.TYPE_SHIELD ) then
					subtype = LLS_SUBTYPE_SHIELD_LIST[sp.subtype].value;
				elseif( _type == LL.TYPE_WEAPON ) then
					subtype = LLS_SUBTYPE_WEAPON_LIST[sp.subtype].value;
				elseif( _type == LL.TYPE_RECIPE ) then
					subtype = LLS_SUBTYPE_RECIPE_LIST[sp.subtype].value;
				elseif( _type == LL.TYPE_GLYPH ) then
					subtype = LLS_SUBTYPE_GLYPH_LIST[sp.subtype].value;
				end
				if( _type == LL.TYPE_GEM ) then
					subtype = LLS_SUBTYPE_GEM_LIST[sp.subtype].value;
					if( subtype ) then
						local valueSubtype = LootLink_SearchData(value, "su");
						if( (valueSubtype == LL.SUBTYPE_GEM_META or subtype == LL.SUBTYPE_GEM_META) or
							 valueSubtype == LL.SUBTYPE_GEM_RED or valueSubtype == LL.SUBTYPE_GEM_YELLOW or valueSubtype == LL.SUBTYPE_GEM_BLUE ) then
							if( subtype ~= valueSubtype ) then
								return nil;
							end
						elseif( valueSubtype == (LL.SUBTYPE_GEM_RED + LL.SUBTYPE_GEM_YELLOW) ) then
							if( subtype == LL.SUBTYPE_GEM_BLUE ) then
								return nil;
							end
						elseif( valueSubtype == (LL.SUBTYPE_GEM_RED + LL.SUBTYPE_GEM_BLUE) ) then
							if( subtype == LL.SUBTYPE_GEM_YELLOW ) then
								return nil;
							end
						elseif( valueSubtype == (LL.SUBTYPE_GEM_YELLOW + LL.SUBTYPE_GEM_BLUE) ) then
							if( subtype == LL.SUBTYPE_GEM_RED ) then
								return nil;
							end
						end
					end
				else
					if( subtype and subtype ~= LootLink_SearchData(value, "su") ) then
						return nil;
					end
				end
			end
			
			if( _type == LL.TYPE_WEAPON ) then
				if( sp.minMinDamage ) then
					local damage = LootLink_SearchData(value, "mi");
					if( not damage or damage < sp.minMinDamage ) then
						return nil;
					end
				end

				if( sp.minMaxDamage ) then
					local damage = LootLink_SearchData(value, "ma");
					if( not damage or damage < sp.minMaxDamage ) then
						return nil;
					end
				end
				
				if( sp.minSpeed ) then
					local speed = LootLink_SearchData(value, "sp");
					if( not speed or speed < sp.minSpeed ) then
						return nil;
					end
				end

				if( sp.maxSpeed ) then
					local speed = LootLink_SearchData(value, "sp");
					if( not speed or speed > sp.maxSpeed ) then
						return nil;
					end
				end

				if( sp.minDPS ) then
					local DPS = LootLink_SearchData(value, "dp");
					if( not DPS or DPS < sp.minDPS ) then
						return nil;
					end
				end
			elseif( _type == LL.TYPE_ARMOR or _type == LL.TYPE_SHIELD ) then
				if( sp.minArmor ) then
					local armor = LootLink_SearchData(value, "ar");
					if( not armor or armor < sp.minArmor ) then
						return nil;
					end
				end
				
				if( _type == LL.TYPE_SHIELD ) then
					if( sp.minBlock ) then
						local block = LootLink_SearchData(value, "bl");
						if( not block or block < sp.minBlock ) then
							return nil;
						end
					end
				end
			elseif( _type == LL.TYPE_CONTAINER ) then
				if( sp.minSlots ) then
					local slots = LootLink_SearchData(value, "sl");
					if( not slots or slots < sp.minSlots ) then
						return nil;
					end
				end
			elseif( _type == LL.TYPE_RECIPE ) then
				if( sp.minSkill ) then
					local skill = LootLink_SearchData(value, "sk");
					if( not skill or skill < sp.minSkill ) then
						return nil;
					end
				end
				
				if( sp.maxSkill ) then
					local skill = LootLink_SearchData(value, "sk");
					if( not skill or skill > sp.maxSkill ) then
						return nil;
					end
				end
			end
		end
	else
		return nil;
	end

	return 1;
end

local function LootLink_NameComparison(elem1, elem2)
	return LootLink_GetName(elem1) < LootLink_GetName(elem2);
end

local function LootLink_ColorComparison(elem1, elem2)
	local color1;
	local color2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].c ) then
		color1 = ItemLinks[elem1].c;
	else
		color1 = "ffffffff";
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].c ) then
		color2 = ItemLinks[elem2].c;
	else
		color2 = "ffffffff";
	end
	
	if( color1 == color2 ) then
		return elem1 < elem2;
	end
	
	if( not lColorSortTable[color1] and not lColorSortTable[color2] ) then
		return color1 < color2;
	end
	
	if( lColorSortTable[color1] ) then
		if( lColorSortTable[color2] ) then
			return lColorSortTable[color1] < lColorSortTable[color2];
		end
		return nil;
	end
	return 1;
end

local function LootLink_GenericComparison(elem1, elem2, v1, v2)
	if( v1 == v2 ) then
		return elem1 < elem2;
	end
	if( not v1 ) then
		return 1;
	end
	if( not v2 ) then
		return nil;
	end
	if( tonumber(v1) and tonumber(v2) ) then
		return tonumber(v1) < tonumber(v2);
	end
	return v1 < v2;
end

local function LootLink_iLevelComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "il");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "il");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_BindsComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "bi");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "bi");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_UniqueComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "un");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "un");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_LocationComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "lo");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "lo");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_TypeComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ty");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ty");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SubtypeComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "su");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "su");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_MinDamageComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "mi");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "mi");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_MaxDamageComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ma");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ma");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SpeedComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sp");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sp");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_DPSComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "dp");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "dp");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_ArmorComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ar");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ar");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_BlockComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "bl");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "bl");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SlotsComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sl");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sl");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SkillComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sk");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sk");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_LevelComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "le");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "le");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_StrengthComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sg");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sg");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_AgilityComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ag");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ag");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_StaminaComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "st");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "st");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_IntellectComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "in");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "in");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SpiritComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "si");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "si");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_AttackPowerComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ap");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ap");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_ExpertiseComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "er");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "er");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_ARPComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "am");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "am");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_HitComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "ht");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "ht");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_CritComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "cr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "cr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_HasteComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "hr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "hr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SPComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_MP5Comparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "mr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "mr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_SpellPenComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "sn");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "sn");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_ResilienceComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "rr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "rr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_DefenseComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "dr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "dr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_DodgeComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "do");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "do");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_ParryComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "pr");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "pr");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_BlockRComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "br");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "br");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_BlockVComparison(elem1, elem2)
	local v1, v2;
	
	if( ItemLinks[elem1] and ItemLinks[elem1].d ) then
		v1 = LootLink_SearchData(ItemLinks[elem1], "bv");
	end
	if( ItemLinks[elem2] and ItemLinks[elem2].d ) then
		v2 = LootLink_SearchData(ItemLinks[elem2], "bv");
	end
	
	return LootLink_GenericComparison(elem1, elem2, v1, v2);
end

local function LootLink_Sort()
	local sortType = LOOTLINK_DROPDOWN_LIST[sdd:GetSelectedID(LootLinkFrameDropDown) or 1].sortType;
	if( sortType == "name" ) then
		table.sort(DisplayIndices, LootLink_NameComparison);
	elseif( sortType == "rarity" ) then
		table.sort(DisplayIndices, LootLink_ColorComparison);
	elseif( sortType == "iLevel" ) then
		table.sort(DisplayIndices, LootLink_iLevelComparison);
	elseif( sortType == "binds" ) then
		table.sort(DisplayIndices, LootLink_BindsComparison);
	elseif( sortType == "unique" ) then
		table.sort(DisplayIndices, LootLink_UniqueComparison);
	elseif( sortType == "location" ) then
		table.sort(DisplayIndices, LootLink_LocationComparison);
	elseif( sortType == "type" ) then
		table.sort(DisplayIndices, LootLink_TypeComparison);
	elseif( sortType == "subtype" ) then
		table.sort(DisplayIndices, LootLink_SubtypeComparison);
	elseif( sortType == "minDamage" ) then
		table.sort(DisplayIndices, LootLink_MinDamageComparison);
	elseif( sortType == "maxDamage" ) then
		table.sort(DisplayIndices, LootLink_MaxDamageComparison);
	elseif( sortType == "speed" ) then
		table.sort(DisplayIndices, LootLink_SpeedComparison);
	elseif( sortType == "DPS" ) then
		table.sort(DisplayIndices, LootLink_DPSComparison);
	elseif( sortType == "armor" ) then
		table.sort(DisplayIndices, LootLink_ArmorComparison);
	elseif( sortType == "block" ) then
		table.sort(DisplayIndices, LootLink_BlockComparison);
	elseif( sortType == "slots" ) then
		table.sort(DisplayIndices, LootLink_SlotsComparison);
	elseif( sortType == "skill" ) then
		table.sort(DisplayIndices, LootLink_SkillComparison);
	elseif( sortType == "level" ) then
		table.sort(DisplayIndices, LootLink_LevelComparison);
	end
end

local function LootLink_BuildDisplayIndices()
	local iNew = 1;
	local index;
	local value;
	local UsabilityData;
	
	if( LootLinkFrame.SearchParams and LootLinkFrame.SearchParams.usable ) then
		UsabilityData = { };
		BuildUsabilityData(UsabilityData);
	end
	
	DisplayIndices = { };
	for index, value in pairs(ItemLinks) do
		if( LootLink_MatchesSearch(index, value, UsabilityData) ) then
			DisplayIndices[iNew] = index;
			iNew = iNew + 1;
		end
	end
	DisplayIndices.onePastEnd = iNew;
	LootLink_Sort();
	LootLink_SetTitle();
end

function LootLink_Reset()
	ItemLinks = { };

	LootLink_SetDataVersion(LOOTLINK_CURRENT_DATA_VERSION);
	DEFAULT_CHAT_FRAME:AddMessage(LOOTLINK_RESET_DONE);

	LootLink_InitSizes(LL.lServerIndex);
	
	if( DisplayIndices ) then
		LootLink_BuildDisplayIndices();
		LootLink_Update();
	end
end

function LootLink_LightMode()
	local index;
	local value;

	for index, value in pairs(ItemLinks) do
		value.t = nil;
	end
	LootLinkState.LightMode = 1;
end

--
-- Uncategorized functions; will sort later
--

local function LootLinkFrameDropDown_Initialize()
	local info = { };
	for i = 1, #LOOTLINK_DROPDOWN_LIST, 1 do
		info.text = LOOTLINK_DROPDOWN_LIST[i].name;
		info.func = LootLinkFrameDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_RarityDropDown_Initialize()
	local info = { };
	for i = 1, #LLS_RARITY_LIST, 1 do
		info.text = LLS_RARITY_LIST[i].name;
		info.func = LLS_RarityDropDown_OnClick;	
		if( LLS_RARITY_LIST[i].value ) then
			info.colorCode = "|c"..LLS_RARITY_LIST[i].value;
		end
		sdd:AddButton(info);
	end
end

local function LLS_BindsDropDown_Initialize()
	local info;
	for i = 1, #LLS_BINDS_LIST, 1 do
		info = { };
		info.text = LLS_BINDS_LIST[i].name;
		info.func = LLS_BindsDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_LocationDropDown_Initialize()
	local info;
	for i = 1, #LLS_LOCATION_LIST, 1 do
		info = { };
		info.text = LLS_LOCATION_LIST[i].name;
		info.func = LLS_LocationDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_StatDropDown1_Initialize()
	local info;
	for i = 1, #LLS_STAT_LIST, 1 do
		info = { };
		info.text = LLS_STAT_LIST[i].name;
		info.func = LLS_StatDropDown1_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_StatDropDown2_Initialize()
	local info;
	for i = 1, #LLS_STAT_LIST, 1 do
		info = { };
		info.text = LLS_STAT_LIST[i].name;
		info.func = LLS_StatDropDown2_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_StatDropDown3_Initialize()
	local info;
	for i = 1, #LLS_STAT_LIST, 1 do
		info = { };
		info.text = LLS_STAT_LIST[i].name;
		info.func = LLS_StatDropDown3_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_StatDropDown4_Initialize()
	local info;
	for i = 1, #LLS_STAT_LIST, 1 do
		info = { };
		info.text = LLS_STAT_LIST[i].name;
		info.func = LLS_StatDropDown4_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_StatDropDown5_Initialize()
	local info;
	for i = 1, #LLS_STAT_LIST, 1 do
		info = { };
		info.text = LLS_STAT_LIST[i].name;
		info.func = LLS_StatDropDown5_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_TypeDropDown_Initialize()
	local info;
	for i = 1, #LLS_TYPE_LIST, 1 do
		info = { };
		info.text = LLS_TYPE_LIST[i].name;
		info.func = LLS_TypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownArmor_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_ARMOR_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_ARMOR_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownGem_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_GEM_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_GEM_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownGlyph_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_GLYPH_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_GLYPH_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownShield_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_SHIELD_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_SHIELD_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownWeapon_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_WEAPON_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_WEAPON_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LLS_SubtypeDropDownRecipe_Initialize()
	local info;
	for i = 1, #LLS_SUBTYPE_RECIPE_LIST, 1 do
		info = { };
		info.text = LLS_SUBTYPE_RECIPE_LIST[i].name;
		info.func = LLS_SubtypeDropDown_OnClick;
		sdd:AddButton(info);
	end
end

local function LootLink_SetupTypeUI(iType, iSubtype)
	local _type = LLS_TYPE_LIST[iType].value;
	
	-- Hide all of the variable labels and fields to start
	_G["LLS_SubtypeLabel"]:Hide();
	_G["LLS_SubtypeDropDown"]:Hide();
	_G["LLS_MinimumArmorLabel"]:Hide();
	_G["LLS_MinimumBlockLabel"]:Hide();
	_G["LLS_DamageRangeLabel"]:Hide();
	_G["LLS_SpeedRangeLabel"]:Hide();
	_G["LLS_MinimumDPSLabel"]:Hide();
	_G["LLS_MinimumSlotsLabel"]:Hide();
	_G["LLS_SkillRangeLabel"]:Hide();
	_G["LLS_MinimumArmorEditBox"]:Hide();
	_G["LLS_MinimumBlockEditBox"]:Hide();
	_G["LLS_MinimumDamageEditBox"]:Hide();
	_G["LLS_MaximumDamageEditBox"]:Hide();
	_G["LLS_MinimumSpeedEditBox"]:Hide();
	_G["LLS_MaximumSpeedEditBox"]:Hide();
	_G["LLS_MinimumDPSEditBox"]:Hide();
	_G["LLS_MinimumSlotsEditBox"]:Hide();
	_G["LLS_MinimumSkillEditBox"]:Hide();
	_G["LLS_MaximumSkillEditBox"]:Hide();
	
	LootLinkFrame.TypeSearchEditFields = { };
	local fields = LootLinkFrame.TypeSearchEditFields;
	
	if( _type == LL.TYPE_ARMOR or _type == LL.TYPE_SHIELD or _type == LL.TYPE_WEAPON or _type == LL.TYPE_RECIPE or _type == LL.TYPE_GEM or _type == LL.TYPE_GLYPH ) then
		local label = _G["LLS_SubtypeLabel"];
		local dropdown = _G["LLS_SubtypeDropDown"];
		local initfunc;
		
		-- Show the dropdown and its label
		label:Show();
		dropdown:Show();
		
		if( _type == LL.TYPE_ARMOR ) then
			label:SetText(LLS_SUBTYPE_ARMOR);
			initfunc = LLS_SubtypeDropDownArmor_Initialize;
			
			_G["LLS_MinimumArmorLabel"]:Show();
			
			field =_G["LLS_MinimumArmorEditBox"];
			field:Show();
			tinsert(fields, field);
		elseif( _type == LL.TYPE_GEM ) then
			label:SetText(LLS_SUBTYPE_GEM);
			initfunc = LLS_SubtypeDropDownGem_Initialize;
		elseif( _type == LL.TYPE_GLYPH ) then
			label:SetText(LLS_SUBTYPE_GLYPH);
			initfunc = LLS_SubtypeDropDownGlyph_Initialize;
		elseif( _type == LL.TYPE_SHIELD ) then
			label:SetText(LLS_SUBTYPE_SHIELD);
			initfunc = LLS_SubtypeDropDownShield_Initialize;

			_G["LLS_MinimumArmorLabel"]:Show();
			_G["LLS_MinimumBlockLabel"]:Show();
			
			field = _G["LLS_MinimumArmorEditBox"];
			field:Show();
			tinsert(fields, field);
			
			field = _G["LLS_MinimumBlockEditBox"];
			field:Show();
			tinsert(fields, field);
		elseif( _type == LL.TYPE_WEAPON ) then
			label:SetText(LLS_SUBTYPE_WEAPON);
			initfunc = LLS_SubtypeDropDownWeapon_Initialize;
			
			_G["LLS_DamageRangeLabel"]:Show();
			_G["LLS_SpeedRangeLabel"]:Show();
			_G["LLS_MinimumDPSLabel"]:Show();
			
			field =_G["LLS_MinimumDamageEditBox"];
			field:Show();
			tinsert(fields, field);
			
			field = _G["LLS_MaximumDamageEditBox"];
			field:Show();
			tinsert(fields, field);

			field =_G["LLS_MinimumSpeedEditBox"];
			field:Show();
			tinsert(fields, field);

			field = _G["LLS_MaximumSpeedEditBox"];
			field:Show();
			tinsert(fields, field);

			field = _G["LLS_MinimumDPSEditBox"];
			field:Show();
			tinsert(fields, field);
		else
			label:SetText(LLS_SUBTYPE_RECIPE);
			initfunc = LLS_SubtypeDropDownRecipe_Initialize;

			_G["LLS_SkillRangeLabel"]:Show();
			
			field = _G["LLS_MinimumSkillEditBox"];
			field:Show();
			tinsert(fields, field);

			field = _G["LLS_MaximumSkillEditBox"];
			field:Show();
			tinsert(fields, field);
		end
		
		sdd:Initialize(dropdown, initfunc);
		sdd:SetSelectedID(dropdown, iSubtype or 1);
	elseif( _type == LL.TYPE_CONTAINER ) then
		_G["LLS_MinimumSlotsLabel"]:Show();

		field = _G["LLS_MinimumSlotsEditBox"];
		field:Show();
		tinsert(fields, field);
	end
end

local function LootLink_InspectSlot(unit, id)
	local link = GetInventoryItemLink(unit, id);
	if( link ) then
		local llid = LootLink_ProcessLinks(link);
		if( llid and ItemLinks[llid] ) then
			LootLink_Event_InspectSlot(LootLink_GetName(llid), 1, ItemLinks[llid], unit, id);
			LootLink_Event_InspectSlotId(llid, 1, ItemLinks[llid], unit, id);
		end
	end
end

local function LootLink_Inspect(who)
	if (CanInspect(who)) then
		NotifyInspect(who);

		local index;
		for index = 1, #INVENTORY_SLOT_LIST, 1 do
			LootLink_InspectSlot(who, INVENTORY_SLOT_LIST[index].id)
		end
		if not ( InspectFrame and InspectFrame:IsVisible() ) then	
			ClearInspectPlayer();
		end
	end
end

local function LootLink_ScanInventory()
	local bagid;
	local size;
	local slotid;
	local link;
	
	for bagid = 0, 4, 1 do
		size = GetContainerNumSlots(bagid);
		if( size ) then
			for slotid = size, 1, -1 do
				link = GetContainerItemLink(bagid, slotid);
				if( link ) then
					local llid = LootLink_ProcessLinks(link);
					if( llid and ItemLinks[llid] ) then
						LootLink_Event_ScanInventory(LootLink_GetName(llid), 1, ItemLinks[llid], bagid, slotid);
						LootLink_Event_ScanInventoryId(llid, 1, ItemLinks[llid], bagid, slotid);
					end
				end
			end
		end
	end
end

local function LootLink_ScanSelf()
	if( not LL.lastSelfScanTime or GetTime() - LL.lastSelfScanTime > LOOTLINK_SELF_SCAN_BUFFER_TIME ) then
		LootLink_ScanInventory();
		LootLink_Inspect("player");
		LL.lastSelfScanTime = GetTime();
	end
end

local function LootLink_ScanMerchant()
	local cItems = GetMerchantNumItems();
	local iItem;
	
	for iItem = 1, cItems, 1 do
		local link = GetMerchantItemLink(iItem);
		if( link ) then
			local llid = LootLink_ProcessLinks(link);
			if( llid and ItemLinks[llid] ) then
				LootLink_Event_ScanMerchant(LootLink_GetName(llid), ItemLinks[llid], iItem);
				LootLink_Event_ScanMerchantId(llid, ItemLinks[llid], iItem);
			end
		end
	end
end

local function LootLink_ScanQuest(questState)
	local fQuestLog;
	local cQuestChoices;
	local cQuestRewards;
	local iItem;
	local link;
	local llid;
	
	-- QuestInfoFrame.questLog is a Cata function
	fQuestLog = (questState == "QuestLog");
	if( fQuestLog ) then
		cQuestChoices = GetNumQuestLogChoices();
		cQuestRewards = GetNumQuestLogRewards();
	else
		cQuestChoices = GetNumQuestChoices();
		cQuestRewards = GetNumQuestRewards();
	end
	
	for iItem = 1, cQuestChoices, 1 do
		if( fQuestLog ) then
			link = GetQuestLogItemLink("choice", iItem);
		else
			link = GetQuestItemLink("choice", iItem);
		end
		if( link ) then
			llid = LootLink_ProcessLinks(link);
			if( llid and ItemLinks[llid] ) then
				LootLink_Event_ScanQuest(LootLink_GetName(llid), ItemLinks[llid], fQuestLog, "choice", iItem);
				LootLink_Event_ScanQuestId(llid, ItemLinks[llid], fQuestLog, "choice", iItem);
			end
		end
	end
	
	for iItem = 1, cQuestRewards, 1 do
		if( fQuestLog ) then
			link = GetQuestLogItemLink("reward", iItem);
		else
			link = GetQuestItemLink("reward", iItem);
		end
		if( link ) then
			llid = LootLink_ProcessLinks(link);
			if( llid and ItemLinks[llid] ) then
				LootLink_Event_ScanQuest(LootLink_GetName(llid), ItemLinks[llid], fQuestLog, "reward", iItem);
				LootLink_Event_ScanQuestId(llid, ItemLinks[llid], fQuestLog, "reward", iItem);
			end
		end
	end
end

local function LootLinkAutoComplete_ShowTooltip(self)
	if( not self.mouseTooltip ) then
		local button = _G["LootLinkAutoCompleteButton"..self.index];
		local link = LootLink_GetHyperlink(button.llid);
		if( link ) then
			LootLinkAutoCompleteTooltip:SetOwner(button, "ANCHOR_RIGHT");
			LootLink_SetHyperlinkFromId(LootLinkAutoCompleteTooltip, button.llid, link);
		end
	end
end

local function LootLink_AutoComplete_SetIndex(self, newIndex)
	local index;
	for index = 1, LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT do
		_G["LootLinkAutoCompleteButton"..index]:UnlockHighlight();
	end
	_G["LootLinkAutoCompleteButton"..newIndex]:LockHighlight();
	
	self.index = newIndex;
	LootLinkAutoComplete_ShowTooltip(self);
end

local function LootLinkAutoComplete_Hide(self, reset)
	if( reset ) then
		self.editBox = nil;
		self.last = nil;
		LL.lAutoCompleteStartIndex = nil;
	end

	LootLinkAutoCompleteTooltip:Hide();
	self:Hide();
end

local function LootLink_ChatEdit_OnTextChanged(self, userInput)
	local text = self:GetText();
	local length = string.len(text);
	local frame = LootLinkAutoCompleteFrame;
	
	-- Check for cases where we don't have to do any work
	if( not LootLinkState or
		not LootLinkState.AutoComplete or
		(frame.editBox and frame.editBox ~= self) or
		frame.last == text )
	then
		return;
	end

	frame.editBox = self;
	frame.last = text;
	
	if( LL.lAutoCompleteStartIndex ) then
		if( string.sub(text, LL.lAutoCompleteStartIndex, LL.lAutoCompleteStartIndex) ~= "[" ) then
			-- We've lost our start bracket and are in a weird state; reset ourselves
			LootLinkAutoComplete_Hide(frame, true);
		else
			if( string.sub(text, length) == "]" ) then
				-- Replace the bracketed text with our current autocomplete entry
				LootLink_AutoCompleteButton_OnClick(_G["LootLinkAutoCompleteButton"..LootLinkAutoCompleteFrame.index]);
			else
				-- Update the autocomplete popup menu
				
				-- Move the frame first
				frame:ClearAllPoints();
				if( self:GetBottom() - frame.maxHeight <= 13 ) then
					frame:SetPoint("BOTTOMLEFT", self, "TOPLEFT", frame.x, -3);
				else
					frame:SetPoint("TOPLEFT", self, "BOTTOMLEFT", frame.x, 3);
				end
				
				-- Now find matching items
				local count = 0;
				local maxWidth = max(120, LootLinkAutoCompleteInstructions:GetStringWidth() + 30);
				local pattern = LootLink_EscapePattern(string.lower(string.sub(text, LL.lAutoCompleteStartIndex + 1)));
				
				if( pattern ~= "" ) then
					local itemid = string.match(pattern, "^(%-?%d+):");
					local match;
					local button;
					
					-- This could be a lot faster if we restricted ourselves to matches at the beginning of
					-- the item name (store {name, llid} pairs in sorted table, binary search that table),
					-- but being able to match anywhere in the item name is substantially more interesting.
					
					for llid, value in pairs(ItemLinks) do
						if( itemid ) then
							match = llid;
						else
							match = LootLink_GetName(llid);
						end
						if( string.match(string.lower(match), pattern) ) then
							count = count + 1;
							if( count > LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT ) then
								button = _G["LootLinkAutoCompleteButton"..LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT];
								button:SetText(CONTINUED);
								maxWidth = max(maxWidth, button:GetFontString():GetWidth() + 30);
								button:GetFontString():SetTextColor(0.5, 0.5, 0.5);
								button.llid = nil;
								button:Disable();
								break;
							else
								button = _G["LootLinkAutoCompleteButton"..count];
								button:SetText(LootLink_GetName(llid));
								maxWidth = max(maxWidth, button:GetFontString():GetWidth() + 30);
								button:GetFontString():SetTextColor(LootLink_GetRGBFromHexColor(ItemLinks[llid].c));
								button:Enable();
								button.llid = llid;
								button:Show();
							end
						end
					end
				end
				
				-- Hide any unused buttons
				local index;
				
				for index = count + 1, LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT do
					_G["LootLinkAutoCompleteButton"..index]:Hide();
				end
				
				-- Now update the frame itself -- sizing, showing, setting selection and count, etc.
				if( count > 0 ) then
					LootLink_AutoComplete_SetIndex(frame, 1);
					if( count > LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT ) then
						frame.count = LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT - 1;
						count = LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT;
					else
						frame.count = count;
					end
					
					-- Set the width of each of the buttons to the maxWidth to allow the highlight to size appropriately
					for index = 1, count do
						_G["LootLinkAutoCompleteButton"..index]:SetWidth(maxWidth);
					end

					frame:SetHeight(count * LootLinkAutoCompleteButton1:GetHeight() + 35);
					frame:SetWidth(maxWidth);
					frame:Show();
				else
					LootLinkAutoComplete_Hide(frame, false);
				end
			end
		end
	end

	if( not LL.lAutoCompleteStartIndex ) then
		-- No start bracket; check to see whether the current text ends in one
		if( string.sub(text, length) == "[" ) then
			LL.lAutoCompleteStartIndex = length;
			
			-- Figure out where to position the popup frame -- this is hacky :(
			local left, _, _, _ = self:GetTextInsets();
			local fontstring = _G["LootLinkAutoCompleteWidthTest"];
			fontstring:SetText(text);
			local width = fontstring:GetStringWidth();
			fontstring:SetText("");
			
			frame.x = left + width - 15;
		end
	end
end

local function LootLink_ChatEdit_OnEscapePressed(self)
	if( LootLinkAutoCompleteFrame.editBox == self and not self:IsShown() ) then
		LootLinkAutoComplete_Hide(LootLinkAutoCompleteFrame, true);
	end
end

local function LootLink_ChatEdit_CustomTabPressed(self)
	local frame = LootLinkAutoCompleteFrame;
	if( frame:IsShown() ) then
		local index = frame.index;
		local count = frame.count;
		local newIndex;
		if( IsShiftKeyDown() ) then
			newIndex = index - 1;
			if( newIndex < 1 ) then
				newIndex = count;
			end
		else
			newIndex = index + 1;
			if( newIndex > count ) then
				newIndex = 1;
			end
		end
		LootLink_AutoComplete_SetIndex(frame, newIndex);
		return true;
	end
	return LL.lOriginal_ChatEdit_CustomTabPressed(self);
end

local function LootLink_ScanLoot()
	local cItems = GetNumLootItems();
	local iItem;
	
	for iItem = 1, cItems, 1 do
		local link = GetLootSlotLink(iItem);
		if( link ) then
			local llid = LootLink_ProcessLinks(link);
			if( llid and ItemLinks[llid] ) then
				LootLink_Event_ScanLoot(LootLink_GetName(llid), ItemLinks[llid], iItem);
				LootLink_Event_ScanLootId(llid, ItemLinks[llid], iItem);
			end
		end
	end
end

local function LootLink_ScanRoll(id)
	local link = GetLootRollItemLink(id);
	if( link ) then
		local llid = LootLink_ProcessLinks(link);
		if( llid and ItemLinks[llid] ) then
			LootLink_Event_ScanRoll(LootLink_GetName(llid), ItemLinks[llid], id);
			LootLink_Event_ScanRollId(llid, ItemLinks[llid], id);
		end
	end
end

local function LootLink_StartAuctionScan()
	local iButton;
	local button;

	-- Hide the UI from any current results, show the no results text so we can use it
	BrowseNoResultsText:Show();
	for iButton = 1, NUM_BROWSE_TO_DISPLAY do
		button = _G["BrowseButton"..iButton];
		button:Hide();
	end
	BrowsePrevPageButton:Hide();
	BrowseNextPageButton:Hide();
	BrowseSearchCountText:Hide();

	-- Start with the first page
	lCurrentAuctionPage = nil;

	-- Hook the functions that we need for the scan
	if( not LL.lOriginal_CanSendAuctionQuery ) then
		LL.lOriginal_CanSendAuctionQuery = CanSendAuctionQuery;
		CanSendAuctionQuery = LootLink_CanSendAuctionQuery;
	end
	if( not LL.lOriginal_AuctionFrameBrowse_OnEvent ) then
		LL.lOriginal_AuctionFrameBrowse_OnEvent = AuctionFrameBrowse:GetScript("OnEvent");
		AuctionFrameBrowse:SetScript("OnEvent", LootLink_AuctionFrameBrowse_OnEvent);
	end
	
	LootLink_Event_StartAuctionScan();
end

local function LootLink_StopAuctionScan()
	LootLink_Event_StopAuctionScan();
	
	-- Unhook the scanning functions
	if( LL.lOriginal_CanSendAuctionQuery ) then
		CanSendAuctionQuery = LL.lOriginal_CanSendAuctionQuery;
		LL.lOriginal_CanSendAuctionQuery = nil;
	end
	if( LL.lOriginal_AuctionFrameBrowse_OnEvent ) then
		AuctionFrameBrowse:SetScript("OnEvent", LL.lOriginal_AuctionFrameBrowse_OnEvent);
		LL.lOriginal_AuctionFrameBrowse_OnEvent = nil;
	end
end

local function LootLink_AuctionNextQuery()
	if( lCurrentAuctionPage ) then
		local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");
		local maxPages = floor(totalAuctions / NUM_AUCTION_ITEMS_PER_PAGE);
		
		if( lCurrentAuctionPage < maxPages ) then
			lCurrentAuctionPage = lCurrentAuctionPage + 1;
			BrowseNoResultsText:SetText(format(LOOTLINK_AUCTION_PAGE_N, lCurrentAuctionPage + 1, maxPages + 1));
		else
			LootLink_StopAuctionScan();
			if( totalAuctions > 0 ) then
				BrowseNoResultsText:SetText(LOOTLINK_AUCTION_SCAN_DONE);
				LootLink_Event_FinishedAuctionScan();
			end
			return;
		end
	else
		lCurrentAuctionPage = 0;
		BrowseNoResultsText:SetText(LOOTLINK_AUCTION_SCAN_START);
	end
	QueryAuctionItems("", "", "", nil, nil, nil, lCurrentAuctionPage, nil, nil);
	LootLink_Event_AuctionQuery(lCurrentAuctionPage);
end

local function LootLink_ScanAuction()
	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");
	local auctionid;

	if( numBatchAuctions > 0 ) then
		for auctionid = 1, numBatchAuctions do
			local link = GetAuctionItemLink("list", auctionid);
			if( link ) then
				local llid = LootLink_ProcessLinks(link);
				if( llid and ItemLinks[llid] ) then
					LootLink_Event_ScanAuction(name, 1, ItemLinks[llid], lCurrentAuctionPage, auctionid);
					LootLink_Event_ScanAuctionId(llid, 1, ItemLinks[llid], lCurrentAuctionPage, auctionid);
				end
			end
		end
	end
end

local function LootLink_ScanBank()
	local index;
	local bagid;
	local size;
	local slotid;
	
	for index, bagid in pairs(lBankBagIDs) do
		size = GetContainerNumSlots(bagid);
		if( size ) then
			for slotid = size, 1, -1 do
				local link = GetContainerItemLink(bagid, slotid);
				if( link ) then
					local llid = LootLink_ProcessLinks(link);
					if( llid and ItemLinks[llid] ) then
						LootLink_Event_ScanBank(LootLink_GetName(llid), 1, ItemLinks[llid], bagid, slotid);
						LootLink_Event_ScanBankId(llid, 1, ItemLinks[llid], bagid, slotid);
					end
				end
			end
		end
	end
end

local function LootLink_ScanGuildBankTab()
	local slotid;
	local currentTab = GetCurrentGuildBankTab();

	for slotid = 1, (MAX_GUILDBANK_SLOTS_PER_TAB or 98) do
		local link = GetGuildBankItemLink(currentTab, slotid);
		if( link ) then
			local llid = LootLink_ProcessLinks(link);
			if( llid and ItemLinks[llid] ) then
				LootLink_Event_ScanGuildBank(LootLink_GetName(llid), 1, ItemLinks[llid], currentTab, slotid);
				LootLink_Event_ScanGuildBankId(llid, 1, ItemLinks[llid], currentTab, slotid);
			end
		end
	end
end

local function LootLink_CheckVersionReminder()
	local index;
	local value;
	local version;
	
	version = LootLink_GetDataVersion();
	for index, value in pairs(LOOTLINK_DATA_UPGRADE_HELP) do
		if( version < value.version and (not value.minVersion or version >= value.minVersion) ) then
			DEFAULT_CHAT_FRAME:AddMessage(value.text);
		end
	end
end

local function LootLink_UpgradeData()
	local name;
	local item;
	
	if( LootLink_GetDataVersion() < 200 ) then
		local UpgradedItemLinks = { };

		for name, item in pairs(ItemLinks) do
			LootLink_ConvertServerFormat(item);
			if( item.item ) then
				item.i = item.item;
				item.item = nil;
			end
			if( item.i ) then
				LootLink_UpgradeLink(item);

				local itemid = string.match(item.i, "^(%-?%d+):");
				if( itemid ) then
					local llid = itemid..":"..name;
					UpgradedItemLinks[llid] = item;
				end
			end
			if( item.color ) then
				item.c = item.color;
				item.color = nil;
			end
			item.price = nil;
			item.stack = nil;

			item.p = nil;
			item.x = nil; -- stackable flag dropped in data version 2.01
			
			if( item.SearchData ) then
				local data = "";

				if( item.SearchData.type ) then
					data = data.."ty"..item.SearchData.type.."·";
				end
				if( item.SearchData.location ) then
					data = data.."lo"..LocationTypes[item.SearchData.location].i.."·";
				end
				if( item.SearchData.subtype ) then
					data = data.."su"..item.SearchData.subtype.."·";
				end
				if( item.SearchData.binds ) then
					data = data.."bi"..item.SearchData.binds.."·";
				end
				if( item.SearchData.level ) then
					data = data.."le"..item.SearchData.level.."·";
				end
				if( item.SearchData.armor ) then
					data = data.."ar"..item.SearchData.armor.."·";
				end
				if( item.SearchData.minDamage ) then
					data = data.."mi"..item.SearchData.minDamage.."·";
				end
				if( item.SearchData.maxDamage ) then
					data = data.."ma"..item.SearchData.maxDamage.."·";
				end
				if( item.SearchData.speed ) then
					data = data.."sp"..item.SearchData.speed.."·";
				end
				if( item.SearchData.DPS ) then
					data = data.."dp"..item.SearchData.DPS.."·";
				end
				if( item.SearchData.unique ) then
					data = data.."un"..item.SearchData.unique.."·";
				end
				if( item.SearchData.block ) then
					data = data.."bl"..item.SearchData.block.."·";
				end
				if( item.SearchData.slots ) then
					data = data.."sl"..item.SearchData.slots.."·";
				end
				if( item.SearchData.skill ) then
					data = data.."sk"..item.SearchData.skill.."·";
				end
				
				if( item.SearchData.text ) then
					item.t = item.SearchData.text;
				end
				
				item.d = data;
				item.SearchData = nil;
			end
		end
	
		ItemLinks = UpgradedItemLinks;
	elseif( LootLink_GetDataVersion() < 201 ) then
		for name, item in pairs(ItemLinks) do
			item.x = nil; -- stackable flag dropped in data version 2.01
		end
	end

	LootLink_SetDataVersion(LOOTLINK_CURRENT_DATA_VERSION);
end

local function LootLink_VariablesLoaded()
	LL.lServer = GetCVar("realmName");
	LL.lServerIndex = LootLink_AddServer(LL.lServer);
	
	LL.lReady = true;

	LootLink_CheckVersionReminder();
	if( not ItemLinks or LootLink_GetDataVersion() < 110 ) then
		LootLink_Reset();
	else
		LootLink_UpgradeData();
		LootLink_InitSizes(LL.lServerIndex);
	end
	LootLinkOptions_Init();
end

--------------------------------------------------------------------------------------------------
-- OnFoo functions
--------------------------------------------------------------------------------------------------
function LootLink_OnLoad(self)
	local index;
	local value;

	for index, value in pairs(LootLinkPanelLayout[self:GetName()]) do
		self:SetAttribute("UIPanelLayout-"..index, value);
	end

	for index, value in pairs(ChatMessageTypes) do
		self:RegisterEvent(value);
	end

	for index = 1, #INVENTORY_SLOT_LIST, 1 do
		INVENTORY_SLOT_LIST[index].id = GetInventorySlotInfo(INVENTORY_SLOT_LIST[index].name);
	end
	
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_LEAVING_WORLD");
	self:RegisterEvent("BANKFRAME_OPENED");
	self:RegisterEvent("GUILDBANKBAGSLOTS_CHANGED");
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("AUCTION_HOUSE_SHOW");
	self:RegisterEvent("AUCTION_HOUSE_CLOSE");
	self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
	self:RegisterEvent("MERCHANT_SHOW");
	self:RegisterEvent("MERCHANT_UPDATE");
	self:RegisterEvent("LOOT_OPENED");
	self:RegisterEvent("START_LOOT_ROLL");
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA");

	LLHiddenTooltip:SetScript("OnTooltipAddMoney", nil);
	LLHiddenTooltip:SetScript("OnTooltipCleared", nil);
	
	-- Register our slash command
	SLASH_LOOTLINK1 = "/lootlink";
	SLASH_LOOTLINK2 = "/ll";
	SlashCmdList["LOOTLINK"] = function(msg)
		LootLink_SlashCommandHandler(msg);
	end

	-- Hook the quest item update function
	hooksecurefunc("QuestInfo_ShowRewards", LootLink_ScanQuest);
	
	-- Hook the chat edit functions we need for auto completion
	hooksecurefunc("ChatEdit_OnTextChanged", LootLink_ChatEdit_OnTextChanged);
	hooksecurefunc("ChatEdit_OnEscapePressed", LootLink_ChatEdit_OnEscapePressed);
	LL.lOriginal_ChatEdit_CustomTabPressed = ChatEdit_CustomTabPressed;
	ChatEdit_CustomTabPressed = LootLink_ChatEdit_CustomTabPressed;

	if( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage("LootLink AddOn loaded");
	end
end

function LootLink_OptionsOnLoad(self)
	self.name = GetAddOnMetadata("LootLink", "Title")
	InterfaceOptions_AddCategory(self)
end

function LootLink_CanSendAuctionQuery(...)
	local value = LL.lOriginal_CanSendAuctionQuery(...);
	if( value ) then
		LootLink_AuctionNextQuery();
		return nil;
	end
	return value;
end

function LootLink_AuctionFrameBrowse_OnEvent(self, event, ...)
	-- Intentionally empty; don't allow the auction UI to update while we're scanning
end

local function LootLink_DoInitialWork()
	if( LL.lReady and LL.lPlayerInWorld ) then
		if( not LL.lAtlasLootLoaded and type(AtlasLoot_LoadAllModules) == "function" ) then
			AtlasLoot_LoadAllModules();
			LL.lAtlasLootLoaded = true;
		end
		LootLink_ScanSelf();
		LL.lInitialWorkDone = true;
	end
end

function LootLink_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6 = ...;
	if( event == "PLAYER_TARGET_CHANGED" ) then
		if( not InCombatLockdown() and not UnitIsUnit("target", "player") and UnitIsPlayer("target") ) then
			LootLink_Inspect("target");
		end
	elseif( event == "UPDATE_MOUSEOVER_UNIT" ) then
		if( not InCombatLockdown() and not UnitIsUnit("mouseover", "player") and UnitIsPlayer("mouseover") and not ( InspectFrame and InspectFrame:IsVisible() )) then
			LootLink_Inspect("mouseover");
		end
	elseif( event == "PLAYER_LOGIN" or event == "ZONE_CHANGED_NEW_AREA" ) then
		if( not LL.lUnitInventoryChangedRegistered ) then
			-- At this point, it's safe to watch for inventory changes
			self:RegisterEvent("UNIT_INVENTORY_CHANGED");
			LL.lUnitInventoryChangedRegistered = true;
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		LL.lPlayerInWorld = true;

		-- Do initial scan of inventory and equipped items if needed
		if( not LL.lInitialWorkDone ) then
			LootLink_DoInitialWork();
		end
	elseif( event == "PLAYER_REGEN_ENABLED" ) then
		if( LL.lScanInventoryAfterCombat ) then
			LL.lScanInventoryAfterCombat = false;
			LootLink_ScanSelf();
		end
	elseif( event == "PLAYER_LEAVING_WORLD" ) then
		LL.lPlayerInWorld = false;
		
		-- When we leave the world, we don't need to watch for inventory changes,
		-- especially since zoning will cause one UNIT_INVENTORY_CHANGED event for
		-- each item in the player's inventory and that they have equipped
		self:UnregisterEvent("UNIT_INVENTORY_CHANGED");
		LL.lUnitInventoryChangedRegistered = false;
	elseif( event == "UNIT_INVENTORY_CHANGED" ) then
		if( arg1 == "player" ) then
			if( InCombatLockdown() ) then
				LL.lScanInventoryAfterCombat = true;
			else
				LootLink_ScanSelf();
			end
		end
	elseif( event == "BANKFRAME_OPENED" ) then
		LootLink_ScanBank();
	elseif( event == "GUILDBANKBAGSLOTS_CHANGED" ) then
		LootLink_ScanGuildBankTab();
	elseif( event == "VARIABLES_LOADED" ) then
		LootLink_VariablesLoaded();

		-- Do initial scan of inventory and equipped items if needed
		if( not LL.lInitialWorkDone ) then
			LootLink_DoInitialWork();
		end
	elseif( event == "AUCTION_HOUSE_SHOW" ) then
		if( LL.lScanAuction ) then
			LL.lScanAuction = false;
			LootLink_StartAuctionScan();
		end
	elseif( event == "AUCTION_HOUSE_CLOSED" ) then
		LootLink_StopAuctionScan();
	elseif( event == "AUCTION_ITEM_LIST_UPDATE" ) then
		LootLink_ScanAuction();
	elseif( event == "MERCHANT_SHOW" ) then
		LootLink_ScanMerchant();
	elseif( event == "MERCHANT_UPDATE" ) then
		LootLink_ScanMerchant();
	elseif( event == "LOOT_OPENED" ) then
		LootLink_ScanLoot();
	elseif( event == "START_LOOT_ROLL" ) then
		LootLink_ScanRoll(arg1);
	else
		local llid = LootLink_ProcessLinks(arg1);
		if( llid and ItemLinks[llid] ) then
			LootLink_Event_ScanChat(LootLink_GetName(llid), ItemLinks[llid], arg1);
			LootLink_Event_ScanChatId(llid, ItemLinks[llid], arg1);
		end
	end
end

function LootLinkItemButton_OnClick(self, button)
	if( button == "LeftButton" ) then
		if( IsShiftKeyDown() ) then
			if( ChatEdit_GetActiveWindow() ) then
				ChatEdit_InsertLink(LootLink_GetLink(self.llid));
			end
		elseif( IsControlKeyDown() ) then
			DressUpItemLink(LootLink_GetLink(self.llid));
		else 
			SetItemRef(LootLink_GetLink(self.llid));
		end
	end
	if( button == "RightButton" ) then
		if( IsShiftKeyDown() and IsControlKeyDown() ) then
			ItemLinks[self.llid] = nil;
			LootLink_Refresh();
		end
	end
end

function LootLink_OnShow(self)
	PlaySound("igMainMenuOpen");
	LootLink_Update();
end

function LootLink_OnHide(self)
	PlaySound("igMainMenuClose");
end

-- this disables tooltips.  Doesn't pull data from things, because of llid instead of name.
function LootLinkItemButton_OnEnter(self)
	local link = LootLink_GetHyperlink(self.llid);
	if( link ) then
		LootLinkFrame.TooltipButton = self:GetID();
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
		local cached = LootLink_SetHyperlinkFromId(GameTooltip, self.llid, link);
		if( IsShiftKeyDown() and (cached or IsControlKeyDown()) ) then
			LootLink_ShowCompareItem(link);
		end
	else
		LootLinkItemButton_OnLeave(self);
	end
end

function LootLinkItemButton_OnLeave(self)
	if( LootLinkFrame.TooltipButton ) then
		LootLinkFrame.TooltipButton = nil;
		GameTooltip:Hide();
	end
end

function LootLinkFrameDropDown_OnLoad(self)
	sdd:Initialize(self, LootLinkFrameDropDown_Initialize);
	sdd:SetSelectedID(self, 1);
	sdd:SetWidth(self, 80);
	sdd:JustifyText(self, "LEFT")
end

function LootLinkFrameDropDown_OnClick(self, arg1, arg2, checked)
	sdd:SetSelectedID(LootLinkFrameDropDown, self:GetID());
	if( not checked ) then
		LootLink_Refresh();
	end
end

function LLS_RarityDropDown_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_RarityDropDown_OnClick(self)
	sdd:SetSelectedID(LLS_RarityDropDown, self:GetID());
end

function LLS_BindsDropDown_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_BindsDropDown_OnClick(self)
	sdd:SetSelectedID(LLS_BindsDropDown, self:GetID());
end

function LLS_LocationDropDown_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_LocationDropDown_OnClick(self)
	sdd:SetSelectedID(LLS_LocationDropDown, self:GetID());
end

function LLS_TypeDropDown_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_TypeDropDown_OnClick(self, arg1, arg2, clicked)
	sdd:SetSelectedID(LLS_TypeDropDown, self:GetID());
	if( not checked ) then
		LootLink_SetupTypeUI(self:GetID(), 1);
	end
end

function LLS_SubtypeDropDown_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_SubtypeDropDown_OnClick(self)
	sdd:SetSelectedID(LLS_SubtypeDropDown, self:GetID());
end

function LLS_StatDropDown1_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_StatDropDown1_OnClick(self)
	sdd:SetSelectedID(LLS_StatDropDown1, self:GetID());
end

function LLS_StatDropDown2_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_StatDropDown2_OnClick(self)
	sdd:SetSelectedID(LLS_StatDropDown2, self:GetID());
end

function LLS_StatDropDown3_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_StatDropDown3_OnClick(self)
	sdd:SetSelectedID(LLS_StatDropDown3, self:GetID());
end

function LLS_StatDropDown4_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_StatDropDown4_OnClick(self)
	sdd:SetSelectedID(LLS_StatDropDown4, self:GetID());
end

function LLS_StatDropDown5_OnLoad(self)
	sdd:SetWidth(self, 90);
	sdd:JustifyText(self, "LEFT");
end

function LLS_StatDropDown5_OnClick(self)
	sdd:SetSelectedID(LLS_StatDropDown5, self:GetID());
end

function LootLink_AutoCompleteButton_OnClick(self)
	local frame = self:GetParent();
	
	if( frame:IsShown() ) then
		local editBox = frame.editBox;
		
		if( not InCombatLockdown() and LL.lAutoCompleteStartIndex ) then
			local link = LootLink_GetLink(self.llid);
			local newText;
			if( link and GetItemInfo(LootLink_GetItemId(self.llid)) ) then
				newText = string.sub(editBox:GetText(), 1, LL.lAutoCompleteStartIndex - 1)..link;
			else
				newText = string.sub(editBox:GetText(), 1, LL.lAutoCompleteStartIndex)..self:GetText().."]";
			end
			editBox:SetText(newText);
			editBox:SetCursorPosition(strlen(newText));
		end

		LootLinkAutoComplete_Hide(frame, true);
	else
		LL.lAutoCompleteStartIndex = nil;
	end
end

function LootLinkAutoCompleteButton_OnEnter(self)
	LootLinkAutoCompleteTooltip:Hide();

	if( self.llid ) then
		local link = LootLink_GetHyperlink(self.llid);
		if( link ) then
			LootLinkAutoCompleteFrame.mouseTooltip = true;
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
			local cached = LootLink_SetHyperlinkFromId(GameTooltip, self.llid, link);
			if( IsShiftKeyDown() and (cached or IsControlKeyDown()) ) then
				LootLink_ShowCompareItem(link);
			end
		end
	end
end

function LootLinkAutoCompleteButton_OnLeave(self)
	LootLinkAutoCompleteFrame.mouseTooltip = false;
	GameTooltip:Hide();
	
	local frame = LootLinkAutoCompleteFrame;
	if( frame:IsShown() ) then
		LootLinkAutoComplete_ShowTooltip(frame);
	end
end

function LootLink_AutoComplete_OnLoad(self)
	self:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	self:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b);
	
	self.maxHeight = LOOTLINK_AUTOCOMPLETE_BUTTON_COUNT * LootLinkAutoCompleteButton1:GetHeight();
	
	LootLinkAutoCompleteInstructions:SetText("|cffbbbbbb"..PRESS_TAB.."|r");
end

--------------------------------------------------------------------------------------------------
-- Callback functions
--------------------------------------------------------------------------------------------------
function ToggleLootLink()
	if( LootLinkFrame:IsVisible() ) then
		HideUIPanel(LootLinkFrame);
	else
		ShowUIPanel(LootLinkFrame);
	end
end

function LootLink_SlashCommandHandler(msg)
	if( not LL.lDisableVersionReminder ) then
		LootLink_CheckVersionReminder();
	end
	if( not msg or msg == "" ) then
		ToggleLootLink();
	else
		local command = string.lower(msg);
		if( command == LOOTLINK_STATUS ) then
			LootLink_Status();
		elseif( command == LOOTLINK_AUCTION or command == LOOTLINK_SCAN ) then
			if( AuctionFrame and AuctionFrame:IsVisible() ) then
				LootLink_StartAuctionScan();
			else
				LL.lScanAuction = true;
				LootLink_Status();
			end
		end
	end
end

function LootLink_Update()
	local iItem;
	
	if( not DisplayIndices ) then
		LootLink_BuildDisplayIndices();
	end
	FauxScrollFrame_Update(LootLinkListScrollFrame, DisplayIndices.onePastEnd - 1, LOOTLINK_ITEMS_SHOWN, LOOTLINK_ITEM_HEIGHT);
	for iItem = 1, LOOTLINK_ITEMS_SHOWN do
		local itemIndex = iItem + FauxScrollFrame_GetOffset(LootLinkListScrollFrame);
		local lootLinkItem = _G["LootLinkItem"..iItem];
		local lootLinkItemText = _G["LootLinkItem"..iItem.."Text"];
		
		if( itemIndex < DisplayIndices.onePastEnd ) then
			local color = { };
			local llid = DisplayIndices[itemIndex];
			
			if (ItemLinks[llid]) then
				lootLinkItem.llid = llid;
			
				lootLinkItemText:SetText(LootLink_GetName(llid));
			
				if( ItemLinks[llid].c ) then
					color.r, color.g, color.b = LootLink_GetRGBFromHexColor(ItemLinks[llid].c);
				else
					color.r, color.g, color.b = LootLink_GetRGBFromHexColor("ff40ffc0");
				end
				lootLinkItemText:SetTextColor(color.r, color.g, color.b);
			else
				lootLinkItem.llid = nil;
				lootLinkItemText:SetText(LOOTLINK_ITEM_RENAMED);
				lootLinkItemText:SetTextColor(LootLink_GetRGBFromHexColor("ff40ffc0"));
			end

			lootLinkItem:Show();
			
			if( LootLinkFrame.TooltipButton == iItem ) then
				LootLinkItemButton_OnEnter(lootLinkItem);
			end
		else
			lootLinkItem:Hide();
		end
	end
end

function LootLink_Search()
	LootLinkSearchFrame:Show();
end

function LootLink_Refresh()
	FauxScrollFrame_SetOffset(LootLinkListScrollFrame, 0);
	_G["LootLinkListScrollFrameScrollBar"]:SetValue(0);
	LootLink_BuildDisplayIndices();
	LootLink_Update();
end

function LootLink_DoSearch()
	LootLink_Refresh();
end

function LootLinkSearch_LoadValues()
	local sp = LootLinkFrame.SearchParams;
	local field;
	
	LootLinkFrame.BaseSearchEditFields = { };
	local fields = LootLinkFrame.BaseSearchEditFields;
	
	if( LootLinkState.LightMode ) then
		_G["LLS_TextDisabled"]:Show();
		_G["LLS_TextEditBox"]:Hide();
		_G["LLS_NameEditBox"]:SetFocus();
	else
		_G["LLS_TextDisabled"]:Hide();
		field = _G["LLS_TextEditBox"];
		field:Show();
		field:SetFocus();
		field:SetText(sp and sp.text or "");
		tinsert(fields, field);
	end
	
	field = _G["LLS_NameEditBox"];
	field:SetText(sp and sp.name or "");
	tinsert(fields, field);
	
	sdd:Initialize(LLS_RarityDropDown, LLS_RarityDropDown_Initialize);
	sdd:SetSelectedID(LLS_RarityDropDown, sp and sp.rarity or 1);
	
	sdd:Initialize(LLS_BindsDropDown, LLS_BindsDropDown_Initialize);
	sdd:SetSelectedID(LLS_BindsDropDown, sp and sp.binds or 1);

	_G["LLS_UniqueCheckButton"]:SetChecked(sp and sp.unique);
	
	_G["LLS_CachedCheckButton"]:SetChecked(sp and sp.cached);
	
	sdd:Initialize(LLS_LocationDropDown, LLS_LocationDropDown_Initialize);
	sdd:SetSelectedID(LLS_LocationDropDown, sp and sp.location or 1);
	
	sdd:Initialize(LLS_StatDropDown1, LLS_StatDropDown1_Initialize);
	sdd:SetSelectedID(LLS_StatDropDown1, sp and sp.stat1 or 1);
	
	sdd:Initialize(LLS_StatDropDown2, LLS_StatDropDown2_Initialize);
	sdd:SetSelectedID(LLS_StatDropDown2, sp and sp.stat2 or 1);
	
	sdd:Initialize(LLS_StatDropDown3, LLS_StatDropDown3_Initialize);
	sdd:SetSelectedID(LLS_StatDropDown3, sp and sp.stat3 or 1);
	
	sdd:Initialize(LLS_StatDropDown4, LLS_StatDropDown4_Initialize);
	sdd:SetSelectedID(LLS_StatDropDown4, sp and sp.stat4 or 1);
	
	sdd:Initialize(LLS_StatDropDown5, LLS_StatDropDown5_Initialize);
	sdd:SetSelectedID(LLS_StatDropDown5, sp and sp.stat5 or 1);
	
	field = _G["LLS_MinimumStatEditBox1"];
	field:SetText(sp and sp.minStat1 or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumStatEditBox1"];
	field:SetText(sp and sp.maxStat1 or "");
	tinsert(fields, field);
	
	field = _G["LLS_MinimumStatEditBox2"];
	field:SetText(sp and sp.minStat2 or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumStatEditBox2"];
	field:SetText(sp and sp.maxStat2 or "");
	tinsert(fields, field);
	
	field = _G["LLS_MinimumStatEditBox3"];
	field:SetText(sp and sp.minStat3 or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumStatEditBox3"];
	field:SetText(sp and sp.maxStat3 or "");
	tinsert(fields, field);
	
	field = _G["LLS_MinimumStatEditBox4"];
	field:SetText(sp and sp.minStat4 or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumStatEditBox4"];
	field:SetText(sp and sp.maxStat4 or "");
	tinsert(fields, field);
	
	field = _G["LLS_MinimumStatEditBox5"];
	field:SetText(sp and sp.minStat5 or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumStatEditBox5"];
	field:SetText(sp and sp.maxStat5 or "");
	tinsert(fields, field);
	
	_G["LLS_UsableCheckButton"]:SetChecked(sp and sp.usable);
	
	field = _G["LLS_MinimumLevelEditBox"];
	field:SetText(sp and sp.minLevel or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumLevelEditBox"];
	field:SetText(sp and sp.maxLevel or "");
	tinsert(fields, field);
	
	field = _G["LLS_MinimumiLevelEditBox"];
	field:SetText(sp and sp.miniLevel or "");
	tinsert(fields, field);

	field = _G["LLS_MaximumiLevelEditBox"];
	field:SetText(sp and sp.maxiLevel or "");
	tinsert(fields, field);
	
	sdd:Initialize(LLS_TypeDropDown, LLS_TypeDropDown_Initialize);
	sdd:SetSelectedID(LLS_TypeDropDown, sp and sp.type or 1);
	
	LootLink_SetupTypeUI(sp and sp.type or 1, sp and sp.subtype or 1);

	_G["LLS_MinimumDamageEditBox"]:SetText(sp and sp.minMinDamage or "");
	
	_G["LLS_MaximumDamageEditBox"]:SetText(sp and sp.minMaxDamage or "");
	
	_G["LLS_MinimumSpeedEditBox"]:SetText(sp and sp.minSpeed or "");
	
	_G["LLS_MaximumSpeedEditBox"]:SetText(sp and sp.maxSpeed or "");
	
	_G["LLS_MinimumDPSEditBox"]:SetText(sp and sp.minDPS or "");
	
	_G["LLS_MinimumArmorEditBox"]:SetText(sp and sp.minArmor or "");
	
	_G["LLS_MinimumBlockEditBox"]:SetText(sp and sp.minBlock or "");
	
	_G["LLS_MinimumSlotsEditBox"]:SetText(sp and sp.minSlots or "");
	
	_G["LLS_MinimumSkillEditBox"]:SetText(sp and sp.minSkill or "");
	
	_G["LLS_MaximumSkillEditBox"]:SetText(sp and sp.maxSkill or "");
end

function LootLinkSearch_SaveValues()
	local sp;
	local interesting;
	local field;
	local value;
	
	LootLinkFrame.SearchParams = { };
	sp = LootLinkFrame.SearchParams;
	
	field = _G["LLS_TextEditBox"];
	value = field:GetText();
	if( value and value ~= "" ) then
		sp.text = value;
		interesting = 1;
	end
	
	field = _G["LLS_NameEditBox"];
	value = field:GetText();
	if( value and value ~= "" ) then
		sp.name = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_RarityDropDown);
	if( value and value ~= 1 ) then
		sp.rarity = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_BindsDropDown);
	if( value and value ~= 1 ) then
		sp.binds = value;
		interesting = 1;
	end
	
	field = _G["LLS_UniqueCheckButton"];
	value = field:GetChecked();
	if( value ) then
		sp.unique = value;
		interesting = 1;
	end
	
	field = _G["LLS_CachedCheckButton"];
	value = field:GetChecked();
	if( value ) then
		sp.cached = value;
		interesting = 1;
	end	
	
	value = sdd:GetSelectedID(LLS_LocationDropDown);
	if( value and value ~= 1 ) then
		sp.location = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_StatDropDown1);
	if( value and value ~= 1 ) then
		sp.stat1 = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_StatDropDown2);
	if( value and value ~= 1 ) then
		sp.stat2 = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_StatDropDown3);
	if( value and value ~= 1 ) then
		sp.stat3 = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_StatDropDown4);
	if( value and value ~= 1 ) then
		sp.stat4 = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_StatDropDown5);
	if( value and value ~= 1 ) then
		sp.stat5 = value;
		interesting = 1;
	end
	
	field = _G["LLS_MinimumStatEditBox1"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat1 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox1"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat1 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumStatEditBox1"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat1 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox1"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat1 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumStatEditBox2"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat2 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox2"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat2 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumStatEditBox3"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat3 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox3"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat3 = tonumber(value);
		interesting = 1;
	end	
	
	field = _G["LLS_MinimumStatEditBox4"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat4 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox4"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat4 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumStatEditBox5"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minStat5 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumStatEditBox5"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxStat5 = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_UsableCheckButton"];
	value = field:GetChecked();
	if( value ) then
		sp.usable = value;
		interesting = 1;
	end
	
	field = _G["LLS_MinimumLevelEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minLevel = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumLevelEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxLevel = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MinimumiLevelEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.miniLevel = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MaximumiLevelEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxiLevel = tonumber(value);
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_TypeDropDown);
	if( value and value ~= 1 ) then
		sp.type = value;
		interesting = 1;
	end
	
	value = sdd:GetSelectedID(LLS_SubtypeDropDown);
	if( value and value ~= 1 ) then
		sp.subtype = value;
		if( sp.type and sp.type ~= 1 ) then
			interesting = 1;
		end
	end

	field = _G["LLS_MinimumDamageEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minMinDamage = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MaximumDamageEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minMaxDamage = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MinimumSpeedEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minSpeed = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MaximumSpeedEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxSpeed = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumDPSEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minDPS = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumArmorEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minArmor = tonumber(value);
		interesting = 1;
	end
	
	field = _G["LLS_MinimumBlockEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minBlock = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MinimumSlotsEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minSlots = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MinimumSkillEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.minSkill = tonumber(value);
		interesting = 1;
	end

	field = _G["LLS_MaximumSkillEditBox"];
	value = field:GetText();
	if( value and LootLink_CheckNumeric(value) ) then
		sp.maxSkill = tonumber(value);
		interesting = 1;
	end

	-- Only save search params if we had interesting data on the page	
	if( not interesting ) then
		LootLinkFrame.SearchParams = nil;
	else
		if( IsControlKeyDown() ) then
			sp.plain = nil;
		else
			sp.plain = 1;
		end
	end
end

function LootLinkSearchFrame_OnLoad(self)
	for index, value in pairs(LootLinkPanelLayout[self:GetName()]) do
		self:SetAttribute("UIPanelLayout-"..index, value);
	end
end

function LootLinkSearchFrame_SaveSearchParams()
	LootLinkSearchFrame.OldSearchParams = LootLinkFrame.SearchParams;
end

function LootLinkSearchFrame_RestoreSearchParams()
	LootLinkFrame.SearchParams = LootLinkSearchFrame.OldSearchParams;
end

function LootLinkSearchFrame_Cancel()
	PlaySound("gsTitleOptionExit");
	LootLinkSearchFrame:Hide();
	LootLinkSearchFrame_RestoreSearchParams();
end

function LootLinkSearchFrame_Okay()
	PlaySound("gsTitleOptionOK");
	LootLinkSearchFrame:Hide();
	LootLinkSearch_SaveValues();
	LootLink_DoSearch();
end

function LootLinkSearchFrame_OnTab(self, backwards)
	local index;
	local value;
	local field;
	
	-- Find the currently selected field
	for index, value in ipairs(LootLinkFrame.BaseSearchEditFields) do
		if( value == self ) then
			if( backwards ) then
				index = index - 1;
				
				if( index < 1 ) then
					if( #LootLinkFrame.TypeSearchEditFields > 0 ) then
						field = LootLinkFrame.TypeSearchEditFields[#LootLinkFrame.TypeSearchEditFields];
					else
						field = LootLinkFrame.BaseSearchEditFields[#LootLinkFrame.BaseSearchEditFields];
					end
				else
					field = LootLinkFrame.BaseSearchEditFields[index];
				end
			else
				index = index + 1;
				if( index > #LootLinkFrame.BaseSearchEditFields ) then
					if( #LootLinkFrame.TypeSearchEditFields > 0 ) then
						field = LootLinkFrame.TypeSearchEditFields[1];
					else
						field = LootLinkFrame.BaseSearchEditFields[1];
					end
				else
					field = LootLinkFrame.BaseSearchEditFields[index];
				end
			end

			field:SetFocus();
			return;
		end
	end
	for index, value in ipairs(LootLinkFrame.TypeSearchEditFields) do
		if( value == self ) then
			if( backwards ) then
				index = index - 1;
				
				if( index < 1 ) then
					field = LootLinkFrame.BaseSearchEditFields[#LootLinkFrame.BaseSearchEditFields];
				else
					field = LootLinkFrame.TypeSearchEditFields[index];
				end
			else
				index = index + 1;
				if( index > #LootLinkFrame.TypeSearchEditFields ) then
					field = LootLinkFrame.BaseSearchEditFields[1];
				else
					field = LootLinkFrame.TypeSearchEditFields[index];
				end
			end

			field:SetFocus();
			return;
		end
	end
end

--------------------------------------------------------------------------------------------------
-- External functions
--------------------------------------------------------------------------------------------------

-- Extract the item id from a LootLink id
function LootLink_GetItemId(llid)
	if( llid ) then
		return string.match(llid, "^(%-?%d+):");
	end
	return nil;
end

-- Extract the name from a LootLink id
function LootLink_GetName(llid)
	if( llid ) then
		return string.match(llid, "^%-?%d+:(.+)$");
	end
	return nil;
end

-- Find the LootLink id for an item by name (or at least the first one)
function LootLink_GetLootLinkIdFromName(name)
	if( LL.lReady ) then
		for index, value in pairs(ItemLinks) do
			if( LootLink_GetName(index) == name ) then
				return value;
			end
		end
	end
	return nil;
end

-- Look up an item from LootLink's cache, by name
function LootLink_GetItem(name)
	if( LL.lReady ) then
		local llid = LootLink_GetLootLinkIdFromName(name);
		if( llid ) then
			return ItemLinks[llid];
		end
	end
	return nil;
end

-- Look up an item from LootLink's cache, by LootLink id
function LootLink_GetItemById(llid)
	if( LL.lReady ) then
		return ItemLinks[llid];
	end
	return nil;
end

-- Use this to extract specific data from a LootLink item entry; possible tags are:
--  bi -> binds; un -> unique; ty -> type; su -> subtype; le -> level; sk -> skill; lo -> location;
--  mi -> min damage; ma -> max damage; sp -> speed; dp -> dps; ar -> armor; bl -> block; sl -> # slots
function LootLink_SearchData(item, tag)
	if( LL.lReady and item and item.d ) then
		local s, e;
		local value;

		s, e, value = string.find(item.d, tag.."(.-)·")
		if( value ) then
			return tonumber(value);
		end
	end
	return nil;
end

-- Allows other AddOns to add items directly to LootLink's cache
function LootLink_AddItem(name, item, color)
	if( LL.lReady and color and item and name and name ~= "" ) then
		local itemString, valid;

		if( string.find(item, "^%d+:%d+:%d+:%d+$") ) then
			-- Upgrade old links, removing instance-specific data
			itemString, valid = string.gsub(item, "^(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+)$", "%1:0:0:0:0:0:%3:%4:0");
		else
			-- Remove instance-specific data from the given item (2nd is enchantment, 3rd-5th are sockets, 9th is the linking character's level)
			itemString, valid = string.gsub(item, "(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+)", "%1:0:0:0:0:0:%7:%8:0");
		end

		if( valid and valid == 1) then
			local itemid = string.match(itemString, "^(%-?%d+):");

			if( itemid ) then
				LootLink_InternalAddItem(itemid, name, color, itemString);
			end
		end
	end
end

-- Looks for and deconstructs links contained in a text string
function LootLink_ProcessLinks(text)
	local color;
	local item;
	local name;
	local itemString;
	local lastLLid;
	local valid;

	if( LL.lReady and text ) then
	for color, item, name in string.gmatch(text, "|c(%x+)|Hitem:(%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+)|h%[(.-)%]|h|r") do
			if( color and item and name and name ~= "" ) then
				itemString, valid = string.gsub(item, "^(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+)$", "%1:0:0:0:0:0:%7:%8:0");

				if( valid and valid == 1) then
					local itemid = string.match(itemString, "^(%-?%d+):");

					if( itemid ) then
						lastLLid = LootLink_InternalAddItem(itemid, name, color, itemString);
					end
				end
			end
		end
	end
	
	return lastLLid;
end

-- Tries to find a zone name for a given data source name and type
local function LootLink_FindAtlasLootZoneName(table, dataSource, expectedType, grandparentKey, parentKey)
	local result;
	
	if( table and type(table) == "table" ) then
		if( table[2] == dataSource and table[3] == expectedType ) then
			if( type(grandparentKey) == "string" ) then
				result = grandparentKey..": "..table[1];
			else
				result = table[1];
			end
		else
			for k, v in pairs(table) do
				result = LootLink_FindAtlasLootZoneName(v, dataSource, expectedType, parentKey, k);
				if( result ) then
					break;
				end
			end
		end
	end
	
	return result;
end

-- Tries to get source information for an item from AtlasLoot
local function LootLink_AddSourceInfo(tooltip, itemid)
	local dataSource;
	local sourceName;
	local zoneName;
	local isHeroic;
	local is25Man;

	-- Make sure we're working with a number (or nil) for the itemid	
	if( type(itemid) ~= "number" ) then
		itemid = tonumber(itemid);
	end
	
	if( type(itemid) == "number" and itemid ~= 0 and AtlasLoot_Data ) then
		-- First, we'll try to find the data table that contains this item
		local tableName, lootTable;
		for tableName, lootTable in pairs(AtlasLoot_Data) do
			local _, item;
			for _, item in ipairs(lootTable) do
				if( item[2] == itemid ) then
					dataSource = tableName;
					break;
				end
			end
			
			if( dataSource ) then
				break;
			end
		end
		
		-- We hopefully have the data table name in dataSource
		if( dataSource ) then
			-- Get the source name, if possible
			if( AtlasLoot_TableNames and AtlasLoot_TableNames[dataSource] ) then
				sourceName = AtlasLoot_TableNames[dataSource][1];
			end
			
			-- Parse out the heroic and 25 man flags
			if( string.sub(dataSource, -6) == "HEROIC" ) then
				isHeroic = true;
				dataSource = string.sub(dataSource, 1, string.len(dataSource) - 6);
			end
			if( string.sub(dataSource, -5) == "25Man" ) then
				is25Man = true;
				dataSource = string.sub(dataSource, 1, string.len(dataSource) - 5);
			end
			
			local try;
			for try = 1, 2 do
				-- Now try to find the zone name
				local expectedType = "Table";
				
				-- First, we check the subtables for the parent table entry that actually is associated with the zone name
				if( AtlasLoot_DewDropDown_SubTables ) then
					local parentName, parentEntry;
					for parentName, parentEntry in pairs(AtlasLoot_DewDropDown_SubTables) do
						local _, subEntry;
						for _, subEntry in ipairs(parentEntry) do
							if( subEntry[2] == dataSource ) then
								dataSource = parentName;
								expectedType = "Submenu";
								break;
							end
						end
					end
				end
				
				-- Then we try to find the zone name that matches the appropriate table name
				zoneName = LootLink_FindAtlasLootZoneName(AtlasLoot_DewDropDown, dataSource, expectedType);
				
				if( zoneName ) then
					break;
				else
					dataSource = dataSource.."HEROIC";
				end
			end
		end
	
		-- Construct the text we're going to add
		local text;
		
		if( sourceName and zoneName ) then
			text = "Source: "..sourceName..", "..zoneName;
		elseif( sourceName ) then
			text = "Source: "..sourceName;
		elseif( zoneName ) then
			text = "Source: "..zoneName;
		end
		
		if( text ) then
			if( is25Man ) then
				if( isHeroic ) then
					text = text.." (25 Player Heroic)";
				else
					text = text.." (25 Player)";
				end
			elseif( isHeroic ) then
				text = text.." (Heroic)";
			end
		end
		
		-- Add the text to the tooltip
		if( text ) then
			tooltip:AddLine(text, 0.2, 0.8, 0.6, true);
		end
	end
end

-- Sets up a tooltip from a hyperlink, building a facsimile from the LootLink data if necessary 
function LootLink_SetHyperlink(tooltip, name, link)
	if( link ) then
		local _, _, itemid = string.find(link, "item:(%-?%d+):");
		
		if( itemid and name ) then
			LootLink_SetHyperlinkFromId(tooltip, itemid..":"..name, link);
		end
	end
end

-- Sets up a tooltip from a hyperlink, building a facsimile from the LootLink data if necessary 
function LootLink_SetHyperlinkFromId(tooltip, llid, link)
	if( tooltip and tooltip["GetObjectType"] and type(tooltip["GetObjectType"]) == "function" and tooltip:GetObjectType() == "GameTooltip" ) then
		local value = ItemLinks[llid];

		-- If the link isn't in the local cache, it may not be valid
		if( not GetItemInfo(link) ) then
			if( LL.lReady ) then
				-- To avoid disconnects, we'll create our own tooltip for these
				if( value ) then
					local extraSkip = 0;
					local lines = 1;
					local usabilityData;
					
					-- Name, in rarity color
					tooltip:SetText("|c"..value.c..LootLink_GetName(llid).."|r");
					
					-- Heroic
					local heroic = LootLink_SearchData(value, "he");
					if( heroic ) then
						tooltip:AddLine("Heroic", 0, 1, 0, 1, 1);
						lines = lines + 1;
					end
					
					-- Binds on equip, binds on pickup
					local binds = LootLink_SearchData(value, "bi");
					if( binds == LL.BINDS_EQUIP ) then
						tooltip:AddLine("Binds when equipped", 1, 1, 1);
						lines = lines + 1;
					elseif( binds == LL.BINDS_PICKUP ) then
						tooltip:AddLine("Binds when picked up", 1, 1, 1);
						lines = lines + 1;
					elseif( binds == LL.BINDS_USED ) then
						tooltip:AddLine("Binds when used", 1, 1, 1);
						lines = lines + 1;
					elseif( binds == LL.BINDS_ACCOUNT ) then
						tooltip:AddLine("Binds to account", 1, 1, 1);
						lines = lines + 1;
					end
					
					-- Unique?
					local unique = LootLink_SearchData(value, "un");
					if( unique ) then
						if( unique == LL.UNIQUE_GENERIC ) then
							tooltip:AddLine("Unique", 1, 1, 1);
							lines = lines + 1;
						elseif( unique == LL.UNIQUE_EQUIPPED ) then
							tooltip:AddLine("Unique-Equipped", 1, 1, 1);
							lines = lines + 1;
						end
					end
					
					local _type = LootLink_SearchData(value, "ty");
					local subtype = LootLink_SearchData(value, "su");

					local i;
					local v;

					-- Equip location and type/subtype
					local location = LootLink_SearchData(value, "lo");
					if( location ) then
						local subtypes;
						local name;
						for i, v in pairs(LocationTypes) do
							if( v.i == location ) then
								name = i;
								subtypes = v.subtypes;
								break;
							end
						end
						if( name ) then
							tooltip:AddLine(name, 1, 1, 1);
							lines = lines + 1;
							if( subtype ) then
								if( _type == LL.TYPE_WEAPON ) then
									subtypes = WeaponSubtypes;
								end
								if( subtypes ) then
									for i, v in pairs(subtypes) do
										if( v == subtype ) then
											if( i == name ) then
												local line = _G[tooltip:GetName().."TextLeft"..lines];
												
												if( not usabilityData ) then
													usabilityData = { };
													BuildUsabilityData(usabilityData);
												end
												if( not LootLink_GetSkillRank(usabilityData, _type, subtype, location) ) then
													line:SetTextColor(1, 0, 0);
												end
											else
												local line = _G[tooltip:GetName().."TextRight"..lines];
												line:SetText(i);

												if( not usabilityData ) then
													usabilityData = { };
													BuildUsabilityData(usabilityData);
												end
												if( LootLink_GetSkillRank(usabilityData, _type, subtype, location) ) then
													line:SetTextColor(1, 1, 1);
												else
													line:SetTextColor(1, 0, 0);
												end
												
												line:Show();
												extraSkip = extraSkip + 1;
												break;
											end
										end
									end
								end
							end
						end
					end
					
					-- Now do type specific data
					if( _type == LL.TYPE_ARMOR ) then
						local armor = LootLink_SearchData(value, "ar");
						if( armor ) then
							tooltip:AddLine(armor.." Armor", 1, 1, 1);
							lines = lines + 1;
						end
					elseif( _type == LL.TYPE_WEAPON ) then
						local min = LootLink_SearchData(value, "mi");
						local max = LootLink_SearchData(value, "ma");
						local speed = LootLink_SearchData(value, "sp");
						local dps = LootLink_SearchData(value, "dp");
						
						if( min and max ) then
							tooltip:AddLine(min.." - "..max.." Damage", 1, 1, 1);
							lines = lines + 1;
							if( speed ) then
								local line = _G[tooltip:GetName().."TextRight"..lines];
								line:SetText(format("Speed %.2f", tonumber(speed)));
								line:SetTextColor(1, 1, 1);
								line:Show();
								extraSkip = extraSkip + 1;
							end
						end
						if( dps ) then
							tooltip:AddLine("("..dps.." damage per second)", 1, 1, 1);
							lines = lines + 1;
						end
					elseif( _type == LL.TYPE_SHIELD ) then
						local armor = LootLink_SearchData(value, "ar");
						local block = LootLink_SearchData(value, "bl");
						if( armor ) then
							tooltip:AddLine(armor.." Armor", 1, 1, 1);
							lines = lines + 1;
						end
						if( block ) then
							tooltip:AddLine(block.." Block", 1, 1, 1);
							lines = lines + 1;
						end
					elseif( _type == LL.TYPE_RECIPE ) then
						local skill = LootLink_SearchData(value, "sk");
						if( skill and subtype ) then
							for i, v in pairs(RecipeSubtypes) do
								if( v == subtype ) then
									if( not usabilityData ) then
										usabilityData = { };
										BuildUsabilityData(usabilityData);
									end
									local rank = LootLink_GetSkillRank(usabilityData, _type, subtype, location);
									if( not rank or rank < skill ) then
										tooltip:AddLine("Requires "..i.." ("..skill..")", 1, 0, 0);
									else
										tooltip:AddLine("Requires "..i.." ("..skill..")", 1, 1, 1);
									end
									lines = lines + 1;
									break;
								end
							end
						end
					elseif( _type == LL.TYPE_CONTAINER ) then
						local slots = LootLink_SearchData(value, "sl");
						if( slots ) then
							tooltip:AddLine(slots.." Slot Container", 1, 1, 1);
							lines = lines + 1;
						end
					elseif( _type == LL.TYPE_GLYPH ) then
						for i, v in pairs(GlyphSubtypes) do
							if( v == subtype ) then
								tooltip:AddLine(i.." Glyph", 0.4, 0.75, 1);
								lines = lines + 1;
								break;
							end
						end
					end
					
					local level = LootLink_SearchData(value, "le");

					-- Now add any extra text data that we have
					if( value.t ) then
						local skip = lines + extraSkip;
						local piece;
						for piece in string.gmatch(value.t, "(.-)·") do
							if( lines < 29 ) then
								if( skip == 0 ) then
									if( string.find(piece, "^%a+ Socket$") ) then
										-- '<Type> Socket'
										local s, e, socket = string.find(piece, "^(%a+) Socket$");
										tooltip:AddLine(piece, 0.5, 0.5, 0.5, 1, 1);
										tooltip:AddTexture("Interface\\ItemSocketingFrame\\UI-EmptySocket-"..socket);
									elseif( string.find(piece, "^Socket Bonus: ") ) then
										-- 'Socket Bonus: <bonus>'
										tooltip:AddLine(piece, 0.5, 0.5, 0.5, 1, 1);
									elseif( string.find(piece, "^Requires Level .*") ) then
										-- 'Requires Level <level>'
										if( level and tonumber(level) > UnitLevel("player") ) then
											tooltip:AddLine(piece, 1, 0, 0, 1, 1);
										else
											tooltip:AddLine(piece, 1, 1, 1, 1, 1);
										end
									elseif( string.find(piece, "^Requires ") ) then
										if( not string.find(piece, "^Requires %a+ %(%d%)$") ) then
											-- 'Requires <something we don't check (faction, PvP rank) or can't check (trade skill specialization)>'
											tooltip:AddLine(piece, 0.8, 0.8, 0.8, 1, 1);
										end
									elseif( string.find(piece, "\"") or string.find(piece, "%(%d+/%d+%)") ) then
										-- '"<quote>"' or '<set name> (0/<pieces>)'
										tooltip:AddLine(piece, 1, 0.8235, 0, 1, 1);
									elseif( string.find(piece, "^  ") ) then
										-- '  <set component>'
										tooltip:AddLine(piece, 0.5, 0.5, 0.5, 1, 1);
									elseif( string.find(piece, ":") ) then
										-- 'Class: <class>' or 'Classes: <classes>' or 'Equip: <benefit>', etc.
										if( string.find(piece, "^Class") ) then
											-- 'Class: <class>' or 'Classes: <classes>'
											if( string.find(piece, "^Class.*"..UnitClass("player")) ) then
												tooltip:AddLine(piece, 1, 1, 1, 1, 1);
											else
												tooltip:AddLine(piece, 1, 0, 0, 1, 1);
											end
										else
											-- 'Equip: <benefit>', etc.
											tooltip:AddLine(piece, 0, 1, 0, 1, 1);
										end
									else
										-- None of the above
										tooltip:AddLine(piece, 1, 1, 1, 1, 1);
									end
									lines = lines + 1;
								else
									skip = skip - 1;
								end
							end
						end
					end
					
					-- Now try to add the drop location to the item
					if( lines < 30 ) then
						LootLink_AddSourceInfo(tooltip, LootLink_GetItemId(llid));
						lines = lines + 1;
					end

					-- And, after all that, let the user know that we faked this tooltip
					if( lines < 30 ) then
						tooltip:AddLine("|cff40ffc0<Generated by LootLink from cached data>|r");
						lines = lines + 1;
					end
					
					-- Finally, show the tooltip, which adjusts its size
					tooltip:Show();
				end
			end
		else
			if( LL.lReady and value ) then
				-- Check to see if any of the data for this item has changed since we stored it
				
				-- To avoid polluting any of our checks with changes by other AddOns that might
				-- be hooking tooltip:SetHyperlink, we'll use our own tooltip to check against
				LLHiddenTooltip:SetOwner(UIParent, "ANCHOR_NONE");
				LLHiddenTooltip:SetHyperlink(link);
				
				local field = _G["LLHiddenTooltipTextLeft1"];
				
				if( field:IsShown() ) then
					local oldName = LootLink_GetName(llid);
					local newName = field:GetText();
					local color = LootLink_GetHexColorFromRGB(field:GetTextColor());
					if( oldName ~= newName ) then
						-- New name; delete the old entry and add a new one
						local itemid = LootLink_GetItemId(llid);
						local itemString = value.i;

						if( LootLink_CheckItemServerRaw(value, LL.lServerIndex) ) then
							LL.lItemLinksSizeServer = LL.lItemLinksSizeServer - 1;
						end
						LL.lItemLinksSizeTotal = LL.lItemLinksSizeTotal - 1;
						ItemLinks[llid] = nil;
						
						LootLink_InternalAddItem(itemid, newName, color, itemString);
					else
						-- Same name; update our data in case things have changed
						value.c = color;
						LootLink_BuildSearchData(llid, ItemLinks[llid]);
					end
				end
				
				LLHiddenTooltip:Hide();
			end
			
			-- Get the actual tooltip from the cache
			tooltip:SetHyperlink(link);

			-- Now try to add the drop location to the item
			LootLink_AddSourceInfo(tooltip, LootLink_GetItemId(llid));

			-- Finally, show the tooltip, which adjusts its size
			tooltip:Show();

			return true;
		end
	end
	
	return false;
end

-- This will set up a tooltip with item information for the given name if it's known
function LootLink_SetTooltip(tooltip, name, quantity)
	if( LL.lReady and tooltip and name ) then
		local llid = LootLink_GetLootLinkIdFromName(name);
		if( llid ) then
			local link = LootLink_GetHyperlink(llid);
			if( link ) then
				LootLink_SetHyperlinkFromId(tooltip, llid, link);
			end
		end
	end
end

-- This will set up a tooltip with item information for the given item if it's known
function LootLink_SetTooltipFromItemIdAndName(tooltip, itemid, name, quantity)
	if( LL.lReady and tooltip and itemid and name ) then
		local link = LootLink_GetHyperlink(itemid..":"..name);
		if( link ) then
			LootLink_SetHyperlinkFromId(tooltip, llid, link);
		end
	end
end

-- Use this function to get the current server name from LootLink's perspective
function LootLink_GetCurrentServerName()
	return LL.lServer;
end

-- Use this function to get the current server index
function LootLink_GetCurrentServerIndex()
	return LL.lServerIndex;
end

-- Use this function to map a server name to the server index for the ItemLinks entry servers array
function LootLink_GetServerIndex(name)
	if( not LL.lReady or not LootLinkState or not LootLinkState.ServerNamesToIndices ) then
		return nil;
	end
	return LootLinkState.ServerNamesToIndices[name];
end

-- Use this function to check whether an ItemLinks entry is valid for a given server index
function LootLink_CheckItemServer(item, serverIndex)
	if( not LL.lReady ) then
		return false;
	end
	return LootLink_CheckItemServerRaw(item, serverIndex);
end

-- Use this function to show the compare tooltip (or tooltips), given a link, once the GameTooltip has been set to that link
-- (I'd really like to be able to just use GameTooltip_ShowCompareItem, but that requires that it's able to get the item link
--  via GameTooltip:GetItem, which isn't possible if we've set the tooltip from a link, rather than from a SetXXXItem call.)
function LootLink_ShowCompareItem(link)
	if ( not link ) then
		return;
	end

	local item1 = nil;
	local item2 = nil;
	local side = "left";
	if ( ShoppingTooltip1:SetHyperlinkCompareItem(link, 1) ) then
		item1 = true;
	end
	if ( ShoppingTooltip2:SetHyperlinkCompareItem(link, 2) ) then
		item2 = true;
	end

	-- find correct side
	local rightDist = 0;
	local leftPos = GameTooltip:GetLeft();
	local rightPos = GameTooltip:GetRight();
	if ( not rightPos ) then
		rightPos = 0;
	end
	if ( not leftPos ) then
		leftPos = 0;
	end

	rightDist = GetScreenWidth() - rightPos;

	if (leftPos and (rightDist < leftPos)) then
		side = "left";
	else
		side = "right";
	end

	-- see if we should slide the tooltip
	if ( GameTooltip:GetAnchorType() ) then
		local totalWidth = 0;
		if ( item1  ) then
			totalWidth = totalWidth + ShoppingTooltip1:GetWidth();
		end
		if ( item2  ) then
			totalWidth = totalWidth + ShoppingTooltip2:GetWidth();
		end

		if ( (side == "left") and (totalWidth > leftPos) ) then
			GameTooltip:SetAnchorType(GameTooltip:GetAnchorType(), (totalWidth - leftPos), 0);
		elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
			GameTooltip:SetAnchorType(GameTooltip:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0);
		end
	end

	-- anchor the compare tooltips
	if ( item1 ) then
		ShoppingTooltip1:SetOwner(GameTooltip, "ANCHOR_NONE");
		ShoppingTooltip1:ClearAllPoints();
		if ( side and side == "left" ) then
			ShoppingTooltip1:SetPoint("TOPRIGHT", "GameTooltip", "TOPLEFT", 0, -10);
		else
			ShoppingTooltip1:SetPoint("TOPLEFT", "GameTooltip", "TOPRIGHT", 0, -10);
		end
		ShoppingTooltip1:SetHyperlinkCompareItem(link, 1);
		ShoppingTooltip1:Show();

		if ( item2 ) then
			ShoppingTooltip2:SetOwner(ShoppingTooltip1, "ANCHOR_NONE");
			ShoppingTooltip2:ClearAllPoints();
			if ( side and side == "left" ) then
				ShoppingTooltip2:SetPoint("TOPRIGHT", "ShoppingTooltip1", "TOPLEFT", 0, 0);
			else
				ShoppingTooltip2:SetPoint("TOPLEFT", "ShoppingTooltip1", "TOPRIGHT", 0, 0);
			end
			ShoppingTooltip2:SetHyperlinkCompareItem(link, 2);
			ShoppingTooltip2:Show();
		end
	end
end


-- Used for debugging changes in item data and tooltip format
--[[function LootLink_Validate()
	-- Indices and values of the outer and inner arrays
	local iOuter, vOuter, iInner, vInner;
	-- What data we found in the element
	local iFound, sFound, dFoumd, cFound, tFound, pFound, xFound;
	-- How many items are missing links
	local ilMissing = 0;

	for iOuter, vOuter in pairs(ItemLinks) do
		-- Keep track of what data we have stored for this item
		iFound = false;
		sFound = false;
		dFound = false;
		cFound = false;
		tFound = false;
		pFound = false;
		xFound = false;
	
		for iInner, vInner in pairs(vOuter) do
			if( iInner == "i" ) then
				iFound = true;
			elseif( iInner == "s" ) then
				sFound = true;
			elseif( iInner == "d" ) then
				dFound = true;
			elseif( iInner == "c" ) then
				cFound = true;
			elseif( iInner == "t" ) then
				tFound = true;
			elseif( iInner == "p" ) then
				pFound = true;
			elseif( iInner == "x" ) then
				xFound = true;
			else
				dlog("Found unknown data for '", iOuter, "' -- ", iInner, " = ", vInner);
			end
		end
		
		if( not iFound ) then
			--dlog("No itemlink for '", iOuter, "'");
			ilMissing = ilMissing + 1;
		end
	end
	
	dlog(ilMissing, " items missing itemlinks!");
end]]--

--------------------------------------------------------------------------------------------------
-- Hookable callback functions
--------------------------------------------------------------------------------------------------

-- Hook this function to be called whenever an equipment slot is successfully inspected
function LootLink_Event_InspectSlot(name, count, item, unit, slotid)
	-- name: the name of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- unit: "target", "player", etc.
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever an equipment slot is successfully inspected
function LootLink_Event_InspectSlotId(llid, count, item, unit, slotid)
	-- llid: the LootLink id of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- unit: "target", "player", etc.
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever an inventory slot is successfully inspected
function LootLink_Event_ScanInventory(name, count, item, bagid, slotid)
	-- name: the name of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- bagid: the id of the bag containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever an inventory slot is successfully inspected
function LootLink_Event_ScanInventoryId(llid, count, item, bagid, slotid)
	-- llid: the LootLink id of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- bagid: the id of the bag containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever a bank slot is successfully inspected
function LootLink_Event_ScanBank(name, count, item, bagid, slotid)
	-- name: the name of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- bagid: the id of the bag containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever a bank slot is successfully inspected
function LootLink_Event_ScanBankId(llid, count, item, bagid, slotid)
	-- llid: the LootLink id of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- bagid: the id of the bag containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever a guild bank slot is successfully inspected
function LootLink_Event_ScanGuildBank(name, count, item, tabid, slotid)
	-- name: the name of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- tabid: the id of the tab containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever a bank slot is successfully inspected
function LootLink_Event_ScanGuildBankId(llid, count, item, tabid, slotid)
	-- llid: the LootLink id of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- tabid: the id of the tab containing the item
	-- slotid: the id of the slot inspected
end

-- Hook this function to be called whenever an auction entry is successfully inspected
function LootLink_Event_ScanAuction(name, count, item, auctionpage, auctionid)
	-- name: the name of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- auctionpage: the page number this item was found on
	-- auctionid: the id of the inspected item
end

-- Hook this function to be called whenever an auction entry is successfully inspected
function LootLink_Event_ScanAuctionId(llid, count, item, auctionpage, auctionid)
	-- llid: the LootLink id of the item
	-- count: the number of items, if known, else 1
	-- item: ItemLinks entry; LootLink's data for this item
	-- auctionpage: the page number this item was found on
	-- auctionid: the id of the inspected item
end

-- Hook this function to be called whenever a chat message is successfully inspected
function LootLink_Event_ScanChat(name, item, text)
	-- name: the name of the last item in the chat message
	-- item: ItemLinks entry; LootLink's data for this item
	-- text: the inspected chat message
end

-- Hook this function to be called whenever a chat message is successfully inspected
function LootLink_Event_ScanChatId(llid, item, text)
	-- llid: the LootLink id of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- text: the inspected chat message
end

-- Hook this function to be called whenever a merchant item is successfully inspected
function LootLink_Event_ScanMerchant(name, item, index)
	-- name: the name of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- index: the merchant item index of this item
end

-- Hook this function to be called whenever a merchant item is successfully inspected
function LootLink_Event_ScanMerchantId(llid, item, index)
	-- llid: the LootLink id of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- index: the merchant item index of this item
end

-- Hook this function to be called whenever a quest log item is successfully inspected
function LootLink_Event_ScanQuest(name, item, questLog, type, index)
	-- name: the name of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- questLog: true if this is a quest log item
	-- type: "choice" or "reward"
	-- index: the quest item index of this item
end

-- Hook this function to be called whenever a quest log item is successfully inspected
function LootLink_Event_ScanQuestId(llid, item, questLog, type, index)
	-- llid: the LootLink id of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- questLog: true if this is a quest log item
	-- type: "choice" or "reward"
	-- index: the quest item index of this item
end

-- Hook this function to be called whenever a loot item is successfully inspected
function LootLink_Event_ScanLoot(name, item, index)
	-- name: the name of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- index: the loot slot index of this item
end

-- Hook this function to be called whenever a loot item is successfully inspected
function LootLink_Event_ScanLootId(llid, item, index)
	-- llid: the LootLink id of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- index: the loot slot index of this item
end

-- Hook this function to be called whenever a rolled-for-item is successfully inspected
function LootLink_Event_ScanRoll(name, item, id)
	-- name: the name of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- id: the roll id of this item
end

-- Hook this function to be called whenever a rolled-for-item is successfully inspected
function LootLink_Event_ScanRollId(llid, item, id)
	-- llid: the LootLink id of the item
	-- item: ItemLinks entry; LootLink's data for this item
	-- id: the roll id of this item
end

-- Hook this function to be called whenever LootLink starts an auction scan
function LootLink_Event_StartAuctionScan()
end

-- Hook this function to be called whenever LootLink stops an auction scan
function LootLink_Event_StopAuctionScan()
end

-- Hook this function to be called whenever LootLink completes a full auction scan
function LootLink_Event_FinishedAuctionScan()
end

-- Hook this function to be called whenever LootLink sends a new auction query
function LootLink_Event_AuctionQuery(auctionpage)
	-- auctionpage: the page number for the query that was just sent
end
