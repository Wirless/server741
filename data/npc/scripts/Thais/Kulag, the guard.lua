dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local fire = createConditionObject(CONDITION_FIRE)
setConditionParam(fire, CONDITION_PARAM_DELAYED, 10)
addDamageCondition(fire, 10, 3000, -10)


-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
 
 
 
 
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's my duty to protect the city."})				
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Behave while in the city or we get you! Do you want to know where to find a shop or a guild?"})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
if msgcontains(msg, "idiot") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "asshole") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "retard") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "sucker") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "fag") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "fuck") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "shut up") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "shit") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0		
	elseif msgcontains(msg, "ugly") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "smell") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "blow") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "cock") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "dick") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "pussy") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0	
	elseif msgcontains(msg, "vagina") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
	elseif msgcontains(msg, "bitch") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
			elseif msgcontains(msg, "nigger") then
	doSendMagicEffect(getCreaturePosition(getNpcId(  )), 13)
	doSendMagicEffect(getPlayerPosition(cid), 15)
	doAddCondition(cid, fire)
	npcHandler:say("Take this!", 0.5)
	name_talk_state = 0
end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
