local trade = LibStub("LibTradeLinks-1.0")

local build = 9835;

trade:RegisterBuild(build);

trade:SetBlackList(build, 
	{ 3273,3274,7924,10846,27028,45542,10846,2018,3100,3538,9785,9788,9787,17039,17040,17041,29844,51300,2108,3104,3811,10656,10660,10658,10662,32549,51302,2259,3101,3464,11611,28596,28677,28675,28672,51304,53042,60893,2550,3102,3413,818,18260,33359,51296,2580,2575,2576,2656,3564,8388,10248,29354,32606,50310,53120,53121,53122,53123,53124,53040,3908,3909,3910,12180,26801,26798,26797,26790,51309,59390,4036,4037,4038,12656,20222,20219,4073,12749,19804,13166,13258,30350,49383,51306,56273,7411,7412,7413,13262,13920,28029,51313,25229,25230,28894,28895,28897,31252,51311,55534,45357,45358,45359,45360,45361,45363,51005,52175,61177,61288 });

trade:SetBoPList(build, 
	{ 15296,16969,16980,16985,16986,34533,34545,34538,34529,34535,34541,34547,34543,34542,34534,34548,34546,34540,34544,34537,34530,36122,36125,36128,36126,36124,36137,36129,36136,36135,36133,36134,36130,36131,36256,36257,36258,36259,36260,36261,36262,36263,36391,36392,41133,41135,46144,46142,55183,55184,55185,55186,55187,35576,35577,35575,35582,35584,35580,35590,35591,35589,35587,35588,35585,36074,36076,36075,36079,36078,36077,36355,36357,36358,36359,41164,41157,41162,41160,46137,46138,46139,46136,11459,17632,47050,47046,47049,47048,58868,58871,60403,60396,60405,64054,8770,18456,18457,18458,36317,36318,41208,41206,46131,46130,60971,12717,12718,12755,12759,12897,12906,12908,15633,15628,30565,30566,30574,30575,40274,41311,41312,41314,41315,41316,41317,41318,41319,41320,41321,46111,46115,46109,46107,46112,46114,46108,46110,46116,46113,46106,54353,56469,56480,56481,56574,56483,56484,56486,56487,62271,7421,7795,13628,13702,15596,20051,32664,32665,32667,60619,26872,26873,26875,26881,26882,26900,26909,26911,26912,26914,31079,31080,31081,31082,31083,32259,32801,32807,32808,32809,32810,42558,42588,42589,42590,42593,42591,42592,46126,46127,46125,46775,46776,46777,46778,46779,56049,56052,56053,56054,56055,56056,56074,56076,56077,56079,56081,56083,56084,56085,56087,56088,56089,56086,56199,56201,56202,56203,58143,58144,59759 });

