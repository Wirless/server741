dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local bciceona = {x="32146", y="31336",z="7"}

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
	if getPlayerSex(cid) == 1 then
	npcHandler:setMessage(MESSAGE_GREET, "Ahoi, young man ".. getPlayerName(cid) .." and welcome to the Nordic Tibia Ferries.")
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Ahoi, young lady ".. getPlayerName(cid) .." and welcome to the Nordic Tibia Ferries.")
	return true
	end	
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Nielson from the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'anderson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'svenson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'carlson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'nielson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'water'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board our ferries."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, Vega and iceona and back to Tibia."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, Vega and iceona and back to Tibia."})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, Vega and iceona and back to Tibia."})
keywordHandler:addKeyword({'round'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The fee for the trip back to Tibia is included."})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda and Vega, and back to Tibia."})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda and Vega, and back to Tibia."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is Tibia, the continent."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
pos = getPlayerPosition(cid)
--Travel in hurry--
if msgcontains(msg, "bring me to senja") then
	bcprice = 20
	bcdestination = Ferrysenja
	bcname = "Senja"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
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
elseif msgcontains(msg, "bring me to folda") then
	bcprice = 20
	bcdestination = Ferryfolda
	bcname = "Folda"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
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
elseif msgcontains(msg, "bring me to vega") then
	bcprice = 20
	bcdestination = Ferryvega
	bcname = "Vega"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
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
--End of Travel in hurry--
	
--Give Destination--
elseif msgcontains(msg, 'senja') and npcHandler.focus == cid then
	bcprice = 20
	bcdestination = Ferrysenja
	bcname = "Senja"
	npcHandler:say("Do you want a round-trip passage to ".. bcname .." for ".. bcprice .." gold?", 1)
	TalkState(cid, 9166)
	
elseif msgcontains(msg, "folda") and npcHandler.focus == cid then
	bcprice = 20
	bcdestination = Ferryfolda
	bcname = "Folda"
	npcHandler:say("Do you want a round-trip passage to ".. bcname .." for ".. bcprice .." gold?", 1)
	TalkState(cid, 9166)
	
elseif msgcontains(msg, "vega") and npcHandler.focus == cid then
	bcprice = 20
	bcdestination = Ferryvega
	bcname = "Vega"
	npcHandler:say("Do you want a round-trip passage to ".. bcname .." for ".. bcprice .." gold?", 1)
	TalkState(cid, 9166)
	
elseif msgcontains(msg, "iceona") and npcHandler.focus == cid then
	bcprice = 20
	bcdestination = bciceona
	bcname = "Iceona"
	npcHandler:say("Do you want a round-trip passage to ".. bcname .." for ".. bcprice .." gold?", 1)
	TalkState(cid, 9166)

--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 9166 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
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
