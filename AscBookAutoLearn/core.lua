-- Author      : nihilianth
-- Create Date : 5/02/2021 9:11:03 AM


local trainerStr = "Book of Ascension"

local function OnEvent(s,event)

  local name = ClassTrainerNameText:GetText()
  if event == "TRAINER_UPDATE" or event == "TRAINER_SHOW" then
    if name ~= nil and not name:find(trainerStr) then return end
    local idx = GetTrainerSelectionIndex()
    local serviceName, serviceSubText, serviceType, isExpanded = GetTrainerServiceInfo(idx);

    if serviceType == "available" then
      BuyTrainerService(0)
    elseif serviceType == "unavailable" and event == "TRAINER_UPDATE" then
      CloseTrainer()
    end
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("TRAINER_UPDATE")
f:RegisterEvent("TRAINER_SHOW")
f:SetScript("OnEvent", OnEvent)
