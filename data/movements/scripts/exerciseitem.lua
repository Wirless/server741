function onEquip(cid, item, slot)
	doCreatureSetStorage(uid, 55771, 1)
	return true
end

function onDeEquip(cid, item, slot)
	doCreatureSetStorage(uid, 55771, 0)
	return true
end