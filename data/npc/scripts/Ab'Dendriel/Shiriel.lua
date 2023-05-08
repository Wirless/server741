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


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'vial') then
npcHandler:say("I will give you 5 gold for every empty vial of yours, accept?", 1)
shiriel_talk_state = 857
elseif shiriel_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	shiriel_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	shiriel_talk_state = 0
	end
end
    return 1
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell mystic runes, spellbooks and fluids of life or mana."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Shiriel Sharaziel."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time was mastered by my people long ago."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our noble race has knowledge of secrets beyond your comprehension."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not worth to bother about."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Cursed with a short livespan and not worth to be remembered."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We should eradicate them all."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are the teachers to the other castes."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their knowledge is limited."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They lack the patience that suits a race with our lifespan."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think they are lost forever."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They were not prepared for what they encountered in their quest for knowledge. WE will be prepared."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A humanbreed abnomination."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no time for superstition."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to analyse it one day."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "News are secrets and you are not worthy of my secrets."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I could teach you some spells ... but I won't."})



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())