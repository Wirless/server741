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


shopModule:addSellableItem({'dagger'}, 					Cfdagger, 2)
shopModule:addSellableItem({'spear'}, 					Cfspear, 3)
shopModule:addSellableItem({'hand axe'}, 					Cfhandaxe, 4)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 5)
shopModule:addSellableItem({'axe'}, 					Cfaxe, 7)
shopModule:addSellableItem({'hatchet'}, 					Cfhatchet, 25)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 12)
shopModule:addSellableItem({'short sword'}, 					Cfshortsword, 10)
shopModule:addSellableItem({'sword'}, 					Cfsword, 25)
shopModule:addSellableItem({'mace'}, 					Cfmace, 30)
shopModule:addSellableItem({'doublet'}, 					Cfdoublet, 3)
shopModule:addSellableItem({'leather armor'}, 					Cfleatherarmor, 5)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 40)
shopModule:addSellableItem({'studded armor'}, 					Cfstuddedarmor, 25)
shopModule:addSellableItem({'leather helmet'}, 					Cfleatherhelmet, 3)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 12)
shopModule:addSellableItem({'studded helmet'}, 					Cfstuddedhelmet, 20)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 3)
shopModule:addSellableItem({'studded shield'}, 					Cfstuddedshield, 16)
shopModule:addSellableItem({'brass shield'}, 					Cfbrassshield, 25)
shopModule:addSellableItem({'plate shield'}, 					Cfplateshield, 40)
shopModule:addSellableItem({'copper shield'}, 					Cfcoppershield, 50)
shopModule:addSellableItem({'leather boots'}, 					Cfleatherboots, 2)
shopModule:addSellableItem({'rope'}, 					Cfrope, 8)

shopModule:addBuyableItem({'spear'}, 					Cfspear, 10)
shopModule:addBuyableItem({'rapier'}, 					Cfrapier, 15)
shopModule:addBuyableItem({'sabre'}, 					Cfsabre, 25)
shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'sickle'}, 					Cfsickle, 8)
shopModule:addBuyableItem({'hand axe'}, 					Cfhandaxe, 8)
shopModule:addBuyableItem({'axe'}, 					Cfaxe, 20)
shopModule:addBuyableItem({'short sword'}, 					Cfshortsword, 30)
shopModule:addBuyableItem({'jacket'}, 					Cfjacket, 10)
shopModule:addBuyableItem({'coat'}, 					Cfcoat, 8)
shopModule:addBuyableItem({'doublet'}, 					Cfdoublet, 16)
shopModule:addBuyableItem({'leather armor'}, 					Cfleatherarmor, 25)
shopModule:addBuyableItem({'leather legs'}, 					Cfleatherlegs, 10)
shopModule:addBuyableItem({'leather helmet'}, 					Cfleatherhelmet, 12)
shopModule:addBuyableItem({'studded helmet'}, 					Cfstuddedhelmet, 63)
shopModule:addBuyableItem({'chain helmet'}, 					Cfchainhelmet, 52)
shopModule:addBuyableItem({'wooden shield'}, 					Cfwoodenshield, 15)
shopModule:addBuyableItem({'studded shield'}, 					Cfstuddedshield, 50)
shopModule:addBuyableItem({'torch'}, 					Cftorch, 2)
shopModule:addBuyableItem({'bag'}, 					Cfbag, 4)
shopModule:addBuyableItem({'scroll'}, 					1949, 5)
shopModule:addBuyableItem({'shovel'}, 					Cfshovel, 10)
shopModule:addBuyableItem({'backpack'}, 					Cfbackpack, 10)
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 50)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'fishing rod'}, 					Cffishingrod, 150)



keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am fine. I'm delighted to welcome you as customer."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell much. Have a look at the blackboards for my wares or just ask."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a merchant, so what can I do for you?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Lee'Delle. Do you want to buy something?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am already helping you by selling stuff."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are plenty of them. Buy here the equipment to kill them and sell their loot afterwards!"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "be carefull down there. Make sure you bought enough torches and a rope or you might get lost."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The sewers are full of rats. They are quite a challenge for inexperienced adventurers."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports our little village very much!"})
keywordHandler:addKeyword({'dallheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a great warrior and our protector."})
keywordHandler:addKeyword({'bug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are several bugs in the wildernes."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell equipment of all kinds. Just ask me about the type of wares you are interested in."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The continent is even more exciting than this isle!"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is the capital of the thaian empire."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I really love flowers. Sadly my favourites, honey flowers are very rare on this isle. If you can find me one, I'll give you a little reward."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I really love flowers. Sadly my favourites, honey flowers are very rare on this isle. If you can find me one, I'll give you a little reward."})
keywordHandler:addKeyword({'reward'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I really love flowers. Sadly my favourites, honey flowers are very rare on this isle. If you can find me one, I'll give you a little reward."})
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons, shields, armor, helmets, and equipment. For what do you want to ask?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons, shields, armor, helmets, and equipment. For what do you want to ask?"})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell spears, rapiers, sabres, daggers, hand axes, axes, and short swords. Just tell me what you want to buy."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell jackets, coats, doublets, leather armor, and leather legs. Just tell me what you want to buy."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell leather helmets, studded helmets, and chain helmets. Just tell me what you want to buy."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden shields and studded shields. Just tell me what you want to buy."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, bags, scrolls, shovels, picks, backpacks, sickles, scythes, ropes, fishing rods and worms. Just tell me what you want to buy."})
keywordHandler:addKeyword({'do you sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell weapons, armor, helmets, shields, and equipment."})
keywordHandler:addKeyword({'do you have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell weapons, armor, helmets, shields, and equipment."})
keywordHandler:addKeyword({'pick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry I fear the only picks left on this isle are in the posession of Al Dee."})
keywordHandler:addKeyword({'sell club'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't buy this garbage!"})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'honey') or msgcontains(msg, 'flower') then
	if getPlayerStorageValue(cid,7004) <= 0 then
		if doPlayerRemoveItem(cid,2103,1) == TRUE then
		doPlayerAddItem(cid, Cfstuddedlegs)
		setPlayerStorageValue(cid,7004,1)
		doAddQuestPoint(cid)
		npcHandler:say("Oh, thank you so much! Please take this piece of armor as reward.", 1)
		leedelle_talk_state = 0
		else
		npcHandler:say("Honey flowers are my favourites <sigh>.", 1)		
		end
	else
	npcHandler:say("Honey flowers are my favourites <sigh>.", 1)
	leedelle_talk_state = 0
	end
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
