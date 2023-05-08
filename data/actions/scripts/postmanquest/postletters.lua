function onUse(cid, item, fromPosition, itemEx, toPosition)

local mailuid = 9121
local storage = 250
local getstorage = getPlayerStorageValue(cid, storage)

	if(itemEx.itemid == 2593 and itemEx.uid == mailuid and getstorage == 39) then
		doSendMagicEffect(toPosition, 14)
		setPlayerStorageValue(cid, storage, 41)
		doPlayerRemoveItem(cid, 2330, 1)
		return true
	end
	
end