trade:AddData(build, trade.SKILL_TAILORING,
	{ 3908,3909,3910,12180,26801,26798,26797,26790,51309 },
	{ 3908,3909,3910,2963,2387,2385,2389,2386,2392,2393,2394,2397,2395,2396,2964,2402,2399,2401,2403,2406,3839,3865,3840,3841,3842,3843,3844,3845,3847,3848,3849,3850,3851,3852,3854,3855,3856,3857,3858,3859,3860,3861,3862,3863,3864,3866,3868,3869,3870,3871,3872,3873,3914,3915,6521,3758,3755,3757,3813,6686,6688,6690,6692,6693,6695,7623,7624,7630,7629,7633,7636,7639,7643,7892,7893,8465,8467,8489,8483,8776,8758,8760,8762,8764,8766,8770,8772,8774,8778,8780,8782,8784,8786,8789,8791,8793,8795,8797,8799,8802,8804,12044,12045,12046,12047,12048,12049,12050,12052,12053,12055,12056,12059,12060,12061,12062,12063,12064,12065,12066,12067,12068,12069,12070,12071,12072,12073,12074,12075,12076,12077,12078,12079,12080,12081,12082,12083,12084,12085,12086,12087,12088,12089,12090,12091,12092,12093,12180,18401,18402,18403,18404,18406,18405,18407,18408,18409,18410,18411,18412,18415,18413,18414,18416,18417,18418,18419,18420,18421,18422,18423,18424,18434,18436,18437,18438,18439,18440,18441,18442,18444,18445,18446,18447,18448,18449,18450,18451,18452,18453,18454,18455,18456,18457,18458,18560,19435,20848,20849,21945,22759,22813,22866,22867,22868,22869,22870,22902,23662,23664,23663,23665,23666,23667,24093,24092,24091,24902,24903,24901,26085,26086,26087,26403,26407,26745,26746,26747,26749,26750,26751,26752,26753,26754,26755,26756,26757,26758,26759,26760,26761,26762,26763,26764,26765,26770,26771,26772,26773,26774,26775,26776,26777,26778,26779,26780,26781,26782,26783,26784,26801,26798,26797,26790,27658,27659,27660,27724,27725,28210,28208,28205,28207,28209,28481,28482,28480,31430,31431,31432,31433,31434,31435,31437,31438,31440,31441,31442,31443,31444,31448,31449,31450,31451,31452,31453,31454,31455,31456,31459,31460,31461,31373,36315,36317,36316,36318,36670,36672,36669,36667,36668,36665,36686,37873,37882,37883,37884,40021,40024,40023,40020,40060,41207,41208,41205,41206,44958,44950,46129,46131,46128,46130,49677,50194,50644,50647,51309,55642,55769,55777,55898,55899,55900,55902,55903,55904,56030,55906,55907,55908,55910,55911,55913,55901,55914,55921,55922,55919,55924,55925,55920,55923,55941,55943,55993,55994,55995,55996,55997,55998,55999,56000,56002,56001,56003,56004,56005,56006,56007,56008,56009,56010,56011,56014,56015,56017,56016,56018,56019,56020,56021,56022,56023,56024,56025,56026,56027,56028,56029,56031,56034,56039,56048,59390,59582,59583,59584,59585,59586,59587,59588,59589,60969,60971,60993,60994,60990,63742,63924,63206,63205,63204,63203,64729,64730 }
);

trade:AddData(build, trade.SKILL_ENCHANTING,
	{ 7411,7412,7413,13920,28029,51313 },
	{ 7411,7412,7413,7418,7420,7421,7426,7428,7443,7454,7457,7748,7766,7771,7776,7779,7782,7786,7788,7745,7793,7795,7857,7859,7861,7863,7867,13262,13378,13380,13419,13421,13464,13485,13501,13503,13522,13529,13536,13538,13607,13612,13617,13620,13622,13626,13628,13631,13635,13637,13640,13642,13644,13646,13648,13653,13655,13657,13659,13661,13663,13687,13689,13693,13695,13698,13700,13702,13920,13746,13794,13815,13817,13822,13836,13841,13846,13858,13868,13882,13887,13890,13898,13905,13915,13917,13931,13933,13935,13937,13939,13941,13943,13945,13947,13948,14293,14807,14809,14810,15596,17181,17180,20008,20020,20014,20017,20009,20012,20024,20026,20016,20029,20015,20028,20051,20013,20023,20010,20030,20033,20036,20031,20011,20034,20025,20032,20035,21931,22749,22750,23799,23800,23801,23802,23803,23804,25072,25073,25074,25078,25079,25080,25081,25082,25083,25084,25086,25124,25125,25126,25127,25128,25129,25130,27837,28029,27899,27905,27906,27911,27913,27914,27917,27920,27924,27926,27927,27944,27945,27946,27947,27948,27950,27951,27954,27957,27958,27960,27961,27962,27967,27968,27972,27971,27975,27977,28004,28003,27984,27981,27982,28016,28019,28021,28022,32664,32665,32667,33990,33991,33992,33993,33994,33995,33996,33997,33999,34001,34002,34003,34004,34005,34006,34007,34008,34009,34010,28027,28028,42613,42615,42620,42974,44383,44483,44484,44488,44489,44492,44494,44508,44500,44506,44509,44510,44528,44513,44524,44555,44556,44529,44575,44576,44584,44582,44589,44588,44590,44593,44591,44612,44592,44595,44598,44596,44616,44621,44623,44625,44630,44629,44631,44633,44635,44645,44636,45765,46578,46594,47051,47672,47898,47899,47901,51313,47766,60609,60616,60606,60621,60623,60653,59636,60663,47900,60668,60619,60691,60707,60714,60692,60763,59621,59625,59619,60767,62256,62257,62948,62959,63746,64441,64579 }
);

