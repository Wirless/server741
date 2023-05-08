function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end

	--doPlayerBroadcastMessage(cid, param)
	doBroadcastMessage(param, MESSAGE_STATUS_WARNING)
	return true
end
