local BigHeals = 
	{
		"Corruption", 
		"Heal",
		"Rejuvenation"
	}
	
function SpellMacroCreator:CreateBigHealMacro()
	local MacroBody = "#showtooltip\n/cast "
	for i, s in ipairs(BigHeals) do
		if IsUsableSpell(s) then
			print(MacroBody .. s)
			break
		end
	end

	
	--local MacroIndex = GetMacroIndexByName("Big Heal")
	--if MacroIndex == 0 then
	--	MacroIndex = 0
	--end
end