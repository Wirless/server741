function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local miss = getPlayerStorageValue(cid, 366666) + 1
	local hit = getPlayerStorageValue(cid, 355555) + 1
	local creaturehit = getPlayerStorageValue(cid, 344444) + 1
	local playername = getCreatureName(cid)
	if(isPlayer(itemEx.uid)) then
		print("".. playername.." Healed with uh ".. getCreatureName(itemEx.uid) .."")
		setPlayerStorageValue(cid, 355555, hit)
		elseif(isCreature(itemEx.uid)) then
			setPlayerStorageValue(cid, 344444, creaturehit)
			print("".. playername.." Healed with uh ".. getCreatureName(itemEx.uid) .."")
		else
			setPlayerStorageValue(cid, 366666, miss)
			print("".. playername.." MISSED UH")
		end
	return combat
	end



