function onUse(cid, item, frompos, item2, topos)
pos = getCreaturePosition(item2.uid)
getplayer = getThingfromPos(pos)
doPlayerAddMana(getplayer.uid, math.random(300, 600))
end
