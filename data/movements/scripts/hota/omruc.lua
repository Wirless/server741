function onStepIn(cid, item, pos, topos)
	--//HOTA TOMBS Omruc's cave//--
	if(item.actionid == 9230) then
		doTeleportThing(cid,{x=33025, y=32872, z=8})
		doSendMagicEffect({x=33025, y=32872, z=8}, 15)
	end

	return TRUE
end