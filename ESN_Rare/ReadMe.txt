=========================
README FILE FOR ESN_Rare
=========================

About ESN_Rare:
=========================
ESN_Rare scans the combat log, nameplates, your target, the creature cache and your mouseover target for rare mobs. When it finds a rare mob in your vicinity it will alert you with a message or sound notification and create a Macro (Out of Combat) to target the Rare Mob.
The macro will be called "RARE" and can be found in the General Macros tab. It will target the last found rare Mob and will make it easier to find it in a huge group of mobs.
It supports HandyNotes for Mapnotes and should work well on German and English Clients.


Configuring ESN_Rare:
=========================
The addon settings can be changed in the Interface options and you can open them with the chat command /rare.
To see a list of all rare mobs in the cache use: /rare cache


The Cache:
=========================
ESN_Rare checks your creature cache for rare mobs. There is one catch to this technique however: Once a mob is “found”,ESN_Rare won't be able to find it again until your cache is cleared. If you find a rare mob's corpse you would have to clear your cache before ESN_Rare would find it again.

CLEARING THE CACHE
To clear your cache, follow these steps:
   1. Exit World of Warcraft.
   2. Delete the “Cache” sub-directory inside your World of Warcraft folder.
      Example: “C:\Program Files\World of Warcraft\Cache”

WoW will recreate your Cache folder after you log in again.

LIMITATIONS
The only problem for ESN_Rare are tamable beasts. Even when you run across the tamed version, ESN_Rare gets tricked and displays a found alert. In order to prevent those false positives you can disable the "scan for tameables" if you want.


Credits:
=========================
This addon was inspired by SilverDragon from Kemayo and NPCScan from Saiket. Some parts of the code were borrowed from SilverDragon.
Author: EnSabahNur
Web: http://www.EnSabahNur.de
Addon Page: http://www.wowinterface.com/downloads/info12758-ESN_Rare.html

Thanks to Bl4ckSh33p (http://www.Bl4ckSh33p.de) for his help.


Changelog:
=========================
0.9.1 Changes
- added UnitPlayerControlled()
- updated enUS Locale

0.9 Changes
- added Cache Scan (Thanks to NPCScan from Saiket)
- added new chatkommand: /rare cache - displays all rare mobs in cache
- updated and optimized Localization and Rare Mob tables (German and English for now)
- added scanning of party targets - if a party member targets are rare mob you get a notification
- overhauled the options screen
- added Minimap Tooltip scans (for tracking, may be CPU intensive)
- added option to enable/disable scanning methods (most of them require a Reload UI right now)
- added options to HandyNotes Plugin Config to configure the min distance between icons
- added flashing screen warning to Output options

0.8 Changes
- add HandyNotes support for Mapnotes

0.7 Changes
- add LibSink for notification message

0.6 Changes
- fix Toc
- add russian localization

0.5 Changes
- add LibSharedMedia support
- rearranged Options

0.4 Changes
- Nameplate scanning
- Options cleaned up
- improved code for combat log

0.3 Changes
- option to create a Macro to Target the Rare Mob

0.2 Changes
- warnings are disabled in combat when fighting a rare mob now
- added english translation
- added icon to chat and screen alert
- added option to prevent warnings from dead mobs
- removed mob type and added source info (combat log, mouseover, target)
- improved detection code for combat log
- updated Libs