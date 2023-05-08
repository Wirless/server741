local config = {
                levelReach = 80,
                item = 2160,
                count = 10
                }
 
function onAdvance(cid, skill, oldLevel, newLevel)
 
if(skill == SKILL__LEVEL and newLevel >= config.levelReach and getPlayerStorageValue(cid, 58554) == -1) then
        setPlayerStorageValue(cid, 58554, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received a total of 10 crystal coins.")
        doPlayerAddItem(cid, config.item, config.count)
end
 
return TRUE
end