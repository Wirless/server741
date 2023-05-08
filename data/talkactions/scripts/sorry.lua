local config = {
	minLevel = 20 -- Min. level to open a cast
}

function onSay(cid, words, param, channel)
	local tmp = param:explode(" ")
    
	
	if (getPlayerLevel(cid) < config.minLevel) then
		return doPlayerSendCancel(cid, "You need at least level ".. config.minLevel .." to get your reward.")
	end

	if getPlayerStorageValue(cid,8874) <= 0 then
		if getPlayerFreeCap(cid) <= 5 then
		doPlayerSendTextMessage(cid,22,"You need 5 cap or more to get your reward!")
		return TRUE
		end
		doPlayerSendTextMessage(cid,22,"You have got 5k as compensate! Sorry for the rollback, I try to fix this as soon as possible!")
		doPlayerAddItem(cid, 2152, 50)
		setPlayerStorageValue(cid,8874,1)
	else
	doPlayerSendTextMessage(cid,22,"You already got your reward.")
	end
	
	doPlayerSave(cid)
    return true
end
