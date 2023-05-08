---function by Armageddom--
function onStepIn(cid, item, frompos, item2, topos) 
--
local playerpos = getPlayerPosition(cid) 
local novapos = {x=32827, y=32272, z=12} 

if item.uid == 10257 then

getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,2) 
doTeleportThing(cid,novapos) 
doSendMagicEffect(novapos,10)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have unlocked the shortcut Ask Oldrak on Plains of Havoc for the shortcut!")
setPlayerStorageValue(cid,46664,1)
end 
end