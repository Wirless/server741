
function onUse(cid, item)
if getPlayerStorageValue(cid,47099) <= 0 then
		doPlayerSendTextMessage(cid,22,"You have found a present.")
		doPlayerAddItem(cid, 1990, 1)
		setPlayerStorageValue(cid,47099,1)
		setPlayerStorageValue(cid, 250, 11)
		else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
	end
	