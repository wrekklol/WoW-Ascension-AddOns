﻿-- ------------------------------------------- --
--   Deadly Boss Mods - Chinese localization   --
--    by Diablohu<白银之手> @ 二区-轻风之语    --
--              www.dreamgen.cn                --
--                 12/7/2007                   --
-- ------------------------------------------- --

if (GetLocale() == "zhCN") then

-- Maulgar
	DBM_MAULGAR_NAME			= "莫加尔大王";
	DBM_MAULGAR_DESCRIPTION		= "警报治疗、圆弧斩、旋风斩和地狱犬";
	DBM_MAULGAR_OPTION_1		= "警报强效真言术：盾";
	DBM_MAULGAR_OPTION_2		= "警报法术护盾";
	DBM_MAULGAR_OPTION_3		= "警报治疗祷言";
	DBM_MAULGAR_OPTION_4		= "警报治疗术";
	DBM_MAULGAR_OPTION_5		= "警报旋风斩";
	DBM_MAULGAR_OPTION_6		= "警报圆弧斩";
	DBM_MAULGAR_OPTION_7		= "警报地狱犬";

	DBM_MAULGAR_WARN_GPWS		= "*** 盲眼先知 +强效真言术：盾+ ***";
	DBM_MAULGAR_WARN_SHIELD		= "*** 克洛什 +法术护盾+ ***";
	DBM_MAULGAR_WARN_SMASH		= "圆弧斩 -> >%s<: %s";
	DBM_MAULGAR_WARN_POH		= "*** 治疗祷言正在施放 ***";
	DBM_MAULGAR_WARN_HEAL		= "*** 治疗术正在施放 ***";

	DBM_MAULGAR_WARN_WHIRLWIND	= "*** 旋风斩 ***";
	DBM_MAULGAR_WARN_WW_SOON	= "*** 旋风斩 - 即将施放 ***";
	DBM_MAULGAR_WARN_FELHUNTER	= "*** 地狱犬 ***";

	DBM_MAULGAR_GPWS			= "盲眼先知获得了强效真言术：盾的效果。";
	DBM_MAULGAR_SPELLSHIELD		= "克洛什·火拳获得了法术护盾的效果。";

	DBM_MAULGAR_POH				= "盲眼先知开始施放治疗祷言。";
	DBM_MAULGAR_HEAL			= "盲眼先知开始施放治疗术。";
	DBM_MAULGAR_FELHUNTER		= "召唤者沃尔姆施放了召唤地狱犬。";
	DBM_MAULGAR_SHIELD_STOLEN	= "([^%s]+)获得了法术护盾的效果。";
	DBM_MAULGAR_SHIELD_STOLEN2	= "你获得了法术护盾的效果。";

	DBM_MAULGAR_WHIRLWIND		= "莫加尔大王获得了旋风斩的效果。";
	DBM_MAULGAR_ARCING_SMASH	= "莫加尔大王的圆弧斩";
	DBM_MAULGAR_SMASH_HIT		= "莫加尔大王的圆弧斩击中([^%s]+)造成(%d+)点伤害。(.*)";
	DBM_MAULGAR_SMASH_MISS		= "莫加尔大王的圆弧斩没有击中([^%s]+)。";
	DBM_MAULGAR_SMASH_YOU_HIT	= "莫加尔大王的圆弧斩击中你造成(%d+)点伤害。(.*)";
	DBM_MAULGAR_SMASH_YOU_MISS	= "莫加尔大王的圆弧斩没有击中你。";
	DBM_MAULGAR_SMASH_YOU_DODGE	= "莫加尔大王的圆弧斩被躲闪过去。";
	DBM_MAULGAR_SMASH_YOU_PARRY	= "莫加尔大王的圆弧斩被招架了。";

	DBM_MAULGAR_DODGED	= "闪躲";
	DBM_MAULGAR_PARRIED	= "招架";
	DBM_MAULGAR_MISSED	= "未击中";
	
	DBM_SBT["Next Whirlwind"]		= "下一次旋风斩";
	DBM_SBT["Whirlwind"]			= "旋风斩";
	DBM_SBT["Prayer of Healing"]	= "治疗祷言";
	DBM_SBT["Heal"]					= "治疗术";
	DBM_SBT["Felhunter"]			= "地狱犬";
	DBM_SBT["Arcing Smash"]			= "圆弧斩";
	
	DBM_SBT["Maulgar"] = {
		  [1] = {"Spell Shield: (.*)", "法术护盾: %1"},
	}
	DBM_SBT["莫加尔大王"] = DBM_SBT["Maulgar"]


-- Gruul
	DBM_GRUUL_NAME				= "屠龙者格鲁尔";
	DBM_GRUUL_DESCRIPTION		= "警报碎裂、成长、沉默和洞穴震颤";

	DBM_GRUUL_RANGE_OPTION		= "显示距离框体";
	DBM_GRUUL_GROW_OPTION		= "警报成长";
	DBM_GRUUL_SHATTER_OPTION	= "警报碎裂";
	DBM_GRUUL_SILENCE_OPT		= "警报沉默";
	DBM_GRUUL_CAVE_OPTION		= "当洞穴震颤发动时显示特殊警报";
	DBM_GRUUL_OPTION_GROWBAR	= "成长"

	DBM_GRUUL_SAY_PULL			= "来了……就得死。"
	DBM_GRUUL_GROW_EMOTE		= "%s的体形变大了！";
	DBM_GRUUL_EMOTE_SHATTER		= "%s咆哮着。";
	DBM_GRUUL_CAVE_IN_YOU		= "你受到了洞穴震颤效果的影响。";
	DBM_GRUUL_SHATTER_CAST		= "屠龙者格鲁尔开始施放碎裂。";
	DBM_GRUUL_SLAM_CAST			= "屠龙者格鲁尔开始施放大地冲击。";
	DBM_GRUUL_SILENCE			= "回响";

	DBM_GRUUL_GROW_ANNOUNCE		= "*** 成长 #%s ***";
	DBM_GRUUL_SHATTER_WARN		= "*** 碎裂 ***";
	DBM_GRUUL_SHATTER_20WARN	= "*** 大地冲击 - 10秒后施放 ***";
	DBM_GRUUL_SHATTER_10WARN	= "*** 大地冲击 - 10秒后碎裂 ***";
	DBM_GRUUL_SHATTER_SOON		= "*** 碎裂 - 即将施放 ***";
	DBM_GRUUL_SILENCE_WARN		= "*** 沉默 ***";
	DBM_GRUUL_SILENCE_SOON_WARN	= "*** 沉默 - 即将施放 ***";
	DBM_GRUUL_CAVE_IN_WARN		= "洞穴震颤";
	
	DBM_SBT["Silence"]		= "沉默";
	DBM_SBT["Ground Slam"]	= "大地冲击";
	DBM_SBT["Shatter"]		= "碎裂";
	DBM_SBT["Grow #1"]		= "成长 #1";
	
	DBM_SBT["Gruul"] = {
		  [1] = {"Grow #", "成长 #"},
	}
	DBM_SBT["屠龙者格鲁尔"] = DBM_SBT["Gruul"]
end
