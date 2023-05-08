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
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 150)
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
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 12)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'fishing rod'}, 					Cffishingrod, 150)


keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am fine. I'm so glad to have you here as my customer."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell much. Just read the blackboards for my awesome wares or just ask me."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a merchant. What can I do for you?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Al Dee, but you can call me Al. Do you want to buy something?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell stuff to prices that low, that all other merchants would mock at my stupidity."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to challenge the monsters, you need some weapons and armor I sell. You need them definitely!"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to explore the dungeons, you have to equip yourself with the vital stuff I am selling. It's vital in the deepest sense of the word."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, our sewer system is very primitive; so primitive it's overrun by rats. But the stuff I sell is save from them. Do you want to buy some of it?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king encouraged salesmen to travel here, but only I dared to take the risk, and a risk it was!"})
keywordHandler:addKeyword({'dallheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some call him a hero."})
keywordHandler:addKeyword({'bug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bugs plague this isle, but my wares are bugfree, totally bugfree."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell equipment of all kinds, all kind available on this isle. Just ask me about my wares if you are interested."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I will return to the continent as a rich, a very rich man!"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is a crowded town."})
keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons, shields, armor, helmets, and equipment. For what do you want to ask?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell weapons, shields, armor, helmets, and equipment. For what do you want to ask?"})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell spears, rapiers, sabres, daggers, hand axes, axes, and short swords. Just tell me what you want to buy."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell jackets, coats, doublets, leather armor, and leather legs. Just tell me what you want to buy."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell leather helmets, studded helmets, and chain helmets. Just tell me what you want to buy."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden shields and studded shields. Just tell me what you want to buy."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, bags, scrolls, shovels, picks, backpacks, sickles, scythes, ropes, fishing rods and sixpacks of worms. Just tell me what you want to buy."})
keywordHandler:addKeyword({'do you sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell weapons, armor, helmets, shields, and equipment."})
keywordHandler:addKeyword({'do you have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What do you need? I sell weapons, armor, helmets, shields, and equipment."})
keywordHandler:addKeyword({'club'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't buy this garbage!"})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'pick') or msgcontains(msg, 'small axe') then
	if getPlayerStorageValue(cid, 7005) <= 0 then
	npcHandler:say("Picks are hard to come by. I trade them only for high quality small axes. Do you want to trade?", 1)
	aldee_talk_state = 854
	end
			
elseif aldee_talk_state == 854 and msgcontains(msg, 'yes') then
	if getPlayerStorageValue(cid, 7005) <= 0 then
		if doPlayerRemoveItem(cid,Cfsmallaxe,1) == TRUE then
		doPlayerAddItem(cid, Cfpick)
		setPlayerStorageValue(cid,7005,1)
		doAddQuestPoint(cid)
		npcHandler:say("Splendid! Here take your pickaxe.", 1)
		aldee_talk_state = 0
		else
		npcHandler:say("Sorry, I am looking for a SMALL axe.", 1)
		aldee_talk_state = 0
		end
	end
	
elseif aldee_talk_state == 854 and msgcontains(msg, 'no') then
npcHandler:say("Well, then not.", 1)
aldee_talk_state = 0
end		
    return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
