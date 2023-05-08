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


shopModule:addSellableItem({'mace'}, 					Cfmace, 23)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 1)
shopModule:addSellableItem({'carlin sword'}, 					Cfcarlinsword, 118)
shopModule:addSellableItem({'club'}, 					Cfclub, 1)
shopModule:addSellableItem({'spear'}, 					Cfspear, 1)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 3)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 5)
shopModule:addSellableItem({'battle axe'}, 					Cfbattleaxe, 75)
shopModule:addSellableItem({'battle hammer'}, 					Cfbattlehammer, 50)
shopModule:addSellableItem({'morning star'}, 					Cfmorningstar, 100)
shopModule:addSellableItem({'two handed sword'}, 					Cftwohandedsword, 190)
shopModule:addSellableItem({'halberd'}, 					Cfhalberd, 310)
shopModule:addSellableItem({'double axe'}, 					Cfdoubleaxe, 260)
shopModule:addSellableItem({'war hammer'}, 					Cfwarhammer, 470)
shopModule:addSellableItem({'longsword'}, 					Cflongsword, 51)
shopModule:addSellableItem({'spike sword'}, 					Cfspikesword, 225)
shopModule:addSellableItem({'fire sword'}, 					Cffiresword, 1000)
shopModule:addSellableItem({'sword'}, 					Cfsword, 15)

shopModule:addBuyableItem({'spear'}, 					Cfspear, 10)
shopModule:addBuyableItem({'rapier'}, 					Cfrapier, 15)
shopModule:addBuyableItem({'sabre'}, 					Cfsabre, 35)
shopModule:addBuyableItem({'battle axe'}, 					Cfbattleaxe, 235)
shopModule:addBuyableItem({'battle hammer'}, 					Cfbattlehammer, 350)
shopModule:addBuyableItem({'morning star'}, 					Cfmorningstar, 430)
shopModule:addBuyableItem({'two handed sword'}, 					Cftwohandedsword, 950)
shopModule:addBuyableItem({'club'}, 					Cfclub, 5)
shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'mace'}, 					Cfmace, 90)
shopModule:addBuyableItem({'throwing knife'}, 					Cfthrowingknife, 25)
shopModule:addBuyableItem({'axe'}, 					Cfaxe, 20)
shopModule:addBuyableItem({'sword'}, 					Cfsword, 85)



keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me a blacksmith is, an' weapons me sell. You want buy weapons?"})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me a blacksmith is, an' weapons me sell. You want buy weapons?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me is Uzgod Hammerslammer, son of Fire, from the Savage Axes. You can say you to me."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy the weapons me maked or sell weapons you have, jawoll."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me make often hunt on big nasties. Me small, but very big muscles me have, jawoll."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We no dungeon need. We prison isle have."})
keywordHandler:addKeyword({'prison'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bad ones locked up there. Never come out again there, jawoll."})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me hacking and smashing rocks as me was little dwarf, jawoll."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me enjoy doing that."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? Me just the weapons sell."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? Me just the weapons sell."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me having clubs, daggers, spears, axes, swords, maces, rapiers, and sabres. What is your choice?"})
keywordHandler:addKeyword({'heavy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me having the best two handed swords in tibia. I also sell battle hammers. What is your choice?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me offer you light an' heavy weapons."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me offer you light an' heavy weapons."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
