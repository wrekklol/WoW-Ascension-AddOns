--[[ *** DataStore_AscensionRE ***
    Written by: Nihilianth @github.com
    31 March 2021
    Implementation of this addon is based on DataStore_Crafts addon
]]

if not DataStore then return end

local addonName = "DataStore_AscensionRE"

_G[addonName] = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")

local addon = _G[addonName]

local THIS_ACCOUNT = "Default"
local commPrefix = "DS_AscRE"

local AscensionInit = false
local AscRESpellIds = {}
local collectionTypeStr = {"Enchant", "Tome"}

local collectionInitMsgName = "ASC_COLLECTION_INIT"
local collectionUpdateMsgName = "ASC_COLLECTION_UPDATE"
local collectionREUnlockedMsgName = "ASC_COLLECTION_RE_UNLOCKED"
local collectionGuildUpdateMsgName = "ASC_GUILD_COLLECTION_UPDATE"
-- local collectionTomeUnlockedMsgName = "ASC_COLLECTION_TOME_UNLOCKED"


local MSG_SEND_LOGIN		= 1
local MSG_LOGIN_REPLY		= 2
local MSG_SEND_ENCHANTS 	= 3


local AddonDB_Defaults = {
    global = {
        Options = {
            BroadcastREs = 1
        },
        Characters = {
            ['*'] = {
                lastUpdate = nil,
                Version = nil,
                NumKnownEnchants = 0,
                KnownEnchants = {},
            }
        },
        Guilds = {
            ['*'] = {
                Members = {
                    ['*'] = {
                        lastUpdate = nil,
                        Version = nil,
                        NumKnownEnchants = 0,
                        KnownEnchants = {},
                    }
                }
            }
        }

    }
}


-- *** Utility functions Generic ***

local function GetOption(option)
	return addon.db.global.Options[option]
end

local function GetCurrentGuild()
	local guild = GetGuildInfo("player")
	if guild then 
		local key = format("%s.%s.%s", THIS_ACCOUNT, GetRealmName(), guild)
		return addon.db.global.Guilds[key]
	end
end

local function SaveAddonVersion(sender, version)
	local thisGuild = GetCurrentGuild()
	if thisGuild and sender and version then
		thisGuild.Members[sender].Version = version
	end
end

local function GetBuildVersion()
	local _, version = GetBuildInfo()
	return tonumber(version)
end

local function GetAddonVersion()
    local version = GetAddOnMetadata(addonName, "Version")
    --addon:Print("curVersion: "..version)
    return version
end

local function SaveVersion(sender, version)
	local thisGuild = GetCurrentGuild()
	if thisGuild and sender and version then
		thisGuild.Members[sender].Version = version
	end
end

local function GuildBroadcast(messageType, ...)
	local serializedData = addon:Serialize(messageType, ...)
	addon:SendCommMessage(commPrefix, serializedData, "GUILD")
end

local function GuildWhisper(player, messageType, ...)
	if DataStore:IsGuildMemberOnline(player) then
		local serializedData = addon:Serialize(messageType, ...)
		addon:SendCommMessage(commPrefix, serializedData, "WHISPER", player)
	end
end

-- *** End Utility Functions Generic ***

