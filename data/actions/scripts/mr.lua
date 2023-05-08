function onUse(cid, item, fromPosition, itemEx, toPosition)
local addpoints = 1 -- amount of points to add
local ilemammany = getCreatureMana(cid)

local nowamana = ilemammany+200
doCreatureAddMana(cid, nowamana)

print(ilemammany)
print(nowamana)
doPlayerSendTextMessage(cid,22,"You just used mana booster!")
doRemoveItem(item.uid, 1)
return true
end

