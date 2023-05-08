function round(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function onSay(cid, words, param, channel)

if(isPlayer(cid)) then
local fragTime = getConfigValue('TimeToDecreaseFrags')
local fragticks = getPlayerRedSkullTicks(cid)

local frags = (getPlayerRedSkullTicks(cid) / fragTime) + 1;

local remainingTime = getPlayerRedSkullTicks(cid) - (fragTime * (frags - 1));

local hours = (fragticks / 3600 % 24)
local minutes = (fragticks / 60 % 60)
local seconds = (fragticks % 60)


if (fragticks > 1) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have " .. math.floor(frags) .. " unjustified kills. You will lose all unjustified kills in ".. math.floor(hours) .." hours, ".. math.floor(minutes) .." minutes, ".. math.floor(seconds) .." seconds.(4 hours each unjustified kill)")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have any unjustified kill.")
end
end
return true
end
