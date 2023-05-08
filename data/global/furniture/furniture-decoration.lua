dofile(getDataDir() .. 'global/items-config.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'water pipe'}, 					Cfwaterpipe, 40)
shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'birdcage'}, 					Cfbirdcage, 50)
shopModule:addBuyableItem({'globe'}, 					Cfglobe, 50)
shopModule:addBuyableItem({'pendulum clock'}, 					Cfpendulumclock, 75)
shopModule:addBuyableItem({'table lamp'}, 					Cftablelamp, 35)
shopModule:addBuyableItem({'cuckoo clock'}, 					Cfcuckooclock, 40)
shopModule:addBuyableItem({'rocking horse'}, 					3922, 30)
shopModule:addBuyableItem({'globe'}, 					3927, 50)

keywordHandler:addKeyword({'decoration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell coal basin, water pipe, birdcage, globe, pendulum clock, table lamp, rocking horse, globe and cuckoo clock."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())