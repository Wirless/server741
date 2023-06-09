dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for this post office."})
keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is the leader of our guild and the most prominent postofficer in the whole land."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is the leader of our guild and the most prominent postofficer in the whole land."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, our guild is the lifeblood of the tibia cominity so to say."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can apply to join only at our headquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find it on the road from Thais to Kazordoon."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hail to the king!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hail to the king!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The army ensures the safety of the traderoutes and of our mail system."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I bet he never gets any letters."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better ask knights about that."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our post system spans the entire known world."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our post system even delivers letters and parcels to and from this isle."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, that's postal secret."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, that's postal secret."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

if msgcontains(msg, 'parcel') or msgcontains(msg, 'Parcel') then
	itemname = "parcel"
	itemprice = 10
	npcHandler:say("Would you like to buy a parcel for 10 gold?", 1)
	crystal_talk_state = 8595
	
elseif msgcontains(msg, 'letter') or msgcontains(msg, 'Letter') then
	itemname = "letter"
	itemprice = 5
	npcHandler:say("Would you like to buy a letter for 5 gold?", 1)
	crystal_talk_state = 8596	
	
			
elseif crystal_talk_state == 8595 and msgcontains(msg, 'yes') or crystal_talk_state == 8595 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 10) == TRUE then
		npcHandler:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", 1)
		doPlayerAddItem(cid, Cfparcel)
		doPlayerAddItem(cid, Cflabel)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	end
elseif crystal_talk_state == 8596 and msgcontains(msg, 'yes') or crystal_talk_state == 8596 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 5) == TRUE then
		npcHandler:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox.", 1)
		doPlayerAddItem(cid, Cfletter)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	end
	
elseif crystal_talk_state == 8595 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)
elseif crystal_talk_state == 8596 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)

elseif  msgcontains(msg, 'mail') then
    npcHandler:say('Our mail system is unique! And everyone can use it. Do you want to know more about it?', 1)
    crystal_talk_state = 505   

        elseif crystal_talk_state == 505 and msgcontains(msg, 'yes') then
		npcHandler:say('The Tibia Mail System enables you to send and receive letters and parcels. You can buy them here if you want.', 1)
		crystal_talk_state = 0
        elseif crystal_talk_state == 505 and msgcontains(msg, 'no') then
		npcHandler:say('Is there anything else I can do for you?', 1)
		crystal_talk_state = 0		

end		

if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, 250) == 27 and getPlayerStorageValue(cid, 100179) == -1) then
		npcHandler:say("If its necessary ... <tells you her measurements>",cid)
		setPlayerStorageValue(cid, 100179,1)
	
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100178) == 1) then
		setPlayerStorageValue(cid, 250, 34)
	end
	end 


    return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
