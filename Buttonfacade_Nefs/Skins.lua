local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Nefs
LBF:AddSkin("Nefs", {

	-- Skin data start.
	Backdrop = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Background]],
		
	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.09,0.90,0.09,0.90}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Flash]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Normal]],
	},
	Pushed = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Checked]],
		BlendMode = "ADD",
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Checked]],
		BlendMode = "ADD",
	},
	Gloss = {
		Height = 32,
		Width = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade_Nefs\Textures\Highlight]],
		BlendMode = "ADD",
	},
	HotKey = {
		Width = 36,
		Height = 10,
		OffsetX = -1,
		OffsetY = 18,
	},
	Count = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = -11,
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = -11,
	},
	-- Skin data end.

}, true)
