dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
if getPlayerLevel(cid) >= 2 then
	if getPlayerStorageValue(cid, 7027) <= 0 then
		if getPlayerSex(cid) == 0 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello there sweet thing, I didn't expect a girl to seek for me.")
		return true
		else
		npcHandler:setMessage(MESSAGE_GREET, "Hello there young man, what do you seek here?")
		return true
		end
	elseif getPlayerStorageValue(cid, 7027) == 1 then
		if getPlayerStorageValue(cid, 7028) == 100 then
		npcHandler:setMessage(MESSAGE_GREET, "Already killed 100 rats?")
		name_talk_state = 703
		return true
		else
		npcHandler:setMessage(MESSAGE_GREET, "What are you doing here!? go kill those rats!")
		end
	elseif getPlayerStorageValue(cid, 7027) == 2 then
	npcHandler:setMessage(MESSAGE_GREET, "Hello again there, did you get the arrows I wanted?")
	name_talk_state = 705	
	return true
	elseif getPlayerStorageValue(cid, 7027) == 3 then
	npcHandler:setMessage(MESSAGE_GREET, "you want next mission?")
	name_talk_state = 706
	return true
	elseif getPlayerStorageValue(cid, 7027) == 4 then
	npcHandler:setMessage(MESSAGE_GREET, "Huh, did you already kill those spiders?")
	name_talk_state = 707
	return true	
	elseif getPlayerStorageValue(cid, 7027) == 5 then
	npcHandler:setMessage(MESSAGE_GREET, "Hello my friend!")
	return true		
	elseif getPlayerStorageValue(cid, 7027) == 6 then
		if getPlayerStorageValue(cid, 7030) >= 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Did you get him?")
		name_talk_state = 502	
		return true			
		else
		npcHandler:setMessage(MESSAGE_GREET, "I told you to get Aaron!")
		return true	
		end
	elseif getPlayerStorageValue(cid, 7027) == 7 and getPlayerStorageValue(cid, 7032) <= 0 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello there! good to see you again!")
		return true	
	elseif getPlayerStorageValue(cid, 7032) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Did you bring the katana and 200 copper coins?")
		name_talk_state = 802
		return true	
	elseif getPlayerStorageValue(cid, 7032) == 2 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello, ready for next mission?")
		name_talk_state = 803
		return true	
	elseif getPlayerStorageValue(cid, 7032) == 3 then
		npcHandler:setMessage(MESSAGE_GREET, "Hi, you got the fresh corpse of a poison spider?")
		name_talk_state = 804
		return true	
	elseif getPlayerStorageValue(cid, 7032) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, "Hi, Do you wish to become a Rook Stayer?")
		name_talk_state = 805
		return true	
	elseif getPlayerStorageValue(cid, 7033) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "There you are, did you bring the salmon?")
		name_talk_state = 901
		return true	




	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello my dear friend!")
		return true			
	end
else
npcHandler:setMessage(MESSAGE_GREET, "How are you supposed to help me when you're just a little kid? come back when you have reach a bit better level!")
end	
return true
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


keywordHandler:addKeyword({'seek'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "that's right, I seek for people who might be able to help me."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'help') and getPlayerStorageValue(cid, 7027) <= 0 or msgcontains(msg, 'quest') and getPlayerStorageValue(cid, 7027) <= 0 then
	selfSay("Hmm, you have never helped me before, but would you be interested in help me with something?")
	name_talk_state = 701

elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 7027) >= 5 then
	selfSay("I can give you the missions \"Rookie\", \"100 copper mission\" and \"Switch of the Minotaur mage\" at the moment.")
	
elseif name_talk_state == 701 and msgcontains(msg, 'yes') then
	selfSay("that's good. okey, I want to see if you're worthy my missions. this is about rats. you know them?")
	name_talk_state = 702
elseif name_talk_state == 701 and msgcontains(msg, 'no') then
	selfSay("what do you want then?")
	name_talk_state = 0
	
