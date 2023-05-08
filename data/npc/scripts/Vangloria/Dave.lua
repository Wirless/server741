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


keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That name sounds familiar... who might that be..."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hm, I think I heard about that guild... oh wait, I am a member!"})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I'm just an illusion NPC, wait to next update to make my missions.."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I'm just an illusion NPC, wait to next update to make my missions.."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working here at the post office. If you have questions about the Royal Tibia Mail System or the depots ask me."})
keywordHandler:addKeyword({'office'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am always in my office. You are welcome at any time."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dave."})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are very easy to use. Just step in front of them and you will find your items in them. They are free for all tibian citizens. Hail our king!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "TO THE ARMS! MAN THE WALLS! FERUMBRAS IS NEAR!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "TO THE ARMS! MAN THE WALLS! FERUMBRAS IS NEAR!"})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "TO THE ARMS! MAN THE WALLS! FERUMBRAS IS NEAR!"})
keywordHandler:addKeyword({'miriam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Miriam? I think I am in love with her foods."})
keywordHandler:addKeyword({'voldoor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He sells equipment."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't drink alcohol while on duty."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't read the letters we transmit."})

keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can sent letters and parcels to Carlin."})
keywordHandler:addKeyword({'jonas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The young sorcerer is a good businessman."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

if msgcontains(msg, 'parcel') or msgcontains(msg, 'Parcel') then
	itemname = "parcel"
	itemprice = 10
	npcHandler:say("Would you like to buy a parcel for 10 gold?", 1)
	TalkState(cid, 8595)
	
elseif msgcontains(msg, 'letter') or msgcontains(msg, 'Letter') then
	itemname = "letter"
	itemprice = 5
	npcHandler:say("Would you like to buy a letter for 5 gold?", 1)
	TalkState(cid, 8596)
	
			
elseif GetTalkState(cid) == 8595 and msgcontains(msg, 'yes') or GetTalkState(cid) == 8595 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 10) == TRUE then
		npcHandler:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", 1)
		doPlayerAddItem(cid, Cfparcel)
		doPlayerAddItem(cid, Cflabel)
		TalkState(cid, 0)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	TalkState(cid, 0)
	end
elseif GetTalkState(cid) == 8596 and msgcontains(msg, 'yes') or GetTalkState(cid) == 8596 and msgcontains(msg, 'Yes') then
	if doPlayerRemoveMoney(cid, 5) == TRUE then
		npcHandler:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox.", 1)
		doPlayerAddItem(cid, Cfletter)
		TalkState(cid, 0)
	else
	npcHandler:say("Oh, you do not have enough gold to buy a ".. itemname ..".", 1)
	TalkState(cid, 0)
	end
	
elseif GetTalkState(cid) == 8595 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)
TalkState(cid, 0)
elseif GetTalkState(cid) == 8596 and msgcontains(msg, '') then
npcHandler:say("Ok.", 1)
TalkState(cid, 0)

elseif  msgcontains(msg, 'mail') then
    npcHandler:say('Our mail system is unique! And everyone can use it. Do you want to know more about it?', 1)
	TalkState(cid, 505)	

        elseif GetTalkState(cid) == 505 and msgcontains(msg, 'yes') then
		npcHandler:say('The Tibia Mail System enables you to send and receive letters and parcels. You can buy them here if you want.', 1)
		TalkState(cid, 0)
        elseif GetTalkState(cid) == 505 and msgcontains(msg, 'no') then
		npcHandler:say('Is there anything else I can do for you?', 1)
		TalkState(cid, 0)	

		
		
elseif msgcontains(msg, 'bounty') or msgcontains(msg, 'price') then
	npcHandler:say("Who do you want to add this bounty to?", 1)
	TalkState(cid, 6981)

	elseif GetTalkState(cid) == 6981 then
	BOUNTYNAME = msg
	newname = string.upper(string.sub(msg, 0, 1)) .. string.sub(msg, 2)
	UPPERCASEBOUNTYNAME = newname
		
	if getPlayerGUIDByName(BOUNTYNAME) > 0 then
		checkcharexist = mysqlQuery("SELECT `id`, `vocation` FROM `players` WHERE `players`.`name` = \"" .. BOUNTYNAME .. "\" AND `players`.`world_id` = '" .. getConfigValue("WorldID") .. "'", "id, vocation")
		GETVALIDCHAR = getCount(checkcharexist.id)
			if GETVALIDCHAR >= 1 then
				if GETVALIDCHAR == getPlayerGUIDByName(getPlayerName(cid)) then
				npcHandler:say("Haha, setting yourself up as bounty, good joke!", 1)
				TalkState(cid, 0)
				else
					notinrook = getCount(checkcharexist.vocation)
					if notinrook >= 1 and notinrook <= 8 then
					npcHandler:say("How much would you like to add as bounty?", 1)
					TalkState(cid, 6982)
					else
					npcHandler:say("You can only add bounty to players with an vocation!", 1)
					TalkState(cid, 0)
					end
				end
			else
			npcHandler:say("There's no such player in this world!", 1)
			TalkState(cid, 0)
			end
		else
		npcHandler:say("There's no such player in this world!", 1)
		TalkState(cid, 0)
		end
	
	
	elseif GetTalkState(cid) == 6982 then
	BOUNTYAMOUT = getCount(msg)
	if BOUNTYAMOUT > 0 then
		if BOUNTYAMOUT <= 1000000 then
			if BOUNTYAMOUT < 1000 then
			npcHandler:say("You cannot add less than 1000 gold to as bounty! so I ask you again, how much would you like to add?", 1)
			TalkState(cid, 6982)
			else
			npcHandler:say("Would you like to add ".. BOUNTYAMOUT .." gold as bounty on ".. UPPERCASEBOUNTYNAME .."?", 1)
			TalkState(cid, 6983)
			end
		else
		npcHandler:say("That number is too high!", 1)
		TalkState(cid, 0)
		end
	else
	npcHandler:say("That's not a valid amount.", 1)
	TalkState(cid, 0)
	end
	
elseif GetTalkState(cid) == 6983 and msgcontains(msg, 'yes') then
	if doPlayerRemoveMoney(cid, BOUNTYAMOUT) == TRUE then 
		getbountyinfo = mysqlQuery("SELECT `bounty_price` FROM `players` WHERE `players`.`name` = \"" .. BOUNTYNAME .. "\" AND `players`.`world_id` = '" .. getConfigValue("WorldID") .. "'", "bounty_price")
		currentbounty = getCount(getbountyinfo.bounty_price)	
		mysqlQuery("UPDATE `players` SET `bounty_price` = '".. (currentbounty+BOUNTYAMOUT) .."' WHERE `players`.`name` = \"" .. BOUNTYNAME .. "\"", "SET")
		npcHandler:say("You have added a ".. BOUNTYAMOUT .." gold bounty on ".. UPPERCASEBOUNTYNAME ..".", 1)
		TalkState(cid, 0)
	else
	npcHandler:say("You don't have enough money!", 1)
	TalkState(cid, 0)	
	end
	
	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
