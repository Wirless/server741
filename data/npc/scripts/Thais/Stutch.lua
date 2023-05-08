dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'hi'}, StdModule.say, {npcHandler = npcHandler, onlyUnfocus = true, text = "MIND YOUR MANNERS COMMONER! To address the king greet with his title!"})
keywordHandler:addKeyword({'hello'}, StdModule.say, {npcHandler = npcHandler, onlyUnfocus = true, text = "MIND YOUR MANNERS COMMONER! To address the king greet with his title!"})

function creatureSayCallback(cid, type, msg)
	if not npcHandler.focus ~= cid then
		return false
	end

	if isInArray({'fuck', 'idiot', 'asshole', 'ass', 'fag', 'stupid', 'tyrant', 'shit', 'lunatic'}, msg) then
		local conditions = { CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED }
		doRemoveConditions(cid)
		doSendMagicEffect(getPlayerPosition(cid), 15)
		doCreatureAddHealth(cid, -getCreatureHealth(cid) +1)
		npcHandler:say("Take this!", 1)
		doSendMagicEffect(getCreaturePosition(getNpcId()), 7)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'HAIL TO THE KING!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'LONG LIVE THE KING! You may leave now!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'LONG LIVE THE KING!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
