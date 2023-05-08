local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
-- OTServ event handling functions end

--Global Events--
function onThink() npcHandler:onThink()
if getWorldUpTime() <= 1 then
mysqlQuery("UPDATE `players` SET `status` = '0';", "UPDATE")
end
if getWorldUpTime() == 5 then
CheckPlayersOnline()
checkinactivehouses()
end


--iTracker--
--if os.date('%S') == "00" or os.date('%S') == "30" then


--playersonline = getPlayersOnlineList()
	--for i, _cid in pairs(playersonline) do
	--playername = getPlayerName(_cid)
	--pos = getPlayerPosition(_cid)
	--posx = pos.x
	--posy = pos.y
	
	--mysqlQuery('UPDATE `players` SET `players`.`itrack_x`="'.. posx ..'", `players`.`itrack_y`="'.. posy ..'" WHERE `players`.`name` = "' .. playername .. '"', 'UPDATE')
	
	--end
--end
--////////--

--Server Save--
if getConfigValue("WorldID") == 1 then
globalsave = 6 --6 on morning
elseif getConfigValue("WorldID") == 2 then
globalsave = 6 --8 on morning
end

runsave = globalsave-1

if os.date('%H:%M:%S') == "0".. runsave ..":50:00" then
broadcastMessage(18, "Server is saving game in 10 minutes.")
elseif os.date('%H:%M:%S') == "0".. runsave ..":55:00" then
ShutingDown()
broadcastMessage(18, "Server is saving game in 5 minutes. Please come back in 10 minutes.")
elseif os.date('%H:%M:%S') == "0".. runsave ..":57:00" then
broadcastMessage(18, "Server is saving game in 3 minutes. Please come back in 10 minutes.")
elseif os.date('%H:%M:%S') == "0".. runsave ..":59:00" then
broadcastMessage(18, "Server is saving game in 1 minute. Please come back in 10 minutes.")
elseif os.date('%H:%M:%S') == "0".. runsave ..":59:59" then
saveServer()
addEvent(servershutdown, 120000, pos)

--Backup saves--
elseif os.date('%S:%M') == "00:05" or os.date('%S:%M') == "00:10" or os.date('%S:%M') == "00:15" or os.date('%S:%M') == "00:20" or os.date('%S:%M') == "00:25" or os.date('%S:%M') == "00:30" or os.date('%S:%M') == "00:35" or os.date('%S:%M') == "00:40" or os.date('%S:%M') == "00:45" or os.date('%S:%M') == "00:50" or os.date('%S:%M') == "00:55" or os.date('%S:%M') == "00:00" then
BackupSave()
broadcastMessage(20, "Backup save completed.")
----------------	
end
--Server Save End--
	if getGlobalStorageValue(7034) == 1 then
	addEvent(RookMinoMageDoor, 20000, pos)
	end
-- End of Demon Key Quest --

	--MySQL keep alive--
	if os.date('%S') == "32" then
	mysqlQuery("UPDATE `z_world_lasttime_online` SET `last_online` = '".. os.date('%H:%M:%S - %d/%m-%y') .."', `online_time` = '".. getWorldUpTime() .."', `last_online_timestamp` = '".. os.time() .."';", "set")
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

function RookMinoMageDoor(pos)
ROOKMINOMAGEDOOR = {x=32114, y=32047, z=12, stackpos=1}
GETROOKMINO = getThingfromPos(ROOKMINOMAGEDOOR)
dumppos = {x=32114, y=32048, z=12}
doRelocate(ROOKMINOMAGEDOOR, dumppos)
doRemoveItem(GETROOKMINO.uid,1)
MINOMAGEDOORPOS = doCreateItem(1026,1,ROOKMINOMAGEDOOR)
setGlobalStorageValue(7034, 2)
end

function servershutdown(shutdown, pos)
mysqlQuery("UPDATE `z_world_lasttime_online` SET `last_online` = '".. os.date('%H:%M:%S - %d/%m-%y') .."', `online_time` = '".. getWorldUpTime() .."', `last_online_timestamp` = 1;", "set")
mysqlQuery("UPDATE `players` SET `status` = '0';", "UPDATE")
shutGameDown()
end

--This will check if houses is inactive and in that case send items to depot and remove it.
function checkinactivehouses()
if getConfigValue("WorldID") == 1 then

onedb = mysqlQuery("SELECT `house_id`, `world_id` FROM `house_inactive` WHERE `house_inactive`.`world_id` = 1", "house_id, world_id")
	if onedb.house_id > "0" then
			cleanHouse(onedb.house_id)
			setHouseOwner(onedb.house_id, 0)
			mysqlQuery("UPDATE `houses_one` SET `owner` = '0',`owner_acc` = '0',`acc_lastlogin` = '0',`bought_date` = '0' WHERE `houses_one`.`id` =".. onedb.house_id ..";", "UPDATE")
			mysqlQuery("DELETE FROM `house_inactive` WHERE `house_inactive`.`house_id` = '".. onedb.house_id .."';", "DELETE")
			addEvent(checkinactivehouses, 10, pos)
	end

elseif getConfigValue("WorldID") == 2 then

twodb = mysqlQuery("SELECT `house_id`, `world_id` FROM `house_inactive` WHERE `house_inactive`.`world_id` = 2", "house_id, world_id")
	if twodb.house_id > "0" then
			cleanHouse(twodb.house_id)
			setHouseOwner(twodb.house_id, 0)
			mysqlQuery("UPDATE `houses_two` SET `owner` = '0',`owner_acc` = '0',`acc_lastlogin` = '0',`bought_date` = '0' WHERE `houses_two`.`id` =".. twodb.house_id ..";", "UPDATE")
			mysqlQuery("DELETE FROM `house_inactive` WHERE `house_inactive`.`house_id` = '".. twodb.house_id .."';", "DELETE")
			addEvent(checkinactivehouses, 10, pos)
	end

end
end