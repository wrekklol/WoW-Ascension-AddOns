local oldGetInstanceDifficulty = GetInstanceDifficulty
if not _GetInstanceDifficulty then
	function GetInstanceDifficulty()
		local diff = oldGetInstanceDifficulty()
		if diff == 1 then
			local _, _, difficulty, _, maxPlayers = GetInstanceInfo()
			if difficulty == 1 and maxPlayers == 25 then
				diff = 2
			end
		end
		return diff
	end
end

if not IsInGroup then
	function IsInGroup()
		return GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
	end
end

if not IsInRaid then
	function IsInRaid()
		return GetNumRaidMembers() > 0
	end
end

if not GetNumSubgroupMembers then
	function GetNumSubgroupMembers()
		return GetNumPartyMembers()
	end
end

if not GetNumGroupMembers then
	function GetNumGroupMembers()
		return IsInRaid() and GetNumRaidMembers() or GetNumPartyMembers()
	end
end

--[[
local oldGetCurrentMapAreaID = GetCurrentMapAreaID()
function GetCurrentMapAreaID()
	local id = oldGetCurrentMapAreaID
	if id == 0 then
		id = 862
	end

	return id
end
]]

if not C_Timer or C_Timer._version ~= 2 then
	local setmetatable = setmetatable
	local type = type
	local tinsert = table.insert
	local tremove = table.remove

	C_Timer = C_Timer or {}
	C_Timer._version = 2

	local TickerPrototype = {}
	local TickerMetatable = {
		__index = TickerPrototype,
		__metatable = true
	}

	local waitTable = {}
	local waitFrame = TimerFrame or CreateFrame("Frame", "TimerFrame", UIParent)
	waitFrame:SetScript("OnUpdate", function(self, elapsed)
		local total = #waitTable
		local i = 1

		while i <= total do
			local ticker = waitTable[i]

			if ticker._cancelled then
				tremove(waitTable, i)
				total = total - 1
			elseif ticker._delay > elapsed then
				ticker._delay = ticker._delay - elapsed
				i = i + 1
			else
				ticker._callback(ticker)

				if ticker._remainingIterations == -1 then
					ticker._delay = ticker._duration
					i = i + 1
				elseif ticker._remainingIterations > 1 then
					ticker._remainingIterations = ticker._remainingIterations - 1
					ticker._delay = ticker._duration
					i = i + 1
				elseif ticker._remainingIterations == 1 then
					tremove(waitTable, i)
					total = total - 1
				end
			end
		end

		if #waitTable == 0 then
			self:Hide()
		end
	end)

	local function AddDelayedCall(ticker, oldTicker)
		if oldTicker and type(oldTicker) == "table" then
			ticker = oldTicker
		end

		tinsert(waitTable, ticker)
		waitFrame:Show()
	end

	_G.AddDelayedCall = AddDelayedCall

	local function CreateTicker(duration, callback, iterations)
		local ticker = setmetatable({}, TickerMetatable)
		ticker._remainingIterations = iterations or -1
		ticker._duration = duration
		ticker._delay = duration
		ticker._callback = callback

		AddDelayedCall(ticker)

		return ticker
	end

	function C_Timer.After(duration, callback)
		AddDelayedCall({
			_remainingIterations = 1,
			_delay = duration,
			_callback = callback
		})
	end

	function C_Timer.NewTimer(duration, callback)
		return CreateTicker(duration, callback, 1)
	end

	function C_Timer.NewTicker(duration, callback, iterations)
		return CreateTicker(duration, callback, iterations)
	end

	function TickerPrototype:Cancel()
		self._cancelled = true
	end
end

-- START_TIMER event
local timerTypes = {
	["30-120"] = {1, 30, 120},
	["60-120"] = {1, 60, 120},
	["120-120"] = {1, 120, 120},
	["15-60"] = {1, 15, 60},
	["30-60"] = {1, 30, 60},
	["60-60"] = {1, 60, 60},
}

