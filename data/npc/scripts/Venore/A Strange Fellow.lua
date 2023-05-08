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
	
	if(getPlayerStorageValue(cid, 250) ~= 5) then
		return true
	end

local npcPos = getCreaturePosition(getNpcId())
	
	if(msgcontains(msg, "bill")) then
		if(npcHandlerfocus == 5) and getPlayerItemCount(cid, 1952) >= 1 then
			npcHandler:say("A bill? Oh boy so you are delivering another bill to poor me? ", cid)
			npcHandlerfocus = 6
			else
			npcHandler:say("Well where is it then?", cid)
		end
	elseif(msgcontains(msg, "yes")) and getPlayerItemCount(cid, 1952) >= 1 then
		if(npcHandlerfocus == 6) then
			npcHandler:say("Ok, ok, I'll take it. I guess I have no other choice anyways. And now leave me alone in my misery please. ", cid)
			npcHandlerfocus = 0
			doPlayerRemoveItem(cid, 1952, 1)
			setPlayerStorageValue(cid, 250, 6)
		end
	elseif(msgcontains(msg, "hat")) then
		if(getPlayerStorageValue(cid, 250) == 5 and getPlayerStorageValue(cid, 1111250) < 1) then
			npcHandler:say("What? My hat?? Theres... nothing special about it! ", cid)
			setPlayerStorageValue(cid, 1111250, 1)
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