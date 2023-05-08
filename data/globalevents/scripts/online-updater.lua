function getInString(tab)
	local ret = ""
	for i = 1, #tab do
		ret = ret .. "'" .. tab[i] .. "'," 
	end
	ret = ret:sub(1, ret:len()-1)
	return "(" .. ret .. ")"
end

function onThink(interval, lastExecution)

	db.executeQuery("DELETE FROM `players_online` WHERE `player_id`")
	
	local players = {}
	for _, cid in pairs(getPlayersOnline()) do
		table.insert(players, getPlayerGUID(cid)) 
	end
	if #players <= 0 then return 1 end
	

	db.executeQuery("INSERT INTO `players_online` VALUES (".. getInString(players) ..")")

	return 1
end