trade:AddData(build, trade.SKILL_LEATHERWORKING,
	{ 2108,3104,3811,10656,10660,10658,10662,32549,51302 },
	{ 2108,2149,2152,2159,2881,3104,3811,3753,3756,3759,3760,3761,3762,3763,3764,3765,3766,3767,3768,3769,3770,3771,3772,3773,3774,3775,3776,3777,3778,3779,3816,3817,3818,3780,4097,4096,5244,6661,6702,6705,6703,6704,7126,7133,7135,7147,7149,7151,7153,7156,7955,7953,7954,8322,9058,9059,9060,9062,9064,9065,9068,9070,9072,9074,9145,9146,9147,9148,9149,9193,9194,9195,9196,9197,9198,9201,9202,9206,9207,9208,10482,10487,10490,10499,10507,10509,10511,10516,10518,10520,10525,10529,10531,10533,10542,10544,10546,10619,10621,10548,10550,10552,10630,10554,10556,10558,10560,10562,10564,10566,10568,10570,10572,10574,10632,10647,10650,10656,10660,10658,10662,14930,14932,19047,19058,19048,19049,19050,19051,19052,19053,19054,19055,19059,19060,19061,19062,19063,19064,19065,19066,19067,19068,19070,19071,19072,19073,19074,19075,19076,19077,19078,19079,19080,19081,19085,19084,19086,19082,19083,19089,19087,19088,19090,19094,19097,19095,19093,19091,19092,19100,19102,19101,19098,19107,19104,19106,19103,20648,20649,20650,20853,20854,20855,21943,22331,22711,22727,22815,22921,22922,22923,22926,22927,22928,23190,23399,23703,23705,23704,23706,23707,23708,23709,23710,24124,24125,24123,24122,24121,24655,24654,24846,24847,24848,24849,24850,24851,24940,24703,26279,28224,28222,28223,28221,28220,28219,28474,28473,28472,32454,32455,32456,32457,32458,32461,32462,32463,32464,32465,32466,32467,32468,32469,32470,32471,32472,32473,32478,32479,32480,32481,32482,32485,32487,32489,32488,32490,32493,32494,32495,32496,32497,32498,32499,32500,32501,32502,32503,32549,35530,35520,35521,35522,35523,35524,35527,35526,35525,35531,35528,35529,35534,35533,35532,35537,35536,35535,35538,35539,35540,35543,35544,35549,35555,35554,35557,35559,35558,35567,35562,35561,35564,35573,35572,35574,35563,35560,35568,35576,35577,35575,35582,35584,35580,35590,35591,35589,35587,35588,35585,36074,36076,36075,36079,36078,36077,36349,36351,36352,36353,36355,36357,36358,36359,39997,40001,40002,40006,40005,40003,40004,41161,41156,41163,41164,41157,41162,41158,41160,42546,42731,44344,44343,44359,44768,44770,44970,44953,45100,45117,46137,46138,46133,46134,46135,46139,46136,46132,50936,50962,50949,50955,50943,51302,50963,50948,50944,50945,50947,50946,51571,52733,55199,55243,57683,57699,57691,57694,57692,57690,57701,57696,60583,60584,50967,50965,51572,51570,51569,51568,50951,50950,50952,50953,50954,60599,60600,60601,60604,60605,50941,50939,50938,50942,50940,60607,60608,60611,60613,60620,50957,50959,50956,50961,50960,50958,60622,60624,60627,60629,60630,60631,60637,60640,50966,50964,50970,50971,60643,60645,60647,60649,60651,60652,60655,60658,60660,60665,60666,60669,60671,60697,60702,60703,60704,60705,60706,60711,60712,60715,60716,60718,60720,60721,60723,60725,60727,60728,60729,60730,60731,60732,60734,60735,60737,60743,60746,60747,60748,60749,60750,60751,60752,60754,60755,60756,60757,60758,60759,60761,60760,60998,60997,60996,61000,61002,60999,62176,62177,62448,63194,63195,63196,63201,63198,63199,63200,63197,64661,2153,2158,2160,2161,2162,2163,2164,2165,2167,2169,2168,2166 }
);

