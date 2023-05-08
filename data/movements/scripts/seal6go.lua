function onStepIn(cid, item, pos, fromPos)
 
	food1 = {x=32173, y=31871, z=15}
	food2 = {x=32180, y=31871, z=15}
	door6 = 63595
 
 
if getTileItemById(food1, 2143).itemid >= 1 and getTileItemById(food2, 2144).itemid >= 1 then
                doSendMagicEffect(getCreaturePosition(cid), 10)
                doRemoveItem(getTileItemById(food1, 2143).uid,1)
                doRemoveItem(getTileItemById(food2, 2144).uid,1)
				setPlayerStorageValue(cid, door6, 1)
				doTeleportThing(cid, {x=32272, y=31849, z=15})
				doPlayerSendTextMessage(cid,22,"You have finished the seal of plague")
				
		else
		doTeleportThing(cid, {x=32176, y=31870, z=15})
                doSendMagicEffect(getCreaturePosition(cid), 10)
		end
		end