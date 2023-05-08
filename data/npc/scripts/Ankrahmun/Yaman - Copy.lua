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
	if getCreatureStorage(cid, 9032) <= 0 then
	--if getPlayerLevel(cid) == 8 then
	npcHandler:say("Sorry you do not have the rights to trade with me, ".. getPlayerName(cid) .."!", 1)
	return false
	else
	npcHandler:setMessage(MESSAGE_GREET, "Hello there adventurer, what you want?")
	return true
	end	
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:buyContainer({'backpack of roh', 'backpack of ring of helaing', 'bp of roh', 'bp roh'}, 	             2003, 2214, 20000, 1,  	'Backpack of ring of healing')

shopModule:addSellableItem({'might ring'}, 					Cfmightring, 250, 20)
shopModule:addSellableItem({'energy ring'}, 					Cfenergyring, 100)
shopModule:addSellableItem({'life ring'}, 					Cflifering, 50)
shopModule:addSellableItem({'time ring'}, 					Cftimering, 100)
shopModule:addSellableItem({'silver amulet'}, 					Cfsilveramulet, 50)
shopModule:addSellableItem({'strange talisman'}, 					Cfstrangetalisman, 30)
shopModule:addSellableItem({'dwarven ring'}, 					Cfdwarvenring, 100)
shopModule:addSellableItem({'ring of healing'}, 					Cfringofhealing, 100)
shopModule:addSellableItem({'protection amulet'}, 					Cfprotectionamulet, 100)
shopModule:addSellableItem({'dragon necklace'}, 					Cfdragonnecklace, 100)
shopModule:addSellableItem({'mysterious fetish'}, 					Cfmysteriousfetish, 50)
shopModule:addSellableItem({'ankh'}, 					Cfankh, 100)

shopModule:addBuyableItem({'might ring'}, 					Cfmightring, 5000, 20)
shopModule:addBuyableItem({'energy ring'}, 					Cfenergyring, 2000)
shopModule:addBuyableItem({'life ring'}, 					Cflifering, 900)
shopModule:addBuyableItem({'time ring'}, 					Cftimering, 2000)
shopModule:addBuyableItem({'silver amulet'}, 					Cfsilveramulet, 100, 200)
shopModule:addBuyableItem({'strange talisman'}, 					Cfstrangetalisman, 100, 200)
shopModule:addBuyableItem({'dwarven ring'}, 					Cfdwarvenring, 2000)
shopModule:addBuyableItem({'ring of healing'}, 					Cfringofhealing, 2000)
shopModule:addBuyableItem({'protection amulet'}, 					Cfprotectionamulet, 700, 250)
shopModule:addBuyableItem({'dragon necklace'}, 					Cfdragonnecklace, 1000, 200)


keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying strange talismans, silver amulets, protection amulets and dragon necklaces."})
keywordHandler:addKeyword({'ring'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying might rings, energy rings, life rings, time rings, dwarven rings and rings of healing."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm currently looking for some special items. Do you have any ankhs or a mysterious fetish?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
