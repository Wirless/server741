
function onUse(cid, item, frompos, item2, topos, name, pos)
doSummonMonster(cid, "Demon")
doRemoveItem(item.uid, 1)
end