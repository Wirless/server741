dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

	local fire = createConditionObject(CONDITION_POISON)
	setConditionParam(fire, CONDITION_PARAM_DELAYED, 10)
	addDamageCondition(fire, 10, 3000, -50)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
if getDistanceTo(cid) > 1 then
	return false
end
selfSay("Begone! Hissssss! You bear not the mark of the cobra!", cid)
doAddCondition(cid, fire)
doTeleportThing(cid, {x=33397, y=32836, z=14})
doSendMagicEffect({x=33397, y=32836, z=14}, 16)
return false
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
