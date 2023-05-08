function onThink(cid)
	if isCreature(cid) then
		local target = getCreatureTarget(cid)
		if(target ~= 0 and not isPlayer(target)) then
			doRemoveCreature(target)
		end
	end
	return true
end