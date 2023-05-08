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

	
	if (msgcontains(msg, 'sniff banana skin') or msgcontains(msg, 'banana skin')) then
	if(getPlayerStorageValue(cid, 250) == 19) then
	if (getPlayerItemCount(cid,2219) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
		npcHandlerfocus = 2
		else
	    npcHandler:say("Grrr! banana?",cid)
		
	end
	elseif(npchandlerfocus == 2) then
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 2) then
	npcHandler:say("Woof!",cid)
	npcHandlerfocus = 3
	end
	
	elseif(npchandlerfocus == 3) then
	if (msgcontains(msg, 'sniff dirty fur') or msgcontains(msg, 'dirty fur')) and (npcHandlerfocus == 3) then
	if (getPlayerItemCount(cid,2220) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
	npcHandlerfocus = 4
	end
		else
	    npcHandler:say("Grrr! fur?",cid) 
		end
		elseif(npcHandlerfocus == 4) then
		if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 4) then
		npcHandler:say("Woof!",cid)
		npcHandlerfocus = 5
		end
		elseif(npcHandlerfocus == 5) then
		if (msgcontains(msg, 'sniff mouldy cheese') or msgcontains(msg, 'mouldy cheese')) and (npcHandlerfocus == 5) then
		if (getPlayerItemCount(cid,2235,1)) then
		npcHandler:say("<sniff><sniff>",cid)
		npcHandlerfocus = 6
		end
		else
		npcHandler:say("Grrr! cheese?",cid)
		end
		elseif(npcHandlerfocus == 6) then
		if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 6) then
		npcHandler:say("Meeep! Grrrrr! <spits>",cid)
		setPlayerStorageValue(cid,250,22)
		npcHandlerfocus = 0
		end
	end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())