 function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getCreatureStorage(cid, 9030) == -1) or getCreatureStorage(cid, 909001) == -1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You completed the full blue djinn quest.")
		doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_RED)
		doCreatureSetStorage(cid, 9030, 1) 
			doCreatureSetStorage(cid, 909001, 1) 
		doRemoveItem(item.uid, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed the blue djinn quest.")
	end
	return true
end 