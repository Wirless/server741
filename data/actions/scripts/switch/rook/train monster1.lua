function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32088, y=32149, z=10, stackpos=1}
getgate = getThingfromPos(gatepos)
dumppos = {x=32088, y=32150, z=10}

if item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
BridgeRelocate(gatepos, dumppos)
doCreateItem(1037,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end