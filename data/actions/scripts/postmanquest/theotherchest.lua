
function onUse(cid, item)
if getPlayerStorageValue(cid,47095) <= 0 then
		doPlayerSendTextMessage(cid,22,"You have found a letter bag.")
		doPlayerAddItem(cid, 2330, 1)
		setPlayerStorageValue(cid,47095,1)
		else
doPlayerSendTextMessage(cid,22,"it's empty.")
	end
	end
	