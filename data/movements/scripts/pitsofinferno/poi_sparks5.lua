function onStepIn(cid, item, position, fromPosition)
    if item.uid == 10005 then
                 if getPlayerStorageValue(cid,10278) == -1 then 
                              doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry. You have not completed Pumins spirit.')
		              doTeleportThing(cid, fromPosition,false)
			      doSendMagicEffect(fromPosition, 2)
	         end
	end
return true
end