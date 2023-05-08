
local teleportin = {x="32343", y="32223", z="7"}

function onUse(cid, item, frompos, item2, topos)

		doTeleportThing(cid, teleportin)
		doSendMagicEffect(getThingPos(cid), 13)
		doPlayerSendTextMessage(cid, 22, "thanks for supporting the server")



		
	return true
end