-- *** Utility Functions Ascension ***
local function SaveEnchants(sender, alt, data)
    local thisGuild = GetCurrentGuild()
    if thisGuild and sender then
        local addonVer = thisGuild.Members[sender].Version
        local member_alt = thisGuild.Members[alt]
        -- addon:Print("Saving enchant from "..sender)
        member_alt.Version = addonVer
        -- addon:Print(format("Gota data for %s: %u", alt, #data))
        member_alt.NumKnownEnchants = #data
        member_alt.KnownEnchants = data
        member_alt.lastUpdate = time()
    end
    addon:SendMessage(collectionGuildUpdateMsgName, sender, alt, data)
end

local enchantQueue
local enchantTimer

function GetEnchantQueue()
    return enchantQueue
end

local function SendEnchantQueue()
    if #enchantQueue == 0 then
        --addon:Print("Sent all queued enchants")
        addon:CancelTimer(enchantTimer)
        enchantTimer = nil
        return
    end
    --addon:Print(format("SendEnchantQueue: %d remaining", #enchantQueue))

    local queueEntry = enchantQueue[#enchantQueue]
    local alt = queueEntry[1]
    local recipient = queueEntry[2]
    local knownEnchants = queueEntry[3]

    if recipient then
        --addon:Print(format("Sending %u enchants for alt %s", #knownEnchants, alt))
        GuildWhisper(recipient, MSG_SEND_ENCHANTS, alt, knownEnchants)
    else
        --addon:Print(format("Broadcasting %u enchants for alt %s", #knownEnchants, alt))
        GuildBroadcast(MSG_SEND_ENCHANTS, alt, knownEnchants)
    end

    table.remove(enchantQueue)
end

local function SendEnchantsWithAlts(alts, recipient)
    if GetOption("BroadcastREs" == 0) then
        return
    end

    enchantQueue = enchantQueue or {}

    --addon:Print("sending alt enchants")
    --addon:Print("Alts: " .. alts)

    if AscensionInit == true then
        local myself = DataStore:GetCharacter()
        local _, _, nameStripped = strsplit(".", myself)
        --addon:Print("sending own enchants: "..myself)
        table.insert(enchantQueue, {nameStripped, recipient, addon.ThisCharacter.KnownEnchants})
    end

    if (strlen(alts) > 0) then
        for _, name in pairs({strsplit("|",alts)}) do
            character = DataStore:GetCharacter(name)
            if character then
                --addon:Print("Sending data for alt: "..character.. " "..name)
                table.insert(enchantQueue, {name, recipient, addon.db.global.Characters[character].KnownEnchants})
            end
        end
    end

    enchantTimer = enchantTimer or addon:ScheduleRepeatingTimer(SendEnchantQueue, 0.5) -- Send queued enchants every 0.5 seconds
end

--[[ * True Spell IDs *
    The CollectionStore contains some variant of skill IDs
    most of which match with spell IDs. For others true spell IDs
    has to be retrieved to ensure proper use for (tooltip and other) addon functionality
-- ]]
local function GetRealRESpellIds()
    local reList = CollectionsFrame.EnchantList
    local spellIds = {}

    for reId, misc in pairs(reList) do
        local spellId = reList[reId][1][2]

        table.insert(spellIds, spellId)
    end

    return spellIds
end

-- Parse Server Message containing known Enchants using Smallfolk (used by Ascension addons)
local function ParseKnownEnchantsList(message)
    -- TODO: Large server messages are split. 
    -- Ingame tests showed no issues for players with large enchant collections
    -- Further tests are needed to determine if additional processing is required
    -- TODO: Additional error handling if required

    local reList = CollectionsFrame.EnchantList
    local knownList = {}
    -- addon:Print("ParseKnownEnchantsList called. Message len "..strlen(message))

    local recvTable = Smallfolk.loads(message, #message)
    if not recvTable or type(recvTable) ~= 'table' then
        addon:Print("Error: received invalid enchant data with size: "..#msg)
        return
    end

    for id, enchant_id in pairs(recvTable[1][4]) do
        local spellId = reList[enchant_id][1][2]
        if not spellId then
            addon:Print("Unknown enchant with id: "..enchant_id.." skipped.")
        else
            table.insert(knownList, spellId)
        end
    end

    -- addon:Print("Setting known list for char "..UnitName("player").." size: "..#knownList)
    addon.ThisCharacter.NumKnownEnchants = #knownList
    addon.ThisCharacter.KnownEnchants = knownList
    addon.ThisCharacter.lastUpdate = time()
    addon.ThisCharacter.Version = GetBuildVersion()
    addon:SendMessage(collectionUpdateMsgName, knownList, AscensionInit)
    SendEnchantsWithAlts("") -- send own enchants
end

-- Parse server message received after unlocking a new RE
local function ParseNewEnchant(message)
    --addon:Print("RE Toolkit: Got FillCollectionByEnchant")
    local reList = CollectionsFrame.EnchantList

    local recvTable = Smallfolk.loads(message, #message)
    if not recvTable or type(recvTable) ~= 'table' then
        addon:Print("Received invalid new enchant message. Size: "..#message)
        addon:Print(message)
    end
    
    local entry = reList[recvTable[1][4]][1][2]
    if entry then 
        addon:SendMessage(collectionREUnlockedMsgName, entry)
    else
        addon:Print("Received unknown New Enchant!")
    end
end

-- verify this
local function OnGuildAltsReceived(self, sender, alts)
    if sender == UnitName("player") then				-- if I receive my own list of alts in the same guild, same realm, same account..
        --addon:Print("Guild alts received from myself")
		GuildBroadcast(MSG_SEND_LOGIN, GetBuildVersion())
		addon:ScheduleTimer(SendEnchantsWithAlts, 5, alts)	-- broadcast my crafts to the guild 5 seconds later, to decrease the load at startup
	end
end

local onlineCnt = 0
local GuildCommCallbacks = {
    [MSG_SEND_LOGIN] = function(sender, version)
        local player = UnitName("player")
        if (sender ~= player) then
            --addon:Print("Got MSG_SEND_LOGIN from "..sender)
            GuildWhisper(sender, MSG_LOGIN_REPLY, GetBuildVersion())
            local alts = DataStore:GetGuildMemberAlts(player)
            if alts then
                SendEnchantsWithAlts(alts, sender)
            end
        end
        SaveAddonVersion(sender, version)
    end,
    [MSG_LOGIN_REPLY] = function(sender, version)
        --addon:Print("Got MSG_LOGIN_REPLY from "..sender)
        onlineCnt = onlineCnt + 1
        SaveAddonVersion(sender, version)
    end,
    [MSG_SEND_ENCHANTS] = function(sender, alt, data)
        local player = UnitName("player")
        if (sender ~= player) then
            -- addon:Print("Got MSG_SEND_ENCHANTS from "..sender)
            SaveEnchants(sender, alt, data)
        end
    end
}

-- *** End Utility Functions Ascension ***



-- *** Public Functions Impl ***

local function _GetRESpellList()
    --addon:Print("GetRESpellList called!")
    if AscensionInit == false then return nil end

    return AscRESpellIds
end

local function _GetKnownEnchants()
    if AscensionInit == false then return nil end

    return addon.ThisCharacter.KnownEnchants
end

local function IsREKnownByPlayer(entry, knownList)
    for _, spellId in pairs(knownList) do
        if entry == spellId  then return true end
    end
    return false
end

local function _GetCharactersWithKnownList()
    local altList = {}
    for name, id in pairs(addon.Characters) do
        table.insert(altList, name)
    end
    return altList
end

local function _GetCharacterREs(name)
    local key = format("%s.%s.%s", THIS_ACCOUNT, GetRealmName(), name)
    local alt = addon.Characters[key]
    if alt == nil then return nil end
    return alt.KnownEnchants
end

-- returns alt names on the same realm that have the RE (cross-faction, cross-guild)
local function _GetCharactersWithRE(entry)
    local altsWithRE = {}

    for name, id in pairs(addon.Characters) do
        if #id.KnownEnchants > 0 then
            if IsREKnownByPlayer(entry, id.KnownEnchants) then
                local _,_,charName = strsplit(".", name)
                table.insert(altsWithRE, charName)
            end
        end
    end

    return altsWithRE
end

-- returns guild member's character names
local function _GetGuildiesWithRE(entry)
    local guildiesWithRE = {}

    local thisGuild = GetCurrentGuild()
    if not thisGuild then return {} end

    for name, data in pairs(thisGuild.Members) do
        if IsREKnownByPlayer(entry, data.KnownEnchants) then
            table.insert(guildiesWithRE, name)
        end
    end

    return guildiesWithRE;
end

local PublicMethods = {
    GetRESpellList = _GetRESpellList,
    GetKnownEnchants = _GetKnownEnchants,
    GetCharactersWithRE = _GetCharactersWithRE,
    GetGuildiesWithRE = _GetGuildiesWithRE,
    GetCharacterREs = _GetCharacterREs,
    GetCharactersWithKnownList = _GetCharactersWithKnownList,
}
-- *** End Public Functions Impl ***


-- *** WOW Events ***

function addon:OnInitialize()
	addon.db = LibStub("AceDB-3.0"):New(addonName .. "DB", AddonDB_Defaults)
	DataStore:RegisterModule(addonName, addon, PublicMethods)
    DataStore:SetGuildCommCallbacks(commPrefix, GuildCommCallbacks)

    addon:RegisterMessage("DATASTORE_GUILD_ALTS_RECEIVED", OnGuildAltsReceived)
    addon:RegisterComm(commPrefix, DataStore:GetGuildCommHandler())
end

function addon:OnEnable()
    addon:RegisterEvent("CHAT_MSG_ADDON")
    -- TODO: addon:SetupOptions()
end

function addon:OnDisable()
    addon:UnregisterEvent("CHAT_MSG_ADDON")
end

local function SendOnlineInfo()
    if onlineCnt then
        print(format("Online guild members with DataStore_AscensionRE: %u.", onlineCnt))
    end
end

-- From https://github.com/Rochet2/AIO/blob/d06da5d8e7c32e45fde93a1632e9e33105dfd895/AIO_Client/AIO.lua
-- Converts an uint16 number to string (2 chars)
-- Note that this escapes using \0 character so the full uint16 range is not usable
local function AIO_16tostring(uint16)
    -- split 16bit to 2 8bit parts but without \0
    assert(uint16 <= 2^16-767, "Too high value")
    assert(uint16 >= 0, "Negative value")
    local high = math.floor(uint16 / 254)
    local l = high +1
    local r = uint16 - high * 254 +1
    return string.char(l)..string.char(r)
end

local recvBuffer = {}
local enchantMsgId = -1
-- Converts a string (2 chars) to uint16 number
-- Note that the chars can not be \0 character so the full uint16 range is not usable
local function AIO_stringto16(str)
    local l = string.byte(string.sub(str, 1,1)) -1
    local r = string.byte(string.sub(str, 2,2)) -1
    local val = l*254 + r
    assert(val <= 2^16-767, "Too high value")
    assert(val >= 0, "Negative value")
    return val
end
local AIO_ShortMsg          = string.char(1)..string.char(1)

function addon:CHAT_MSG_ADDON(event, prefix, message, channel, sender)
    if not prefix or not prefix:find("SAIO") then return end
    if not message then return end

    -- From AIO documentation
        -- the chars can not contain \0
        -- 16bit -> Message ID -- 0 reserved for identifying short msg
        -- 16bit -> Number of parts (should be > 1)
        -- 16bit -> Part ID
        -- Rest -> Message String


    local msgid = string.sub(message, 1,2)
    local messageId = AIO_stringto16(msgid)

    if enchantMsgId > 0 and messageId ~= enchantMsgId then
        addon:Print("Message ID mismatch"..enchantMsgId.." "..messageId)
        return
    end


    if msgid == AIO_ShortMsg then
        -- addon:Print("Short Message")
        message = string.sub(message, 3)
    --elseif  message:find("BuildEnchantList") or enchantMsgId == messageId then -- sic!
    elseif  message:find("GetKnownEnchantsList") or enchantMsgId == messageId then -- sic!
        -- print("messageId "..messageId)
        if #message < 3*2 then
            return
        end
        local parts = AIO_stringto16(string.sub(message, 3,4))
        local partId = AIO_stringto16(string.sub(message, 5,6))
        if partId <= 0 or partId > parts then
            print("received long message with invalid amount of parts. id, parts: "..partId.." "..parts)
            return
        end

        message = string.sub(message, 7)
        if parts >= 40 then 
            addon:Print("Received "..parts.."parts for GetKnownEnchantsList. Aborting")
            return
        end

        if not recvBuffer[messageId] then
            enchantMsgId = messageId
            --addon:Print("got new message "..messageId)
            recvBuffer[messageId] = {
                partsCnt = parts,
                partsStored = 1,
                parts = { message }
            }
            return
        end
        msgBuf = recvBuffer[messageId]
        --print(string.sub(message, 1, 30), string.sub(message, -30))
        
        if msgBuf then
            table.insert(msgBuf.parts, message)
            msgBuf.partsStored = msgBuf.partsStored + 1

            if msgBuf.partsCnt == msgBuf.partsStored then
                --local msgLenCalc = (msgBuf.partsCnt - 1) * 2549 + #message
                --addon:Print("Received all parts")
                -- print(string.sub(message, 1, 30), string.sub(message, -30))
                message = table.concat(msgBuf.parts)
                --print(msgLenCalc, #message, msgBuf.partsStored)
                --addon:Print(string.sub(message, 1, 30), " : ", string.sub(message, -30))
                --addon:Print("found "..string.find(message, "Sanctified Light"))
                enchantMsgId = -1
                smallFolkLoad = Smallfolk.loads(message, #message)
            else
                --print(messageId, partId, parts, #message)
                --print(string.sub(message, 1, 30), " : ", string.sub(message, -30))
                --addon:Print("Saved part "..partId)
                return
            end
        end

    end

    if string.sub(message,1,2) ~= (string.char(1)):rep(2) then
        local msg_noprefix = string.sub(message, 3)
        --print("split message "..strlen(message))
        --print(string.sub(msg_noprefix, 1, 30), string.sub(msg_noprefix, -30))
    end
    -- Provided after login as a responce to requests from client addons
    -- Data is not present on PLAYER_ALIVE
    if message:find("GetKnownEnchantsList") then
        --addon:Print("Received GetKnownEnchantsList")
        charEnchants = {}

        if AscensionInit == false then
            AscRESpellIds = GetRealRESpellIds()
            addon:SendMessage(collectionInitMsgName, AscRESpellIds)
            ParseKnownEnchantsList(message)
            addon:ScheduleTimer(SendOnlineInfo, 10)
            AscensionInit = true
        else
            ParseKnownEnchantsList(message)
        end
        
        --addon:Print("Parsed GetKnownEnchantsList")
    elseif message:find("FillCollectionByEnchant") then
        ParseNewEnchant(message)
        --addon:Print("Unlocked Enchant")
    end
end