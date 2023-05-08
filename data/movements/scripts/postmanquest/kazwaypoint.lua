function onStepIn(cid, item, pos)
	if(not isPlayer(cid)) then
		return true
	end
	
	if(getPlayerStorageValue(cid, 250) == 1) then
		if item.aid == 9100 and getPlayerStorageValue(cid,300) <= 0 then
			setPlayerStorageValue(cid, 300, 1) --Set Kazordoon Waypoint 1
		elseif item.aid == 9101 and getPlayerStorageValue(cid,300) == 1 then
			setPlayerStorageValue(cid, 300, 2) --Set Kazordoon Waypoint 2
		elseif item.aid == 9102 and getPlayerStorageValue(cid,300) == 2 then
			setPlayerStorageValue(cid, 300, 3) --Set Kazordoon Waypoint 3
		elseif item.aid == 9103 and getPlayerStorageValue(cid,300) == 3 then
			setPlayerStorageValue(cid, 300, 4) --Set Kazordoon Waypoint 4
		elseif item.aid == 9104 and getPlayerStorageValue(cid,300) == 4 then
			setPlayerStorageValue(cid, 300, 5) --Set Kazordoon Waypoint 5
		elseif item.aid == 9105 and getPlayerStorageValue(cid,300) == 5 then
			setPlayerStorageValue(cid, 300, 6) --Set Kazordoon Waypoint 6
		elseif item.aid == 9106 and getPlayerStorageValue(cid,300) == 6 then
			setPlayerStorageValue(cid, 300, 7) --Set Kazordoon Waypoint 7
		elseif item.aid == 9107 and getPlayerStorageValue(cid,300) == 7 then
			setPlayerStorageValue(cid, 300, 8) --Set Kazordoon Waypoint 8
		elseif item.aid == 9108 and getPlayerStorageValue(cid,300) == 8 then
			setPlayerStorageValue(cid, 300, 9) --Set Kazordoon Waypoint 9
		elseif item.aid == 9109 and getPlayerStorageValue(cid,300) == 9 then
			setPlayerStorageValue(cid, 300, 10) --Set Kazordoon Waypoint 10
		end
	end

end