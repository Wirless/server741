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
	if isPremium(cid) == FALSE then
	npcHandler:say("I only deal with premium players, ".. getPlayerName(cid) .."!", 1)
	return false
	else
	npcHandler:setMessage(MESSAGE_GREET, "Hello there lil'one, what you want?")
	return true
	end	
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'serpent sword'}, 					Cfserpentsword, 900)
shopModule:addSellableItem({'dragon hammer'}, 					Cfdragonhammer, 2000)
shopModule:addSellableItem({'giant sword'}, 					Cfgiantsword, 17000)
shopModule:addSellableItem({'poison dagger'}, 					Cfpoisondagger, 50)
shopModule:addSellableItem({'scimitar'}, 					Cfscimitar, 150)
shopModule:addSellableItem({'skull staff'}, 					Cfskullstaff, 6000)
shopModule:addSellableItem({'knight axe'}, 					Cfknightaxe, 2000)
shopModule:addSellableItem({'tower shield'}, 					Cftowershield, 8000)
shopModule:addSellableItem({'black shield'}, 					Cfblackshield, 800)
shopModule:addSellableItem({'ancient shield'}, 					Cfancientshield, 900)
shopModule:addSellableItem({'vampire shield'}, 					Cfvampireshield, 15000)
shopModule:addSellableItem({'warrior helmet'}, 					Cfwarriorhelmet, 5000)
shopModule:addSellableItem({'knight armor'}, 					Cfknightarmor, 5000)
shopModule:addSellableItem({'knight legs'}, 					Cfknightlegs, 5000)
shopModule:addSellableItem({'plate legs'}, 					Cfplatelegs, 400)
shopModule:addSellableItem({'strange helmet'}, 					Cfstrangehelmet, 500)
shopModule:addSellableItem({'dark armor'}, 					Cfdarkarmor, 400)
shopModule:addSellableItem({'dark helmet'}, 					Cfdarkhelmet, 250)
shopModule:addSellableItem({'mystic turban'}, 					Cfmysticturban, 150)
shopModule:addSellableItem({'magic lightwand'}, 					Cfmagiclightwand, 35)
shopModule:addSellableItem({'sword ring'}, 					Cfswordring, 100)
shopModule:addSellableItem({'axe ring'}, 					Cfaxering, 100)
shopModule:addSellableItem({'club ring'}, 					Cfclubring, 100)
shopModule:addSellableItem({'stone skin amulet'}, 					Cfstoneskinamulet, 500)
shopModule:addSellableItem({'elven amulet'}, 					Cfelvenamulet, 100)
shopModule:addSellableItem({'garlic necklace'}, 					Cfgarlicnecklace, 50)
shopModule:addSellableItem({'bronze amulet'}, 					Cfbronzeamulet, 50)
shopModule:addSellableItem({'stealth ring'}, 					Cfstealthring, 200)
shopModule:addSellableItem({'power ring'}, 					Cfpowerring, 50)
shopModule:addSellableItem({'mind stone'}, 					Cfmindstone, 100)
shopModule:addSellableItem({'life crystal'}, 					Cflifecrystal, 50)
shopModule:addSellableItem({'orb'}, 					Cforb, 750)
shopModule:addSellableItem({'spike sword'}, 					Cfspikesword, 1000)
shopModule:addSellableItem({'fire sword'}, 					Cffiresword, 4000)
shopModule:addSellableItem({'war hammer'}, 					Cfwarhammer, 1200)
shopModule:addSellableItem({'ice rapier'}, 					Cficerapier, 1000)
shopModule:addSellableItem({'broad sword'}, 					Cfbroadsword, 500)
shopModule:addSellableItem({'dragon lance'}, 					Cfdragonlance, 14000)
shopModule:addSellableItem({'obsidian lance'}, 					Cfobsidianlance, 500)
shopModule:addSellableItem({'fire axe'}, 					Cffireaxe, 8000)
shopModule:addSellableItem({'guardian shield'}, 					Cfguardianshield, 2000)
shopModule:addSellableItem({'dragon shield'}, 					Cfdragonshield, 4000)
shopModule:addSellableItem({'medusa shield'}, 					Cfmedusashield, 9000)
shopModule:addSellableItem({'beholder shield'}, 					Cfbeholdershield, 1200)
shopModule:addSellableItem({'crown shield'}, 					Cfcrownshield, 8000)
shopModule:addSellableItem({'phoenix shield'}, 					Cfphoenixshield, 16000)
shopModule:addSellableItem({'noble armor'}, 					Cfnoblearmor, 900)
shopModule:addSellableItem({'crown armor'}, 					Cfcrownarmor, 12000)
shopModule:addSellableItem({'crown legs'}, 					Cfcrownlegs, 12000)
shopModule:addSellableItem({'crown helmet'}, 					Cfcrownhelmet, 2500)
shopModule:addSellableItem({'crusader helmet'}, 					Cfcrusaderhelmet, 6000)
shopModule:addSellableItem({'royal helmet'}, 					Cfroyalhelmet, 30000)
shopModule:addSellableItem({'blue robe'}, 					Cfbluerobe, 10000)
shopModule:addSellableItem({'boots of haste'}, 					Cfbootsofhaste, 30000)
shopModule:addSellableItem({'dragon scale mail'}, 					Cfdragonscalemail, 40000)
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
shopModule:addSellableItem({'ring of the sky'}, 					Cfringofthesky, 30000)
shopModule:addSellableItem({'golden armor'}, 					Cfgoldenarmor, 20000)
shopModule:addSellableItem({'demon shield'}, 					Cfdemonshield, 30000)
shopModule:addSellableItem({'magic plate armor'}, 					Cfmagicplatearmor, 115000)
shopModule:addSellableItem({'devil helmet'}, 					Cfdevilhelmet, 1000)
shopModule:addSellableItem({'mastermind shield'}, 					Cfmastermindshield, 55000)
shopModule:addSellableItem({'golden legs'}, 					Cfgoldenlegs, 45000)
shopModule:addSellableItem({'gold ring'}, 					Cfgoldring, 8000)
shopModule:addSellableItem({'steel boots'}, 					Cfsteelboots, 30000)
shopModule:addSellableItem({'guardian halberd'}, 					Cfguardianhalberd, 11000)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
