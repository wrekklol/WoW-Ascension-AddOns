local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

--Global Settings
G.general = {
	UIScale = 0.7111111111111111,
	version = 6.08,
	versionCheck = true,
	locale = "auto",
	eyefinity = false,
	ignoreScalePopup = false,
	smallerWorldMap = true,
	fadeMapWhenMoving = true,
	mapAlphaWhenMoving = 0.35,
	AceGUI = {
		width = 1000,
		height = 720
	},
	WorldMapCoordinates = {
		enable = true,
		position = "BOTTOMLEFT",
		xOffset = 0,
		yOffset = 0
	}
}

G.classtimer = {}

G.chat = {
	classColorMentionExcludedNames = {},
}

G.bags = {
	ignoredItems = {},
}

G.nameplates = {}

G.unitframe = {
	aurafilters = {},
	buffwatch = {},
	raidDebuffIndicator = {
		instanceFilter = "RaidDebuffs",
		otherFilter = "CCDebuffs",
	},
	spellRangeCheck = {
		DRUID = {
			enemySpells = {
				[585] = true, -- Smite (30 yards)
				[33786] = true, -- Cyclone (20 yards)
				[20271] = true, -- Judgement (10 yards)
				[51514] = true, -- Hex (20 yards)
				[8042] = true, -- Earth Shock (25 yards)
				[5782] = true, -- Fear (20 yards)
				[2136] = true, -- Fire Blast (20 yards)
				[12826] = true, -- Polymorph (30 yards)
				[75] = true, -- Auto Shot (35 yards)
				[49576] = true, -- Death Grip (30 yards)
				[2094] = true, -- Blind (10 yards)
				[5246] = true, -- Intimidating Shout (8 yards)
				[100] = true, -- Charge (25 yards)
			},
			longEnemySpells = {
				[589] = true, -- Shadow Word: Pain (30 yards)
				[5176] = true, -- Wrath (30 yards)
				[879] = true, -- Exorcism (30 yards)
				[403] = true, -- Lightning Bolt (30 yards)
				[686] = true, -- Shadow Bolt (30 yards)
				[133] = true, -- Fireball (35 yards)
				[44614] = true, -- Frostfire Bolt (40 yards)
				[26679] = true, -- Deadly Throw (30 yards)
				[355] = true, -- Taunt (30 yards)

			},
			friendlySpells = {
				[2050] = true, -- Lesser Heal (40 yards)
				[5185] = true, -- Healing Touch (40 yards)
				[635] = true, -- Holy Light (40 yards)
				[331] = true, -- Healing Wave (40 yards)
				[5697] = true, -- Unending Breath (30 yards)
				[475] = true, -- Remove Curse (40 yards)
				[47541] = true, -- Death Coil (40 yards)
				[57934] = true, -- Tricks of the Trade (20 yards)
				[3411] = true, -- Intervene (25 yards)

			},
			resSpells = {
				[2006] = true, -- Resurrection (40 yards)
				[50769] = true, -- Revive (30 yards)
				[20484] = true, -- Rebirth (30 yards)
				[7328] = true, -- Redemption (30 yards)
				[2008] = true, -- Ancestral Spirit (30 yards)
				[61999] = true, -- Raise Ally (30 yards)
			},
			petSpells = {
				[755] = true, -- Health Funnel (45 yards)
				[136] = true, -- Mend Pet (45 yards)
			},
		},
	}
}

G.profileCopy = {
	--Specific values
	selected = "Minimalistic",
	movers = {},
	--Modules
	actionbar = {
		general = true,
		bar1 = true,
		bar2 = true,
		bar3 = true,
		bar4 = true,
		bar5 = true,
		bar6 = true,
		barPet = true,
		stanceBar = true,
		microbar = true,
		cooldown = true
	},
	auras = {
		general = true,
		buffs = true,
		debuffs = true,
		cooldown = true
	},
	bags = {
		general = true,
		split = true,
		vendorGrays = true,
		bagBar = true,
		cooldown = true
	},
	chat = {
		general = true
	},
	cooldown = {
		general = true,
		fonts = true
	},
	databars = {
		experience = true,
		reputation = true
	},
	datatexts = {
		general = true,
		panels = true
	},
	general = {
		general = true,
		minimap = true,
		threat = true,
		totems = true
	},
	nameplates = {
		general = true,
		cooldown = true,
		reactions = true,
		threat = true,
		units = {
			FRIENDLY_PLAYER = true,
			ENEMY_PLAYER = true,
			FRIENDLY_NPC = true,
			ENEMY_NPC = true
		}
	},
	tooltip = {
		general = true,
		visibility = true,
		healthBar = true
	},
	unitframe = {
		general = true,
		cooldown = true,
		colors = {
			general = true,
			power = true,
			reaction = true,
			healPrediction = true,
			classResources = true,
			frameGlow = true,
			debuffHighlight = true
		},
		units = {
			player = true,
			target = true,
			targettarget = true,
			targettargettarget = true,
			focus = true,
			focustarget = true,
			pet = true,
			pettarget = true,
			boss = true,
			arena = true,
			party = true,
			raid = true,
			raid40 = true,
			raidpet = true,
			tank = true,
			assist = true
		}
	}
}