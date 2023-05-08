 function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerVocation(cid) >= 1 and getPlayerVocation(cid) <= 4 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Promoted!")
		doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_RED)
		doPlayerSetPromotionLevel(cid, 1)
		doRemoveItem(item.uid, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed the promotion.")
	end
	return true
end 