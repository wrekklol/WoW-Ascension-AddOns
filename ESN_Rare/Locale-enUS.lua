local L = LibStub("AceLocale-3.0"):NewLocale("ESN_Rare", "enUS", false)
if not L then return end

L["Kampflog"] = "Combatlog"
L["Warnton"] = "Sound Alert"
L["Warnton Ein/Ausschalten."] = "Toggle Sound Alert."
L["Intervall"] = "Interval"
L["Die Zeit zwischen Warnungen in Sek. eingeben."] = "Time between warnings in Sec."
L["ist bereits tot"] = "is already dead"
L["Warnung bei Toten"] = "Alert when dead"
L["Warnungen bei Toten Ein/Ausschalten."] = "Toggle Alert when dead"
L["(Rare) Macro zum anwählen des Mobs"] = "(Rare) Macro to Target the Mob"
L["Macrogenerierung Ein/Ausschalten."] = "Toggle Macrogeneration."
L["Scan Frequenz"] = "Scan Frequenzy"
L["Wie oft nach Rare Scannen (0 deaktiviert Scannen)"] = "how often to scan for Rares (0 deactivate Scan)"
L["Plakette"] = "Nameplate"
L["Warnton"] = "Alertsound"
L["Warnton auswählen"] = "Select Alertsound"
L["Kartenmarkierung"] = "Mapnote"
L["Kartenmarkierung Ein/Ausschalten (Benötigt HandyNotes)."] = "Toggle Mapnote (req. HandyNotes)."
L["Zähmbare melden"] = "Report tameable Mobs"
L["Zähmbare bei CacheScan auch melden."] = "Report tameable mobs on CacheScan"
L["Namensplaketten überwachen"] = "Scan Nameplates"
L["Namensplaketten Überwachung Ein/Ausschalten."] = "Toggle Nameplate scanning"
L["Kampflog überwachen"] = "Scan CombatLog"
L["Kampflog Überwachung Ein/Ausschalten. (Reload UI empfohlen)"] = "Toggle CombatLog scanning (ReloadUI suggested)"
L["Minimap überwachen"] = "Scan Minimap"
L["Minimap Überwachung (bei Mouseover) Ein/Ausschalten. (Benötigt Reload UI! - Prozessoraufwändig)"] = "Toggle Minimap scanning on MouseOver. (Requires ReloadUI! - CPU intensive)"
L["Cache Dateien überwachen"] = "Scan Cache Files"
L["Cache Datei Überwachung Ein/Ausschalten. (Nachdem der seltene gefunden wurde muß die Cachedatei gelöscht werden um ihn nochmal finden zu können)"] = "Toggle Cache scanning. (After finding a rare mob you have to delete your Cachefile to be able to find him again)"
L["Mouseover überwachen"] = "Scan MouseOver"
L["Mouseover Überwacung Ein/Ausschalten."] = "Toggle MouseOver scanning"
L["Bildschirm blinken"] = "Flash Screen"
L["Bildschirm blinken Ein/Ausschalten."] = "Toggle Screen flashing"
L["Minimap"] = "Minimap"
L["Seltene Gegner im Cache:"] = "Rare Mobs in Cache:"
L["In Städten keine Meldungen"]= "No Warnings in Town"
L["Gibt keine Warnungen in Städten aus."]= "No Warnings in Town"

