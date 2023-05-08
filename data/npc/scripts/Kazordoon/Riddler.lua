dofile(getDataDir() .. 'global/greeting.lua')
dofile(getDataDir() .. 'global/NPC_Speach.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as the riddler. That is all you need to know."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the guardian of the paradox tower."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is the age of the talon."})
keywordHandler:addKeyword({'tower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This tower, of course, silly one. It holds my master's treasure."})
keywordHandler:addKeyword({'paradox'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This tower, of course, silly one. It holds my master's treasure."})
keywordHandler:addKeyword({'master'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His name is none of your business."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am guarding the treasures of the tower. Only those who pass the test of the three sigils may pass."})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am guarding the treasures of the tower. Only those who pass the test of the three sigils may pass."})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The key of this tower! You will never find it! A malicious plant spirit is guarding it!"})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The key of this tower! You will never find it! A malicious plant spirit is guarding it!"})
function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

if msgcontains(msg, 'test') or msgcontains(msg, 'sigil') then
	npcHandler:say("Death awaits those who fail the test of the three seals! Do you really want me to test you?", 1)
	riddler_talk_state = 1
	
elseif riddler_talk_state == 1 and msgcontains(msg, 'yes') then
	if getPlayerStorageValue(cid,8195) <= 0 then
	setPlayerStorageValue(cid,8195,1)
	npcHandler:say("FOOL! Now you're doomed! But well ... So be it! Let's start out with the Seal of Knowledge and the first question: What name did the necromant king choose for himself?", 1)
	riddler_talk_state = 2	
	elseif getPlayerStorageValue(cid,8195) == 1 then
	npcHandler:say("So you think you're smart! But well ... So be it! Let's start out with the Seal of Knowledge and the first question: What do I have in my pocket??", 1)
	riddler_talk_state = 14		
	end
elseif riddler_talk_state == 1 and msgcontains(msg, 'no') then
	npcHandler:say("HEHEHE! I knew you wouldn't have the stomach.", 1)
	riddler_talk_state = 0		
elseif riddler_talk_state == 14 and msgcontains(msg, '') then	
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0	
	
elseif riddler_talk_state == 2 and msgcontains(msg, 'goshnar') then
	npcHandler:say("HOHO! You have learned your lesson well. Question number two then: Who or what is the feared Hugo?", 1)
	riddler_talk_state = 3		
elseif riddler_talk_state == 2 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 3 and msgcontains(msg, 'demonbunny') then
	if getPlayerStorageValue(cid,8191) == 4 then
	setPlayerStorageValue(cid,8191,1)
	npcHandler:say("HOHO! Right again. All right. The final question of the first seal: Who was the first warrior to follow the path of the Mooh'Tah?", 1)
	riddler_talk_state = 4	
	else
	npcHandler:say("Hmmm, so you think cheating will get you through that test? Then your final question of the first seal is: What is the meaning of life?", 1)
	riddler_talk_state = 13		
	end
elseif riddler_talk_state == 3 and msgcontains(msg, 'demonrabbit') then
	if getPlayerStorageValue(cid,8191) == 4 then
	setPlayerStorageValue(cid,8191,1)
	npcHandler:say("HOHO! Right again. All right. The final question of the first seal: Who was the first warrior to follow the path of the Mooh'Tah?", 1)
	riddler_talk_state = 4	
	else
	npcHandler:say("Hmmm, so you think cheating will get you through that test? Then your final question of the first seal is: What is the meaning of life?", 1)
	riddler_talk_state = 13		
	end	
elseif riddler_talk_state == 3 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0		
elseif riddler_talk_state == 13 and msgcontains(msg, '') then
	npcHandler:say("WRONG! Next time get your own answers. To hell with thee, cheater!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0	

elseif riddler_talk_state == 4 and msgcontains(msg, "tha'kull") then
	npcHandler:say("HOHO! Lucky you. You have passed the first seal! So ... would you like to continue with the Seal of the Mind?", 1)
	riddler_talk_state = 5
elseif riddler_talk_state == 4 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 5 and msgcontains(msg, "yes") then
	npcHandler:say("As you wish, foolish one! Here is my first question: Its lighter then a feather but no living creature can hold it for ten minutes?", 1)
	riddler_talk_state = 6
elseif riddler_talk_state == 5 and msgcontains(msg, "") then
	setPlayerStorageValue(cid,8195,0)
	npcHandler:say("HEHEHE! I knew you don't have the stomach.", 1)
	npcHandler:releaseFocus()
	npcHandler:resetNpc()
	riddler_talk_state = 6

elseif riddler_talk_state == 6 and msgcontains(msg, "breath") then
	npcHandler:say("That was an easy one. Let's try the second: If you name it, you break it.", 1)
	riddler_talk_state = 7
elseif riddler_talk_state == 6 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 7 and msgcontains(msg, "silence") then
	npcHandler:say("Hm. I bet you think you're smart. All right. How about this: What does everybody want to become but nobody to be?", 1)
	riddler_talk_state = 8
elseif riddler_talk_state == 7 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 8 and msgcontains(msg, "old") then
	npcHandler:say("ARGH! You did it again! Well all right. Do you wish to break the Seal of Madness?", 1)
	riddler_talk_state = 9
elseif riddler_talk_state == 8 and msgcontains(msg, '') then
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 9 and msgcontains(msg, "yes") then
	npcHandler:say("GOOD! So I will get you at last. Answer this: What is your favourite colour?", 1)
	riddler_talk_state = 10	
elseif riddler_talk_state == 9 and msgcontains(msg, "") then
	setPlayerStorageValue(cid,8195,0)
	npcHandler:say("HEHEHE! I knew you don't have the stomach.", 1)
	npcHandler:releaseFocus()
	npcHandler:resetNpc()
	riddler_talk_state = 6

elseif riddler_talk_state == 10 then
	if msgcontains(msg, "red") or msgcontains(msg, "blue") or msgcontains(msg, "black") or msgcontains(msg, "white") or msgcontains(msg, "orange") or msgcontains(msg, "green") or msgcontains(msg, "yellow") or msgcontains(msg, "brown") or msgcontains(msg, "violet") or msgcontains(msg, "pink") or msgcontains(msg, "silver") or msgcontains(msg, "gold") or msgcontains(msg, "grey") then
	npcHandler:say("UHM UH OH ... How could you guess that? Are you mad??? All right. Question number two: What is the opposite?", 1)
	riddler_talk_state = 11		
	else
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0	
	end

elseif riddler_talk_state == 11 and msgcontains(msg, "nothing") then
	npcHandler:say("NO! NO! NO! That can't be true. You're not only mad, you are a complete idiot! Ah well. Here is the last question: What is 1 plus 1?", 1)
	riddler_talk_state = 12
elseif riddler_talk_state == 11 and msgcontains(msg, "none") then
	npcHandler:say("NO! NO! NO! That can't be true. You're not only mad, you are a complete idiot! Ah well. Here is the last question: What is 1 plus 1?", 1)
	riddler_talk_state = 12	
elseif riddler_talk_state == 11 and msgcontains(msg, "") then
	npcHandler:say("SORRY I AM NOT ALLOWD TO HELP HEHEHE!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0

elseif riddler_talk_state == 12 then
	if ABgetCount(msg) >= 1 then
	setPlayerStorageValue(cid,8204,1)
	npcHandler:say("DAMN YOUUUUUUUUUUUUUUUUUUUUUU!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32478, y=31905, z=1})
	doSendMagicEffect({x=32478, y=31905, z=1}, 10)
	riddler_talk_state = 0	
	else
	npcHandler:say("WRONG!", 1)
	setPlayerStorageValue(cid,8195,0)
	doTeleportThing(cid,{x=32725, y=31589, z=12})
	doSendMagicEffect({x=32725, y=31589, z=12}, 15)
	riddler_talk_state = 0	
	end
	
end	
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
