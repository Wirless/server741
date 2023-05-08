local stairs_pos = {x=32483, y=31633, z=9}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doCreateItem(383,1,stairs_pos)
		doTransformItem(item.uid, 1946)
	else
		doPlayerSendCancel(cid, "The path is already open.")
	end
	return true
end