elseif name_talk_state == 702 and msgcontains(msg, 'yes') then
	selfSay("Yeah, of course you do. I want you to kill 100 rats, after that come back to me!")
	setPlayerStorageValue(cid,7028,0)
	setPlayerStorageValue(cid,7027,1)
	name_talk_state = 0	
elseif name_talk_state == 702 and msgcontains(msg, 'no') then
	selfSay("Nonsense! I know you know what a rat is! I want you to kill 100 rats, after that come back to me!")
	setPlayerStorageValue(cid,7028,0)
	setPlayerStorageValue(cid,7027,1)
	name_talk_state = 0		
elseif name_talk_state == 703 and msgcontains(msg, 'yes') then
	selfSay("Impresive! really. anyway, time to turn up the heat, right?")
	name_talk_state = 704		
elseif name_talk_state == 704 and msgcontains(msg, 'yes') then
	selfSay("that's the spirit. I need some arrows, not many thought, get me 10 arrows and come back to me!")
	setPlayerStorageValue(cid,7027,2)
	name_talk_state = 0	
elseif name_talk_state == 705 and msgcontains(msg, 'yes') then
	if doPlayerRemoveItem(cid, Cfarrow, 10) == TRUE then
	selfSay("Thank you very much! if you complete my next mission to you, I'll reward you with something nice! you want next mission?")
	setPlayerStorageValue(cid,7027,3)
	name_talk_state = 706
	else
	selfSay("Bah, don't fool around, get me those arrows!")
	end
	name_talk_state = 0		
elseif name_talk_state == 706 and msgcontains(msg, 'yes') then
	selfSay("Great! I hate spiders, so god damn much! go kill 100 spiders and I'll give you something that you might have some use for!")
	setPlayerStorageValue(cid,7027,4)
	setPlayerStorageValue(cid,7029,0)
	name_talk_state = 0	

elseif name_talk_state == 707 and msgcontains(msg, 'yes') then
	if getPlayerStorageValue(cid, 7029) == 100 then
	selfSay("Really nice of you! please take this key as reward! you have proven yourself worthy to me. you may now select any mission you want from me.")
	WOLVESKEY = doPlayerAddItem(cid, 2088, 1)
	doSetItemActionId(WOLVESKEY, 2008)
	doSetItemSpecialDescription(WOLVESKEY, "It seems like this key match a door located near some rats.")
	setPlayerStorageValue(cid,7027,5)
	name_talk_state = 0	
	else
	selfSay("No you didn't! You have killed ".. getPlayerStorageValue(cid, 7029) .." spiders.")
	end
----------100 copper mission----------
elseif msgcontains(msg, '100 copper') and getPlayerStorageValue(cid, 7027) <= 6 then
	selfSay("Brave, but yeah.. Aaron, he stole my backpack few days ago, kill him and I'll hand you 100 copper! you accept?")
	name_talk_state = 501
elseif msgcontains(msg, '100 copper') and getPlayerStorageValue(cid, 7027) >= 7 then
	selfSay("I'm sorry, but you have already done this quest.")
	name_talk_state = 0	
elseif name_talk_state == 501 and msgcontains(msg, 'yes') then
	selfSay("Good. you find him somewhere in Rookgaard city!")
	setPlayerStorageValue(cid,7027,6)
	setPlayerStorageValue(cid,7030,0)
	name_talk_state = 0
elseif name_talk_state == 501 and msgcontains(msg, 'no') then
	selfSay("Okay then, sure it's heavy work to kill someone so I understand.")
	name_talk_state = 0	

elseif name_talk_state == 502 and msgcontains(msg, 'yes') then
	doPlayerAddItem(cid, cfcoppercoin, 100)
	setPlayerStorageValue(cid,7027,7)
	selfSay("Good work! here, take these money!")
	name_talk_state = 0	