trade:AddData(build, trade.SKILL_COOKING,
	{ 2550,3102,3413,18260,33359,51296 },
	{ 2550,2538,2540,3102,3370,3371,3372,3373,3376,3377,3397,3398,3399,3400,3413,4094,6412,6413,6414,6415,6416,6417,6418,6419,6501,6500,6499,7213,7751,7752,7753,7754,7755,7827,7828,8238,8604,8607,9513,15935,15853,15855,15856,15861,15863,15865,15906,15910,15915,15933,818,18239,18238,18241,18240,18242,18243,18244,18245,18246,18247,18260,20626,20916,21144,21143,21175,22480,22761,24418,24801,25659,25704,25954,28267,33276,33277,33278,33279,33284,33285,33286,33287,33288,33289,33290,33291,33292,33293,33294,33295,33296,33359,36210,37836,38868,38867,42296,42302,42305,43707,43758,43761,43765,43779,45022,43772,13028,45695,46684,46688,51296,53056,45560,45561,45562,45563,45564,45565,45569,45566,57421,45549,45550,45551,45552,45553,45554,57423,45555,45556,45557,45558,45559,45567,45568,45571,45570,57433,57434,57435,57436,57437,57438,57439,57440,57441,57442,57443,58065,58512,58521,58523,58525,58527,58528,62045,62044,62051,62050,62049,62350,64054,64358,2539,2795,2541,2542,2543,2544,2545,2546,2547,2548,2549 }
);

