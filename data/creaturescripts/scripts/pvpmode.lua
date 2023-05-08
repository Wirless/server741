
function onCombat(cid, target)
local storageValue = getCreatureStorage(cid, 97541)


if (getPlayerPVPMode(cid) == 1 and getPlayerPVPMode(target) == 1) or isPlayer(target) == FALSE then
return TRUE
else
doPlayerSendCancel(cid, "You cannot attack players which pvp mode is off.")

if storageValue >= os.time() then
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot attack players which pvp mode is off.")
end

doCreatureSetStorage(cid, 97541, os.time() + 1)

return FALSE
end
end 
