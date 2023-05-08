dofile(getDataDir() .. 'global/items-config.lua')

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


shopModule:addBuyableItem({'green tapestry'}, 					Cfgreentapestry, 25)
shopModule:addBuyableItem({'yellow tapestry'}, 					Cfyellowtapestry, 25)
shopModule:addBuyableItem({'orange tapestry'}, 					Cforangetapestry, 25)
shopModule:addBuyableItem({'red tapestry'}, 					Cfredtapestry, 25)
shopModule:addBuyableItem({'blue tapestry'}, 					Cfbluetapestry, 25)
shopModule:addBuyableItem({'white tapestry'}, 					Cfwhitetapestry, 25)

keywordHandler:addKeyword({'tapestry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})
keywordHandler:addKeyword({'tapestries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())