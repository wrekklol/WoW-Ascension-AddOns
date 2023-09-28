local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

--		{ #, "MOUNTMENU", "INV_Misc_QirajiCrystal_05", "=ds="..AL["Mounts"], ""};
--		{ #, "PETMENU", "INV_Box_PetCarrier_01", "=ds="..AL["Vanity Pets"], ""};
--		{ #, "Tabards3", "INV_Shirt_GuildTabard_01", "=ds="..AL["Tabards"], ""};
--		{ #, "CardGame1", "INV_Misc_Ticket_Tarot_Madness", "=ds="..AL["Upper Deck Card Game Items"], ""};
--		{ #, "PVPMENU", "INV_Axe_02", "=ds="..AL["PvP Rewards"], ""};

		AtlasLoot_SubMenus["CollectionsCLASSIC"] = {
			Module = "AtlasLootOriginalWoW";
			{ "", "Heirloom"};
			{ "", "ClassicSets"};
			{ "", "WorldEpicsCLASSIC"};
			{ "", "ZGSets"};
			{ "", "AQ20Sets"};
			{ "", "T0"};
			{ "", "T1"};
			{ "", "T2"};
			{ "", "T2.5"};
			{ "", "T3"};
		};

		AtlasLoot_SubMenus["CollectionsTBC"] = {
			Module = "AtlasLootBurningCrusade";
			{ "", "Heirloom"};
			{ "", "DS3"};
			{ "", "WorldEpicsTBC"};
			{ "", "TBCSets"};
			{ AL["Badge of Justice Rewards"], "BadgeShatt", "Header"};
			{ "", "BadgeShatt"};
			{ "", "BadgeSunwell"};
			{ "Tier Sets", "T4", "Header"};
			{ "", "T4"};
			{ "", "T5"};
			{ "", "T6"};
		};

		AtlasLoot_SubMenus["CollectionsWRATH"] = {
			Module = "AtlasLootWotLK";
			{ "", "Heirloom"};
			{ "", "WorldEpicsWrath"};
			{ "", "Legendaries"};
			{ "Badge Rewards", "EmblemofHeroism", "Header"};
			{ "", "EmblemofHeroism"};
			{ "", "EmblemofValor"};
			{ "", "EmblemofConquest"};
			{ "", "EmblemofTriumph"};
			{ "", "EmblemofFrost"};
			{ "Tier Sets", "T7", "Header"};
			{ "", "T7"};
			{ "", "T8"};
			{ "", "T9"};
			{ "", "T10"};
		};

		AtlasLoot_SubMenus["VanityCLASSIC"] = {
			Module = "AtlasLootVanity";
			{ "", "Tabards"};
			{ "", "VanityPets"};
			{ "", "Mounts"};
		};
		
		AtlasLoot_SubMenus["VanityTBC"] = AtlasLoot_SubMenus["VanityCLASSIC"];
		AtlasLoot_SubMenus["VanityWRATH"] = AtlasLoot_SubMenus["VanityCLASSIC"];

----------------------
--- Heirloom Items ---
----------------------
AtlasLoot_Data["Heirloom"] = {
	Name = AL["Heirloom"];
	{
		Name = "Chests";
		{ 1, 48691, "", "=q7=Tattered Dreadmist Robe", "=ds=#s5#, #a1#", "1200 #tokenofprestige#" };
		{ 2, 48687, "", "=q7=Preened Ironfeather Breastplate", "=ds=#s5#, #a2#", "1200 #tokenofprestige#" };
		{ 3, 48689, "", "=q7=Stained Shadowcraft Tunic", "=ds=#s5#, #a2#", "1200 #tokenofprestige#" };
		{ 4, 48677, "", "=q7=Champion's Deathdealer Breastplate", "=ds=#s5#, #a3#", "1200 #tokenofprestige#" };
		{ 5, 48683, "", "=q7=Mystical Vest of Elements", "=ds=#s5#, #a3#", "1200 #tokenofprestige#" };
		{ 6, 48685, "", "=q7=Polished Breastplate of Valor", "=ds=#s5#, #a4#", "1200 #tokenofprestige#" };
		{ 7, 1548685, "", "=q7=Polished Breastplate of Might", "=ds=#s5#, #a4#", "1200 #tokenofprestige#" };

	};
	{
		Name = "Shoulders";
		{ 1, 42985, "", "=q7=Tattered Dreadmist Mantle", "=ds=#s3#, #a1#", "800 #tokenofprestige#" };
		{ 2, 42984, "", "=q7=Preened Ironfeather Shoulders", "=ds=#s3#, #a2#", "800 #tokenofprestige#" };
		{ 3, 42952, "", "=q7=Stained Shadowcraft Spaulders", "=ds=#s3#, #a2#", "800 #tokenofprestige#" };
		{ 4, 42950, "", "=q7=Champion Herod's Shoulder", "=ds=#s3#, #a3#", "800 #tokenofprestige#" };
		{ 5, 42951, "", "=q7=Mystical Pauldrons of Elements", "=ds=#s3#, #a3#", "800 #tokenofprestige#" };
		{ 6, 42949, "", "=q7=Polished Spaulders of Valor", "=ds=#s3#, #a4#", "800 #tokenofprestige#" };
		{ 7, 1542949, "", "=q7=Polished Spaulders of Might", "=ds=#s3#, #a4#", "800 #tokenofprestige#" };
		{ 16, 44107, "", "=q7=Exquisite Sunderseer Mantle", "=ds=#s3#, #a1#", "800 #tokenofprestige#" };
		{ 17, 44103, "", "=q7=Exceptional Stormshroud Shoulders", "=ds=#s3#, #a2#", "800 #tokenofprestige#" };
		{ 18, 44105, "", "=q7=Lasting Feralheart Spaulders", "=ds=#s3#, #a2#", "800 #tokenofprestige#" };
		{ 19, 44102, "", "=q7=Aged Pauldrons of The Five Thunders", "=ds=#s3#, #a3#", "800 #tokenofprestige#" };
		{ 20, 44101, "", "=q7=Prized Beastmaster's Mantle", "=ds=#s3#, #a3#", "800 #tokenofprestige#" };
		{ 21, 44100, "", "=q7=Pristine Lightforge Spaulders", "=ds=#s3#, #a4#", "800 #tokenofprestige#" };
		{ 22, 44099, "", "=q7=Strengthened Stockade Pauldrons", "=ds=#s3#, #a4#", "800 #tokenofprestige#" };
	};
	{
		Name = "Trinkets/Rings";
		{ 1, 42992, "", "=q7=Discerning Eye of the Beast", "=ds=#s14#", "500 #tokenofprestige#" };
		{ 2, 42991, "", "=q7=Swift Hand of Justice", "=ds=#s14#", "500 #tokenofprestige#" };
		{ 3, 44098, "", "=q7=Inherited Insignia of the Alliance", "500 #tokenofprestige#" };
		{ 4, 44097, "", "=q7=Inherited Insignia of the Horde", "500 #tokenofprestige#" };
		{ 6, 50255, "", "=q7=Dread Pirate Ring", "=ds=#s13#", "" };
	};
	{
		Name = "Weapons";
		{ 1, 42944, "", "=q7=Balanced Heartseeker", "=ds=#w4#, #h1#", "600 #tokenofprestige#" };
		{ 2, 42945, "", "=q7=Venerable Dal'Rend's Sacred Charge", "=ds=#w10#, #h3#", "600 #tokenofprestige#" };
		{ 3, 42948, "", "=q7=Devout Aurastone Hammer", "600 #tokenofprestige#" };
		{ 4, 48716, "", "=q7=Venerable Mass of McGowan", "600 #tokenofprestige#" };
		{ 5, 44091, "", "=q7=Sharpened Scarlet Kris", "=ds=#h1#, #w4#", "600 #tokenofprestige#" };
		{ 6, 44096, "", "=q7=Battleworn Thrash Blade", "=ds=#h1#, #w10#", "600 #tokenofprestige#" };
		{ 7, 44094, "", "=q7=The Blessed Hammer of Grace", "=ds=#h3#, #w6#", "600 #tokenofprestige#" };
		{ 7, 1540350, "", "=q7=Urn of Aspiring Light", "=ds=#h3#, #w6#", "600 #tokenofprestige#" };
		{ 16, 42943, "", "=q7=Bloodied Arcanite Reaper", "=ds=#w1#, #h2#", "1000 #tokenofprestige#" };
		{ 17, 1542943, "", "=q7=Sturdied Arcanite Spear", "=ds=#w1#, #h2#", "1000 #tokenofprestige#" };
		{ 18, 48718, "", "=q7=Repurposed Lava Dredger", "=ds=#w6#, #h2#", "1000 #tokenofprestige#" };
		{ 19, 42947, "", "=q7=Dignified Headmaster's Charge", "=ds=#w9#", "1000 #tokenofprestige#" };
		{ 20, 44092, "", "=q7=Reforged Truesilver Champion", "=ds=#h2#, #w10#", "1000 #tokenofprestige#" };
		{ 21, 44095, "", "=q7=Grand Staff of Jordan", "=ds=#w9#", "1000 #tokenofprestige#" };
		{ 23, 42946, "", "=q7=Charmed Ancient Bone Bow", "=ds=#w2#", "1000 #tokenofprestige#" };
		{ 24, 44093, "", "=q7=Upgraded Dwarven Hand Cannon", "=ds=#w5#", "1000 #tokenofprestige#" };
	};
};