local chatMessage = {
	-- Ущелье Песни Войны
	["Битва за Ущелье Песни Войны начнется через 30 секунд. Приготовьтесь!"] = timerTypes["30-120"],
	["Битва за Ущелье Песни Войны начнется через 1 минуту."] = timerTypes["60-120"],
	["Сражение в Ущелье Песни Войны начнется через 2 минуты."] = timerTypes["120-120"],
	-- Низина Арати
	["Битва за Низину Арати начнется через 30 секунд. Приготовьтесь!"] = timerTypes["30-120"],
	["Битва за Низину Арати начнется через 1 минуту."] = timerTypes["60-120"],
	["Сражение в Низине Арати начнется через 2 минуты."] = timerTypes["120-120"],
	-- Око Бури
	["Битва за Око Бури начнется через 30 секунд."] = timerTypes["30-120"],
	["Битва за Око Бури начнется через 1 минуту."] = timerTypes["60-120"],
	["Сражение в Око Бури начнется через 2 минуты."] = timerTypes["120-120"],
	-- Альтеракская долина
	["Сражение на Альтеракской долине начнется через 30 секунд. Приготовьтесь!"] = timerTypes["30-120"],
	["Сражение на Альтеракской долине начнется через 1 минуту."] = timerTypes["60-120"],
	["Сражение на Альтеракской долине начнется через 2 минуты."] = timerTypes["120-120"],
	-- Берег Древних
	["Битва за Берег Древних начнется через 30 секунд. Приготовьтесь!"] = timerTypes["30-120"],
	["Битва за Берег Древних начнется через 1 минуту."] = timerTypes["60-120"],
	["Битва за Берег Древних начнется через 2 минуты."] = timerTypes["120-120"],
	-- Берег древних 2-й раунд
	["Второй раунд начнется через 30 секунд. Приготовьтесь!"] = timerTypes["30-60"],
	["Второй раунд битвы за Берег Древних начнется через 1 минуту."] = timerTypes["60-60"],
	-- Другие
	["Битва начнется через 30 секунд!"] = timerTypes["30-120"],
	["Битва начнется через 1 минуту."] = timerTypes["60-120"],
	["Битва начнется через 2 минуты."] = timerTypes["120-120"],
	-- Арена
	["15 секунд до начала боя на арене!"] = timerTypes["15-60"],
	["30 секунд до начала боя на арене!"] = timerTypes["30-60"],
	["1 минута до начала боя на арене!"] = timerTypes["60-60"],
	["Пятнадцать секунд до начала боя на арене!"] = timerTypes["15-60"],
	["Тридцать секунд до начала боя на арене !"] = timerTypes["30-60"],

	-- WSG
	["The battle for Warsong Gulch begins in 30 seconds. Prepare yourselves!"] = timerTypes["30-120"],
	["The battle for Warsong Gulch begins in 1 minute."] = timerTypes["60-120"],
	["The battle for Warsong Gulch begins in 2 minutes."] = timerTypes["120-120"],
	-- AB
	["The Battle for Arathi Basin begins in 30 seconds. Prepare yourselves!"] = timerTypes["30-120"],
	["The Battle for Arathi Basin begins in 1 minute."] = timerTypes["60-120"],
	["The battle for Arathi Basin begins in 2 minutes."] = timerTypes["120-120"],
	-- EotS
	["The Battle for Eye of the Storm begins in 30 seconds."] = timerTypes["30-120"],
	["The Battle for Eye of the Storm begins in 1 minute."] = timerTypes["60-120"],
	["The battle for Eye of the Storm begins in 2 minutes."] = timerTypes["120-120"],
	-- AV
	["The Battle for Alterac Valley begins in 30 seconds. Prepare yourselves!"] = timerTypes["30-120"],
	["The Battle for Alterac Valley begins in 1 minute."] = timerTypes["60-120"],
	["The Battle for Alterac Valley begins in 2 minutes."] = timerTypes["120-120"],
	-- SotA
	["The battle for Strand of the Ancients begins in 30 seconds. Prepare yourselves!."] = timerTypes["30-120"],
	["The battle for Strand of the Ancients begins in 1 minute."] = timerTypes["60-120"],
	["The battle for Strand of the Ancients begins in 2 minutes."] = timerTypes["120-120"],
	-- SotA 2 round
	["Round 2 begins in 30 seconds. Prepare yourselves!"] = timerTypes["30-60"],
	["Round 2 of the Battle for the Strand of the Ancients begins in 1 minute."] = timerTypes["60-60"],
	-- Other
	["The battle will begin in 30 seconds!"] = timerTypes["30-120"],
	["The battle will begin in 1 minute."] = timerTypes["60-120"],
	["The battle will begin in two minutes."] = timerTypes["120-120"],
	["The battle begins in 30 seconds!"] = timerTypes["30-120"],
	["The battle begins in 1 minute!"] = timerTypes["60-120"],
	["The battle begins in 2 minutes!"] = timerTypes["120-120"],
	-- Arena
	["Fifteen seconds until the Arena battle begins!"] = timerTypes["15-60"],
	["Thirty seconds until the Arena battle begins!"] = timerTypes["30-60"],
	["One minute until the Arena battle begins!"] = timerTypes["60-60"]
}

if not GetStartTimeData then
	function GetStartTimeData(msg)
		local data = chatMessage[msg]
		if data then
			return data[1], data[2], data[3]
		end
		return nil, nil, nil
	end
end