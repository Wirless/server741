function doAddQuestPoint(cid)
if getConfigValue("WorldID") == 1 then
    getquestpoints = mysqlQuery("SELECT `quest_points` FROM `players` WHERE `players`.`name` = \"".. getPlayerName(cid) .."\"", "quest_points")
    NEW_QUEST_POINTS = (getNumberValue(getquestpoints.quest_points) +1)	
mysqlQuery("UPDATE `players` SET `players`.`quest_points`=\"".. NEW_QUEST_POINTS .."\" WHERE `players`.`name` = \"".. getPlayerName(cid) .."\"", 'SET')
return true
end
end

function getQuestPoints(cid)
    getquestpoints = mysqlQuery("SELECT `quest_points` FROM `players` WHERE `players`.`name` = \"".. getPlayerName(cid) .."\"", "quest_points")
 return getNumberValue(getquestpoints.quest_points)
end