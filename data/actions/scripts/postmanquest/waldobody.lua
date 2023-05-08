
function onUse(cid, item)
if getPlayerStorageValue(cid,47096) <= 0 then
		doPlayerSendTextMessage(cid,22,"You have found a waldo post horn.")
		doPlayerAddItem(cid, 2332, 1)
		setPlayerStorageValue(cid,47096,1)
		setPlayerStorageValue(cid, 250, 36)
		else
	doPlayerSendTextMessage(cid,22,"it's empty.")
	end
	end
	