
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerItemCount(cid, 6507) >= 1  then
		doRemoveItem(item.uid, 1)
		doPlayerAddItem(cid, 5971,2)
		else
		doPlayerSendCancel(cid, "Sorry not possible")
		end
		end
