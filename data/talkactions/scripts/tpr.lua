function onSay(cid, words, param)
	doTeleportThing(cid, getCreaturePosition(getRandomPlayer()))
	return true
end

function getRandomPlayer()
	local players = getPlayersOnline()
	return players[math.random(1, #players)]
end