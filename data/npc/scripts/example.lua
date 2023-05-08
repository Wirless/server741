dofile(getDataDir() .. 'global/greeting.lua')
dofile(getDataDir() .. 'global/boat destination.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
	if getPlayerSex(cid) == 1 then
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir ".. getPlayerName(cid) ..".")
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Madam ".. getPlayerName(cid) ..".")
	return true
	end	
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 

keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})


function creatureSayCallback(cid, type, msg)
pos = getPlayerPosition(cid)
--Travel in hurry--
if msgcontains(msg, "bring me to carlin") then
	bcprice = 110
	bcdestination = Boatcarlin
	bcname = "Carlin"
	if (getTilePzInfo(pos) == TRUE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
		selfSay("Set the sails!")
		talk_state = 0
		else
		selfSay("You don't have enough money.")
		talk_state = 0
		end
	else
	selfSay("If you want to travel with the boat you have to stand in it! else you'll just fall off!")
	talk_state = 0	
	end
--End of Travel in hurry--
	
--Give Destination--
elseif msgcontains(msg, 'carlin') and npcHandler.focus == cid then
	bcprice = 110
	bcdestination = Boatcarlin
	bcname = "Carlin"
	selfSay("Do you seek a passage to ".. bcname .." for ".. bcprice .." gold?")
	talk_state = 9166
	
elseif msgcontains(msg, "ab'dendriel") and npcHandler.focus == cid then
	bcprice = 130
	bcdestination = Boatabdendriel
	bcname = "Ab'Dendriel"
	selfSay("Do you seek a passage to ".. bcname .." for ".. bcprice .." gold?")
	talk_state = 9166

--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif talk_state == 9166 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == TRUE) then
		if doPlayerRemoveMoney(cid, bcprice) == TRUE then
		doTeleportThing(cid, bcdestination)
		doSendMagicEffect(bcdestination, 10)
		selfSay("Set the sails!")
		talk_state = 0
		else
		selfSay("You don't have enough money.")
		talk_state = 0
		end
	else
	selfSay("If you want to travel with the boat you have to stand in it! else you'll just fall off!")
	talk_state = 0	
	end
--End of the System that does the job after confirm destination--
	
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())