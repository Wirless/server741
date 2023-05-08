local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


function creatureSayCallback(cid, type, msg)
pos = getPlayerPosition(cid)
--Travel in hurry--
if msgcontains(msg, "") then
	doPlayerSendTextMessage(cid, 22, getNpcId())
	npcHandler:say("Code: ".. getNpcId() .."!", 1)
	npcHandler:say("I think..", 4)
	npcHandler:say("Or..", 5)
	npcHandler:say("Bah Nevermind!", 6)
	talk_state = 0
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())