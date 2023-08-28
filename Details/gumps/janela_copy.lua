do

	local _detalhes = _G._detalhes
	local DetailsFrameWork = _detalhes.gump
	local _
--> panel

	function _detalhes:CreateCopyPasteWindow()

		local panel = CreateFrame ("Frame", "DetailsCopy", UIParent, "PortraitFrameTemplate")
		panel:SetSize (512, 148)
		tinsert (UISpecialFrames, "DetailsCopy")
		panel:SetFrameStrata ("TOOLTIP")
		panel:SetPoint ("CENTER", UIParent, "CENTER")
		panel.locked = false
		panel:SetToplevel (true)
		panel:SetMovable (true)
		panel:SetScript ("OnMouseDown", function(self, button)
			if (self.isMoving) then
				return
			end
			if (button == "RightButton") then
				self:Hide()
			else
				self:StartMoving()
				self.isMoving = true
			end
		end)
		panel:SetScript ("OnMouseUp", function(self, button)
			if (self.isMoving and button == "LeftButton") then
				self:StopMovingOrSizing()
				self.isMoving = nil
			end
		end)

		DetailsFrameWork:NewImage (panel, "Interface\\AddOns\\Details\\images\\copy", 512, 128, "overlay", nil, "background", "$parentBackGround")
		panel.background:SetPoint (0, -25)

		--> title
		panel.TitleText:SetText ("Paste & Copy")
		panel.portrait:SetTexture ([[Interface\CHARACTERFRAME\TEMPORARYPORTRAIT-FEMALE-BLOODELF]])

		DetailsFrameWork:NewTextEntry (panel, _, "$parentTextEntry", "text", 476, 14)
		panel.text:SetPoint (20, -127)
		panel.text:SetHook ("OnEditFocusLost", function() panel:Hide() end)
		panel.text:SetHook ("OnChar", function() panel:Hide() end)

		DetailsFrameWork:NewLabel (panel, _, _, "desc", "paste on your web browser address bar", "GameFontHighlight", 12)
		panel.desc:SetPoint (340, -78)
		panel.desc.width = 150
		panel.desc.height = 25
		panel.desc.align = "|"
		panel.desc.color = "gray"

		panel:Hide()
	end

	function _detalhes:CreateImportWindow()
		local panel = CreateFrame ("Frame", "DetailsImport", UIParent, "PortraitFrameTemplate")
		panel:SetSize (512, 148)
		tinsert (UISpecialFrames, "DetailsImport")
		panel:SetFrameStrata ("TOOLTIP")
		panel:SetPoint ("CENTER", UIParent, "CENTER")
		panel.locked = false
		panel:SetToplevel (true)
		panel:SetMovable (true)
		panel:SetScript ("OnMouseDown", function(self, button)
			if (self.isMoving) then
				return
			end
			if (button == "RightButton") then
				self:Hide()
			else
				self:StartMoving()
				self.isMoving = true
			end
		end)
		panel:SetScript ("OnMouseUp", function(self, button)
			if (self.isMoving and button == "LeftButton") then
				self:StopMovingOrSizing()
				self.isMoving = nil
			end
		end)

		--> title
		panel.TitleText:SetText ("Import")
		panel.portrait:SetTexture ([[Interface\CHARACTERFRAME\TEMPORARYPORTRAIT-FEMALE-BLOODELF]])

		panel.text = CreateFrame("EditBox", "$parentTextEntry", panel)
		panel.text:SetBackdrop({bgFile = [["Interface\DialogFrame\UI-DialogBox-Background"]], tileSize = 64, tile = true, edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], edgeSize = 10, insets = {left = 1, right = 1, top = 0, bottom = 0}})
		panel.text:SetFontObject("GameFontHighlightSmall")
		panel.text:SetBackdropColor(0, 0, 0, 0.9)
		panel.text:SetSize(476, 14)
		panel.text:SetPoint("TOPLEFT", 20, -127)
		panel.text:SetScript("OnEnterPressed", function(self)
			local importText = self:GetText()
			local import = C_Serialize:DeserializeDecompressFromPrint(importText)
			if import then
				pcall(_detalhes.SaveConfig)
				_detalhes.SaveConfig = nop
				_detalhes_database.tabela_historico, _detalhes_database.tabela_overall, _detalhes_database.tabela_pets, _detalhes_database.savedbuffs = unpack(import)
				ReloadUI()
			end
			self:SetText("")
			panel:Hide()
		end)

		DetailsFrameWork:NewLabel (panel, _, _, "desc", "Paste import string and press enter.", "GameFontHighlight", 12)
		panel.desc:SetPoint (340, -78)
		panel.desc.width = 150
		panel.desc.height = 25
		panel.desc.align = "|"
		panel.desc.color = "white"

		panel:Hide()
	end

	function _detalhes:CreateExportWindow()

		local panel = CreateFrame ("Frame", "DetailsExport", UIParent, "PortraitFrameTemplate")
		panel:SetSize (512, 148)
		tinsert (UISpecialFrames, "DetailsExport")
		panel:SetFrameStrata ("TOOLTIP")
		panel:SetPoint ("CENTER", UIParent, "CENTER")
		panel.locked = false
		panel:SetToplevel (true)
		panel:SetMovable (true)
		panel:SetScript ("OnMouseDown", function(self, button)
			if (self.isMoving) then
				return
			end
			if (button == "RightButton") then
				self:Hide()
			else
				self:StartMoving()
				self.isMoving = true
			end
		end)
		panel:SetScript ("OnMouseUp", function(self, button)
			if (self.isMoving and button == "LeftButton") then
				self:StopMovingOrSizing()
				self.isMoving = nil
			end
		end)
	
		--> title
		panel.TitleText:SetText ("Export")
		panel.portrait:SetTexture ([[Interface\CHARACTERFRAME\TEMPORARYPORTRAIT-FEMALE-BLOODELF]])

		panel.text = CreateFrame("EditBox", "$parentTextEntry", panel)
		panel.text:SetBackdrop({bgFile = [["Interface\DialogFrame\UI-DialogBox-Background"]], tileSize = 64, tile = true, edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], edgeSize = 10, insets = {left = 1, right = 1, top = 0, bottom = 0}})
		panel.text:SetFontObject("GameFontHighlightSmall")
		panel.text:SetBackdropColor(0, 0, 0, 0.9)
		panel.text:SetSize(476, 14)
		panel.text:SetPoint("TOPLEFT", 20, -127)

		DetailsFrameWork:NewLabel (panel, _, _, "desc", "Copy string below to share current segments.", "GameFontHighlight", 12)
		panel.desc:SetPoint (340, -78)
		panel.desc.width = 150
		panel.desc.height = 25
		panel.desc.align = "|"
		panel.desc.color = "white"

		panel:Hide()
	end

	function _detalhes:CopyPaste (link)
		_G.DetailsCopy.text.text = link
		_G.DetailsCopy.text:HighlightText()
		_G.DetailsCopy:Show()
		_G.DetailsCopy.text:SetFocus()

	end
end
