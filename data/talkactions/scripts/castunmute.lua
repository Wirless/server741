function onSay(cid, words, param, channel)

	--local allowCheck = {204, 2, 476, 1399}
	
	--if not(isInArray(allowCheck, getPlayerGUID(cid))) then
	--	return doPlayerSendCancel(cid, "This command is not enabled yet. Only BETA players can test cast system for now.")
	--end
	
    if getPlayerCast(cid).status == false then
        doPlayerSendCancel(cid, "You are not casting at the moment.")
		return true
    end
	
    if param == "" then
        doPlayerSendCancel(cid, "Specify a spectator that you want to mute.")
		return true
    end
	
    if param:len() > 20 then
        doPlayerSendCancel(cid, "Spectator name is too long.")
		return true
    end

	if doPlayerRemoveCastMute(cid, param) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "" .. param .. " has been muted.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "" .. param .. " could not be muted.")
	end
	
    return true
end