trade:AddData(build, trade.SKILL_JEWELCRAFTING,
	{ 25229,25230,28894,28895,28897,51311 },
	{ 25229,25230,25278,25255,25280,25283,25284,25287,25305,25317,25318,25339,25320,25321,25323,25493,25490,25498,25610,25612,25613,25614,25615,25617,25618,25619,25620,25621,25622,26872,26873,26874,26875,26876,26878,26880,26881,26882,26883,26885,26887,26896,26897,26900,26902,26903,26906,26907,26908,26909,26910,26911,26912,26914,26915,26916,26918,26920,26925,26926,26927,26928,28894,28895,28897,28903,28905,28906,28907,28910,28912,28914,28915,28916,28917,28918,28924,28925,28927,28933,28936,28938,28944,28947,28948,28950,28953,28955,28957,31089,31096,31112,31085,31110,31106,31091,31099,31109,31104,31113,31108,31094,31101,31107,31111,31098,31105,31088,31103,31097,31102,31092,31149,31095,31090,31087,31100,31084,31048,31049,31050,31051,31052,31053,31054,31055,31056,31057,31058,31060,31061,31062,31063,31064,31065,31066,31067,31068,31070,31071,31072,31076,31077,31078,31079,31080,31081,31082,31083,31252,32178,32179,32259,32801,32807,32808,32809,32810,32867,32869,32870,32866,32868,32871,32874,32872,32873,34069,34590,34960,34961,34955,34959,36523,36524,36525,36526,37818,37855,38068,38175,38503,38504,39451,39452,39455,39458,39463,39462,39466,39467,39470,39471,39705,39712,39706,39714,39711,39713,39710,39717,39715,39716,39718,39719,39722,39725,39724,39721,39720,39723,39729,39731,39730,39732,39728,39727,39736,39733,39735,39734,39737,39738,39741,39739,39742,39740,39963,39961,40514,41418,41414,41415,41420,41429,42558,42588,42589,42590,42593,42591,42592,43493,44794,46126,46124,46127,46122,46125,46123,46403,46404,46405,46597,46601,46775,46776,46777,46778,46779,46803,47053,47054,47055,47056,47280,48789,51311,53831,53832,53834,53835,53843,53844,53845,54017,53934,53940,53941,53943,53852,53853,53854,53855,53857,53856,53859,53860,53861,53862,53863,53864,53865,53866,53867,53868,53869,53870,53871,53872,53873,53874,53875,53876,53877,53878,53879,53880,53881,53882,53883,53884,53885,53886,53887,53888,53889,53890,53891,53892,53893,53894,53916,53917,53918,53919,53920,53921,53922,53923,53924,53925,53926,53927,53928,53929,53930,53931,53932,53933,53830,53945,53946,53947,53948,53949,53950,53951,53952,53953,53954,53955,53956,53957,53958,53959,53960,53961,53962,53963,53964,53965,53966,53967,53968,53969,53970,53971,53972,53973,53974,53975,53976,53977,53978,53979,53980,53981,53982,53983,53984,53985,53986,53987,53988,53989,53990,53991,53992,53993,53994,54019,54023,54010,54011,54012,54013,54014,53995,53996,53997,53998,54000,54001,54002,54003,54004,54005,54006,54007,54008,54009,55384,55386,55387,55388,55390,55392,55393,55394,55395,55407,55396,55397,55398,55399,55400,55401,55402,55403,55404,55405,55389,55534,56049,56052,56053,56054,56055,56056,56074,56076,56077,56079,56081,56083,56084,56085,56087,56088,56089,56086,56193,56194,56195,56196,56197,56199,56201,56202,56203,56205,56206,56208,56496,56497,56498,56499,56500,56501,56530,56531,58141,58142,58143,58144,58145,58146,58147,58148,58149,58150,58507,58492,58954,59759,62242,62941,63743,64725,64726,64727,64728 }
);

trade:AddData(build, trade.SKILL_FIRSTAID,
	{ 3273,3274,7924,10846,27028,45542,10846 },
	{ 3273,3274,3275,3276,3277,3278,7928,7929,7924,7934,7935,10846,10840,10841,18629,18630,23787,27028,27032,27033,45545,45546,45542,10841,18629,10846,18630,3276,7934,3277,3278,7928,7929,10840 }
);

