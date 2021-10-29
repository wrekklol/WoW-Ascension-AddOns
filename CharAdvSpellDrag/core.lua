-- Author      : nihilianth
-- Create Date : 4/30/2021 11:20:02 AM

local function GetTalentSpellName(spellId)
  local name, _, _ = GetSpellInfo(spellId)
  if name ~= nil then return name end
  return ""
end

local function CharacterAdvancementMod_HandleDrag(spellName, isClick)
  if isClick and ACTIVE_CHAT_EDIT_BOX ~= nil then return end
  
  if isClick == false or IsModifiedClick("PickupAction") then
    DropDownList1:Hide()
    PickupSpell(spellName)
  end
end

local init = false

-- TODO: Feral is maxed at 30. Verify this when Ascension implements scrolling (wotlk?)
local MAX_CADV_SPELL = 3 * 10 
local MAX_CADV_TALENT = 4 * 11

local function OnEvent(s,e,prefix,msg,form,player)
  -- Ensure that Character Advancement is initialized
  if prefix and not prefix:find("SAIO") then return end
  if msg:find("UpdatePlayerState") == nil then return end

  if init == true then return --print("already initialized") return 
  else init = true end

  local btnNameFmt = "CA2.CharacterAdvancementMain.Main.Tree%u.Content.%s.Button%u" 
  
  for tab_id = 1,3 do
    for grid_id = 1, MAX_CADV_TALENT do

      if grid_id <= MAX_CADV_SPELL then
        local btn = _G[format(btnNameFmt, tab_id, "Spells", grid_id)]
        assert(btn ~= nil)

        btn:RegisterForDrag("LeftButton")
        btn:HookScript("OnClick", function(self) CharacterAdvancementMod_HandleDrag(self.SpellName:GetText(), true) end)
        btn:HookScript("OnDragStart", function(self) CharacterAdvancementMod_HandleDrag(self.SpellName:GetText(), false) end)
      end

      local btn = _G[format(btnNameFmt, tab_id, "Talents", grid_id)]
      assert(btn ~= nil)

      btn:RegisterForDrag("LeftButton")
      btn:HookScript("OnClick", function(self) CharacterAdvancementMod_HandleDrag(GetTalentSpellName(self.Spell), true) end)
      btn:HookScript("OnDragStart", function(self) CharacterAdvancementMod_HandleDrag(GetTalentSpellName(self.Spell), false) end)
    end
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript("OnEvent", OnEvent)
