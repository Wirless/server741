local config = {
                levelReach = 8,
                item = 2160,
                count = 1
                }
 
function onAdvance(cid, skill, oldLevel, newLevel)
 
if(skill == SKILL__LEVEL and newLevel >= config.levelReach and getPlayerStorageValue(cid, 58557) == -1) then
        setPlayerStorageValue(cid, 58557, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received a total of 1 crystal coin.")
        doPlayerAddItem(cid, config.item, config.count)
end
 
return TRUE
end