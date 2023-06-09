dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our guild relys heavily on the honor and trustworthyness of its members."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You might apply for a membership in our haedquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its just south oh Kazordoon. Follow the road and you will run right into it."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working here at the post office. If you have questions about the Royal Carlin Mail System or the depots ask me."})
keywordHandler:addKeyword({'office'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I rarely leave my office. You are welcome at any time."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Liane."})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are very easily to use. Just step in front of them and you will find your items in them. They are free for all citizens. Hail our Queen!"})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our Queen's rule makes Carlin prosper."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our wonderful town is protected by the wise Queen Eloise."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A town ruled by men, a dangerous place. Anyway, we bring also letters and parcels there."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the postman in Thais and somewhat stupid. But he never sents wrong letters or parcels."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't deliver letters or parcels there, sorry."})
keywordHandler:addKeyword({'wally'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wally and I became pen-pals in the course of years."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

if msgcontains(msg, 'parcel') or msgcontains(msg, 'Parcel') then
	itemname = "parcel"
	itemprice = 10
	npcHandler:say("Would you like to buy a parcel for 10 gold?", 1)
	liane_talk_state = 8595
	
elseif msgcontains(msg, 'letter') or msgcontains(msg, 'Letter') then
	itemname = "letter"
	itemprice = 5
	npcHandler:say("Would you like to buy a letter for 5 gold?", 1)
	liane_talk_state = 8596	
	
			
elseif liane_talk_state == 8595 and msgcontains(msg, 'yes') or liane_talk_state == 8595 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 10) == TRUE then
		npcHandler:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", 1)
		doPlayerAddItem(cid, Cfparcel)
		doPlayerAddItem(cid, Cflabel)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	end
elseif liane_talk_state == 8596 and msgcontains(msg, 'yes') or liane_talk_state == 8596 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 5) == TRUE then
		npcHandler:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox.", 1)
		doPlayerAddItem(cid, Cfletter)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	end
	
elseif liane_talk_state == 8595 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)
elseif liane_talk_state == 8596 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)

elseif  msgcontains(msg, 'mail') then
    npcHandler:say('Our mail system is unique! And everyone can use it. Do you want to know more about it?', 1)
    liane_talk_state = 505   

        elseif liane_talk_state == 505 and msgcontains(msg, 'yes') then
		npcHandler:say('The Tibia Mail System enables you to send and receive letters and parcels. You can buy them here if you want.', 1)
		liane_talk_state = 0
        elseif liane_talk_state == 505 and msgcontains(msg, 'no') then
		npcHandler:say('Is there anything else I can do for you?', 1)
		liane_talk_state = 0		

end

if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, 250) == 27 and getPlayerStorageValue(cid, 100175) == -1) then
		npcHandler:say("I have more urgent problem to attend then that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I'll see if I have the time for this nonsense. Do you have 12 arrows with you?",cid)
		talkstatez = 1
	elseif (talkstatez == 1) then   
	if (msgcontains(msg, 'yes') and talkstatez == 1 and doPlayerRemoveItem(cid,2544,12)) then
		npcHandler:say("Great! Now I'll teach them a lesson ... For those measurements ... <tells you her measurements>",cid)
		setPlayerStorageValue(cid, 100175,1)
		talkstatez = 0
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100178) == 1 and getPlayerStorageValue(cid,100179) == 1) then
		setPlayerStorageValue(cid,100171,29)
		setPlayerStorageValue(cid, 250, 34)
	end
    else
        npcHandler:say("I dont see the 12 arrows with you.",cid)
	end
	end 


		
    return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
