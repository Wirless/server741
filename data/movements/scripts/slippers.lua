function onEquip(cid, item, slot)
	doDecayItem(item.uid)
	doChangeSpeed(cid, getCreatureBaseSpeed(cid) + 20 - getCreatureSpeed(cid))
	return true
end

function onDeEquip(cid, item, slot)
	doDecayItem(item.uid)
	doChangeSpeed(cid, -20)
	return true
end