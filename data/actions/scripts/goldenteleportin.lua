local teleportin = {x="32340", y="32222", z="13"}

function onUse(cid, item, frompos, item2, topos)
	if getGoldenAccountDays(cid) > 0 then
		doTeleportThing(cid, teleportin)
		doSendMagicEffect(getThingPos(cid), 13)
		doPlayerSendTextMessage(cid, 22, "safe djinn.")
	else
		doPlayerSendTextMessage(cid, 22, "Golden account only.")
	end
		
	return true
end