DTD_Announcements = DTD:NewModule("Announcements")

local Crayon = LibStub("LibCrayon-3.0")

function DTD_Announcements:Announce(message)
	if DTD_Database.profile.announceQuestCompletion == true then
		-- Reset to the default setting if the preferred method is not loaded
		if DTD_Database.profile.announceMethod == 2 and not IsAddOnLoaded("MikScrollingBattleText") then
			DTD_Database.profile.announceMethod = 1
		elseif DTD_Database.profile.announceMethod == 2 then
			if MikSBT.IsModDisabled() then
				DTD_Database.profile.announceMethod = 1
			end
		end
	
		-- Announce the message
		if DTD_Database.profile.announceMethod == 1 then
			UIErrorsFrame:AddMessage(message, 1.0, 1.0, 1.0, 5.0)
		elseif DTD_Database.profile.announceMethod == 2 then
			MikSBT.DisplayMessage(message,MikSBT.DISPLAYTYPE_NOTIFICATION,true)
		elseif DTD_Database.profile.announceMethod == 3 then
			Parrot:ShowMessage(message, "Notification", false, 1, 1, 1)
		elseif DTD_Database.profile.announceMethod == 4 then
			SCT:DisplayMessage(message,{r = 255, b = 255,g = 255})
		end
	
	end
end