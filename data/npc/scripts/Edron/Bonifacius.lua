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


shopModule:addBuyableItem({'meat'}, 					Cfmeat, 5)
shopModule:addBuyableItem({'salmon'}, 					Cfsalmon, 4)
shopModule:addBuyableItem({'orange'}, 					Cforange, 5, 0, 'oranges')
shopModule:addBuyableItem({'banana'}, 					Cfbanana, 2, 0, 'bananas')
shopModule:addBuyableItem({'grape'}, 					Cfgrape, 3, 0, 'grapes')
shopModule:addBuyableItem({'melon'}, 					Cfmelon, 8, 0, 'melons')
shopModule:addBuyableItem({'pumpkin'}, 					Cfpumpkin, 10, 0, 'pumpkins')
shopModule:addBuyableItem({'cookie'}, 					Cfcookie, 2, 0, 'cookies')
shopModule:addBuyableItem({'roll'}, 					Cfroll, 2, 0, 'rolls')
shopModule:addBuyableItem({'egg'}, 					Cfegg, 2, 0, 'eggs')
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 5)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Bonifacius."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell delicious food. May I be at your service?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our wise king, Tibianus, be praised!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our wise king, Tibianus, be praised!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am glad about their healthy appetite."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is that a new, exotic vegetable?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uh, I hate bugs of all kind."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We recive food from thais with every arriving ship."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world provides us with all kinds of delicious food."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We do not buy any wares there. Our food is of high quality, Thaian origin."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our climate is quite rough, so we can only grow wheat here, but no fruits."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard the corn prices in Thais are going to be increased."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard the corn prices in Thais are going to be increased."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you meat, salmons, fruits, cookies, rolls, eggs, and cheese."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you meat, salmons, fruits, cookies, rolls, eggs, and cheese."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you meat, salmons, fruits, cookies, rolls, eggs, and cheese."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you meat, salmons, fruits, cookies, rolls, eggs, and cheese."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you meat, salmons, fruits, cookies, rolls, eggs, and cheese."})
keywordHandler:addKeyword({'fruit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have oranges, bananas, grapes, pumpkins and melons. What do you want?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
