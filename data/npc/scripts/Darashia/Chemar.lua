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
shopModule:addBuyableItem({'letter'}, 					Cfletter, 5)


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Chemar Ibn Kalith."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed carpetpilot and responsible for the Darashian airmail. I can bring you to the Femor Hills, Edron, or you can buy letters and parcels."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph depends heavily on his carpetfleet for commerce and for war alike."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph depends heavily on his carpetfleet for commerce and for war alike."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The prophet of our people; praised be his name."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This scourge of the west may have connections to the evil soils in Drefia."})
keywordHandler:addKeyword({'derfia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the west a big city existed. Its people were corrupted and drew the wrath of the djinn upon them and Drefia was destroyed."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have been almost everywhere in the world and think it's only a myth."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think it's a rolemodel for what befalls people if they forget the teachings of Daraman."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That city is getting noisier and more crowded each month."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'rumour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'femur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you sure that you are not talking about the FEMOR Hills?"})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
pos = getPlayerPosition(cid)
--Travel in hurry--
if msgcontains(msg, "bring me to femor") or msgcontains(msg, "bring me to hill") then
	Chemarbcprice = 60
	Chemarbcdestination = Carpethills
	bcname = "Femor Hills"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Chemarbcprice) == TRUE then
		doTeleportThing(cid, Chemarbcdestination)
		doSendMagicEffect(Chemarbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
elseif msgcontains(msg, "bring me to edron") then
	Chemarbcprice = 40
	Chemarbcdestination = Carpetedron
	bcname = "Edron"
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Chemarbcprice) == TRUE then
		doTeleportThing(cid, Chemarbcdestination)
		doSendMagicEffect(Chemarbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of Travel in hurry--
	
--Give Destination--
elseif msgcontains(msg, 'femor') and npcHandler.focus == cid or msgcontains(msg, 'hill') and npcHandler.focus == cid then
	Chemarbcprice = 60
	Chemarbcdestination = Carpethills
	bcname = "Femor hills"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Chemarbcprice .." gold?", 1)
	TalkState(cid, 94989)
	
elseif msgcontains(msg, "edron") and npcHandler.focus == cid then
	Chemarbcprice = 40
	Chemarbcdestination = Carpetedron
	bcname = "Edron"
	npcHandler:say("Do you seek a passage to ".. bcname .." for ".. Chemarbcprice .." gold?", 1)
	TalkState(cid, 94989)
--End of Give Destination--
	

	
	
--System that does the job after confirm destination--
elseif GetTalkState(cid) == 94989 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if (getTilePzInfo(pos) == FALSE) then
		if doPlayerRemoveMoney(cid, Chemarbcprice) == TRUE then
		doTeleportThing(cid, Chemarbcdestination)
		doSendMagicEffect(Chemarbcdestination, 10)
		npcHandler:say("Hold on!", 1)
		TalkState(cid, 0)
		else
		npcHandler:say("You don't have enough money.", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("If you want to travel with the carpet you have to stand on it! else you'll just fall off!", 1)
	TalkState(cid, 0)	
	end
--End of the System that does the job after confirm destination--

elseif msgcontains(msg, 'flying') and npcHandler.focus == cid then	
	npcHandler:say("Do you want to buy a flying carpet for 5000 platinum coins?", 1)
	TalkState(cid, 7358)
elseif GetTalkState(cid) == 7358 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if getPlayerItemCount(cid,2160) >= 500 then
	npcHandler:say("Oh, I am sorry, but you have no pilot licence.", 1)
	TalkState(cid, 0)
	else
	npcHandler:say("You don't own enough worldly wealth to afford this item.", 1)
	TalkState(cid, 0)
	end
	
elseif GetTalkState(cid) == 7358 and msgcontains(msg, 'no') and npcHandler.focus == cid then
	npcHandler:say("Maybe another day then, my friend.", 1)
	TalkState(cid, 0)

elseif msgcontains(msg, 'mail') and npcHandler.focus == cid then
	npcHandler:say("Our mail system is unique! And everyone can use it. Do you want to know more about it?", 1)
	TalkState(cid, 4278)	
elseif GetTalkState(cid) == 4278 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	npcHandler:say("The Darashian Airmail System enables you to send and receive letters and parcels. You can buy them here if you want.", 1)
	TalkState(cid, 0)

elseif msgcontains(msg, 'parcel') and npcHandler.focus == cid then
	npcHandler:say("Do you want to buy a parcel for 15 gold?", 1)
	TalkState(cid, 3532)
elseif GetTalkState(cid) == 3532 and msgcontains(msg, 'yes') and npcHandler.focus == cid then
	if doPlayerRemoveMoney(cid, 15) == TRUE then
	doPlayerAddItem(cid, Cfparcel, 1)
	doPlayerAddItem(cid, Cflabel, 1)
	npcHandler:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", 1)
	TalkState(cid, 0)
	else
	npcHandler:say("Oh, you have not enough gold to buy a parcel.", 1)
	TalkState(cid, 0)
	end
elseif msgcontains(msg, 'fly') and npcHandler.focus == cid then
	npcHandler:say("I can fly you to Femor Hills or Edron if you like. Where do you want to go?", 1)
	TalkState(cid, 0)	
end		
    return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
