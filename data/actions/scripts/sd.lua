function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local miss = getPlayerStorageValue(cid, 266666) + 1
	local hit = getPlayerStorageValue(cid, 255555) + 1
	local creaturehit = getPlayerStorageValue(cid, 244444) + 1
	local playername = getCreatureName(cid)
	if(isPlayer(itemEx.uid)) then
		print("".. playername.." hit sd into ".. getCreatureName(itemEx.uid) .."")
		setPlayerStorageValue(cid, 255555, hit)
		elseif(isCreature(itemEx.uid)) then
			setPlayerStorageValue(cid, 244444, creaturehit)
			print("".. playername.." hit sd into ".. getCreatureName(itemEx.uid) .."")
		else
			setPlayerStorageValue(cid, 266666, miss)
			print("".. playername.." MISSED")
		end
	return combat
	end



