PortalHelpers = LibStub("AceAddon-3.0"):NewAddon("PortalHelpers", "AceConsole-3.0", "AceEvent-3.0" );
PortalHelpers:SetDefaultModuleLibraries("AceEvent-3.0")

SpellMacroCreator = PortalHelpers:NewModule("SpellMacroCreator")
Party = PortalHelpers:NewModule("Party")



function PortalHelpers:OnInitialize()
	self:Print("OnInitialize Event Fired")
end

function PortalHelpers:OnEnable()
	self:Print("OnEnable Event Fired")
end

function PortalHelpers:OnDisable()
	self:Print("OnDisable Event Fired")
end
