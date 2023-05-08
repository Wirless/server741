
function onStepIn(cid, item, pos)
doTransformItem(item.uid,425)
    local stairs_pos = {x=32482, y=32170, z=14}
    if item.uid == 60099 and isPlayer(cid) == TRUE then
        doCreateItem(430,1,stairs_pos)
    end
    return true
end

function onStepOut(cid, item, pos)
doTransformItem(item.uid,426)
    local stairs_pos = {x=32482, y=32170, z=14, stackpos=1}
    local stairs = getThingfromPos(stairs_pos)
    if item.uid == 60099 and isPlayer(cid) == TRUE then              
    doRemoveItem(stairs.uid)
    end
    return true
end
