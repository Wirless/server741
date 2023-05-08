dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'rune'}, 					Cfblankrune, 10)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? JOB? Hey man - I am in prison! But you know - once upon a time - I was a powerful mage! A mage ... come to think of it .., what is that - a mage?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is - uhm - hang on? I knew it yesterday, didn't I? Doesn't matter!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better save time than comitting a crime. I am a poet and I know it!"})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mightiest sorcerer from here to there! Yeah!"})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Power. Hmmm. Once while we were crossing the mountains together a man named Aureus said to me that parcels are equal to power. Any idea what that meant?"})
keywordHandler:addKeyword({'books'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have many books in my home. But only powerful people can read them. I bet you will only see three dots after the headline! Hehehe! Hahaha! Excellent!"})
keywordHandler:addKeyword({'mad mage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey! That's me! You got it! Thanks mate - now I remember my name!"})
keywordHandler:addKeyword({'riddle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great riddle, isn´t it? If you can tell me the correct answer, I will give you something. Hehehe!"})
keywordHandler:addKeyword({'something'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No! I won´t tell you. Shame coz it would be useful for you - hehehe."})
keywordHandler:addKeyword({'escape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How could I escape? They only give me rotten food here. I can´t regain my powers because I have no mana!"})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sure I have the key! Hehehe! Perhaps I will give it to you. IF you can solve my riddle."})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are trying to capture me! Or hang on! Haven't they already captured me? Hmmm - I will have to think about this."})
keywordHandler:addKeyword({'markwin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the worst of them all! He is the king of the minos! May he burn in hell!"})
keywordHandler:addKeyword({'labyrinth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'palkar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the leader of the outcasts. I hope he will never conquer the city of Mintwallin. That would be the end of me!"})
keywordHandler:addKeyword({'karl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tataah!"})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only monster I cannot conjure. But soon I will be powerful enough!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'conjure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'home'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'apple') or msgcontains(msg, 'Apple') then
	npcHandler:say("Apples! Real apples! Man I love them! Can I have one? Oh please say yes!", 1)
	aprisoner_talk_state = 1
			
elseif aprisoner_talk_state == 1 and msgcontains(msg, 'yes') or aprisoner_talk_state == 1 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveItem(cid, Cfapple, 1) == TRUE then
	npcHandler:say("Mnjam. Excellent! Thanks, man!", 1)
	else
	npcHandler:say("Do you want to trick me? You don´t have one lousy apple!", 1)
	end
	aprisoner_talk_state = 0
elseif aprisoner_talk_state == 1 and msgcontains(msg, '') then
	npcHandler:say("Ooooooooooo.<sniff>", 1)
	aprisoner_talk_state = 0

elseif msgcontains(msg, 'number') or msgcontains(msg, 'Number') or msgcontains(msg, 'math') or msgcontains(msg, '+') or msgcontains(msg, 'plus') then
	if getPlayerStorageValue(cid, 8086) <= 0 then
	npcHandler:say("My surreal numbers are based on astonishing facts. Are you interested in learning the secret of mathemagics?", 1)
	aprisoner_talk_state = 7	
	elseif getPlayerStorageValue(cid, 8086) >= 1 then
	npcHandler:say("You already know the secrets of mathemagics! Now go and use them to learn.", 1)
	end

elseif aprisoner_talk_state == 7 and msgcontains(msg, 'yes') or aprisoner_talk_state == 7 and msgcontains(msg, 'Yes') then
	npcHandler:say("But first tell me your favourite colour please!", 1)
	aprisoner_talk_state = 8

elseif aprisoner_talk_state == 8 and msgcontains(msg, '') then
	npcHandler:say("Very interesting. So are you ready to proceed in you lesson in mathemagics?", 1)
	aprisoner_talk_state = 9
	
elseif aprisoner_talk_state == 9 and msgcontains(msg, 'yes') or aprisoner_talk_state == 9 and msgcontains(msg, 'Yes') then
THEMATH = math.random(1,4)
	if THEMATH == 1 then
	npcHandler:say("So know that everthing is based on the simple fact that 1 + 1 = 49!", 1)
	elseif THEMATH == 2 then
	npcHandler:say("So know that everthing is based on the simple fact that 1 + 1 = 94!", 1)
	elseif THEMATH == 3 then
	npcHandler:say("So know that everthing is based on the simple fact that 1 + 1 = 13!", 1)
	elseif THEMATH == 4 then
	npcHandler:say("So know that everthing is based on the simple fact that 1 + 1 = 1!", 1)
	end
	aprisoner_talk_state = 0
	setPlayerStorageValue(cid, 8086, 1)

elseif aprisoner_talk_state == 8 and msgcontains(msg, '') then
	npcHandler:say("I think you are not in touch with yourself, come back if you have tuned in on your own feelings.", 1)
	aprisoner_talk_state = 0	

elseif msgcontains(msg, 'dp') or msgcontains(msg, 'pd') then
	npcHandler:say("Hurray! For that I will give you my key for - hmm - let´s say ... some apples. Interested?", 1)
	aprisoner_talk_state = 3

elseif aprisoner_talk_state == 3 and msgcontains(msg, 'yes') or aprisoner_talk_state == 3 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveItem(cid, Cfapple, 7) == TRUE then
	npcHandler:say("Mnjam - excellent apples. Now - about that key. You are sure want it?", 1)
	aprisoner_talk_state = 4
	else
	npcHandler:say("Get some more apples first!", 1)
	aprisoner_talk_state = 0
	end
elseif aprisoner_talk_state == 3 and msgcontains(msg, '') then
	npcHandler:say("Then go away!",1)
	aprisoner_talk_state = 0
	npcHandler:releaseFocus()
	npcHandler:resetNpc()
	
elseif aprisoner_talk_state == 4 and msgcontains(msg, 'yes') or aprisoner_talk_state == 4 and msgcontains(msg, 'Yes') then
	npcHandler:say("Really, really?", 1)
	aprisoner_talk_state = 5
elseif aprisoner_talk_state == 4 and msgcontains(msg, '') then
	npcHandler:say("Then go away!", 1)
	aprisoner_talk_state = 0
	npcHandler:releaseFocus()
	npcHandler:resetNpc()

elseif aprisoner_talk_state == 5 and msgcontains(msg, 'yes') or aprisoner_talk_state == 5 and msgcontains(msg, 'Yes') then
	npcHandler:say("Really, really, really, really?", 1)
	aprisoner_talk_state = 6
elseif aprisoner_talk_state == 5 and msgcontains(msg, '') then
	npcHandler:say("Then go away!", 1)
	aprisoner_talk_state = 0
	npcHandler:releaseFocus()
	npcHandler:resetNpc()	
	
elseif aprisoner_talk_state == 6 and msgcontains(msg, 'yes') or aprisoner_talk_state == 6 and msgcontains(msg, 'Yes') then
	npcHandler:say("Then take it and get happy - or die, hehe.", 1)
	KEY = doPlayerAddItem(cid, Cfsilverkey, 1)
	doSetItemActionId(KEY, 3666)
	aprisoner_talk_state = 0
elseif aprisoner_talk_state == 6 and msgcontains(msg, '') then
	npcHandler:say("Then go away!", 1)
	aprisoner_talk_state = 0
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