trade:AddData(build, trade.SKILL_INSCRIPTION,
	{ 45357,45358,45359,45360,45361,45363 },
	{ 45357,45358,45359,45360,45361,45363,45382,48114,48116,48247,50612,50614,50616,50617,50618,50619,50620,50598,50599,50600,50601,50602,50603,50604,50605,50606,50607,50608,50609,50610,50611,51005,52175,52738,52739,48248,52840,52843,53462,57207,57208,57209,57210,57211,57212,57213,57214,57215,57216,57217,57218,57219,57220,57221,57222,57223,57224,57225,57226,57227,57228,57229,57230,57231,57703,57704,57706,57707,57708,57709,57710,57711,57712,57713,57714,57715,57716,56955,56963,56961,48121,56945,56951,56948,56953,56956,56959,56957,56952,56943,56946,56947,56960,56950,56944,56954,56958,56949,57004,57009,56995,56997,57005,57007,56994,57000,57001,57002,57008,57003,56996,56999,57012,57013,57006,57011,56998,57010,56976,56978,56968,56971,56973,56974,56981,56982,56979,56985,56984,56972,56989,56986,56980,56983,57719,56975,56977,56987,56988,57022,57027,57029,57030,57031,57032,57020,57023,57024,57025,57026,57033,57036,57034,57035,57021,57028,57019,57194,57196,57184,57186,57188,57197,57200,57201,57183,57185,57187,57192,57193,57198,57191,57195,57202,57189,57181,57199,57190,57114,57119,57120,57121,57123,57125,57129,57131,57132,57133,57122,57113,57116,57124,57128,57115,57126,57127,57112,57117,57130,57239,57246,57238,57240,57245,57249,57241,57242,57244,57251,57236,57252,57233,57232,57247,57248,57235,57243,57250,57234,57237,57259,57266,57265,57262,57269,57271,57277,57270,57274,57272,57275,57257,57264,57273,57258,57267,57260,57268,57261,57263,57276,58484,58485,58486,58487,58488,58489,58490,58491,58472,58473,58476,58478,58480,58481,58482,58483,58565,59480,59487,59491,59502,59503,59504,61117,61119,61120,61118,61177,61288,58296,58289,58299,58301,58298,58300,58303,58306,58310,58308,58314,58313,58312,58318,58317,58326,58323,58337,58342,58344,58346,58343,58286,58288,58305,58311,58315,58320,58325,58332,59326,58336,58345,58307,58324,58328,58331,58340,59315,58287,58302,58316,58321,58333,58329,58330,58338,58339,58319,58297,58327,58347,58322,58341,57162,57158,59475,59478,57163,57157,57167,59484,59486,57161,57165,59499,59387,60336,59489,59490,59488,57151,57154,59493,59494,57156,59495,59496,59338,57168,59339,59340,57172,60337,59497,59498,59500,59501,57159,57170,57152,57169,57160,57166,59559,57155,59561,57153,57164,59560,57014,61677,56990,57253,56965,62162,56991,64051,64053,64248,64246,64247,64249,64250,64251,64252,64253,64254,64255,64256,64257,64261,64258,64260,64259,64262,64266,64267,64276,64277,64268,64295,64294,64271,64297,64274,64280,64279,64273,64288,64281,64278,64291,64300,64284,64298,64283,64285,64275,64318,64282,64289,64286,64296,64287,64299,64270,64302,64303,64305,64304,64312,64309,64307,64311,64308,64310,64317,64315,64316,64314,64313,65245 }
);

trade:AddData(build, trade.SKILL_ENGINEERING,
	{ 4036,4037,4038,12656,20222,20219,30350,51306 },
	{ 4036,4037,4038,3918,3919,3920,3922,3923,3924,3925,3977,3973,3926,3928,3929,3930,3931,3932,3933,3934,3936,3937,3938,3978,3939,3940,3941,3942,3944,3945,3946,3947,3949,3950,3952,3953,3954,3955,3956,3957,3958,3959,3960,3961,3962,3963,3979,3965,3966,3967,3968,3969,3971,3972,6458,7430,8243,8334,8339,8895,9269,9271,9273,12584,12585,12586,12587,12590,12589,12591,12594,12595,12596,12597,12599,12603,12607,12614,12615,12616,12617,12618,12619,12620,12621,12622,12624,12656,12715,12716,12717,12718,12760,12720,12722,12755,12754,12759,12758,12895,12897,12899,12900,12902,12903,12904,12905,12906,12907,12908,13240,15255,15633,15628,19567,19788,19790,19792,19791,19793,19794,19796,19814,19795,19815,19799,19800,19819,19831,19830,19825,19833,20222,20219,21940,22704,22793,22795,22797,4073,12749,19804,23066,23068,23067,23069,23070,23071,23077,23078,23079,23080,23081,23082,23096,23129,13166,13258,23489,23486,23507,24356,24357,26011,26416,26417,26418,26420,26421,26422,26423,26424,26425,26426,26427,26428,26442,26443,28327,30350,30310,30311,30312,30313,30314,30315,30316,30317,30318,30325,30329,30332,30334,30337,30341,30342,30343,30344,30346,30347,30348,30349,30303,30304,30305,30306,30307,30308,30309,30547,30548,30549,30551,30552,30556,30558,30560,30561,30563,30565,30566,30568,30569,30570,30573,30574,30575,32814,36954,36955,39895,39971,39973,40274,41307,41311,41312,41314,41315,41316,41317,41318,41319,41320,41321,43676,44155,44157,44391,46111,46115,46109,46107,46112,46114,46108,46110,46116,46113,46106,46697,49383,51306,53281,54353,55252,56273,56349,54736,54998,54999,55002,54793,55016,56460,56459,56461,56464,56463,56465,56471,56466,56467,56468,56470,56472,56514,56473,56474,56475,56462,56476,56477,56469,56478,56479,56480,56481,56574,56483,56484,56486,56487,60867,60866,60874,61471,61481,61482,61483,62271,63750,63765,63770 }
);

