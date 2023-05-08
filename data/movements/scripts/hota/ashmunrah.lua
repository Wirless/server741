function onStepIn(cid, item, pos, topos)
--//HOTA TOMBS Ashmunrah cave//--
	if(item.actionid == 9231) then
		doTeleportThing(cid,{x=33159, y=32838, z=8})
		doSendMagicEffect({x=33159, y=32838, z=8}, 15)
	end

	return TRUE
end