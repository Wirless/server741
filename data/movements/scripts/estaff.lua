function onEquip(cid, item, slot)
	doDecayItem(item.uid)
	return true
end

function onDeEquip(cid, item, slot)
	doDecayItem(item.uid)
	return true
end