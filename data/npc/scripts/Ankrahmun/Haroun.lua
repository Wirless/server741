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

	npcHandler:setMessage(MESSAGE_GREET, "Hello there adventurer, what you want?")
	return true

end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	



local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'magic lightwand'}, 				Cfmagiclightwand, 35)
shopModule:addSellableItem({'sword ring'}, 						Cfswordring, 100)
shopModule:addSellableItem({'axe ring'}, 						Cfaxering, 100)
shopModule:addSellableItem({'club ring'}, 						Cfclubring, 100)
shopModule:addSellableItem({'elven amulet'}, 					Cfelvenamulet, 100)
shopModule:addSellableItem({'garlic necklace'}, 				Cfgarlicnecklace, 50)
shopModule:addSellableItem({'bronze amulet'}, 					Cfbronzeamulet, 50)
shopModule:addSellableItem({'stealth ring'}, 					Cfstealthring, 200)
shopModule:addSellableItem({'power ring'}, 						Cfpowerring, 50)
shopModule:addSellableItem({'mind stone'}, 						Cfmindstone, 100)
shopModule:addSellableItem({'life crystal'}, 					Cflifecrystal, 50)
shopModule:addSellableItem({'orb'}, 							Cforb, 750)
shopModule:addSellableItem({'wand of inferno'}, 				7096, 3000)
shopModule:addSellableItem({'woi'},				 				7096, 3000)

shopModule:addBuyableItem({'magic lightwand'}, 					Cfmagiclightwand, 120)
shopModule:addBuyableItem({'sword ring'}, 						Cfswordring, 500)
shopModule:addBuyableItem({'axe ring'}, 						Cfaxering, 500)
shopModule:addBuyableItem({'club ring'}, 						Cfclubring, 500)
shopModule:addBuyableItem({'elven amulet'}, 					Cfelvenamulet, 500, 50)
shopModule:addBuyableItem({'garlic necklace'}, 					Cfgarlicnecklace, 100, 150)
shopModule:addBuyableItem({'bronze amulet'}, 					Cfbronzeamulet, 100, 200)
shopModule:addBuyableItem({'stealth ring'}, 					Cfstealthring, 5000)
shopModule:addBuyableItem({'power ring'}, 						Cfpowerring, 100)


keywordHandler:addKeyword({'stone skin amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry I do not have any in stock"})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm afraid I do not trade with weapons or armour. Nah'bob only deals with magical equipment."})
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'magical'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only deal with magical equipment. Our range of goods include amulets, rings, wands and some special items."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying bronze amulets, elven amulets and garlic necklaces."})
keywordHandler:addKeyword({'ring'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying stealth rings, power rings, sword rings, axe rings, and club rings."})
keywordHandler:addKeyword({'wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm buying wands of vortex, wands of dragonbreath, wands of plague, wands of cosmic energy and wands of inferno as well as magic light wands."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying magic light wands. I'm currently also looking for mind stones, life crystals and orbs."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
