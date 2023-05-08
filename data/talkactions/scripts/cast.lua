local config = {
	minLevel = 25 -- Min. level to open a cast
}

function setCastPassword(cid, password)	
	doPlayerSetCastPassword(cid, password)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast password has been changed to: "..password)
	db.query('UPDATE `players` SET `castPassword` = "1" WHERE `id` = ' .. getPlayerGUID(cid))
end

function onSay(cid, words, param, channel)
	local tmp = param:explode(" ")
    
	--local allowCheck = {204, 2, 476, 1399}
	
	--if not(isInArray(allowCheck, getPlayerGUID(cid))) then
	--	return doPlayerSendCancel(cid, "This command is not enabled yet. Only BETA players can test cast system for now.")
	--end
	
	if (getPlayerLevel(cid) < config.minLevel) then
		return doPlayerSendCancel(cid, "You need at least level ".. config.minLevel .." to start a cast.")
	end
	if getPlayerCast(cid).status == false and param:len() > 10 then
		return doPlayerSendCancel(cid, "The password is too long. (Max.: 10 letters).")
	end
	
		if getPlayerCast(cid).status == false then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Cast has started.")
			doPlayerSetCastState(cid, true)
			if tmp[1] then
				setCastPassword(cid, param)
			else
				db.query('UPDATE `players` SET `castPassword` = "0" WHERE `id` = ' .. getPlayerGUID(cid))
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Cast has ended.")
			doPlayerSetCastState(cid, false)
			db.query('UPDATE `players` SET `castPassword` = "0" WHERE `id` = ' .. getPlayerGUID(cid))
			--doPlayerSave(cid)
		end
		
	doPlayerSave(cid)
    return true
end
