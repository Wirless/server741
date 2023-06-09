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
 

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Uzon Ibn Kalith."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed Darashian carpetpilot. I can bring you to Darashia or Edron."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there is so much to tell about Daraman. You better travel to Darama to learn about his teachings."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would never transport this one."})
keywordHandler:addKeyword({'derfia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So you heared about haunted Drefia? Many adventures travel there to test their skills against the undead: vampires, mummies, and ghosts."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some people claim it is hidden somewhere under the endless sands of the devourer desert in Darama."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is noisy and overcroweded. That's why I like Darashia more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen almost every place on the continent."})
keywordHandler:addKeyword({'continent'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I could retell the tales of my travels for hours. Sadly another flight is scheduled soon."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just another Thais but with women to lead them."})
keywordHandler:addKeyword({'flying'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy flying carpets only in Darashia."})
keywordHandler:addKeyword({'fly'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I transport travellers to the continent of Darama for a small fee. So many want to see the wonders of the desert and learn the secrets of Darama."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'rumors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
pos = getPlayerPosition(cid)
--Travel in hurry--
if msgcontains(msg, "bring me to darashia") then
	Uzonbcprice = 60
	Uzonbcdestination = Carpetdarashia
	bcname = "Darashia"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Uzonbcprice) == TRUE then
		doTeleportThing(cid, Uzonbcdestination)
		doSendMagicEffect(Uzonbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand in it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
elseif msgcontains(msg, "bring me to edron") then
	Uzonbcprice = 60
	Uzonbcdestination = Carpetedron
	bcname = "Edron"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Uzonbcprice) == TRUE then
		doTeleportThing(cid, Uzonbcdestination)
		doSendMagicEffect(Uzonbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand in it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of Travel in hurry--
	
--Give Destination--
elseif msgcontains(msg, 'darashia') and npcHandler.focus == cid then
	Uzonbcprice = 60
	Uzonbcdestination = Carpetdarashia
	bcname = "Darashia"
	npcHandler:say("Do you want to get a ride to Darashia on Darama for 60 gold?", 1)
	TalkState(cid, 94992)
	
elseif msgcontains(msg, "edron") and npcHandler.focus == cid then
	Uzonbcprice = 60
	Uzonbcdestination = Carpetedron
	bcname = "Edron"
	npcHandler:say("Do you want to get a ride to Edron for 60 gold?", 1)
	TalkState(cid, 94993)
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94992 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Uzonbcprice) == TRUE then
		doTeleportThing(cid, Uzonbcdestination)
		doSendMagicEffect(Uzonbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand in it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
	
elseif GetTalkState(cid) == 94993 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Uzonbcprice) == TRUE then
		doTeleportThing(cid, Uzonbcdestination)
		doSendMagicEffect(Uzonbcdestination, 10)
		if(getPlayerStorageValue(cid, 250) == 1 and getPlayerStorageValue(cid, 252) <= 1) then
		setPlayerStorageValue(cid, 252, 1)
		end
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand in it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of the System that does the job after confirm destination--
	
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
