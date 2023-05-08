function onSay(cid, words, param)
   
if(param == '') and getGoldenAccountDays(cid) >= 1 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Please use {".. words .." enable} to enable or {".. words .." disable} to disable loot message.")
return true
end

    if(param == 'on') or (param == 'enable') then
	if getPlayerStorageValue(cid, 5788) < 1 then
        setPlayerStorageValue(cid,5788, 1)
		doPlayerSendTextMessage(cid, 22, "You have enabled loot message.")
		
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Loot message is enabled already.")
	end
	end
	
    if(param == 'off') or (param == 'disable') then
	if getPlayerStorageValue(cid, 5788) == 1 then
        setPlayerStorageValue(cid,5788, 0)
		doPlayerSendTextMessage(cid, 22, "You have disabled loot message.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Loot message is disabled already.")
	end
	end
	
    return true
end