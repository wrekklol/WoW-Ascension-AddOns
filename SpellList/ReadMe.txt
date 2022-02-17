SpellList
by SDPhantom
http://www.phantomweb.org
===================================================================================================

For questions and bug reports go to the "Contact Me" section of my website and fill out the form.
Use at your own risk, but if anything serious should happen, blame Blizzard's crappy script engine.

Instructions: UnZip the contents into World of Warcraft's "Interface\AddOns" folder.

SpellList can be accessed by typing /SpellList or /SL
For a list of commands, type "/SL help"



-===- Scanner -===-
SpellList is coded with a live scanner and filtering algorithm that uses FPS limit code to throttle
itself to an acceptable rate. This rate can be adjusted, but changes don't carry over between sessions.



-===- Display -===-
Spells shown in the list can be selected to keep its description in the details pane.
This allows you to mouseover another spell and compare descriptions for both spells.



-===- Filtering -===-
Filtering can be done either by command line, using the filter text box that appears after clicking
the "Filter" button on the SpellList Window, or dropping a spell or item into the auto filter box in
the top right corner of the SpellList window.

Filter Inputs:
Auto Filter Box - Any item or spell can be dropped into this area to start.
	Note only items with a use effect have a spell attached to it.
	If an item given doesn't have a spell attached, the filter will be set to the item's name.
Filter Text Box - Spell ID or Name may be given. To look for a specific rank of a spell, you must
	supply the name in the format, "Spell Name(Rank #)". This is the same format accepted by
	the /cast command. If an empty rank "()" is provided, the filter will search for spells
	matching the name given, if any, with no rank.
Command Line - The command line system is able to set the filter using the same rules as the
	Filter Text Box by using "/SL filter". This method also allows the use of spell and item links,
	using the same rules for the respective spell or item as the Auto Filter Box.
	Using the command line input for the filter will automaticly show the SpellList window.
	Note linking an item that you do not have may not detect the spell on it.
	This is a limitation on the game client and not anything I have any control over.

If the filter is supplied with an empty string or the Auto Filter Box is clicked without the cursor
holding something, the filter will reset and display all spells found in the database.
Alternatively, you may type "/SL reset" to clear the filter.

===================================================================================================
Versions:
--= Public Release =--
	v1.4 (2011-12-01)
		Fixed FPS-limit throttle code, "scannew" no longer freezes the game

	v1.3 (2011-08-11)
		Cleaned up the code a little
		Throttle settings are now saved across sessions as well as detection of new spells
		"scannew" and "scanstop" commands have been added to the slash command system
		"scannew" makes the scanner start scanning for spells past the current maximum
		"scanstop" halts scanning for new spells, this is the only way to stop "scannew"

	v1.2 (2011-06-30)
		Build checking is added and a warning message is displayed when a new version is to be expected

	v1.1 (2011-05-01)
		Build version is now included as the last number of the version string
		Version is now displayed along with the addon name in the title bar of the SpellList frame

	v1.0 (2009-10-14)
		Initial Version
