function onStepIn(cid, item, pos)
if isPlayer(cid) == TRUE then
		actionid = 101
		if item.actionid > 100 and item.actionid < 125 then
			actionid = item.actionid
		end
		if actionid > 100 then
			if isPlayer(cid) == TRUE then
				if (getTilePzInfo(pos) == TRUE) then
				depotitems = getPlayerDepotItems(cid, actionid - 100)
            
					if depotitems == 1 then
					doPlayerSendTextMessage(cid, 20, 'Your depot contains 1 item.')
					else
					doPlayerSendTextMessage(cid, 20, 'Your depot contains '.. depotitems ..' items.')
					end
				end
			end	
		end
    
if item.itemid == 446 or item.itemid == 416 or item.itemid == 3216 then
        doTransformItem(item.uid, item.itemid+1)
	 elseif item.itemid == 426 then
        doTransformItem(item.uid, 425)
    end
end
end

function onStepOut(cid, item, pos)
    if item.itemid == 447 or item.itemid == 417 or item.itemid == 3217 then
if item.actionid == 255 and item.uid == 1001 then
if getPlayerStorageValue(cid, 351) == 2 then
else
position = getPlayerPosition(cid)
newposition = {x = position.x+4, y = position.y, z = position.z}
doTeleportThing(cid, newposition)
doSendMagicEffect(newposition, 12)
end
end
        doTransformItem(item.uid, item.itemid-1)
		
	elseif item.itemid == 425 and item.uid == 1001 then	
	
	elseif item.itemid == 425 then
        doTransformItem(item.uid, 426)
    end
end
