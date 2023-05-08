local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	npcHandlerfocus = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   	if(npcHandler.focus ~= cid) then
		return false
	end	
	
	if (msgcontains(msg, 'no') or msgcontains(msg, 'bad')) and (npcHandlerfocus >= 1) then
		npcHandler:say("Grrr! Woof! Woof!",cid)
		npcHandlerfocus = 0
	end 

    	if (msgcontains(msg, 'sniff banana skin') or msgcontains(msg, 'banana skin')) and (getPlayerStorageValue(cid, 250) == 19) then 
        if (getPlayerItemCount(cid,2219) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
		npcHandlerfocus = 1
			else
	    npcHandler:say("Grrr! banana?",cid)
   end
	elseif (npcHandlerfocus == 1) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 1) then
		npcHandler:say("Woof!",cid)
		npcHandlerfocus = 2
	end
	elseif (npcHandlerfocus == 2) then
	if (msgcontains(msg, 'sniff dirty fur') or msgcontains(msg, 'dirty fur')) and (npcHandlerfocus == 2) then
    if (getPlayerItemCount(cid,2220) >= 1) then
		npcHandler:say("<sniff><sniff>",cid)
		npcHandlerfocus = 3
		end
	else
	    npcHandler:say("Grrr! fur?",cid) 
	end 
	elseif (npcHandlerfocus == 3) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 3) then
		npcHandler:say("Woof!",cid)
		npcHandlerfocus = 4
	end
	elseif (npcHandlerfocus == 4) then
    	if (msgcontains(msg, 'sniff mouldy cheese') or msgcontains(msg, 'mouldy cheese')) and (npcHandlerfocus == 4) then
        if (getPlayerItemCount(cid,2235,1)) then
		npcHandler:say("<sniff><sniff>",cid)
		npcHandlerfocus = 5
		end
	else
	    npcHandler:say("Grrr! cheese?",cid)
	end 
	elseif (npcHandlerfocus == 5) then   
	if (msgcontains(msg, 'do you like that?') or msgcontains(msg, 'do you like that') or msgcontains(msg, 'do you like') or msgcontains(msg, 'like')) and (npcHandlerfocus == 5) then
		npcHandler:say("Meeep! Grrrrr! <spits>",cid)
		setPlayerStorageValue(cid,250,22)
		setPlayerStorageValue(cid,100171,26)
		npcHandlerfocus = 0
	end
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "<sniff> Woof! <sniff>")
npcHandler:setMessage(MESSAGE_FAREWELL, "Woof! Woof!") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())