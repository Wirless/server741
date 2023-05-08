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
 

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look at my blackened beard? I'm the steamship captain!"})
keywordHandler:addKeyword({'work'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look at my blackened beard? I'm the steamship captain!"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Brodrosch Steamtrousers, son of the machine, of the Molten Rock."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia? Just don't ask."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a great ship. Ha! It works without wind but with fire, and it travels not on the ocean but beneath the earth!"})
keywordHandler:addKeyword({'steamship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a great ship. Ha! It works without wind but with fire, and it travels not on the ocean but beneath the earth!"})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Of course, I am the captain. But I am also a technomancer."})
keywordHandler:addKeyword({'technomancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Being a technomancer is a privilege few dwarfs have. We form earth and fire through powerful technology into tools. Also, we are great inventors."})
keywordHandler:addKeyword({'inventors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes. There could have been thousands of our inventions, if they wouldn't explode all the time..."})
keywordHandler:addKeyword({'inventions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes. There could have been thousands of our inventions, if they wouldn't explode all the time..."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is not a shop, damn it!"})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is not a shop, damn it!"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is a steamship that travels only subterreneanly. No way to get on that risky ocean. Kazordoon - Cormaya only."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, we ARE at Kazordoon! Must be the cavemadness..."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes being drunk means seeing two rivers. I survive by steering right between them."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Deep inside, we're all dwarfs."})
keywordHandler:addKeyword({'gurbasch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, my brother in Cormaya. He can take you back."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
pos = getPlayerPosition(cid)
	if(npcHandler.busyState ~= 0) and (npcHandler.focus ~= cid) then
		--Travel in hurry--
		if msgcontains(msg, "bring me to cormaya") then
			Brodroschbcprice = 160
			Brodroschbcdestination = Steamcormaya
			bcname = "Cormaya"
			if (getTilePzInfo(pos) ~= TRUE) then
				if doPlayerRemoveMoney(cid, Brodroschbcprice) == TRUE then
				doTeleportThing(cid, Brodroschbcdestination)
				doSendMagicEffect(Brodroschbcdestination, 10)
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
if msgcontains(msg, 'cormaya') and npcHandler.focus == cid or msgcontains(msg, 'passage') and npcHandler.focus == cid then
	Brodroschbcprice = 160
	Brodroschbcdestination = Steamcormaya
	bcname = "Cormaya"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Brodroschbcprice .." gold?", 1)
					setPlayerStorageValue(cid, 251, 1)
				setPlayerStorageValue(cid, 252, 1)
				setPlayerStorageValue(cid, 253, 1)
				setPlayerStorageValue(cid, 254, 1)
	TalkState(cid, 94993)


--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94993 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) ~= TRUE) then
		if doPlayerRemoveMoney(cid, Brodroschbcprice) == TRUE then
		doTeleportThing(cid, Brodroschbcdestination)
		doSendMagicEffect(Brodroschbcdestination, 10)
		if(getPlayerStorageValue(cid, 250) == 1 and getPlayerStorageValue(cid, 300) == 10 and getPlayerStorageValue(cid, 254) <= 1) then
		setPlayerStorageValue(cid, 254, 1)
		end
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
