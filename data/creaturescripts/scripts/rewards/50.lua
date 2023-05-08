local config = {
                levelReach = 50,
                item = 2160,
                count = 5
                }
 
function onAdvance(cid, skill, oldLevel, newLevel)
 
if(skill == SKILL__LEVEL and newLevel >= config.levelReach and getPlayerStorageValue(cid, 58555) == -1) then
        setPlayerStorageValue(cid, 58555, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received a total of 5 crystal coins.")
        doPlayerAddItem(cid, config.item, config.count)
end
 
return TRUE
end