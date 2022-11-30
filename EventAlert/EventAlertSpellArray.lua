function EventAlert_LoadSpellArray()
	if EA_Items == nil then
		EA_Items = {};
	end

	if EA_AltItems == nil then
		EA_AltItems = {};
	end

	if EA_CustomItems == nil then
		EA_CustomItems = {};
	end
	
	local EventAlertItems = {
		-- Death Knight
		51124,-- Killing Machine
		59052, -- Rime (Freezing Fog)
		53386, -- Cinderglacier (Runeforge)
		-- Druid
		48517, -- Eclipse
		48518, -- Eclipse
		16886, -- Nature's Grace
		69369, -- Predator's Swiftness
		16870, -- Omen of Clarity
		48391, -- Owlkin Frenzy
		46833, -- Wrath of Elune (PvP Set Bonus)
		64823, -- Elune's Wrath (Tier 8 Set Bonus)
		-- Hunter
		53220, -- Improved Stead Shot
		56453, -- Lock and Load
		35098, -- Rapid Killing
		35099, -- Rapid Killing
		-- Mage
		12536, -- Arcane Concentration
		31643, -- Blazing Speed
		57761, -- Brain Freeze
		44543, -- Fingers of Frost
		44544, -- Fingers of Frost
		44545, -- Fingers of Frost
		74396, -- Fingers of Frost
		54741, -- Firestarter
		48108, -- Hot Streak
		64343, -- Impact
		44401, -- Missile Barrage
		-- Paladin
		53489, -- Art of War
		59578, -- Art of War
		53672, -- Infusion of Light
		54149, -- Infusion of Light
		31834, -- Light's Grace
		58597, -- Sacred Shield
		-- Priest
		59887, -- Borrowed Time
		59888, -- Borrowed Time
		59889, -- Borrowed Time
		59890, -- Borrowed Time
		59891, -- Borrowed Time
		34754, -- Holy Concentration
		63724, -- Holy Concentration
		63725, -- Holy Concentration
		14743, -- Martyrdom
		27828, -- Martyrdom
		63731, -- Serendipity
		63734, -- Serendipity
		63735, -- Serendipity
		33151, -- Surge of Light
		-- Rogue
		-- Shaman
		16246, -- Elemental Focus
		53817, -- Maelstrom Weapon (Fifth stack)
		53390, -- Tital Waves
		-- Warlock
		54274, -- Backdraft
		54276, -- Backdraft
		54277, -- Backdraft
		34936, -- Backlash
		63165, -- Decimation
		63167, -- Decimation
		47283, -- Empowered Imp
		64368, -- Eradication
		64370, -- Eradication
		64371, -- Eradication
		47383, -- Molten Core
		71162, -- Molten Core
		71165, -- Molten Core
		17941, -- Nightfall
		18093, -- Pyroclasm
		63243, -- Pyroclasm
		63244, -- Pyroclasm
		63321, -- Glyph of Life Tap
		-- Warrior
		46916, -- Bloodsurge
		52437, -- Sudden Death
		50227, -- Sword and Board
		60503, -- Taste for Blood
		58363, -- Glyph of Revenge
		-- Other
		37706, -- Healing Trance
		37721, -- Healing Trance
		37722, -- Healing Trance
		37723, -- Healing Trance
		60512, -- Healing Trance
		60513, -- Healing Trance
		60514, -- Healing Trance
		60515, -- Healing Trance
		33370, -- Quagmirran's Eye (Spell Haste)
	};
	
	for _,v in pairs(EventAlertItems) do
		if EA_Items[v] == nil then
			EA_Items[v] = true
		end
	end
	
	local EventAlertAltItems = {
		-- Death Knight
		56815,-- Rune Strike
		-- Druid
		-- Hunter
		53351, -- Kill Shot
		61005, -- Kill Shot
		61006, -- Kill Shot
		-- Mage
		-- Paladin
		24275, -- Hammer of Wrath
		24274, -- Hammer of Wrath
		24239, -- Hammer of Wrath
		27180, -- Hammer of Wrath
		48805, -- Hammer of Wrath
		48806, -- Hammer of Wrath
		-- Priest
		-- Rogue
		14251, -- Riposte
		-- Shaman
		-- Warlock
		-- Warrior
		7384, -- Overpower
		5308, -- Execute
		20658, -- Execute
		20660, -- Execute
		20661, -- Execute
		20662, -- Execute
		25234, -- Execute
		25236, -- Execute
		47470, -- Execute
		47471, -- Execute
		6572, -- Revenge
		6574, -- Revenge
		7379, -- Revenge
		11600, -- Revenge
		11601, -- Revenge
		25288, -- Revenge
		25269, -- Revenge
		30357, -- Revenge
		57823, -- Revenge
		34428, -- Victory Rush
	};
	
	for _,v in pairs(EventAlertAltItems) do
		if EA_AltItems[v] == nil then
			EA_AltItems[v] = true
		end
	end
end