trade:AddData(build, trade.SKILL_MINING,
	{ 2656 },
	{ 2580,2575,2576,2656,2658,2659,3308,3307,3304,3564,3569,2657,8388,10098,10097,10248,14891,16153,29354,29356,29358,29359,29360,29361,29686,32606,35750,35751,46353,49252,49258,50310,55208,55211,22967,53120,53121,53122,53123,53124,53040 }
);

trade:AddData(build, trade.SKILL_BLACKSMITHING,
	{ 2018,3100,3538,9785,9788,9787,17039,17040,17041,29844,51300 },
	{ 2018,2660,2663,3100,3115,3117,3116,3292,3293,3294,3295,3296,3297,3319,3320,3321,3323,3324,3325,3326,3328,3330,3331,3333,3334,3336,3337,3491,3492,3493,3494,3495,3496,3497,3498,3500,3501,3502,3503,3504,3505,3506,3507,3508,3511,3513,3515,3538,6518,6517,2671,2673,7224,7223,7221,7222,7408,7817,7818,8366,8367,8368,8768,8880,9785,9788,9787,9811,9813,9814,9818,9820,9916,9918,9921,9920,9926,9928,9931,9933,9935,9937,9939,9942,9945,9950,9952,9954,9957,9959,9961,9964,9966,9968,9970,9972,9974,9979,9980,9983,9985,9986,9987,9993,9995,9997,10001,10003,10005,10007,10009,10011,10013,10015,11643,12260,12259,11454,14379,14380,15296,15293,15292,15294,15295,15972,15973,16641,16640,16639,16642,16643,16644,16645,16646,16647,16648,16649,16650,16651,16652,16653,16654,16667,16656,16660,16655,16657,16658,16659,16662,16663,16664,16665,16724,16725,16726,16730,16728,16729,16731,16732,16741,16742,16744,16745,16746,16960,16965,16967,16969,16970,16971,16973,16978,16980,16983,16984,16985,16986,16987,16988,16990,16991,16992,16993,16994,16995,17039,17040,17041,16661,19666,19667,19668,19669,20201,20874,20872,20876,20873,20897,20890,21161,21913,22757,23628,23629,23632,23633,23636,23637,23638,23639,23650,23652,23653,24136,24138,24137,24139,24140,24141,24399,24914,24912,24913,27585,27588,27586,27589,27590,27587,27830,27829,27832,28244,28242,28243,28461,28462,28463,29545,29547,29548,29549,29550,29551,29552,29553,29556,29557,29558,29565,29566,29568,29569,29571,29603,29605,29606,29608,29611,29610,29613,29614,29615,29616,29617,29619,29620,29621,29628,29629,29630,29642,29643,29645,29648,29649,29654,29656,29657,29658,29622,29662,29663,29664,29668,29669,29671,29672,29692,29693,29694,29695,29696,29697,29698,29699,29700,29728,29729,29844,32284,32285,32655,32656,32657,34533,34545,34538,34529,34535,34541,34547,34543,34542,34534,34548,34546,34540,34544,34537,34530,34607,34608,34979,34981,34982,34983,36122,36125,36128,36126,36124,36137,36129,36136,36135,36133,36134,36130,36131,36256,36257,36258,36259,36260,36261,36262,36263,36389,36390,36391,36392,38473,38475,38476,38477,38478,38479,40034,40036,40035,40033,41132,41133,41135,41134,42662,42688,43549,43846,46141,46144,46142,46140,51300,52568,52569,52570,52567,52571,52572,54550,54551,54552,54553,54554,54555,54556,54557,54917,54918,54941,54944,54945,54946,54947,54948,54949,54978,54979,54980,54981,55013,55017,55014,55015,55055,55056,55057,55058,55174,55177,55179,55181,55182,55183,55184,55185,55186,55187,55200,55201,55203,55204,55202,55206,55298,55300,55301,55302,55303,55304,55305,55306,55307,55308,55309,55311,55310,55312,55371,55372,55373,55374,55375,55376,55369,55370,55377,55628,55641,55656,55732,55834,55835,55839,56234,56280,56357,56400,56549,56550,56551,56552,56553,56554,56555,56556,59405,59406,59436,59438,59440,59441,59442,61008,61009,61010,62202,63182,63190,63191,63189,63187,63188,63192,2737,2738,2662,2739,2661,2664,2665,2740,2666,2741,2667,2668,2742,2670,2672,2674,2675 }
);

