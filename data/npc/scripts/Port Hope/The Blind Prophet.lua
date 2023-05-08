dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me put name away name long ago. Now only blind prophet of ape people are."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me prophet and guardian is."})
keywordHandler:addKeyword({'prophet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me is who in dreams speak to holy banana. Me divine the will of banana."})
keywordHandler:addKeyword({'guardian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport."})
keywordHandler:addKeyword({'forbidden'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport."})
keywordHandler:addKeyword({'Hairycles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good ape he is. Has to work hard to make other apes listen but you helped a lot."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me not know. Me seldom have visions of not banana related objects."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our people a lot to learn have. One day we might live in peace with you hairless apes, who knows."})
keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hairless apes strange people are."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards evil and vengeful are. Ape people on guard must be."})
keywordHandler:addKeyword({'hair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me visions show hair in the far north west of forbidden land. Near coast look for signs of Bongs presence."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
pos = getPlayerPosition(cid)	
--Give Destination--
if msgcontains(msg, 'transport') and npcHandler.focus == cid then
	bcprice = 0
	bcdestination = {x=33026, y=32580, z=6}
	bcname = "forbidden lands"
	npcHandler:say("You want me to transport you to forbidden land?", 1)
	theblindprophet_talk_state = 9166

--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif theblindprophet_talk_state == 9166 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
		npcHandler:say("Take care!", 1)
		theblindprophet_talk_state = 0
		else
		npcHandler:say("You don't have enough money.", 1)
		theblindprophet_talk_state = 0
		end
--End of the System that does the job after confirm destination--
	
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
