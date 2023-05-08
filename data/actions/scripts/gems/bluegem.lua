wokacje = {1,2,5,6}
--MAGIC VOCATIONS IF NOT THEN MLVL LESS
palek = {3,7}
knight = {4,8}
function onUse(cid, item, fromPosition, itemEx, toPosition)
		if getPlayerMagLevel(cid) <= 140 and isInArray(wokacje, getPlayerVocation(cid)) then
		doPlayerAddSkill(cid, 7, 1) -- magic
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You gain magic level.")
		elseif getPlayerMagLevel(cid) <= 10 and isInArray(knight, getPlayerVocation(cid)) then
		doPlayerAddSkill(cid, 7, 1) -- magic
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You gain magic level.")
		elseif getPlayerMagLevel(cid) <= 20 and isInArray(palek, getPlayerVocation(cid)) then
		doPlayerAddSkill(cid, 7, 1) -- magic
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You gain magic level.")
		else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are too strong.")
	return true
end 
end
