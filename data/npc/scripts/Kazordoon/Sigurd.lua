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
	local playerPos = getPlayerPosition(cid)
	if getTileInfo(playerPos).protection then
	npcHandler:say("I do not talk with players in a protection zone, ".. getPlayerName(cid) .."!", 1)
	return false
	else
	npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
	return true
	end	
end	

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'vial') then
npcHandler:say("I will give you 5 gold for every empty vial of yours, accept?", 1)
xodet_talk_state = 857
elseif xodet_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	xodet_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	xodet_talk_state = 0
	end
end
    return 1
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

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
xodet_talk_state = 857
elseif xodet_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	xodet_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	xodet_talk_state = 0
	end
end
    return 1
end

keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm just wonderful - thank you for asking."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Topsy."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time waits for no one! Not even you, sweetheart, so please do hurry up."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better buy and charge a lot of runes before facing any monster."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dungeons - dark cold places if you ask me. They lead to rusty armour, severe colds and death ... on the other hand you use a lot of runes there ... so just think about the treasures you'll surely find there."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Thais sewerage system is a model of modern rat breeding and for some reason is very popular with young adventurers such as yourself."})
keywordHandler:addKeyword({'boss'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I had one once. He should have bought better armour.. Actually, he's upstairs."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, such a sweetie ... and so polite. I thought politeness was out of fashion, these days."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Gods, if we didn't have them, we would have invented them."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, such a sweetie.  A simple man, with simple tastes and a simple mind."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bless him, he stood, he fought, and then left his sanity on the battlefield."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't tell much about that old monk."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He wanted to be the court jester but got upset when people laughed at him"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I went there on holiday once. Just goes to show that women are much better at running a place than men. King Tibianus could learn a thing or two from Queen Eloise."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wrong shop, go to my sister, silly!"})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Magic will only protect you, a rune and some magic fluids."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a power struggle between Venore and Thais."})
keywordHandler:addKeyword({'rebellion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is talk of a rebellion in Venore to gain independence from the Oppressor - I mean - King of Thais - it can only help business."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell magic stuff, my dear. If you want a quest, you've come to the wrong shop."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You never know when you run out of mana. All the more reason to buy some good runes or fluids."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You should ask this guy Oswald about him ... or other pointless rumors."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some call her the preying mantis, apparently she has killed over a dozen husbands already."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A marvellous city! Modern! Prosperous! Thais could learn a thing or two from Venore"})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who knows what the old man is up to in his hideout when no one is watching?"})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah Knight ... can't expect much from those guys."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only heared rumours about him, isn't he a hermit somewhere in the north?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to find out about excalibug you should ask the more sinister characters in Thais not a respectable woman like myself!"})
keywordHandler:addKeyword({'chester'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have never seen him at all. I only heared hes kind of the townsguards chief or such."})
keywordHandler:addKeyword({'ardua'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What a strange woman. She lingers in our shop now and then ... I wonder what shes up to."})
keywordHandler:addKeyword({'partos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heared he was a thief. Good thing he was caught."})
keywordHandler:addKeyword({'gamel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He hung around with that partos a lot. I wouldn't be suprised if he's a thief too. He is not allowed to enter our markethall."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sure. Just ask my sister Turvy."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'gamon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think he is a spy ... so I smile at him the whole day. He won't get anything out of me!"})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah yes ... Gorn ... the used-cart salesman of scrolls."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<mutters> Here we go again  ... Hail to King Tibianus! ... Don't make me do that again!"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'd love to help, but I have a business to run"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell runes, life and mana fluids - your best friends in any dungeon!"})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
