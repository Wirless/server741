dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


function greetCallback(cid, type, msg)

local npcPos = getCreaturePosition(getNpcId())


	if getCreatureStorage(cid, 2190117) <= 0 then
	--if getPlayerLevel(cid) == 8 then
	npcHandler:say("No! The hornless have reached my city! BODYGUARDS TO ME!", cid)
          doSummonCreature("Minotaur Archer", {x=npcPos.x-1,y=npcPos.y,z=npcPos.z})
	  doSummonCreature("Minotaur Archer", {x=npcPos.x+1,y=npcPos.y,z=npcPos.z})
	  doSummonCreature("Minotaur Archer", {x=npcPos.x,y=npcPos.y+1,z=npcPos.z})
	  doSummonCreature("Minotaur Guard", {x=npcPos.x,y=npcPos.y-1,z=npcPos.z})
          doSummonCreature("Minotaur Guard", {x=npcPos.x+1,y=npcPos.y+1,z=npcPos.z})
	  doSummonCreature("Minotaur guard", {x=npcPos.x-1,y=npcPos.y-1,z=npcPos.z})
          doSummonCreature("Minotaur", {x=npcPos.x+1,y=npcPos.y-1,z=npcPos.z})
          doSummonCreature("Minotaur", {x=npcPos.x-1,y=npcPos.y+1,z=npcPos.z})
		setPlayerStorageValue(cid,2190117,1)
	return false
	else
	npcHandler:setMessage(MESSAGE_GREET, " Well ... you defeated my guards! Now everything is over! I guess I will have to answer your questions now.?")
	return true
	end	
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end	
	
	

	
	if (msgcontains(msg, 'letter') and getPlayerStorageValue(cid, 250) == 42) then
		npcHandler:say("A letter from my Moohmy?? Do you have a letter from my Moohmy to me?",cid)
		markwintwat = 1
	elseif (markwintwat == 1) then
	if (msgcontains(msg, 'yes') and markwintwat == 1 and doPlayerRemoveItem(cid, 2333,1)) then
		npcHandler:say("Uhm, well thank you, hornless beeing.",cid)
		setPlayerStorageValue(cid,250,43)
		markwintwat = 0
	end 
	markwintwat = 0
	end
	
	return true
end
 
 
 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())