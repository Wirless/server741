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
if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
	if getPlayerSex(cid) == 1 then
	npcHandler:setMessage(MESSAGE_GREET, "Welcome back, brother ".. getPlayerName(cid) .."!")
	else
	npcHandler:setMessage(MESSAGE_GREET, "Welcome back, sister ".. getPlayerName(cid) .."!")
	end
	return true
else
npcHandler:setMessage(MESSAGE_GREET, "Welcome ".. getPlayerName(cid) .."! Whats your need?")
return true
	end	
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'talon'}, 					Cftalon, 320)

shopModule:buyContainer({'backpack of manafluid', 'bp of manafluid', 'bp mf', 'bp of mf'}, 	             2004, 2006, 2000, 7,  	'Backpack of manafluid')
shopModule:buyContainer({'backpack of lifefluid', 'bp of lifefluid', 'bp lf', 'bp of lf'},				2000, 2006, 2000, 10, 'Backpack of lifefluid')
shopModule:buyContainer({'bp of blank', 'backpack of blank', 'bp blank'}, 	             1988, 2260, 200, 1,  	'Backpack of blank runes')


shopModule:addBuyableItem({'blank rune', 'blank rune'}, 							2260, 10, 1,		'blank rune')
shopModule:addBuyableItem({'light wand', 'lightwand'}, 					2163, 500, 		'magic light wand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 					2006, 100, 	7, 	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 					2006, 80, 	10,	'life fluid')



--shopModule:addBuyableItem({'magic wall', 'magic', 'magic wall rune'}, 					2293, 350,  3,   	'magic wall rune')


--shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile'}, 					2311, 120, 5,	'heavy magic missile rune')
--shopModule:addBuyableItem({'light magic missile rune', 'light magic missile'}, 					2287, 40, 5,	'light magic missile rune')
--shopModule:addBuyableItem({'sudden death rune', 'sudden death'}, 						2268, 325, 1,	'sudden death rune')
--shopModule:addBuyableItem({'great fireball rune', 'great fire ball'}, 						2304, 180, 2, 	'great fireball rune')
--shopModule:addBuyableItem({'fireball rune', 'fireball rune'}, 						2302, 65, 3, 	'fireball rune')
--shopModule:addBuyableItem({'explosion rune', 'explosion rune'}, 							2313, 190, 3, 	'explosion rune')
--shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 					2273, 175, 1, 	'ultimate healing rune')
--shopModule:addBuyableItem({'intense healing rune', 'ih'}, 					2265, 90, 1, 	'intense healing rune')



--shopModule:addBuyableItem({'fire field rune', 'fire field rune'}, 					2301, 60, 3, 	'fire field rune')
--shopModule:addBuyableItem({'fire wall rune', 'fire wall rune'}, 					2303, 60, 3, 	'fire wall rune')
--shopModule:addBuyableItem({'fire bomb rune', 'fire bomb rune'}, 					2305, 235, 2, 	'fire bomb rune')

--shopModule:addBuyableItem({'poison field rune', 'poison field rune'}, 					2285, 65, 3, 	'poison field rune')
--shopModule:addBuyableItem({'poison wall rune', 'poison wall rune'}, 					2289, 50, 3, 	'poison bomb rune')
--shopModule:addBuyableItem({'poison bomb rune', 'pb'}, 					2286, 65, 3, 	'poison wall rune')

--shopModule:addBuyableItem({'energy field rune', 'energy rune'}, 					2277, 65, 3, 	'energy rune')
--shopModule:addBuyableItem({'energy bomb rune', 'energy bomb rune'}, 					2262, 160, 3, 	'energy bomb rune')
--shopModule:addBuyableItem({'energy wall rune', 'energy wall rune'}, 					2279, 340, 4, 	'energy wall rune')

--shopModule:addBuyableItem({'destroy field', 'destroy field rune'}, 					2261, 45, 3, 	'destroy field rune')

--shopModule:addBuyableItem({'convince creature rune', 'convince creature rune'}, 					2290, 80, 5, 	'convince creature rune')
--shopModule:addBuyableItem({'chameleon rune', 'chameleon rune'}, 					2291, 210, 1, 	'chameleon rune')

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'vial') then
npcHandler:say("I will give you 5 gold for every empty vial of yours, accept?", 1)
rachel_talk_state = 857
elseif rachel_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	rachel_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	rachel_talk_state = 0
	end
end
    return 1
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the head alchemist of Carlin. I keep the secret recipies of our ancestors. Besides, I am selling mana and life fluids, spellbooks and runes."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the illusterous Rachel, of course."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is of no meaning to us sorcerers."})
keywordHandler:addKeyword({'wisdom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wisdom arises from patience."})
keywordHandler:addKeyword({'patience'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You have to free yourself from unpatience to learn the deeper secrets of magic."})
keywordHandler:addKeyword({'ancestor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a guild of old traditions and even older secrets."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Spells are the minor parts that make a sorcerer. To be one is a state of mind, not of a full spellbook."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Power is important, but it is just the way, not the ultimate goal."})
keywordHandler:addKeyword({'goal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This secrect will be taught you by life, not by me."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Sorcerers, paladins, knights, and druids."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am too busy to teach you, ask in your guild about that."})



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
