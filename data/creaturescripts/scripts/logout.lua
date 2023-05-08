function onLogout(cid)
	if getCreatureStorage(cid,34506) <= 0 then
		doRemoveCondition(cid, CONDITION_REGENERATION)
		doCreatureSetStorage(cid,34506,1)
	end
	return true
end