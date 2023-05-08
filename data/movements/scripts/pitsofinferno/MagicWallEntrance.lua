function onStepIn(cid, item, pos)
	BOOK_ID = 1970
	ACTION_ID = 10201 -- Actionid of the tile that teleport you if you have the Holy Tible
	if (item.actionid == 10201) then
			doTeleportThing(cid, {x=32791, y=32327, z=10})
			doSendMagicEffect(getPlayerPosition(cid),10)
	end
	return TRUE
end