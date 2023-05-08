local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end	
	
	

local npcPos = getCreaturePosition(getNpcId())
	
	if(msgcontains(msg, "new set of uniforms")) then
		if(getPlayerStorageValue(cid, 250)) == 13 then
			npcHandler:say("It was ... wonderous beyond wildest imaginations! I have no clue where Kevin Postner got it from. Better ask him ", cid)
			setPlayerStorageValue(cid, 250, 14)
		end
		
	elseif(msgcontains(msg, "new dress pattern")) then
		if(getPlayerStorageValue(cid, 250)) == 23  then
			npcHandler:say("By the gods of fashion! Didn't it do that I fed the last dress pattern to my poor dog? Will this mocking of all which is taste and fashion never stop?? Ok, ok, you will get those ugly, stinking uniforms and now get lost, fashion terrorist. ", cid)
			setPlayerStorageValue(cid, 250, 24)
			npcHandlerfocus = 2
		elseif(npcHandlerfocus == 2) then
			npcHandler:say("Stop bugging me about that hat, do you listen? ", cid)
			npcHandlerfocus = 3
		elseif(npcHandlerfocus == 3) then
			npcHandler:say("Hey! Don't touch that hat! Leave it alone!!! Don't do this!!!! ", cid)
			npcHandlerfocus = 4
		elseif(npcHandlerfocus == 4) then
			npcHandler:say("Noooooo! Argh, ok, ok, I guess I can't deny it anymore, I am David Brassacres, the magnificent, so what do you want? ", cid)
doSummonCreature("Rabbit", {x=npcPos.x-1,y=npcPos.y,z=npcPos.z})
	  doSummonCreature("Rabbit", {x=npcPos.x+1,y=npcPos.y,z=npcPos.z})
	  doSummonCreature("Rabbit", {x=npcPos.x,y=npcPos.y+1,z=npcPos.z})
	  doSummonCreature("Rabbit", {x=npcPos.x,y=npcPos.y-1,z=npcPos.z})
			npcHandlerfocus = 5
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())