dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

-- COME BACK TO ME WITH TEAR OF DARAMA RETARD
--alue(cid, 1029, 1)
--doPlayerRemoveItem(cid,2346,1)
function greetCallback(cid)
	if getCreatureStorage(cid, 1029) == 1 then
		if getPlayerItemCount(cid, 2346) ~= 1 then
	npcHandler:say("Bring me the tear of darama and finish the rest of djinns missions, ".. getPlayerName(cid) .."!", 1)
	return false
	
	elseif getPlayerItemCount(cid, 2346) >= 1 then
	doPlayerRemoveItem(cid,2346,1)
	setPlayerStorageValue(cid, 1032, 1)
	setPlayerStorageValue(cid, 1029, 2)
	npcHandler:say("Thank you for the tear now go to Malor and follow rest of the mission!", 1)
	end

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

shopModule:addBuyableItem({'ice rapier'}, 					Cficerapier, 5000)
shopModule:addBuyableItem({'serpent sword'}, 					Cfserpentsword, 6000)
shopModule:addBuyableItem({'ancient shield'}, 					Cfancientshield, 5000)
shopModule:addBuyableItem({'dark armor'}, 					Cfdarkarmor, 1500)
shopModule:addBuyableItem({'dark helmet'}, 					Cfdarkhelmet, 1000)


keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only selling ice rapiers and serpent swords. But I would buy scimitars, giant swords, serpent swords, poison daggers, knight axes, dragon hammers and skull staffs from you."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling only ancient shields. But I buy tower shields, black shields, ancient shields and vampire shields."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying and selling dark armors. But I would also buy a knight armor from you."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying and selling dark helmets. Furthermore I'm buying warrior helmets, strange helmets and mystic turbans."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only buying knight and plate legs."})


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is none of your business."})
keywordHandler:addKeyword({'alesar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is my name. So what!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What does it look like, fool? I'm a guard! But I won't sell you anything until Malor orders me otherwise."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'permission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't you dare mention Daraman in my presence, human. I am through with his insidious lies and through with your accursed race!"})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we will teach your race a lesson it will never forget."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We need a strong king to unite us in our struggle against the humans."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we djinn will rid this world of evil."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh in Ankrahmun is a dangerous fool. Just your typical human, in other words."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So?"})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like them. They are peaceful, but if they are provoked they fight ferociously. And they are know to eat humans!"})
keywordHandler:addKeyword({"kha'zeel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These mountains are our refuge from those pesky humans. Too bad there are always some who come up here anyway. You, for example."})
keywordHandler:addKeyword({"kha'labal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The desert Kha'labal was once a beautiful land, but it was devastated in the course of the war. Damn humans! This is all your fault!"})
keywordHandler:addKeyword({'melchior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I remember him. He was a greedy, double-dealing hyena. As far as I know his bleached bones are now lying somewhere in the Kha'labal."})
keywordHandler:addKeyword({'djema'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Djema? Well - I suppose she is the only human I still like. But she has been brought up by djinns. Who knows - perhaps humans can learn."})
keywordHandler:addKeyword({"baa'leal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Baa'leal is Malor's lieutenant. Unflinchingly loyal, but not quite as clever as he thinks he is."})
keywordHandler:addKeyword({"bo'ques"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I miss Bo'ques' cooking, but not his pompous airs and graces."})
keywordHandler:addKeyword({"fa'hradin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fa'hradin, that old cynic is way too smart to believe in Daraman's lies. He should reconsider his loyalties."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
