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


shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 112)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 40)
shopModule:addSellableItem({'plate armor'}, 					Cfplatearmor, 240)
shopModule:addSellableItem({'steel helmet'}, 					Cfsteelhelmet, 293)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 12)
shopModule:addSellableItem({'brass helmet'}, 					Cfbrasshelmet, 30)
shopModule:addSellableItem({'viking helmet'}, 					Cfvikinghelmet, 66)
shopModule:addSellableItem({'iron helmet'}, 					Cfironhelmet, 145)
shopModule:addSellableItem({'devil helmet'}, 					Cfdevilhelmet, 450)
shopModule:addSellableItem({'warrior helmet'}, 					Cfwarriorhelmet, 696)
shopModule:addSellableItem({'dwarven shield'}, 					Cfdwarvenshield, 100)
shopModule:addSellableItem({'plate shield'}, 					Cfplateshield, 45)
shopModule:addSellableItem({'brass shield'}, 					Cfbrassshield, 16)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 3)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 60)
shopModule:addSellableItem({'brass legs'}, 					Cfbrasslegs, 49)
shopModule:addSellableItem({'chain legs'}, 					Cfchainlegs, 20)
shopModule:addSellableItem({'plate legs'}, 					Cfplatelegs, 115)
shopModule:addSellableItem({'knight legs'}, 					Cfknightlegs, 375)


shopModule:addBuyableItem({'chain armor'}, 					Cfchainarmor, 200)
shopModule:addBuyableItem({'brass armor'}, 					Cfbrassarmor, 450)
shopModule:addBuyableItem({'plate armor'}, 					Cfplatearmor, 1200)
shopModule:addBuyableItem({'chain helmet'}, 					Cfchainhelmet, 52)
shopModule:addBuyableItem({'brass helmet'}, 					Cfbrasshelmet, 120)
shopModule:addBuyableItem({'iron helmet'}, 					Cfironhelmet, 390)
shopModule:addBuyableItem({'steel helmet'}, 					Cfsteelhelmet, 580)
shopModule:addBuyableItem({'steel shield'}, 					Cfsteelshield, 240)
shopModule:addBuyableItem({'brass shield'}, 					Cfbrassshield, 65)
shopModule:addBuyableItem({'plate shield'}, 					Cfplateshield, 125)
shopModule:addBuyableItem({'dwarven shield'}, 					Cfdwarvenshield, 500)
shopModule:addBuyableItem({'chain legs'}, 					Cfchainlegs, 80)
shopModule:addBuyableItem({'brass legs'}, 					Cfbrasslegs, 195)
 
function creatureSayCallback(cid, type, msg) msg = string.lower(msg)

if msgcontains(msg, 'sam') or msgcontains(msg, 'dwarven armor') and getPlayerStorageValue(cid, 8111) == 1 then
	npcHandler:say("Oh, so its you, he wrote me about? Sadly I have no dwarven armor in stock. But I give you the permission to retrive one from the mines. ...", 1)
	npcHandler:say("The problem is, some giant spiders made the tunnels where the storage is their new home. Good luck.", 5)
	setPlayerStorageValue(cid, 8111, 2)
	setPlayerStorageValue(cid, 8112, 1)
	name_talk_state = 0	
		end		
		
		
if (msgcontains(msg, 'measurements')) and (getPlayerStorageValue(cid, 250) == 27 and getPlayerStorageValue(cid, 100178) == -1) then
		npcHandler:say("Hm, well I guess its ok to tell you ... <tells you about Lokurs measurements>",cid)
		setPlayerStorageValue(cid, 100178,1)
	if (getPlayerStorageValue(cid,100174) == 1 and getPlayerStorageValue(cid,100175) == 1 and getPlayerStorageValue(cid,100176) == 1 and getPlayerStorageValue(cid,100177) == 1 and getPlayerStorageValue(cid,100178) == 1) then
		setPlayerStorageValue(cid, 250, 34)
	end
	end 
	
	
    return 1
end


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell best armor in land. My armor save you life. Better buy much."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell best armor in land. My armor save you life. Better buy much."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Kroox Shieldbearer, son of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy all kinds of armor. Dwarfish are the best, jawoll!"})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are proud fellows."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You not be afraid, here you be save."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Much fun you can have in dungeons. Much battle and much gold, jawoll!"})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Foreigners not welcome in mines. An evil basilisk rob our deeper mines."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I you thank, too."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer armor, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask in the shop next tunnel about that."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell chain helmets, brass helmets, iron helmets, and steel helmets. What you want?"})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell chain armor, brass armor, and plate armor. What you need?"})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell steel shields, dwarven shields, brass shields, and plate shields. What you want?"})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs, and brass legs. What you need?"})
keywordHandler:addKeyword({'you buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You want sell any armor?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
