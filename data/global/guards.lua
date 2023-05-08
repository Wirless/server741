local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function greetCallback(cid)
	if getPlayerSex(cid) == 0 then
		if getPlayerHealth(cid) <= 59 then
		doCreatureAddHealth(cid, 60 -getCreatureHealth(cid))
		doSendMagicEffect(getPlayerPosition(cid),12)
		npcHandler:setMessage(MESSAGE_GREET, 'You look very hurt my lady! let me heal you wounds!')
		return true
		else
		npcHandler:setMessage(MESSAGE_GREET, 'Hello there my lady')
		return true
		end
		
	elseif getPlayerSex(cid) == 1 then
		if getPlayerHealth(cid) <= 59 then
		doCreatureAddHealth(cid, 60 -getCreatureHealth(cid))
		npcHandler:setMessage(MESSAGE_GREET, 'You look very hurt sir! let me heal you wounds!')
		doSendMagicEffect(getPlayerPosition(cid),12)
		return true
		else
		npcHandler:setMessage(MESSAGE_GREET, 'Hello there mr')
		return true
		end
	end
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
	
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's my duty to protect the city."})				
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Behave while in the city or we get you! Do you want to know where to find a shop or a guild?"})				


function creatureSayCallback(cid, type, msg)
pos = getPlayerPosition (cid)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	if msgcontains(msg, "idiot") then
	selfSay("Take this!")
	doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "asshole") then
		selfSay("Take this!")
		local condition = createConditionObject(CONDITION_FIRE)
		setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
		addDamageCondition(condition, 10, 2000, -10)
		setCombatCondition(combat, condition)
	elseif msgcontains(msg, "retard") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "sucker") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "fag") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)	
	elseif msgcontains(msg, "fuck") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "shut up") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)	
	elseif msgcontains(msg, "shit") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)		
	elseif msgcontains(msg, "ugly") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "smell") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "blow") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "cock") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "dick") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "pussy") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)	
	elseif msgcontains(msg, "vagina") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)	
	elseif msgcontains(msg, "bitch") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
			elseif msgcontains(msg, "nigger") then
		selfSay("Take this!")
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
	elseif msgcontains(msg, "heal") then
if getPlayerHealth(cid) <= 79 then
	doCreatureAddHealth(cid, 80 -getCreatureHealth(cid))
	doSendMagicEffect(pos,12)
	selfSay('you\'re looking bad, let me heal you!')
	talk_state = 101
	elseif getPlayerHealth(cid) >= 80 then
	selfSay('you\'re not looking that bad, simple gain more life by eat some food!')
	talk_state = 101
end
end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())