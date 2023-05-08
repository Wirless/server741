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
 

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of the Poodle, the proudest ship on all oceans."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's Charles."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His majesty himself was present at the day the Poodle was launched."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a fascinating forest, full of exotic life. If it weren't for my duties, I would spend some time just exploring this jungle."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We live in a fascinating world with even more fascinating oceans. And all its major harbours are known to me."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An inland town of dwarves, somewhere in the middle of nowhere."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's fun to see a seasoned dwarven fighter turnining into a shivering green something as soon as we get a mild breeze on sea."})
keywordHandler:addKeyword({'dwarfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's fun to see a seasoned dwarven fighter turnining into a shivering green something as soon as we get a mild breeze on sea."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My visits there were interesting and I learnt a lot about the elves and their city. I can only recommend a visit there and if it is only to admire the amazing architectural style in which the city was built."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are very special creatures. They keep in touch with nature almost like druids. Although I don't really understand their way of life, I think we could learn one or two things of them."})
keywordHandler:addKeyword({'elfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are very special creatures. They keep in touch with nature almost like druids. Although I don't really understand their way of life, I think we could learn one or two things of them."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sailed around the whole continent once and I have seen many of its wonders. For sure there are more waiting to be discovered."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is that for the land what giant sea serpents are for the sea."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You better ask some knight about it."})
keywordHandler:addKeyword({'apes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to catch a living exemplar and bring it to Thais so the king could see it."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They have a small settlement in the southeast of the jungle next to the coast. It looks somewhat primitive but there is evidence it was erected only recently."})
keywordHandler:addKeyword({'dworcs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They attacked us when we set our feet on the south shore of the continent. They are poison using savages, nothing more."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Darashia, Ankrahmun, Venore or Edron?"})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)

pos = getPlayerPosition(cid)
if(npcHandler.busyState ~= 0) and (npcHandler.focus ~= cid) then
		--Travel in hurry--
		if msgcontains(msg, "bring me to thais") then
			Charlesbcprice = 160
			Charlesbcdestination = Boatthais
			bcname = "Thais"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
				doTeleportThing(cid, Charlesbcdestination)
				doSendMagicEffect(Charlesbcdestination, 10)
				npcHandler:say("Set the sails!", 1)
				charles_talk_state = 0
				else
				npcHandler:say("You don't have enough money.", 1)
				charles_talk_state = 0
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			charles_talk_state = 0	
			end
		elseif msgcontains(msg, "bring me to darashia") then
			Charlesbcprice = 180
			Charlesbcdestination = Boatdarashia
			bcname = "Darashia"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
				doTeleportThing(cid, Charlesbcdestination)
				doSendMagicEffect(Charlesbcdestination, 10)
				npcHandler:say("Set the sails!", 1)
				charles_talk_state = 0
				else
				npcHandler:say("You don't have enough money.", 1)
				charles_talk_state = 0
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			charles_talk_state = 0	
			end
		elseif msgcontains(msg, "bring me to edron") then
			Charlesbcprice = 150
			Charlesbcdestination = Boatedron
			bcname = "Edron"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
				doTeleportThing(cid, Charlesbcdestination)
				doSendMagicEffect(Charlesbcdestination, 10)
				npcHandler:say("Set the sails!", 1)
				charles_talk_state = 0
				else
				npcHandler:say("You don't have enough money.", 1)
				charles_talk_state = 0
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			charles_talk_state = 0	
			end
		elseif msgcontains(msg, "bring me to venore") then
			Charlesbcprice = 160
			Charlesbcdestination = Boatvenore
			bcname = "Venore"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
				doTeleportThing(cid, Charlesbcdestination)
				doSendMagicEffect(Charlesbcdestination, 10)
				npcHandler:say("Set the sails!", 1)
				charles_talk_state = 0
				else
				npcHandler:say("You don't have enough money.", 1)
				charles_talk_state = 0
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			charles_talk_state = 0	
			end
		elseif msgcontains(msg, "bring me to ankrahmun") then
			Charlesbcprice = 110
			Charlesbcdestination = Boatankrahmun
			bcname = "Ankrahmun"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
				doTeleportThing(cid, Charlesbcdestination)
				doSendMagicEffect(Charlesbcdestination, 10)
				npcHandler:say("Set the sails!", 1)
				charles_talk_state = 0
				else
				npcHandler:say("You don't have enough money.", 1)
				charles_talk_state = 0
				end
			else
			npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
			charles_talk_state = 0	
			end
		--End of Travel in hurry--
	end
	
	if(npcHandler.focus ~= cid) then
		return false
	end
	
--Give Destination--
elseif msgcontains(msg, 'thais') and npcHandler.focus == cid then
	Charlesbcprice = 160
	Charlesbcdestination = Boatthais
	bcname = "Thais"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Charlesbcprice .." gold?", 1)
	charles_talk_state = 9166
	
elseif msgcontains(msg, "darashia") and npcHandler.focus == cid then
	Charlesbcprice = 180
	Charlesbcdestination = Boatdarashia
	bcname = "Darashia"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Charlesbcprice .." gold?", 1)
	charles_talk_state = 9166

elseif msgcontains(msg, "edron") and npcHandler.focus == cid then
	Charlesbcprice = 150
	Charlesbcdestination = Boatedron
	bcname = "Edron"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Charlesbcprice .." gold?", 1)
	charles_talk_state = 9166

elseif msgcontains(msg, "venore") and npcHandler.focus == cid then
	Charlesbcprice = 160
	Charlesbcdestination = Boatvenore
	bcname = "Venore"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Charlesbcprice .." gold?", 1)
	charles_talk_state = 9166

elseif msgcontains(msg, "ankrahmun") and npcHandler.focus == cid then
	Charlesbcprice = 110
	Charlesbcdestination = Boatankrahmun
	bcname = "Ankrahmun"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Charlesbcprice .." gold?", 1)
	charles_talk_state = 9166
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif charles_talk_state == 9166 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Charlesbcprice) == TRUE then
		doTeleportThing(cid, Charlesbcdestination)
		doSendMagicEffect(Charlesbcdestination, 10)
		npcHandler:say("Set the sails!", 1)
		charles_talk_state = 0
		else
		npcHandler:say("You don't have enough money.", 1)
		charles_talk_state = 0
		end
	else
	npcHandler:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", 1)
	charles_talk_state = 0	
	end
