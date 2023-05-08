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
 

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dalbrect Windtrouser, of the once proud windtrouser family."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble legacy."})
keywordHandler:addKeyword({'capt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble legacy."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})
keywordHandler:addKeyword({'legacy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'famil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'nobi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'fate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'poverty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'project'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only sailed to the isle of the kings once or twice. I dare not anger the monks by bringing travellers there without their permission."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think my family used to belong to the local nobility! And now those arrogant women are in charge!"})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only isle I visit regularly is the isle of the kings. I bring food and the occasional visitor to the monastery."})
keywordHandler:addKeyword({'monastery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The monks are not exactly fond of visitors, so I rarely take somebody there without their permission."})
keywordHandler:addKeyword({'white raven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think that is the name both of the monastery and of the monks' order."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
pos = getPlayerPosition(cid)

if msgcontains(msg, 'passage') and npcHandler.focus == cid then
	Dalbrectbcprice = 10
	Dalbrectbcdestination = Boatisleofkings
	bcname = "Isle of Kings"
	npcHandler:say("Since you are my friend now I will sail you to the isle of the kings for 10 gold. Is that okay for you?", 1)
	TalkState(cid, 94986)
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94986 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Dalbrectbcprice) == TRUE then
		doTeleportThing(cid, Dalbrectbcdestination)
		doSendMagicEffect(Dalbrectbcdestination, 10)
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
