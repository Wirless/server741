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
shopModule:buyContainer({'backpack of explo', 'backpack of explosion', 'bp of explo', 'bp explo'}, 	             2001, 2313, 5800, 3,  	'Backpack of Explosion')
shopModule:buyContainer({'bp of hmm', 'backpack of hmm', 'bp hmm'}, 	             2001, 2311, 4400, 5,  	'Backpack of Heavy Magic Missile')
shopModule:buyContainer({'bp of lmm', 'backpack of lmm', 'bp lmm'}, 	             1998, 2287, 2000, 5,  	'Backpack of Light Magic Missile')
shopModule:buyContainer({'bp of gfb', 'backpack of gfb', 'bp gfb'}, 	             2000, 2304, 6600, 2,  	'Backpack of Great Fireball')
shopModule:buyContainer({'bp of fbomb', 'bp of firebomb', 'backpack of firebomb', 'bp fb'}, 	             2000, 2305, 5700, 2,  	'Backpack of Fire Bomb')
shopModule:buyContainer({'bp of df', 'backpack of destroy field', 'bp of destroy field', 'bp df'}, 	             2003, 2261, 1500, 3,  	'Backpack of Destroy Field')
shopModule:buyContainer({'bp of firefield', 'backpack of firefield', 'bp ff'}, 	             2000, 2301, 2200, 3,  	'Backpack of Fire Field')
shopModule:buyContainer({'bp of energyfield', 'backpack of energyfield', 'bp ef'}, 	             2002, 2277, 2500, 3,  	'Backpack of Energy Field')
shopModule:buyContainer({'bp of energy wall', 'backpack of energy wall', 'bp ew'}, 	             2002, 2279, 10000, 4,  	'Backpack of Energy Wall')
shopModule:buyContainer({'bp of poison field', 'backpack of poison field', 'bp pf'}, 	             1998, 2285, 1700, 3,  	'Backpack of Poison Field')
shopModule:buyContainer({'bp of chameleon', 'backpack of chameleon', 'bp chameleon'}, 	             1998, 2291, 4200, 1,  	'Backpack of Chameleon')
shopModule:buyContainer({'bp of blank', 'backpack of blank', 'bp blank'}, 	             1988, 2260, 400, 1,  	'Backpack of Blanks')
shopModule:buyContainer({'bp of magic wall', 'backpack of magic wall', 'bp magic wall', 'bp mw', 'bp of mw', 'backpack of mw'}, 	             2004, 2293, 10000, 3,  	'Backpack of Magic Wall')
shopModule:buyContainer({'backpack of uh', 'backpack of ultimate healing runes', 'bp of uh', 'bp uh'}, 	             2002, 2273, 6000, 1,  	'Backpack of ultimate healing')
shopModule:buyContainer({'backpack of sd', 'backpack of sudden death runes', 'bp of sd', 'bp sd'}, 	             2003, 2268, 12000, 1,  	'Backpack of Sudden Death')


shopModule:addBuyableItem({'blank rune', 'blank rune'}, 							2260, 10, 1,		'blank rune')
shopModule:addBuyableItem({'light wand', 'lightwand'}, 					2163, 500, 		'magic light wand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 					2006, 100, 	7, 	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 					2006, 80, 	10,	'life fluid')


shopModule:addBuyableItem({'magic wall', 'magic', 'magic wall rune'}, 					2293, 650,  3,   	'magic wall rune')


shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile'}, 					2311, 320, 5,	'heavy magic missile rune')
shopModule:addBuyableItem({'light magic missile rune', 'light magic missile'}, 					2287, 100, 5,	'light magic missile rune')
shopModule:addBuyableItem({'sudden death rune', 'sudden death'}, 						2268, 800, 1,	'sudden death rune')
shopModule:addBuyableItem({'great fireball rune', 'great fire ball'}, 						2304, 500, 2, 	'great fireball rune')
shopModule:addBuyableItem({'fireball rune', 'fireball rune'}, 						2302, 120, 3, 	'fireball rune')
shopModule:addBuyableItem({'explosion rune', 'explosion rune'}, 							2313, 380, 3, 	'explosion rune')
shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 					2273, 260, 1, 	'ultimate healing rune')
shopModule:addBuyableItem({'intense healing rune', 'ih'}, 					2265, 120, 1, 	'intense healing rune')



shopModule:addBuyableItem({'fire field rune', 'fire field rune'}, 					2301, 90, 3, 	'fire field rune')
shopModule:addBuyableItem({'fire wall rune', 'fire wall rune'}, 					2303, 150, 3, 	'fire wall rune')
shopModule:addBuyableItem({'fire bomb rune', 'fire bomb rune'}, 					2305, 335, 2, 	'fire bomb rune')

shopModule:addBuyableItem({'poison field rune', 'poison field rune'}, 					2285, 65, 3, 	'poison field rune')
shopModule:addBuyableItem({'poison wall rune', 'poison wall rune'}, 					2289, 120, 3, 	'poison bomb rune')
shopModule:addBuyableItem({'poison bomb rune', 'pb'}, 					2286, 280, 3, 	'poison wall rune')

shopModule:addBuyableItem({'energy field rune', 'energy rune'}, 					2277, 95, 3, 	'energy rune')
shopModule:addBuyableItem({'energy bomb rune', 'energy bomb rune'}, 					2262, 200, 3, 	'energy bomb rune')
shopModule:addBuyableItem({'energy wall rune', 'energy wall rune'}, 					2279, 390, 4, 	'energy wall rune')

shopModule:addBuyableItem({'destroy field', 'destroy field rune'}, 					2261, 60, 3, 	'destroy field rune')

shopModule:addBuyableItem({'convince creature rune', 'convince creature rune'}, 					2290, 600, 5, 	'convince creature rune')
shopModule:addBuyableItem({'chameleon rune', 'chameleon rune'}, 					2291, 300, 1, 	'chameleon rune')

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

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Xodet, the owner of this shop."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorcerer and trade with all kinds of magic items."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a sorcerer guild in Thais. Just go in the east of the town, it is easly to find."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
