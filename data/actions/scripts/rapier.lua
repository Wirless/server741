function onUse(cid, item, frompos, item2, topos)

  if getPlayerStorageValue(cid,7023) == -1 then
doPlayerAddItem(cid, Cfrapier, 1)
setPlayerStorageValue(cid,7023,1)
else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
end