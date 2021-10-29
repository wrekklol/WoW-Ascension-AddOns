-- Author      : nihilianth
-- Create Date : 4/11/2021 9:31:39 PM

local lfgMsg = "LFG System: You have been removed from the queue (Internal Reset)."
local queueLeaveMsg = "You are no longer queued in the Dungeon Finder."
local msgTime = 0
local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_SYSTEM")


function LFGAutoReque_Click()
	LFDQueueFrameFindGroupButton:Click()
end

-- https://wowwiki-archive.fandom.com/wiki/USERAPI_wait
local waitTable = {};
local waitFrame = nil;

function LFGAutoReque_wait(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
    waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
		  -- print("Calling Click")
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end

frame:SetScript("OnEvent", function(self, event, msg, ...)
	if event ~= "CHAT_MSG_SYSTEM" then return end

	-- print(msg)
    if msg == lfgMsg then
		msgTime = time()
	elseif msg == queueLeaveMsg and time() - msgTime < 2 then
		print("Re-queueing for LFD")
		msgTime = 0
		LFGAutoReque_wait(1, LFGAutoReque_Click)
	end
end)

