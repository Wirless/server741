local BoxId = 2159
local Ladder = 1386
local LadderPos = {x=32478, y=31904, z=5, stackpos=1}

player4pos = {x=33073, y=32590, z=13, stackpos=253}
player4 = getThingfromPos(player4pos)
nplayer4pos = {x=33080, y=32588, z=13}

function onAddItem(moveitem, tileitem, pos)
	if moveitem.itemid == BoxId then
	doTeleportThing(player4.uid,nplayer4pos)
	end
	end

function onRemoveItem(moveitem, tileitem, pos)
	if moveitem.itemid == BoxId then
	doRemoveItem(GetThingFromPos({x=32478, y=31904, z=5, stackpos=1}).uid,1)
	end
	end