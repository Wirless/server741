
function onUse(cid, item)
if getPlayerStorageValue(cid,909005) <= 0 then
		doPlayerSendTextMessage(cid,22,"You have found a tear of daraman.")
		doPlayerAddItem(cid, 2346, 1)
		setPlayerStorageValue(cid,909005,1)
		doSendMagicEffect(pos,1)
		else

	end
	end
	