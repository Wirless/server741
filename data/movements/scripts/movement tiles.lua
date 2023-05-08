function onStepIn(cid, item, pos)
gate1 = {x=32225, y=32282, z=9, stackpos=0}
getgate = getThingfromPos(gate1)
if isPlayer(cid) == TRUE then
	if item.actionid == 5005 then --Thais Lighthouse
	doTransformItem(getgate.uid, 4837)
	doTransformItem(item.uid, item.itemid-1)
	end
end
end

function onStepOut(cid, item, pos)
gate1 = {x=32225, y=32282, z=9, stackpos=0}
getgate = getThingfromPos(gate1)
if isPlayer(cid) == TRUE then
	if item.actionid == 5005 then --Thais Lighthouse
	doTransformItem(getgate.uid, 424)
	doTransformItem(item.uid, item.itemid+1)
	end
end
end