trade:AddData(build, trade.SKILL_ALCHEMY,
	{ 2259,3101,3464,11611,28596,28677,28675,28672,51304 },
	{ 2259,2330,2329,3101,3171,3172,3173,3174,3176,3177,2333,3188,3170,3230,3447,3448,3449,3450,3451,3452,3453,3454,3464,4508,4942,6624,6618,6617,7179,7181,7183,7257,7258,7255,7259,7256,7836,7837,7841,7845,8240,11449,11450,11451,11448,11452,11453,11456,11457,11458,11459,11460,11461,11464,11465,11466,11467,11468,11472,11473,11476,11477,11478,11479,11480,11611,12609,15833,17187,17551,17552,17553,17554,17555,17556,17557,17559,17561,17566,17560,17563,17562,17564,17565,17570,17571,17572,17573,17574,17575,17576,17577,17578,17579,17580,17632,17634,17635,17636,17637,17638,3175,21923,22732,22808,24266,24365,24366,24367,24368,25146,26277,28596,28543,28544,28545,28546,28549,28550,28552,28551,28553,28554,28555,28556,28557,28558,28562,28563,28564,28565,28566,28567,28568,28569,28570,28575,28571,28572,28577,28573,28576,28578,28579,28585,28583,28584,28582,28580,28581,28586,28590,28587,28588,28589,28591,28677,28675,28672,29688,32765,32766,33732,33738,33740,33733,33741,38070,38960,38962,38961,39636,39637,39638,39639,41458,41500,41501,41502,41503,42736,45061,47050,47046,47049,47048,51304,53812,53836,53837,53838,53840,53842,53847,53895,53898,53900,53905,53904,53903,53902,53901,53899,53848,53841,53839,53777,53776,53781,53782,53775,53774,53773,53771,53779,53780,53783,53784,53942,53936,53937,53938,53939,54020,54213,54218,54220,54221,54222,53042,56519,57425,57427,58868,58871,60403,60396,60405,60354,60355,60356,60357,60365,60366,60367,60350,60893,62213,62409,62410,63732,2331,2332,2334,2335,2336,2337 }
);