----------end of the 100 copper mission----------
----------Vocation mission----------
elseif msgcontains(msg, 'rookie') and getPlayerStorageValue(cid, 7027) >= 5 and getPlayerStorageValue(cid, 7032) <= 0 then
	selfSay("if you complete this mission you'll get the vocation \"Rookie\" as reward. Rookie vocation will make your skill go a little bit faster, your health will come faster. ...")
	addEvent(STORY1, 5000, pos)
	name_talk_state = 801
	
elseif name_talk_state == 801 and msgcontains(msg, 'yes') then
	selfSay("Great! I want a katana and 200 copper. get that for me!")
	setPlayerStorageValue(cid,7032,1)
	name_talk_state = 0
elseif name_talk_state == 802 and msgcontains(msg, 'yes') then
	if doPlayerRemoveItem(cid, Cfkatana,1) and doPlayerRemoveMoney(cid, 200) == TRUE then
	selfSay("Great work! thank you very much! hope you're ready for a new mission. are you?")
	setPlayerStorageValue(cid,7032,2)
	name_talk_state = 803
	else
	selfSay("Don't fool around kid! get me my katana and those 200 copper!")
	end
elseif name_talk_state == 803 and msgcontains(msg, 'yes') then
	selfSay("Very good! I want a fresh corpse of a poison spider, I need it for some research. go and kill a poison spider and bring it back to me before it gets too old!")
	setPlayerStorageValue(cid,7032,3)
	name_talk_state = 0
elseif name_talk_state == 804 and msgcontains(msg, 'yes') then
	if doPlayerRemoveItem(cid,2848,1) == TRUE then
	selfSay("Thank you very much! so, Do you wish to become a Rook Stayer?")
	setPlayerStorageValue(cid,7032,4)
	name_talk_state = 805	
	elseif getPlayerItemCount(cid,2885) >= 1 or getPlayerItemCount(cid,2944) >= 1 then
	selfSay("Urk, that corpse is too old! get me a new one!")
	name_talk_state = 0
	else
	selfSay("Don't screw around! haven't I already told you to stop lying and do what you have been told to do!")
	name_talk_state = 0
	end
elseif name_talk_state == 805 and msgcontains(msg, 'yes') then
	selfSay("Once you have become a rook stayer you cannot change your mind. DO YOU WANT TO BE A ROOK STAYER?")
	name_talk_state = 806
elseif name_talk_state == 806 and msgcontains(msg, 'yes') then
	doSendMagicEffect(getPlayerPosition(cid), 13)
	doSendMagicEffect(getPlayerPosition(cid), 23)
	doPlayerSetVocation(cid, 9)
	setPlayerStorageValue(cid,7032,5)
	selfSay("Very well.. You have been promoted to a Rook stayer! enjoy the new class!")
	name_talk_state = 0
----------End of the Vocation mission----------	
----------Minotaur Mage-Switch mission----------
elseif msgcontains(msg, 'minotaur mage') and getPlayerStorageValue(cid, 7027) >= 5 and getPlayerStorageValue(cid, 7033) <= 0 then
	selfSay("Bring me some salmon and I'll tell you how to use the switch!")
	setPlayerStorageValue(cid,7033,1)
	name_talk_state = 0
	
elseif name_talk_state == 901 and msgcontains(msg, 'yes') then
	if doPlayerRemoveItem(cid,Cfsalmon,1) == TRUE then
	selfSay("Thank you! well.. the switch is stuck sometimes, you might have to try to pull it more than once to pull it.")
	setPlayerStorageValue(cid,7033,2)
	name_talk_state = 0
	else
	selfSay("You don't have the salmon! get it!")
	name_talk_state = 0
	end
----------End of Minotaur Mage-Switch mission----------

elseif name_talk_state >= 1 and msgcontains(msg, 'no') then
	selfSay("Okey then, have it your way!")
	name_talk_state = 0
end		
    return 1
end

function STORY1(cid, type, msg)
npcHandler:say("and also you'll be able to use the Rookgaard boat on the east shore. would you like to take this mission?")
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
