function onUse(cid, item, frompos, item2, topos)
local scythe = getPlayerStorageValue(cid, 711111) + 1 
	
	if item2.itemid == 2739 then
		doTransformItem(item2.uid,2737)
		doDecayItem(item2.uid)
		doCreateItem(2694,1,topos)
		setPlayerStorageValue(cid, 711111, scythe)
	end
	return 1
end