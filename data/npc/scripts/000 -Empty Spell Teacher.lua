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


shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)

shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
 

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
	if(npcHandler.focus ~= cid) then
		return false
	end
	if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 8 then
	else
		if msgcontains(msg, '') then
		selfSay("Sorry, I only teach paladins and knights!")
		return false
		end
	end
--name the spell--
if msgcontains(msg, '') or msgcontains(msg, '') then
	spellprice = #
	spellvoc = {00, 00}
	spellname = ""
	spellmagiclevel = #
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for ")###
		talk_state = 0
		end
	
elseif msgcontains(msg, '') or msgcontains(msg, '') then
	spellprice = #
	spellvoc = {00, 00}
	spellname = ""
	spellmagiclevel = #
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for ")###
		talk_state = 0
		end

--End of Give spell--
	

	
	
--System that does the job after confirm spell--
elseif talk_state == 8754 and msgcontains(msg, 'yes') then
	if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		if getPlayerMagLevel(cid) >= spellmagiclevel then
			if getPlayerLearnedInstantSpell(cid, spellname) < 1 then
				if doPlayerRemoveMoney(cid, spellprice) == TRUE then
				playerLearnInstantSpell(cid, spellname)
				doSendMagicEffect(getPlayerPosition(cid), 14)
				selfSay("Here you are. Look in your spellbook for the pronounciation of this spell.")
				talk_state = 0
				else
				selfSay("Oh. You do not have enough money.")
				talk_state = 0			
				end
			else
			selfSay("You already know how to cast this spell.")
			talk_state = 0	
			end
		else
		selfSay("You must have magic level ".. spellmagiclevel .." or better to learn this spell!")
		talk_state = 0
		end
	end
elseif talk_state == 8754 and msgcontains(msg, '') then
selfSay("Maybe next time.")
talk_state = 0
--End of the System that does the job after confirm spell--
	
	
end		
    return 1
end

addEvent(paladinspell11, 5000, pos)
function paladinspell11(cid, type, msg)
npcHandler:say("")
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())