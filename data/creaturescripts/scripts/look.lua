function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) then
	doPlayerSetSpecialDescription(thing.uid, "\n Hit:" .. getPlayerStorageValue(thing.uid, 255555) .. " Miss: " .. getPlayerStorageValue(thing.uid, 266666) .. ".")
	print("".. getCreatureName(cid) .." is looking at " .. getCreatureName(thing.uid) .."")
	return true
	else
	return(getItemDescriptions(thing.uid))
	end
end