-- 10544 = PoI Arcane Staff.
-- 10545 = PoI Epee.
-- 10546 = PoI Crystal Arrow.
-- 10547 = PoI Soft Boots.
-- 10548 = PoI BackPack of Holding.
-- 10549 = PoI Panda Bear.
-- 10550 = PoI Frozen Starlight.
-- 10551 = PoI Ornamented Ankh
-- 10552 = Holy Tible

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10544 then
if getPlayerStorageValue(cid,10544) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have chosen a avenger.")
 	doPlayerAddItem(cid,5755,1)
 	setPlayerStorageValue(cid,10544,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
 
	elseif item.uid == 10545 then
if getPlayerStorageValue(cid,10545) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have chosen a a pair of Soft Boots.")
 	doPlayerAddItem(cid,2358,1)
 	setPlayerStorageValue(cid,10545,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
 
 	elseif item.uid == 10546 then
if getPlayerStorageValue(cid,10546) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have chosen a arbalest.")
 	doPlayerAddItem(cid,5754,1)
 	setPlayerStorageValue(cid,10546,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
 
	elseif item.uid == 10547 then
if getPlayerStorageValue(cid,10547) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found 15 crystal coins.")
 	doPlayerAddItem(cid,2160,15)
 	setPlayerStorageValue(cid,10547,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end

	elseif item.uid == 10548 then
if getPlayerStorageValue(cid,10548) == -1 then
	doPlayerSendTextMessage(cid,22,"You have found a frozen starlight.")
 	doPlayerAddItem(cid,2361,1)
 	setPlayerStorageValue(cid,10548,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end


	elseif item.uid == 10549 then
if getPlayerStorageValue(cid,10549) == -1 then
	doPlayerSendTextMessage(cid,22,"You have found a backpack of holding.")
 	doPlayerAddItem(cid,6338,1)
 	setPlayerStorageValue(cid,10549,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
	elseif item.uid == 10550 then
if getPlayerStorageValue(cid,10550) == -1 then
	doPlayerSendTextMessage(cid,22,"You have found a stuffed dragon.")
 	doPlayerAddItem(cid,6433,1)
 	setPlayerStorageValue(cid,10550,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
 
 	elseif item.uid == 10551 then
if getPlayerStorageValue(cid,10551) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a war backpack.")
 	doPlayerAddItem(cid,5954,1)
 	setPlayerStorageValue(cid,10551,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
	elseif item.uid == 10552 then
 
if getPlayerStorageValue(cid,10552) == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found the Holy Tible.")
 	local book = doPlayerAddItem(cid,1970,1)
 	doSetItemText(book,"Banor I praise your name.\nBe with me in the battle.\nBe my shield, let me be your sword.\nI will honour the godly spark in my soul. May it flourish and grow.")
 	setPlayerStorageValue(cid,10552,1)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end

end
return TRUE
end