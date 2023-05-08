local pos = {x=32187, y=31626, z=8}
local pos2 = {x=32186, y=31626, z=8}
local pos3 = {x=32188, y=31626, z=8}
local pos4 = {x=32189, y=31626, z=8}

 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		doRemoveItem(getTileItemById(pos, 1498).uid)
		doRemoveItem(getTileItemById(pos2, 1498).uid)
		doRemoveItem(getTileItemById(pos3, 1498).uid)
		doRemoveItem(getTileItemById(pos4, 1498).uid)
		doTransformItem(item.uid, 1946)
	else
	doTransformItem(item.uid, 1945)
	doCreateItem(1498, 1, pos)
	doCreateItem(1498, 1, pos2)
	doCreateItem(1498, 1, pos3)
	doCreateItem(1498, 1, pos4)
	end
	return true
end