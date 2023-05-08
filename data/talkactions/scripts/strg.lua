local storejdz = getGlobalStorageValue(120012)
function onSay(cid, words, param)
 
 
    if(param == 'global') then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, storejdz)
return true
end
	end