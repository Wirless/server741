function onStepIn(cid, item, position, fromPosition)
    if item.uid == 10002 then
                 if getPlayerStorageValue(cid,10275) == -1 then 
                              doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry. You have not completed Infernatils spirit.')
		              doTeleportThing(cid, fromPosition,false)
			      doSendMagicEffect(fromPosition, 2)
	         end
	end
return true
end