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

shopModule:addBuyableItem({'torch'}, 					Cftorch, 3)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 60)
shopModule:addBuyableItem({'water hose'}, 					Cfwaterhose, 10)
shopModule:addBuyableItem({'backpack'}, 					Cfbackpack, 25)
shopModule:addBuyableItem({'fishing rod'}, 					Cffishingrod, 175)
shopModule:addBuyableItem({'crowbar'}, 					Cfcrowbar, 260)
shopModule:addBuyableItem({'apple'}, 					Cfapple, 3)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling equipment for adventurers. Do you need anything?"})
keywordHandler:addKeyword({'lubo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Lubo, the owner of this shop."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No idea."})
keywordHandler:addKeyword({'mountain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that once there lived a great magician on the top of this mountain."})
keywordHandler:addKeyword({'magician'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't remember his name, but it's said that his banner was the black eye."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell the best apples in Tibia."})
keywordHandler:addKeyword({'map'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh! I'm sorry, I sold the last one just five minutes ago."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's a lot of magic flowing in the mountain to the north."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to buy weapons, you'll have to go to a town or city."})
keywordHandler:addKeyword({'dog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is Ruffy my dog, please don't do him any harm."})
keywordHandler:addKeyword({'pet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are some strange stories about a magicians pet names. Ask Hoggle about it."})
keywordHandler:addKeyword({'finger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, you sure mean this old story about the mage Dago, who lost two fingers when he conjured a dragon."})
keywordHandler:addKeyword({'inn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Frodo runs a nice inn in the near town Thais."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah yes, I remember my grandfather talking about that name. This house used to be an inn a long time ago. My family bought it from some of these flower guys."})
keywordHandler:addKeyword({'flower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I mean druids of course. They sold the cottage to my family after some of them died in an accident or something like that."})
keywordHandler:addKeyword({'accident'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As far as I can remember the story, a pet escaped its stable behind the inn. It got somehow involved with powerfull magic at a ritual and was transformed in some way."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'goods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'stable') then
	if getPlayerStorageValue(cid, 8191) == 3 then
		npcHandler:say("My grandpa told me, in the old days there were some behind this cottage. Nothing big though, just small ones, for chicken or rabbits.", 1)
		setPlayerStorageValue(cid,8191, 4)
	elseif getPlayerStorageValue(cid, 8191) >= 3 then
		npcHandler:say("My grandpa told me, in the old days there were some behind this cottage. Nothing big though, just small ones, for chicken or rabbits.", 1)
	else
		npcHandler:say("Sorry speak louder I can't hear you.", 1)
	end
	name_talk_state = 0
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
