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


shopModule:addSellableItem({'two handed sword'}, 					Cftwohandedsword, 450)
shopModule:addSellableItem({'battle axe'}, 					Cfbattleaxe, 80)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 2)
shopModule:addSellableItem({'hand axe'}, 					Cfhandaxe, 4)
shopModule:addSellableItem({'halberd'}, 					Cfhalberd, 400)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 5)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 12)
shopModule:addSellableItem({'axe'}, 					Cfaxe, 7)
shopModule:addSellableItem({'hunting spear'}, 					Cfhuntingspear, 25)
shopModule:addSellableItem({'spear'}, 					Cfspear, 3)
shopModule:addSellableItem({'morning star'}, 					Cfmorningstar, 90)
shopModule:addSellableItem({'mace'}, 					Cfmace, 30)
shopModule:addSellableItem({'short sword'}, 					Cfshortsword, 10)
shopModule:addSellableItem({'battle hammer'}, 					Cfbattlehammer, 120)
shopModule:addSellableItem({'sword'}, 					Cfsword, 25)
shopModule:addSellableItem({'templar scytheblade'}, 					Cftemplarscytheblade, 200)
shopModule:addSellableItem({'ripper lance'}, 					Cfripperlance, 500)
shopModule:addSellableItem({'banana staff'}, 					Cfbananastaff, 1000)
shopModule:addSellableItem({'leather armor'}, 					Cfleatherarmor, 12)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 70)
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 150)
shopModule:addSellableItem({'plate armor'}, 					Cfplatearmor, 400)
shopModule:addSellableItem({'chain legs'}, 					Cfchainlegs, 25)
shopModule:addSellableItem({'leather helmet'}, 					Cfleatherhelmet, 4)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 17)
shopModule:addSellableItem({'steel helmet'}, 					Cfsteelhelmet, 190)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 5)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 95)
shopModule:addSellableItem({'steel shield'}, 					Cfsteelshield, 80)
shopModule:addSellableItem({'tusk shield'}, 					Cftuskshield, 850)
shopModule:addSellableItem({'sentinel shield'}, 					Cfsentinelshield, 120)
shopModule:addSellableItem({'salamander shield'}, 					Cfsalamandershield, 280)
shopModule:addSellableItem({'tribal'}, 					Cftribal, 250)
shopModule:addSellableItem({'leopard armor'}, 					Cfleopardarmor, 300)
shopModule:addSellableItem({'horseman helmet'}, 					Cfhorsemanhelmet, 280)
shopModule:addSellableItem({'feather headdress'}, 					Cffeatherheaddress, 850)
shopModule:addSellableItem({'crocodile boots'}, 					Cfcrocodileboots, 100)
shopModule:addSellableItem({'bast shirt'}, 					Cfbastshirt, 750)
shopModule:addSellableItem({'charmer tiara'}, 					Cfcharmertiara, 900)
shopModule:addSellableItem({'beholder helmet'}, 					Cfbeholderhelmet, 2200)

shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'hand axe'}, 					Cfhandaxe, 8)
shopModule:addBuyableItem({'spear'}, 					Cfspear, 10)
shopModule:addBuyableItem({'rapier'}, 					Cfrapier, 15)
shopModule:addBuyableItem({'axe'}, 					Cfaxe, 20)
shopModule:addBuyableItem({'sabre'}, 					Cfsabre, 35)
shopModule:addBuyableItem({'sword'}, 					Cfsword, 85)
shopModule:addBuyableItem({'mace'}, 					Cfmace, 90)
shopModule:addBuyableItem({'battle hammer'}, 					Cfbattlehammer, 350)
shopModule:addBuyableItem({'throwing star'}, 					Cfthrowingstar, 50, 0, 'throwing stars')
shopModule:addBuyableItem({'chain armor'}, 					Cfchainarmor, 200)
shopModule:addBuyableItem({'brass armor'}, 					Cfbrassarmor, 450)
shopModule:addBuyableItem({'leather armor'}, 					Cfleatherarmor, 35)
shopModule:addBuyableItem({'chain helmet'}, 					Cfchainhelmet, 52)
shopModule:addBuyableItem({'leather helmet'}, 					Cfleaterhelmet, 12)
shopModule:addBuyableItem({'steel shield'}, 					Cfsteelshield, 240)
shopModule:addBuyableItem({'wooden shield'}, 					Cfwoodenshield, 15)
shopModule:addBuyableItem({'chain legs'}, 					Cfchainlegs, 80)
 


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a tradesman. I sell and buy weapons and armor."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Brengus."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, my watch didn't take the moist air here too well."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the king's land. It was a wise decision to have us people from Venore rule this settlement."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I miss my home like most of us here, but I have duties and responsibilities. After all, there is some meagre profit to earn here."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A nice big city of course, but it lacks style and grandeur. Such qualities you will only find when you visit my hometown Venore."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope the king will take these rebelling women soon under Thaian guidance once again. I hate to see the profits wasted that could be earned there."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A rich and lovely island. Sadly those knights kept our tradesmen out of business for some unknown reason. I am convinced after seeing our success with this colony here, the king will allow Venore to become more present over there too."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Of course there are problems. But problems are there to keep those out of business who are not prepared and diligent enough."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a world full of possibilities."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves of Kazordoon are stubborn people and it's hard to have dealings with them. But as often, the hardship is very rewarding for those who are able to handle them."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves of Kazordoon are stubborn people and it's hard to have dealings with them. But as often, the hardship is very rewarding for those who are able to handle them."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves of Kazordoon are stubborn people and it's hard to have dealings with them. But as often, the hardship is very rewarding for those who are able to handle them."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's complicated to negotiate with those elves but it is possible."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's complicated to negotiate with those elves but it is possible."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's complicated to negotiate with those elves but it is possible."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have hardly scratched the surface of all the possibilities to gain profit that are hidden on this continent."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The sandwasp's honey is quite useful. But that's the only noteworthy thing about this unimportant desert hicktown."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's somewhat hard to evaluate if this city poses another threat or a new market. Only time can tell."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is bad for business. The big trading houses of Venore have yet to decide what price they will put on his head."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you ever stumble upon that interesting piece of jewellery, contact me. I know somebody who would pay a decent amount of crystal to add it to his collection of curiosities."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are neither skilled in a craft nor do they know about the concept of trade. They constantly raid our colony to steal items."})
keywordHandler:addKeyword({'lizzard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizzard folk is hostile to us but luckily they live far enough from here to be an immediate danger."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They should be driven into the sea."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My offers are weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have hand axes, axes, spears, maces, battle hammers, swords, rapiers, daggers, and sabres. What's your choice?"})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling leather helmets and chain helmets. What do you want?"})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling leather, chain and brass armors. What do you need?"})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling wooden shields and steel shields. What do you want?"})
keywordHandler:addKeyword({'trousers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs. Do you want to buy some?"})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs. Do you want to buy some?"})
keywordHandler:addKeyword({'tusk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I'm not interested in tusks, but you might want to offer them to Zaidal - as far as I know he uses them for making tables and chairs."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
