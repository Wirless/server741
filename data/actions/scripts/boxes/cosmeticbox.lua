	function makeffectszz(cid)
doSendAnimatedText(getPlayerPosition(cid), "CARPET BOX", TEXTCOLOR_YELLOW)
doSendMagicEffect(getPlayerPosition(cid),  math.random(27,30))
end
	
local function faz(cid)
doSendAnimatedText(getPlayerPosition(cid), "CARPET BOX", TEXTCOLOR_YELLOW)
doSendMagicEffect(getPlayerPosition(cid), 83)
end	

function onUse(cid, item, fromPosition, itemEx, toPosition)

local costmeticboxstorage = getPlayerStorageValue(cid, 7143) + 1 
print(generuj)
setPlayerStorageValue(cid, 7143, cosmeticboxstorage)
doRemoveItem(item.uid, 1)	
addEvent(faz, 500, cid)
addEvent(faz, 1500, cid)
addEvent(faz, 2500, cid)
addEvent(faz, 3500, cid)
makeffectszz(cid)
	
			backpack = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(backpack, math.random(7101,7125), math.random(1,20))
			doSendAnimatedText(getPlayerPosition(cid),"LOL!", TEXTCOLOR_YELLOW)
			doSendMagicEffect(getPlayerPosition(cid), 83)




end









