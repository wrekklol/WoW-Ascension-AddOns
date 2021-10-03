local L = AceLibrary("AceLocale-2.2"):new("XLootMaster")

L:RegisterTranslations("frFR", function()
	return {
		["Self loot"] = "Ramasser soi-m\195\170me",
		["Priority Looters"] = "Ramasseurs prioritaires",
		["No priority players"] = "Pas de joueurs prioritaires",
		["Possible victims"] = "Victimes possibles",
		["Move up"] = "D\195\169placer vers le haut",
		["Move Down"] = "D\195\169placer vers le bas",
		["Remove"] = "Retirer",
		["Random"] = "Al\195\169atoirement",
		["Give to random player"] = "Donner \195\160 un joueur al\195\169atoirement",
		["Clear list and announce new roll"] = "Vider la liste et annoncer un nouveau tirage",
		[">> Priority configuration"] = "Configuration de priorit\195\169",
		
		["Never"] = "Jamais",
		["XLoot Master"] = "XLoot Master",
		["XLoot Master plugin, replacement for the standard Master Looter dropdown."] = "Plugin XLoot Master, un substitut pour le menu standard de Ma\195\174tre de butin",
		["Item tooltip"] = "Bulle d'objet",
		["Show a tooltip for the ML item when mousing over it."] = "Affiche une bulle pour l'objet en MdB lors du passage de la souris",
		["Player tooltip"] = "Bulle de joueur",
		["Show a tooltip for each player when mousing over them."] = "Affiche une bulle pour chaque joueur lors du passage de la souris",
		["Value utilities"] = "Utilitaires de valeur",
		["Various tools such as tracking dkp assignments, broadcasting value along with assignment, and such. |cffff0000Doesn't do much yet.|r"] = "Outils divers tel que le suivie des paris DKP, diffusion de la valeur avec les paris, et autre. |cffff0000Ne fait pas grand chose d'autre pour le moment.|r",
		["Awarded item text"] = "Texte de r\195\169ception de l'objet",
		["Default: |cffff0000[name] awarded [item][method]|r\n[name] is replaced with the name of the player, \n[item] with the item link, \n[method] with any special note (dkp, random), if it exists, eg: ' (Random)'."] = "Par d\195\169faut : |cffff0000[name] re\195\167oit  [item][method]|r\n[name] est remplac\195\169 par le nom du joueur, \n[item] avec le lien de l'objet, \n[method] toute notes sp\195\169ciales (dkp, al\195\169atoire), si elle existe, ie: ' (Al\195\169atoire)'.",
		["A string containing any of [range], [item], or [time]"] = "Une cha\195\174ne contenant tout ou partie de [range], [item] ou [time]",
		["Thresholds"] = "Seuils",
		["Confirmation threshold"] = "Confirmation du seuil",
		["The lowest quality of item to open the assignment confirmation window for."] = "Raret\195\169 minimum d'un objet ouvrant la fen\195\170tre de confirmation d'assignation",
		["Item value threshold"] = "Seuil de valeur d'un objet",
		["The lowest quality of item to open the assignment |cFF22EE22and value|r confirmation window for."] = "Raret\195\169 minimum d'un objet ouvrant la fen\195\170tre de confirmation d'assignation |cFF22EE22et de valeur|r",
		["Announce to group..."] = "Annoncer au groupe...",
		["Announce to /rw..."] = "Annoncer dans /rw...",
		["Announce to guild..."] = "Annoncer \195\160 la guilde...",
		["Randomization"] = "Tirage",
		["Random menu"] = "Menu des tirages",
		["Show the Random menu for loot distribution."] = "Affiche le menu des tirages pour la distribution des loot",
		["Capture /rolls"] = "Capturer les /rolls",
		["Capture party member /roll #'s"] = "Capture les /rolls #'s des membres du groupe",
		["Show all rolls"] = "Affiche tous les tirages",
		["If enabled, show all rolls during a request, even ones not matching set range."] = "Si activ\195\169, affiche tous les tirages durant une requ\195\170te, m\195\170me ceux hors norme",
		["Roll timeout"] = "Dur\195\169e du tirage",
		["Length of time to capture rolls"] = "Dur\195\169e de la capture des tirages",
		["Roll range"] = "Borne sup\195\169rieure du tirage",
		["Range to request players to roll in"] = "Borne sup\195\169rieure que les joueurs ne doivent pas d\195\169passer",
		["Roll request text"] = "Texte de demande d'un tirage",
		["Default: |cffff0000Attention! Please /roll [range] for [item]. Ends in [time] seconds.|r\n[range] is replaced with the range you pick, \n[item] with the item link, \n[time] with seconds in countdown."] = "Par d\195\169faut : |cffff0000Attention ! Faite un /rand [range] pour [item]. Se termine dans [time] secondes.|r\n[range] est remplac\195\169 par la borne sup\195\169rieure que vous avez choisie, \n[item] par le lien de l'objet, \n[time] par les secondes en compt \195\160 rebours.",
		
		[" Please enter the value of the item."] = " SVP, saisissez la valeur de cet objet.",
		["Value: "] = "Valeur : ",
	}
end)

