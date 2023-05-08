dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm m ol' Captain Jack."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I work as a kind of ferryman. I transport wares and travellers for the monks."})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I work as a kind of ferryman. I transport wares and travellers for the monks."})
keywordHandler:addKeyword({'capt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I work as a kind of ferryman. I transport wares and travellers for the monks."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All right she's small. But she's a real beauty, don't you think?"})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All right she's small. But she's a real beauty, don't you think?"})
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They always need provisions from the cities, and they sell their wine there."})
keywordHandler:addKeyword({'traveller'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes pilgrims come to this place. And now and then a monk leaves the monastery for some time."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "For some obscure political reason the monks never sail to Carlin or Thais directly."})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the isle of the kings. All the great Tibian leaders have found their final rest here under the monastery."})
keywordHandler:addKeyword({'monastery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The white raven monastery is a place of wisdom and contemplation, or so the monks say. Sounds like a pretty boring place to me! HAR HAR!"})
keywordHandler:addKeyword({'monk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The order of the white raven."})
keywordHandler:addKeyword({'white rav'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I prefer parrots. And monkeys! And snakes! HAR! HAR!"})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
pos = getPlayerPosition(cid)

if msgcontains(msg, 'continent') and npcHandler.focus == cid or msgcontains(msg, 'passage') and npcHandler.focus == cid then
	CapJackbcprice = 10
	CapJackbcdestination = {x=32205, y=31756, z=7}
	bcname = "Isle of Kings"
	npcHandler:say("Tibia is the main continent. Do you want a passage to the continent for 10 gold?", 1)
	TalkState(cid, 94986)
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94986 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, CapJackbcprice) == TRUE then
		doTeleportThing(cid, CapJackbcdestination)
		doSendMagicEffect(CapJackbcdestination, 10)
		npcHandler:say("Have a nice trip!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of the System that does the job after confirm destination--
	
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
