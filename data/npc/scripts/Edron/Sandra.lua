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



shopModule:addBuyableItem({'life'}, 					2006, 60, 10, 'life fluid')
shopModule:addBuyableItem({'slime'}, 					2006, 12, 4, 'potion of slime')
shopModule:addBuyableItem({'blood'}, 					2006, 15, 2, 'potion of blood')
shopModule:addBuyableItem({'urine'}, 					2006, 10, 13, 'potion of urine')
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'potion of oil')
shopModule:addBuyableItem({'water'}, 					2006, 8, 1, 'potion of distilled water')


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am lady Sandra Astralian."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell potions and magic fluids."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Buy a watch."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was guest at his castle on my visits to Thais."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was guest at his castle on my visits to Thais."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do I look as if I'd fraternize with such people?"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A disgusting person indeed."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not interested in tales only kids belive in."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city full of disgusting people with ill manners."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is a place of barbarianism."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I plan to visit this city one day."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't it a wonderful town?"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nothing I would talk to you about."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nothing I would talk to you about."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'potion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling potions of slime, blood, urine, oil, and distilled water."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
if msgcontains(msg, 'vial') then
npcHandler:say("I will give you 5 gold for every empty vial of yours, accept?", 1)
sandra_talk_state = 857
elseif sandra_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	sandra_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	sandra_talk_state = 0
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
