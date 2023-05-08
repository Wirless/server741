local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end



--local function doPlayerRemoveNuggets(cid, amount)
--	return doPlayerRemoveItem(cid, 2230, amount) and doPlayerRemoveItem(cid, 2231, getPlayerItemCount(cid, 2231))
--end

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	
	--INTRO TO DEAL AND REPEAT
	--npcHandlerfocus = 8
	elseif(msgcontains(msg, "weapon box")) then
	npcHandler:say("Would you like to exchange 2 tokens for weapon box?", cid)
	npcHandlerfocus = 1
	
	elseif(msgcontains(msg, "skill box")) then
	npcHandler:say("Would you like to exchange 5 tokens for skill box?", cid)
	npcHandlerfocus = 2
	elseif(msgcontains(msg, "carpet box")) then
	npcHandler:say("Would you like to exchange 1 tokens for carpet box?", cid)
	npcHandlerfocus = 3
	--are you sure you want to exchange it?
	--if(npcHandlerfocus == 1) then
	

	--DEALS
	elseif(msgcontains(msg, "yes")) then
		if(npcHandlerfocus == 1) then
			if(getPlayerItemCount(cid, 2157)) >= 2 and getPlayerFreeCap(cid) >= 5 and (doPlayerRemoveItem(cid, 2157, 2) == TRUE)  then
			npcHandler:say("Here you go! Want more?", cid)
				--doPlayerRemoveItem(cid, 2157, 2)	
				doPlayerAddItem(cid, 7141, 1, true)
				npcHandlerfocus = 1
			else
			npcHandler:say("Put tokens in your backpack or you dont have cap", cid)
			end
	
	elseif(npcHandlerfocus == 2) then
			if(getPlayerItemCount(cid, 2157)) >= 5  and getPlayerFreeCap(cid) >= 5 and (doPlayerRemoveItem(cid, 2157, 5) == TRUE) then
			npcHandler:say("Here you go! Want more?", cid)
				--doPlayerRemoveItem(cid, 2157, 5)	
				doPlayerAddItem(cid, 7142, 1, true)
				npcHandlerfocus = 2
			else
			npcHandler:say("Put tokens in your backpack or you dont have cap", cid)
			end
	elseif(npcHandlerfocus == 3) then
			if(getPlayerItemCount(cid, 2157)) >= 1 and getPlayerFreeCap(cid) >= 5  and (doPlayerRemoveItem(cid, 2157, 1) == TRUE)  then
			npcHandler:say("Here you go! Want more?", cid)
				--doPlayerRemoveItem(cid, 2157, 1)	
				doPlayerAddItem(cid, 7143, 1, true)
				npcHandlerfocus = 3
			else
			npcHandler:say("Put tokens in your backpack or you dont have cap", cid)
			end
			--doPlayerSendTextMessage(cid, 22, "You have completed the postman quest.")
			--doPlayerSendTextMessage(cid, 22, "You have upgraded your character. You can trade now with Rashid.")
		end
--- QUESTIONS

	elseif(msgcontains(msg, "tokens") or msgcontains(msg, 'token') or msgcontains(msg, 'offer')) then
	npcHandler:say("You can exchange tokens for 'weapon box', 'skill box', 'carpet box'", cid)
	npcHandlerfocus = 0
	
	return true
	end
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())