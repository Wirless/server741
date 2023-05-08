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


keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I offer you gold coins and premium time for premium tokens.'})	
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I offer you gold coins and premium time for premium tokens.'})	
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm just a simple monk here in the temple, heal really hurted people."})				



function creatureSayCallback(cid, type, msg)
---------------	
--premium--
---------------			
    if(npcHandler.focus ~= cid) then
        return false
    end
if  msgcontains(msg, 'premium') then
	selfSay('Would you like to buy premium account?')
	talk_state = 101
	

        elseif msgcontains(msg, 'yes') and talk_state == 101 then
            selfSay('You will receive 7 days premium, and it will cost 3 premium coins. do you accept?')
			talk_state = 102
			
         elseif msgcontains(msg, 'yes') and talk_state == 102 then
            if getPlayerItemCount(cid,2157) >= 3 then
            doPlayerTakeItem(cid,2157,1)
			doPlayerTakeItem(cid,2157,1)
			doPlayerTakeItem(cid,2157,1)
				if getPlayerPremiumDays(cid) == 0 then
				doPlayerAddPremiumDays(cid, 8)
				selfSay('You have receive 7 days of premium account! enjoy it!')
				else
				doPlayerAddPremiumDays(cid, 7)
				selfSay('You have receive 7 days of premium account! enjoy it!')
				end
            else
                selfSay('You need three premium coins to buy premium time!')
            end
			

        elseif msgcontains(msg, 'no') and (talk_state >= 101) then
            selfSay('Ok then...')
            talk_state = 0
        end
		-------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------	
---------------	
--  crystal  --
---------------					
    if(npcHandler.focus ~= cid) then
        return false
    end
if  msgcontains(msg, 'gold') or msgcontains(msg, 'crystal') or msgcontains(msg, 'money') then
	selfSay('Would you like to buy one crystal coin?')
	talk_state = 103
	

        elseif msgcontains(msg, 'yes') and talk_state == 103 then
            selfSay('You will receive one crystal coin, and it will cost one premium coin. do you accept?')
			talk_state = 104
			
         elseif msgcontains(msg, 'yes') and talk_state == 104 then
            if getPlayerItemCount(cid,2157) >= 1 then
			doPlayerTakeItem(cid,2157,1)
			doPlayerAddItem(cid, 2160)
			selfSay('You have receive one crystal coin! enjoy it!')
            else
                selfSay('You need a premium coin to buy premium time!')
            end
			

        elseif msgcontains(msg, 'no') and (talk_state >= 101) then
            selfSay('Ok then...')
            talk_state = 0
        end
		-------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------	
		
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())