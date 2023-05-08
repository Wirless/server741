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
	if getCreatureStorage(cid, 9030) ~= 1 then
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


shopModule:addSellableItem({'spike sword'}, 					Cfspikesword, 1000)
shopModule:addSellableItem({'fire sword'}, 					Cffiresword, 4000)
shopModule:addSellableItem({'war hammer'}, 					Cfwarhammer, 1200)
shopModule:addSellableItem({'ice rapier'}, 					Cficerapier, 1000)
shopModule:addSellableItem({'broad sword'}, 					Cfbroadsword, 500)
shopModule:addSellableItem({'dragon lance'}, 					Cfdragonlance, 9000)
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

shopModule:addBuyableItem({'spike sword'}, 					Cfspikesword, 8000)
shopModule:addBuyableItem({'war hammer'}, 					Cfwarhammer, 10000)
shopModule:addBuyableItem({'obsidian lance'}, 					Cfobsidianlance, 3000)
shopModule:addBuyableItem({'beholder shield'}, 					Cfbeholdershield, 7000)
shopModule:addBuyableItem({'noble armor'}, 					Cfnoblearmor, 8000)


keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying spike swords, war hammers and obsidian lances. Furthermore I would buy fire swords, ice rapiers, dragon lances, fire axes and broadswords from you, if you have any."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm just selling beholder shields. But I'm buying guardian shields, dragon shields, beholder shields, crown shields, medusa shields and phoenix shields."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying noble armors. Furthermore I'm buying dragon scale mails, crown armors and blue robes."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm not selling any helmets. I'm only buying crown helmets, crusader helmets and royal helmets."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only buying crown legs. Oh, and I'm also looking for boots of haste!"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
