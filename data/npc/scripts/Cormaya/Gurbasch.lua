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
 

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As should be quite obvious, I am operating a steamship."})
keywordHandler:addKeyword({'work'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As should be quite obvious, I am operating a steamship."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Gurbasch Firejuggler, son of the machine, of the Molten Rock."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia? Just don't ask."})
keywordHandler:addKeyword({'steamship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is indeed something we dwarfs may be proud of: a ship operating by steam power."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is indeed something we dwarfs may be proud of: a ship operating by steam power."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Captain"})
keywordHandler:addKeyword({'technomancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A technomancer wields power over incredible machines, as his knowledge is his magic."})
keywordHandler:addKeyword({'inventors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You know, elves may be intelligent, but they are too lazy to invent. Really."})
keywordHandler:addKeyword({'inventions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You know, elves may be intelligent, but they are too lazy to invent. Really."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a vendor."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a vendor."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, we ARE at Cormaya! Must be the cavemadness..."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, you got some? Nah, beer only tastes fine in Kazordoon. If you have brought it from there, it tastes foul now, I guess."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an old and proud race, although we posess the best inventions."})
keywordHandler:addKeyword({'brodrosch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is my brother working the Kazordoon steamship."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have one elf onboard a ship, and you are doomed."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have one elf onboard a ship, and you are doomed."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
pos = getPlayerPosition(cid)
	if(npcHandler.busyState ~= 0) and (npcHandler.focus ~= cid) then
		--Travel in hurry--
		if msgcontains(msg, "bring me to kazordoon") then
			Gurbaschbcprice = 160
			Gurbaschbcdestination = Steamkazordoon
			bcname = "Kazordoon"
			if (getTilePzInfo(pos) ~= TRUE) then
				if doPlayerRemoveMoney(cid, Gurbaschbcprice) == TRUE then
				doTeleportThing(cid, Gurbaschbcdestination)
				doSendMagicEffect(Gurbaschbcdestination, 10)
				npcHandler:say("Full steam ahead!", 1)
				TalkState(cid, 0)
				else
				npcHandler:say("You don't have enough money.", 1)
				TalkState(cid, 0)
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			TalkState(cid, 0)	
			end
		--End of Travel in hurry--
		end
	end
	
	if(npcHandler.focus ~= cid) then
		return false
	end
	
--Give Destination--
if msgcontains(msg, 'kazordoon') and npcHandler.focus == cid or msgcontains(msg, 'passage') and npcHandler.focus == cid then
	Gurbaschbcprice = 160
	Gurbaschbcdestination = Steamkazordoon
	bcname = "Kazordoon"
	npcHandler:say("Do you want to go to Kazordoon? And try the beer there? 160 gold?", 1)
	TalkState(cid, 9166)

--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 9166 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) ~= TRUE) then
		if doPlayerRemoveMoney(cid, Gurbaschbcprice) == TRUE then
		doTeleportThing(cid, Gurbaschbcdestination)
		doSendMagicEffect(Gurbaschbcdestination, 10)
		npcHandler:say("Full steam ahead!", 1)
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
