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




keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They call me Digger, that fine with me."})
keywordHandler:addKeyword({'frans'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think the FRANS is bugged."})
keywordHandler:addKeyword({'digger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So what?"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling some potions."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the magicwielder is the only way to true power."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the magicwielder is the only way to true power."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the magic market. Just have a look around."})
keywordHandler:addKeyword({'market'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the magic market. Just have a look around."})
keywordHandler:addKeyword({'vladruc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better don't cross the master!"})
keywordHandler:addKeyword({'urghain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better don't cross the master!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An upstart of minor skills and great ambitions."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just a knights' legend."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})
keywordHandler:addKeyword({'potion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You may be interested in my life and mana fluids."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
if msgcontains(msg, 'vial') then
npcHandler:say("I will give you 5 gold for every empty vial of yours, accept?", 1)
digger_talk_state = 857
elseif digger_talk_state == 857 and msgcontains(msg, 'yes') then
	if SellPlayerEmptyVials(cid) == true then
	npcHandler:say("Here's your money!", 1)
	digger_talk_state = 0
	else
	npcHandler:say("You don't have any empty vials!", 1)
	digger_talk_state = 0
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