L["Rares"] = {
	[33776] = "Gondria",
	[32630] = "Vyragosa",
	[32447] = "Zul'drak Sentinel",
	[32422] = "Grocklar",
	[32481] = "Aotona",
	[32409] = "Crazed Indu'le Survivor",
	[32500] = "Dirkee",
	[32358] = "Fumblub Gearwind",
	[32471] = "Griegen",
	[32501] = "High Thane Jorfus",
	[32495] = "Hildana Deathstealer",
	[16179] = "Hyakiss the Lurker",
	[32361] = "Icehorn",
	[32485] = "King Krush",
	[32398] = "King Ping",
	[32517] = "Loque'nahak",
	[32357] = "Old Crystalbark",
	[32377] = "Perobas the Bloodthirster",
	[32487] = "Putridus the Ancient",
	[16181] = "Rokad the Ravager",
	[32417] = "Scarlet Highlord Daion",
	[32429] = "Seething Hate",
	[16180] = "Shadikith the Glider",
	[32438] = "Syreian the Bonecarver",
	[32475] = "Terror Spinner",
	[32491] = "Time-Lost Proto Drake",
	[32400] = "Tukemuth",
	[32435] = "Vern",
	[32386] = "Vigdis the War Maiden",
	[18693] = "Speaker Mar'grom",
	[1851] = "The Husk",
	[18683] = "Voidhunter Yar",
	[18679] = "Vorakem Doomspeaker",
	[18689] = "Crippler",
	[18686] = "Doomsayer Jurim",
	[18695] = "Ambassador Jerrikar",
	[18682] = "Bog Lurker",
	[18684] = "Bro'Gaz the Clanless",
	[18697] = "Chief Engineer Lorthander",
	[18681] = "Coilfang Emissary",
	[18694] = "Collidus the Warp-Watcher",
	[18698] = "Ever-Core the Punisher",
	[1843] = "Foreman Jerris",
	[18678] = "Fulgorge",
	[10899] = "Goraluk Anvilcrack",
	[17144] = "Goretooth",
	[18692] = "Hemathion",
	[18696] = "Kraator",
	[10201] = "Lady Hederine",
	[14506] = "Lord Hel'nurath",
	[18680] = "Marticar",
	[18677] = "Mekthorg the Wild",
	[18690] = "Morcrush",
	[20932] = "Nuramoc",
	[18685] = "Okrek",
	[1839] = "Scarlet High Clerist",
	[1838] = "Scarlet Interrogator",
	[14471] = "Setis",
	[10202] = "Azurous",
	[9596] = "Bannok Grimaxe",
	[10263] = "Burning Felguard",
	[8301] = "Clack the Reaver",
	[10077] = "Deathmaw",
	[10827] = "Deathspeaker Selendre",
	[7104] = "Dessecus",
	[8304] = "Dreadscorn",
	[10817] = "Duggan Wildhammer",
	[1844] = "Foreman Marcrid",
	[1847] = "Foulmane",
	[10196] = "General Colbatann",
	[6650] = "General Fangferror",
	[9718] = "Ghok Bashguud",
	[10825] = "Gish the Unmoving",
	[9604] = "Gorgon'och",
	[14472] = "Gretheer",
	[10199] = "Grizzle Snowpaw",
	[14477] = "Grubthor",
	[6583] = "Gruff",
	[8979] = "Gruklash",
	[9602] = "Hahk'Zor",
	[10558] = "Hearthsinger Forresten",
	[10821] = "Hed'mush the Rotting",
	[1885] = "Scarlet Smith",
	[9046] = "Scarshield Quartermaster",
	[11498] = "Skarr the Unbreakable",
	[10393] = "Skul",
	[9218] = "Spirestone Battle Lord",
	[9219] = "Spirestone Butcher",
	[9217] = "Spirestone Lord Magus",
	[8299] = "Spiteflayer",
	[10809] = "Stonespine",
	[10078] = "Terrorspark",
	[8978] = "Thauris Balgarr",
	[14345] = "The Ongar",
	[11497] = "The Razza",
	[11467] = "Tsu'zee",
	[14479] = "Twilight Lord Everun",
	[6585] = "Uhk'loc",
	[9042] = "Verek",
	[10119] = "Volchan",
	[9041] = "Warder Stilgiss",
	[10822] = "Warlord Thresh'jin",
	[2931] = "Zaricotl",
	[14474] = "Zora",
	[10823] = "Zul'Brin Warpbranch",
	[8976] = "Hematos",
	[10828] = "High General Abbendis",
	[11383] = "High Priestess Hai'watna",
	[8282] = "Highlord Mastrogonde",
	[14478] = "Huricanian",
	[7137] = "Immolatus",
	[8213] = "Ironback",
	[10509] = "Jed Runewatcher",
	[10198] = "Kashoch the Reaver",
	[6584] = "King Mosh",
	[14476] = "Krellack",
	[6649] = "Lady Sesspira",
	[14473] = "Lapress",
	[10826] = "Lord Darkscythe",
	[1848] = "Lord Maldazzar",
	[6647] = "Magister Hawkhelm",
	[8297] = "Magronos the Unyielding",
	[8981] = "Malfunctioning Reaver",
	[6652] = "Master Feardred",
	[10197] = "Mezzir the Howler",
	[8217] = "Mith'rethis the Enchanter",
	[6646] = "Monnos the Elder",
	[11447] = "Mushgog",
	[16184] = "Nerubian Overseer",
	[14343] = "Olm the Wise",
	[8923] = "Panzor the Invincible",
	[1850] = "Putridius",
	[9024] = "Pyromancer Loregrain",
	[14342] = "Ragepaw",
	[10200] = "Rak'shiri",
	[10824] = "Ranger Lord Hawkspear",
	[8300] = "Ravage",
	[14475] = "Rex Ashil",
	[13896] = "Scalebeard",
	[1841] = "Scarlet Executioner",
	[1837] = "Scarlet Judge",
	[6582] = "Clutchmother Zavas",
	[10376] = "Crystal Fang",
	[8298] = "Akubar the Seer",
	[14340] = "Alshirr Banebreath",
	[6648] = "Antilos",
	[5347] = "Antilus the Soarer",
	[5349] = "Arash-ethis",
	[5346] = "Bloodroar the Stalker",
	[8202] = "Cyclok the Mad",
	[14339] = "Death Howl",
	[8302] = "Deatheye",
	[10081] = "Dustwraith",
	[8279] = "Faulty War Golem",
	[14446] = "Fingat",
	[2601] = "Foulbelly",
	[6651] = "Gatekeeper Rageroar",
	[6650] = "General Fangferror",
	[14447] = "Gilmorian",
	[5354] = "Gnarl Leafbrother",
	[8207] = "Greater Firebird",
	[8215] = "Grimungous",
	[8303] = "Grunter",
	[8205] = "Haarka the Ravenous",
	[1063] = "Jade",
	[8214] = "Jalinde Summerdrake",
	[14492] = "Verifonix",
	[5399] = "Veyzhak the Cannibal",
	[8199] = "Warleader Krazzilak",
	[8218] = "Witherheart the Stalker",
	[5400] = "Zekkis",
	[10082] = "Zerillis",
	[8219] = "Zul'arek Hatefowler",
	[8200] = "Jin'Zallah the Sandbringer",
	[8203] = "Kregg Keelhaul",
	[14491] = "Kurmokk",
	[5343] = "Lady Szallah",
	[14445] = "Lord Captain Wyrmak",
	[2541] = "Lord Sakrasis",
	[12237] = "Meshlok the Harvester",
	[8296] = "Mojo the Twisted",
	[14448] = "Molt Thorn",
	[14344] = "Mongress",
	[8208] = "Murderous Blisterpaw",
	[2447] = "Narillasanz",
	[8211] = "Old Cliff Jumper",
	[5352] = "Old Grizzlegut",
	[8201] = "Omgorn the Lost",
	[2779] = "Prince Nazjak",
	[5350] = "Qirot",
	[6581] = "Ravasaur Matriarch",
	[8210] = "Razortalon",
	[8277] = "Rekk'tilac",
	[8216] = "Retherokk the Berserker",
	[14490] = "Rippa",
	[2752] = "Rumbler",
	[10080] = "Sandarr Dunereaver",
	[8281] = "Scald",
	[1552] = "Scale Belly",
	[3581] = "Sewer Beast",
	[8280] = "Shleipnarr",
	[8283] = "Slave Master Blackheart",
	[8278] = "Smoldar",
	[5356] = "Snarler",
	[8204] = "Soriid the Devourer",
	[8924] = "The Behemoth",
	[8660] = "The Evalcharr",
	[8212] = "The Reak",
	[6118] = "Varo'then's Ghost",
	[4339] = "Brimgore",
	[11688] = "Cursed Centaur",
	[14224] = "7:XT",
	[2754] = "Anathemus",
	[2453] = "Lo'Grosh",
	[14236] = "Lord Angler",
	[503] = "Lord Malathrom",
	[763] = "Lost One Chieftain",
	[1106] = "Lost One Cook",
	[2604] = "Molok the Crusher",
	[534] = "Nefaru",
	[2606] = "Nimar the Slayer",
	[14237] = "Oozeworm",
	[14225] = "Prince Kellen",
	[10647] = "Prince Raze",
	[1140] = "Razormaw Matriarch",
	[14233] = "Ripscale",
	[14488] = "Roloch",
	[2602] = "Ruul Onestone",
	[2744] = "Shadowforge Commander",
	[2749] = "Siege Golem",
	[4132] = "Silithid Ravager",
	[2600] = "Singer",
	[2452] = "Skhowl",
	[2258] = "Stone Fury",
	[3792] = "Terrowulf Packlord",
	[14235] = "The Rot",
	[12037] = "Ursol'lok",
	[5937] = "Vile Sting",
	[2751] = "War Golem",
	[2605] = "Zalas Witherbark",
	[2753] = "Barnabus",
	[2850] = "Broken Tooth",
	[14230] = "Burgle Eye",
	[14229] = "Accursed Slitherblade",
	[5933] = "Achellios the Banished",
	[7895] = "Ambassador Bloodrage",
	[14222] = "Araga",
	[6490] = "Azshir the Sleepless",
	[771] = "Commander Felstrom",
	[14223] = "Cranky Benj",
	[18241] = "Crusty",
	[2598] = "Darbel Montrose",
	[4380] = "Darkmist Widow",
	[14232] = "Dart",
	[7057] = "Digmaster Shovelphlange",
	[14231] = "Drogoth the Roamer",
	[6488] = "Fallen Champion",
	[507] = "Fenros",
	[2609] = "Geomancer Flintdagger",
	[14228] = "Giggler",
	[14487] = "Gluggle",
	[14221] = "Gravis Slipknot",
	[14234] = "Hayoc",
	[5934] = "Heartrazor",
	[14227] = "Hissperak",
	[5935] = "Ironeye the Invincible",
	[6489] = "Ironspine",
	[14226] = "Kaskk",
	[2603] = "Kovork",
	[14277] = "Lady Zephris",
	[3735] = "Apothecary Falthis",
	[5834] = "Azzere the Skyblade",
	[14280] = "Big Samras",
	[4425] = "Blind Hunter",
	[10641] = "Branch Snapper",
	[5827] = "Brontus",
	[5915] = "Brother Ravenoak",
	[1720] = "Bruegal Ironknuckle",
	[5851] = "Captain Gerogg Hammertoe",
	[616] = "Chatter",
	[14279] = "Creepthess",
	[18241] = "Crusty",
	[1920] = "Dalaran Spellscribe",
	[6228] = "Dark Iron Ambassador",
	[3872] = "Deathsworn Captain",
	[5849] = "Digger Flameforge",
	[1037] = "Dragonmaw Battlemaster",
	[4842] = "Earthcaller Halmgar",
	[10642] = "Eck'alom",
	[5931] = "Foreman Rigger",
	[2108] = "Garneg Charskull",
	[14427] = "Gibblesnik",
	[5831] = "Swiftmane",
	[5864] = "Swinegart Spearhide",
	[14275] = "Tamra Stormpike",
	[5932] = "Taskmaster Whipfang",
	[5798] = "Thora Feathermoon",
	[5832] = "Thunderstomp",
	[4030] = "Vengeful Ancient",
	[462] = "Vultros",
	[14425] = "Gnawbone",
	[5859] = "Hagg Taurenbane",
	[5799] = "Hannah Bladeleaf",
	[14426] = "Harb Foulmountain",
	[5847] = "Heggin Stonewhisker",
	[5828] = "Humar the Pridelord",
	[14281] = "Jimmy the Bleeder",
	[584] = "Kazon",
	[10559] = "Lady Vespia",
	[7016] = "Lady Vespira",
	[2476] = "Large Loch Crocolisk",
	[1112] = "Leech Widow",
	[521] = "Lupos",
	[2090] = "Ma'ruk Wyrmscale",
	[1399] = "Magosh",
	[5848] = "Malgin Barleybrew",
	[5800] = "Marcus Bel",
	[14424] = "Mirelow",
	[10644] = "Mist Howler",
	[10643] = "Mugglefin",
	[4066] = "Nal'taszar",
	[574] = "Naraxis",
	[10640] = "Oakpaw",
	[4015] = "Pridewing Patriarch",
	[2283] = "Ravenclaw Regent",
	[4438] = "Razorfen Spearhide",
	[14278] = "Ro'Bark",
	[947] = "Rohh the Silent",
	[10639] = "Rorgish Jowl",
	[1944] = "Rot Hide Bruiser",
	[14276] = "Scargil",
	[14269] = "Seeker Aqualon",
	[5916] = "Sentinel Amarassan",
	[3253] = "Silithid Harvester",
	[5930] = "Sister Riven",
	[14433] = "Sludginn",
	[1948] = "Snarlmane",
	[5928] = "Sorrow Wing",
	[1398] = "Boss Galgosh",
	[14273] = "Boulderheart",
	[5797] = "Aean Swiftriver",
	[3773] = "Akkrilus",
	[3672] = "Boahn",
	[520] = "Brack",
	[596] = "Brainwashed Noble",
	[5838] = "Brokespear",
	[5823] = "Death Flayer",
	[1911] = "Deeb",
	[5912] = "Deviate Faerie Dragon",
	[5865] = "Dishu",
	[22062] = "Dr. Whitherlimb",
	[3270] = "Elder Mystic Razorsnout",
	[16854] = "Eldinarcus",
	[14267] = "Emogg the Crusher",
	[5787] = "Enforcer Emilgund",
	[5836] = "Engineer Whirleygig",
	[472] = "Fedfennel",
	[10358] = "Fellicent's Shade",
	[5822] = "Felweaver Scornn",
	[22060] = "Fenissa the Assassin",
	[2192] = "Firecaller Radison",
	[7015] = "Flagglemurk the Cruel",
	[573] = "Foe Reaper 4000",
	[5842] = "Takk the Leaper",
	[61] = "Thuros Lightfingers",
	[3652] = "Trigore the Lasher",
	[5835] = "Foreman Grills",
	[5863] = "Geopriest Gukk'rok",
	[3398] = "Gesharahan",
	[3056] = "Ghost Howl",
	[8503] = "Gibblewilt",
	[12431] = "Gorefang",
	[1260] = "Great Father Arctikus",
	[14429] = "Grimmaw",
	[1425] = "Grizlak",
	[100] = "Gruff Swiftbite",
	[1119] = "Hammerspine",
	[12433] = "Krethis Shadowspinner",
	[2184] = "Lady Moongazer",
	[572] = "Leprithus",
	[2191] = "Licillin",
	[14268] = "Lord Condar",
	[7017] = "Lord Sinslayer",
	[599] = "Marisa du'Paige",
	[1424] = "Master Digger",
	[3586] = "Miner Johnson",
	[12432] = "Old Vicejaw",
	[3470] = "Rathorian",
	[10357] = "Ressan the Needler",
	[14271] = "Ribchaser",
	[5841] = "Rocklance",
	[506] = "Sergeant Brashclaw",
	[2175] = "Shadowclaw",
	[14266] = "Shanda the Spinner",
	[5785] = "Sister Hatelash",
	[5830] = "Sister Rathtalon",
	[519] = "Slark",
	[3295] = "Sludge Beast",
	[14272] = "Snarlflare",
	[5829] = "Snort the Heckler",
	[14270] = "Squiddic",
	[10359] = "Sri'skulk",
	[5837] = "Stonearm",
	[2172] = "Strider Clutchmother",
	[5824] = "Captain Flat Tusk",
	[2186] = "Carnivous the Breaker",
	[1130] = "Bjarn",
	[3535] = "Blackmoss the Fetid",
	[1137] = "Edan the Howler",
	[1936] = "Farmer Solliden",
	[10356] = "Bayne",
	[16380] = "Bone Witch",
	[5345] = "Diamond Head",
	[14430] = "Duskstalker",
	[14431] = "Fury Shelda",
	[5826] = "Geolord Mottle",
	[1531] = "Lost Soul",
	[14697] = "Lumbering Horror",
	[3068] = "Mazzranache",
	[99] = "Morgaine the Sly",
	[471] = "Mother Fang",
	[1910] = "Muad",
	[79] = "Narg the Taskmaster",
	[12116] = "Priestess of Elune",
	[5786] = "Snagglespear",
	[16379] = "Spirit of the Damned",
	[5807] = "The Rake",
	[14432] = "Threggil",
	[1132] = "Timber",
	[1533] = "Tormented Spirit",
	[16855] = "Tregla",
	[14428] = "Uruson",
	[5808] = "Warlord Kolkanis",
	[5809] = "Watch Commander Zalaphil",
}
