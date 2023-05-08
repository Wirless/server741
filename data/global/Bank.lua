function creatureSayCallback(cid, type, msg)
---------------	
--  deposit	 --
---------------			
    if(npcHandler.focus ~= cid) then
        return false
    end
if  msgcontains(msg, 'deposit') or msgcontains(msg, 'deposit') then
    selfSay('How much would you like to deposit?')
    talk_state = 201  
		
		elseif talk_state == 201 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveMoney(cid, amount) == TRUE then
			setPlayerStorageValue(cid,101,getPlayerStorageValue(cid,101)+amount)
			selfSay("You have added ".. amount .." gold to your bank account.")
			else
			selfSay("You don't have that much money!")
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount of how much you would like to deposit.")
		end
		talk_state = 0

        end
		
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------	
---------------	
--  Balance  --
---------------			
    if(npcHandler.focus ~= cid) then
        return false
    end
if  msgcontains(msg, 'balance') or msgcontains(msg, 'balance') then
	if getPlayerStorageValue(cid,101) <= 4999 then
	selfSay("You aren't very rich my young child. you account balance is ".. getPlayerStorageValue(cid,101) .." gold.")
    talk_state = 0 
	elseif getPlayerStorageValue(cid,101) >= 5000 and getPlayerStorageValue(cid,101) <= 49999 then
	selfSay("You have a nice amount of cash. you account balance is ".. getPlayerStorageValue(cid,101) .." gold.")
    talk_state = 0 
	elseif getPlayerStorageValue(cid,101) >= 50000 and getPlayerStorageValue(cid,101) <= 99999 then
	selfSay("You really have made a nice penny young traveler! you account balance is ".. getPlayerStorageValue(cid,101) .." gold.")
    talk_state = 0 
	elseif getPlayerStorageValue(cid,101) >= 100000 then
	selfSay("You have really been successful with money! you account balance is ".. getPlayerStorageValue(cid,101) .." gold.")
    talk_state = 0  
	end
        end
		
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------	
---------------	
-- Withdraw  --
---------------			
    if(npcHandler.focus ~= cid) then
        return false
    end
if  msgcontains(msg, 'withdraw') or msgcontains(msg, 'withdraw') then
    selfSay('How much would you like to withdraw?')
    talk_state = 301  
	
		elseif talk_state == 301 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if getPlayerStorageValue(cid,101) >= amount then
			setPlayerStorageValue(cid,101,getPlayerStorageValue(cid,101)-amount)
			doPlayerAddMoney(cid, amount)
			selfSay("There you go.. enjoy them!")
			else
			selfSay("You don't have that much money on your bank account!")
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount of how much you would like to withdraw.")
		end
		talk_state = 0

        end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------	
---------------	
--Change gold--
---------------			
    if(npcHandler.focus ~= cid) then
        return false
    end
if msgcontains(msg, 'change') or msgcontains(msg, 'change gold') then
    selfSay('Would you like to change "gold", "platinum" or "crystal"?')
    talk_state = 401  
	
elseif msgcontains(msg, 'gold') and talk_state == 401 then
selfSay('How many platinum coins would you like to get?')
talk_state = 402 

----------
elseif msgcontains(msg, 'platinum') and talk_state == 401 then
selfSay('would you like to change platinum to "gold" or "crystal"?')
talk_state = 403
elseif msgcontains(msg, 'gold') and talk_state == 403 then
selfSay('How many platinum coins would you like to change to gold?')
talk_state = 404
elseif msgcontains(msg, 'crystal') and talk_state == 403 then
selfSay('How many crystal coins would you like to get?')
talk_state = 405
----------

elseif msgcontains(msg, 'crystal') and talk_state == 401 then
selfSay('How many crystal coins would you like to change to platinum coins?')
talk_state = 406
	

	
		elseif talk_state == 402 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveItem(cid, 2148, (amount) * 100) == TRUE then
			doPlayerAddItem(cid, 2152, amount)
			selfSay("Here's your ".. amount .." platinum coins.")
			talk_state = 0
			else
			selfSay("You don't have that much money!")
			talk_state = 402
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount.")
		talk_state = 402
		end

		elseif talk_state == 404 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveItem(cid, 2152, (amount)) == TRUE then
			doPlayerAddItem(cid, 2148, (amount) * 100)
			selfSay("Here's your ".. (amount) * 100 .." gold coins.")
			talk_state = 0
			else
			selfSay("You don't have that much money!")
			talk_state = 404
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount.")
		talk_state = 404
		end		

		elseif talk_state == 405 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveItem(cid, 2152, (amount) * 100) == TRUE then
			doPlayerAddItem(cid, 2160, amount)
			selfSay("Here's your ".. amount .." crystal coins.")
			talk_state = 0
			else
			selfSay("You don't have that much money!")
			talk_state = 405
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount.")
		talk_state = 405
		end

		elseif talk_state == 406 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveItem(cid, 2160, (amount)) == TRUE then
			doPlayerAddItem(cid, 2152, amount * 100)
			selfSay("Here's your ".. (amount) * 100 .." platinum coins.")
			talk_state = 0
			else
			selfSay("You don't have that much money!")
			talk_state = 406
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount.")
		talk_state = 406
		end
		
        end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------	
		
end
