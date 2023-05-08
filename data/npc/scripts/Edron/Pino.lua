dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
pos = getPlayerPosition(cid)
	if(npcHandler.busyState ~= 0) and (npcHandler.focus ~= cid) then
		--Travel in hurry--
		if msgcontains(msg, "bring me to femor") or msgcontains(msg, "bring me to hill") then
			Pinobcprice = 60
			Pinobcdestination = Carpethills
			bcname = "Femor Hills"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Pinobcprice) == TRUE then
				doTeleportThing(cid, Pinobcdestination)
				doSendMagicEffect(Pinobcdestination, 10)
				npcHandler:say("Hold on!", 1)
				TalkState(cid, 0)
				else
				npcHandler:say("You don't have enough money.", 1)
				TalkState(cid, 0)
				end
			else
			npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
			TalkState(cid, 0)	
			end
		elseif msgcontains(msg, "bring me to darashia") then
			Pinobcprice = 40
			Pinobcdestination = Carpetdarashia
			bcname = "Darashia"
			if (getTilePzInfo(pos) == FALSE) then
				if doPlayerRemoveMoney(cid, Pinobcprice) == TRUE then
				doTeleportThing(cid, Pinobcdestination)
				doSendMagicEffect(Pinobcdestination, 10)
				npcHandler:say("Hold on!", 1)
				TalkState(cid, 0)
				else
				npcHandler:say("You don't have enough money.", 1)
				TalkState(cid, 0)
				end
			else
			npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
			TalkState(cid, 0)	
			end
		--End of Travel in hurry--
		end
	end
	if(npcHandler.focus ~= cid) then
		return false
	end
--Travel in hurry--
if msgcontains(msg, "bring me to femor") or msgcontains(msg, "bring me to hill") then
	Pinobcprice = 60
	Pinobcdestination = Carpethills
	bcname = "Femor Hills"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Pinobcprice) == TRUE then
		doTeleportThing(cid, Pinobcdestination)
		doSendMagicEffect(Pinobcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
elseif msgcontains(msg, "bring me to darashia") then
	Pinobcprice = 40
	Pinobcdestination = Carpetdarashia
	bcname = "Darashia"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Pinobcprice) == TRUE then
		doTeleportThing(cid, Pinobcdestination)
		doSendMagicEffect(Pinobcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of Travel in hurry--
	
--Give Destination--
elseif msgcontains(msg, 'femor') and npcHandler.focus == cid or msgcontains(msg, 'hill') and npcHandler.focus == cid then
	Pinobcprice = 60
	Pinobcdestination = Carpethills
	bcname = "Femor hills"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Pinobcprice .." gold?", 1)
	TalkState(cid, 94991)
	
elseif msgcontains(msg, "darashia") and npcHandler.focus == cid then
	Pinobcprice = 40
	Pinobcdestination = Carpetdarashia
	bcname = "Darashia"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Pinobcprice .." gold?", 1)
	TalkState(cid, 94991)
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94991 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Pinobcprice) == TRUE then
		doTeleportThing(cid, Pinobcdestination)
		doSendMagicEffect(Pinobcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of the System that does the job after confirm destination--

elseif msgcontains(msg, 'fly') and npcHandler.focus == cid then
	npcHandler:say("I can fly you to Femor Hills or Darashia if you like. Where do you want to go?", 1)
	TalkState(cid, 0)	
end		
    return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
