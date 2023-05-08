function onAddItem(moveitem, tileitem, pos)
if tileitem.actionid == 9928 then
PlayerPos = {x=32482, y=31906, z=7, stackpos=253}
GetPlayer = getThingfromPos(PlayerPos)
	StairPos = {x=32478, y=31902, z=7}
	GetStair = getTileItemById(StairPos, 1385)
	GetStone = getTileItemById(StairPos, 1304)

	--// Entrance Stair (Paradox Tower //--
    if moveitem.itemid == 2782 and tileitem.uid == 9928 and isPlayer(GetPlayer.uid) == TRUE then
	doTransformItem(GetStone.uid,1385)
	
	--// Entrance Stair (Paradox Tower //--
	elseif moveitem.itemid == 2781 and tileitem.uid == 9928 and getThingfromPos(StairPos).itemid == 1385 then 
	doTransformItem(GetStair.uid,1304)
	
	
	
	--// Ghoul Box (Paradox Tower //--
    elseif moveitem.itemid == 1739 and tileitem.uid == 9922 then	
	doCreateItem(1386,1,{x=32477, y=31904, z=5})
    elseif moveitem.itemid == 1739 and tileitem.uid == 8003 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)
		end	
    elseif moveitem.itemid == 1739 and tileitem.uid == 9915 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)
		end	
    elseif moveitem.itemid == 1739 and tileitem.uid == 9916 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)
		end	
    elseif moveitem.itemid == 1739 and tileitem.uid == 9917 then	
		if getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).itemid == 1386 then
		doRemoveItem(getThingfromPos({x=32477, y=31904, z=5, stackpos=1}).uid)
		end	
				
	
	end
end
return TRUE
end