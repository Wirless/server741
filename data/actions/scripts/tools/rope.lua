local SEWER_GRATE = {430}
local OPENED_HOLE = {294, 383, 469, 470, 482, 482, 485, 489, 430}
local OPENED_TRAP = {462}
local DOWN_LADDER = {369, 370, 408, 409, 427, 428, 3135, 3136, 5545, 5763}
local ROPE_SPOT = {384, 418}
local allowed_items_inway = {2016,  2017, 2018, 2019, 2020, 2021, 1903, 1904, 1905, 369, 370, 408, 409, 427, 428, 3135, 3136, 5545, 5763}

function onUse(cid, item, frompos, item2, topos, itemEx)
local rope = getPlayerStorageValue(cid, 777777) + 1


if topos.x == 65535 then
return 0
end

if item2.itemid == 0 then
return 0
end
	newPos = {x = topos.x, y = topos.y, z = topos.z, stackpos = 0}
	groundItem = getThingfromPos(newPos)
	
	BlockItemPos = {x = topos.x, y = topos.y, z = topos.z, stackpos = 1}
	blockingItem = getThingfromPos(BlockItemPos)
	
	if (isInArray(ROPE_SPOT, groundItem.itemid) == TRUE) then
		newPos.y = newPos.y + 1
		newPos.z = newPos.z - 1
		if blockingItem.itemid <= 0 or (isInArray(allowed_items_inway, blockingItem.itemid) == TRUE) and not (isPlayer(getTopCreature(BlockItemPos).uid)) then
		doTeleportThing(cid, newPos)
			setPlayerStorageValue(cid, 777777, rope)
		end

	elseif (isInArray(OPENED_HOLE, groundItem.itemid) == TRUE or isInArray(OPENED_TRAP, groundItem.itemid) == TRUE or isInArray(DOWN_LADDER, groundItem.itemid) == TRUE or isInArray(SEWER_GRATE, item2.itemid) == TRUE) then
		newPos.y = newPos.y + 1
		downPos = {x = topos.x, y = topos.y, z = topos.z + 1, stackpos = 255}
		downItem = getThingfromPos(downPos)
		if (downItem.itemid > 0) then
			doTeleportThing(downItem.uid, newPos)
			setPlayerStorageValue(cid, 777777, rope)
		else
			doPlayerSendCancel(cid, "Sorry, not possible.")
		end
	else
		return FALSE
	end
	return TRUE

end