--End of the System that does the job after confirm destination--
	

elseif msgcontains(msg, 'major') and npcHandler.focus == cid or msgcontains(msg, 'harbour') and npcHandler.focus == cid then
		npcHandler:say("Well the harbours of thais, venore, carlin, edron, darashia and ankrahmun. Do you have any questions about one of those harbours?", 1)
		charles_talk_state = 921

elseif charles_talk_state == 921 and msgcontains(msg, 'venore') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("The Venorans build fine ships. Enough said about them.", 1)
		charles_talk_state = 0		
elseif charles_talk_state == 921 and msgcontains(msg, 'thais') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("Thais is the proud capital of the largest kingdom in the known world.", 1)
		charles_talk_state = 0
elseif charles_talk_state == 921 and msgcontains(msg, 'carlin') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("Rebellious women might be amusing for a while, but it is time for them to stop this nonsense and return to the kingdom.", 1)
		charles_talk_state = 0
elseif charles_talk_state == 921 and msgcontains(msg, 'edron') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("The coastline of Edron is treacherous and it takes some skills to sail a ship safely into the harbour.", 1)
		charles_talk_state = 0
elseif charles_talk_state == 921 and msgcontains(msg, 'darashia') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("An unremarkable little town with a small harbour and quiet people.", 1)
		charles_talk_state = 0
elseif charles_talk_state == 921 and msgcontains(msg, 'ankrahmun') and npcHandler.focus == cid and npcHandler.focus == cid then
		npcHandler:say("The city is surely worth a look although its inhabitants are somewhat strange and their customs oddish.", 1)
		charles_talk_state = 0		
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
