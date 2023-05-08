dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
if getCreatureHealth(cid) <= 39 then
	npcHandler:setMessage(MESSAGE_GREET, "You are looking really bad, ".. getPlayerName(cid) ..". Let me heal your wounds.")
	doCreatureAddHealth(cid, -getCreatureHealth(cid)+40)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	name_talk_state = 0
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Welcome to the temple of Banor's blood ".. getPlayerName(cid) ..".")
	return true
	end
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

 


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a humble nun."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sister Amanda."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created the world and all life on it."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's our world."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a pawn of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only a being loyal to Banor will wield this blade."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I rarely have time to chat."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
local crystalValue = getCreatureStorage(cid, 1345)

if msgcontains(msg, 'heal') then
	if getCreatureHealth(cid) <= 39 then
	npcHandler:say("You are looking really bad. Let me heal your wounds.", 1)
	doCreatureAddHealth(cid, -getCreatureHealth(cid)+40)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	name_talk_state = 0
	return true
	else
	npcHandler:say("You aren't looking really bad. Sorry, I can't help you.", 1)
	return true
	end
	name_talk_state = 0	
    return 1
end


local crystalValue = getCreatureStorage(cid, 1345)

--bless function
if msgcontains(msg, 'blessings') then
	npcHandler:say("There are five different blessings available in five sacred places. I can sell all of them for you if you ask me for {all} or {bless}", 1)
	name_talk_state = 0

elseif msgcontains(msg, 'all') or msgcontains(msg, 'bless') then
	npcHandler:say("I can provide you with all blessings. But you will have to sacrifice 40.000 gold to receive it. Are you still interested?", 1)
	name_talk_state = 1894


elseif name_talk_state == 1894 and msgcontains(msg, 'yes') then
if crystalValue >= 0 then
	if getPlayerMoney(cid) >= 40000 then
		for i = 1,5 do
                if(not getPlayerBlessing(cid, i)) then
                    doPlayerAddBlessing(cid, i)
					doSendMagicEffect(getPlayerPosition(cid), 13)
					npcHandler:say("So you receive all the blessings, pilgrim", 1)
					doPlayerRemoveMoney(cid, 8000)
                else
                    npcHandler:say("You have already recived my blessings!", 1)
				end
		end
		else
		npcHandler:say("Oh. You do not have enough money.", 1)
		name_talk_state = 0	
		end
	else
	npcHandler:say("Only special players can use this.", 1)
	name_talk_state = 0	
end
	

end
--blessend	

	
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
