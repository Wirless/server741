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

keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, the king doesn't send troops anymore, the academy is dreadfully low on money, and the end of the world is pretty nigh. Apart from that I am reasonably fine, I suppose."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell the Key to Adventure for 5 gold! If you are interested, tell me that you want to buy the key."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the master of this fine academy."})
keywordHandler:addKeyword({'academy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our academy has a library, a training center in the cellars and the oracle upstairs."})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Go and read our books. Ignorance may mean death, so be careful."})
keywordHandler:addKeyword({'train'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can try some basic things down there, but don't challenge the monsters in our arena if you are inexperienced."})
keywordHandler:addKeyword({'center'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can try some basic things down there, but don't challenge the monsters in our arena if you are inexperienced."})
keywordHandler:addKeyword({'cellar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can try some basic things down there, but don't challenge the monsters in our arena if you are inexperienced."})
keywordHandler:addKeyword({'oracle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You will find the oracle upstairs. Talk to the oracle as soon as you have made level 8. Choose a vocation and a new home town, and you will be sent off to the continent."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You will find the oracle upstairs. Talk to the oracle as soon as you have made level 8. Choose a vocation and a new home town, and you will be sent off to the continent."})
keywordHandler:addKeyword({'rookgaard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here on Rookgaard we have some people, a temple, some shops, a farm and an academy."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Seymour, but to you I am 'Sir' Seymour."})
keywordHandler:addKeyword({'seymour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Seymour, but to you I am 'Sir' Seymour."})
keywordHandler:addKeyword({'sir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At least you know how to address a man of my importance."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can assist you with my advice."})
keywordHandler:addKeyword({'hint'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can assist you with my advice."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, there's me, Cipfried, Willie, Obi, Amber, Dallheim, Al Dee, Norma, and Hyacinth."})
keywordHandler:addKeyword({'advice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Read the blackboard for some hints and visit the training center in the cellar."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can learn about Tibia's monsters in our library."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are some dungeons on this isle. You should be strong enough to explore them now, but make sure to take a rope with you."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our sewers are overrun with rats. If you own some equipment you could go down a sewer grate and fight the vermin."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can learn much about Tibia's gods in our library."})
keywordHandler:addKeyword({'gamemaster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have serious problems with the game or with other people who are harassing you, contact a counsellor or a gamemaster using CTRL+R."})
keywordHandler:addKeyword({'counsellor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have serious problems with the game or with other people who are harassing you, contact a counsellor or a gamemaster using CTRL+R."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hail to King Tibianus! Long live our king! Not that he cares for an old veteran who is stuck on this godforsaken island..."})
keywordHandler:addKeyword({'obi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A cousin of Thais' smith Sam. He has a shop here where you can buy most stuff an adventurer needs."})
keywordHandler:addKeyword({'cipfried'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A humble monk with healing powers, and a pupil of the great Quentin himself."})
keywordHandler:addKeyword({'amber'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A traveller from the main land. I wonder what brought her here, since no one comes here of his own free will."})
keywordHandler:addKeyword({'willie'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Willie is a fine farmer, although he has short temper."})
keywordHandler:addKeyword({'hyacinth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A mysterious druid who lives somewhere in the wilderness. He sells precious life fluids."})
keywordHandler:addKeyword({'dallheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh good Dallheim! What a fighter he is! Without him we would be doomed."})
keywordHandler:addKeyword({'al dee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a shop owner in the northwestern part of the village."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is responsible for the temple in Thais."})
keywordHandler:addKeyword({'life fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A rare magic potion that restores health."})
keywordHandler:addKeyword({'bug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nasty little creatures, but once you have a suitable weapon and perhaps a shield they will be no match for you."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You need fine weapons to fight the tougher beasts. Unfortunately only the most basic weapons and armor are available here. You will have to fight some monsters to get a better weapon."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only magic-user on this isle is old Hyacinth."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, how I miss the crowded streets of Thais. I know one day I will get promoted and get a job at the castle... I must get out of here! The faster the better! It is people like you who are driving me mad."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The castle of Thais is the greatest achievement in Tibian history."})
keywordHandler:addKeyword({'smuggler'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are pretty annoying yes, they use to steal food and water from the basement here.. I hope someday there will be a player that can help us get rid of them once and for all."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)

if msgcontains(msg, 'mission') or msgcontains(msg, 'quest') then
	if getPlayerLevel(cid) <= 3 then
	npcHandler:say("You are pretty inexperienced. I think killing rats is a suitable challenge for you. For each fresh rat I will give you two shiny coins of gold.", 1)
	elseif getPlayerLevel(cid) >= 4 then
	npcHandler:say("Well I would like to send our king a little present, but I do not have a suitable box. If you find a nice box, please bring it to me.", 1)
	end
	seymour_talk_state = 0
			
elseif msgcontains(msg, 'fuck') then
	if getPlayerSex(cid) == 0 then
	npcHandler:say("For this remark I will wash your mouth with soap, young lady!", 1)
	doSendMagicEffect(getPlayerPosition(cid), 7)
	elseif getPlayerSex(cid) == 1 then
	npcHandler:say("For this remark I will wash your mouth with soap, young man!", 1)
	doSendMagicEffect(getPlayerPosition(cid), 7)	
	end

elseif msgcontains(msg, 'present') and getPlayerStorageValue(cid, 7001) <= 0 or msgcontains(msg, 'box') and getPlayerStorageValue(cid, 7001) <= 0 then
	npcHandler:say("Do you have a suitable present box for me?", 1)
	seymour_talk_state = 205
	
elseif seymour_talk_state == 205 and msgcontains(msg, 'yes') then
	if getPlayerItemCount(cid, 1990) >= 1 then
	doPlayerRemoveItem(cid, 1990, 1)
	npcHandler:say("THANK YOU! Here is a helmet that will serve you well.", 1)
	doPlayerAddItem(cid, Cflegionhelmet, 1)
	setPlayerStorageValue(cid,7001,1)
	doAddQuestPoint(cid)
	seymour_talk_state = 0
	else
	npcHandler:say("HEY! You don't have one! Stop playing tricks on me or I will give some extra work!", 1)
	end

	elseif msgcontains(msg, 'key') then
	npcHandler:say("Do you want to buy the Key to Adventure for 5 gold coins?", 1)
	seymour_talk_state = 206
	
elseif seymour_talk_state == 206 and msgcontains(msg, 'yes') then
	if doPlayerRemoveMoney(cid, 5) == TRUE then
	npcHandler:say("Here you are.", 1)
	KEY = doPlayerAddItem(cid, 2088, 1) --Rook Academy Key
	doSetItemActionId(KEY, 2006)
	doSetItemSpecialDescription(KEY, "(key: 4600)")
	seymour_talk_state = 0
	else
	npcHandler:say("You don't have enough money.", 1)
	seymour_talk_state = 0
	end	

elseif msgcontains(msg, 'rat') then
	npcHandler:say("Have you brought dead rats to me to pick up your reward?", 1)
	seymour_talk_state = 2
	
elseif seymour_talk_state == 2 and msgcontains(msg, 'yes') then
AMOUNTRAT = getPlayerItemCount(cid,2813)
if AMOUNTRAT >= 1 then
	if doPlayerRemoveItem(cid, 2813, AMOUNTRAT) == TRUE then
	doPlayerAddMoney(cid, AMOUNTRAT*2)
	npcHandler:say("Thank you! Here is your reward.", 1)
	end
else
npcHandler:say("HEY! You don't have one! Stop playing tricks on fooling me or I will give you some extra work!", 1)
end
seymour_talk_state = 0

elseif seymour_talk_state == 2 and msgcontains(msg, '') then
npcHandler:say("Go and find some rats to kill!", 1)
seymour_talk_state = 0

end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
