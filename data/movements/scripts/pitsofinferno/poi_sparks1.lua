function onStepIn(cid, item, position, fromPosition)
    if item.uid == 10001 then
                 if getPlayerStorageValue(cid,10274) == -1 then 
                              doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry. You have not completed Veminors spirit.')
		              doTeleportThing(cid, fromPosition,false)
			      doSendMagicEffect(fromPosition, 2)
	         end
	end
return true
end