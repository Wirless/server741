function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == ITEM_GOLD_COIN and item.type == 100 then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 1)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type == 100 then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, 1)
	else
		return FALSE
	end
	return TRUE
end
