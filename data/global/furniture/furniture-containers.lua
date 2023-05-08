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



shopModule:addBuyableItem({'wooden drawer'}, 					Cfwoodendrawer, 20)
shopModule:addBuyableItem({'dresser'}, 					Cfdresser, 25)
shopModule:addBuyableItem({'locker'}, 					Cflocker, 30)
shopModule:addBuyableItem({'large trunk'}, 					Cflargetrunk, 10)
shopModule:addBuyableItem({'box'}, 					1738, 10)
shopModule:addBuyableItem({'chest'}, 					1740, 10)
shopModule:addBuyableItem({'crate'}, 					1739, 10)
shopModule:addBuyableItem({'trough'}, 					1775, 7)
shopModule:addBuyableItem({'barrel'}, 					Cfbarrel, 12)

keywordHandler:addKeyword({'container'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I seel wooden drawer, dresser, locker, large trunk, box, chest, crate, barrel and trough."})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())