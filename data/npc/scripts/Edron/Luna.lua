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

shopModule:addSellableItem({'fire mushroom'}, 					2795, 200)

shopModule:addBuyableItem({'white mushroom'}, 					Cfwhitemushroom, 6)
shopModule:addBuyableItem({'red mushroom'}, 					Cfredmushroom, 12)
shopModule:addBuyableItem({'brown mushroom'}, 					Cfbrownmushroom, 10)
shopModule:addBuyableItem({'rose'}, 					Cfrose, 11, 0, 'red rose')
shopModule:addBuyableItem({'tulip'}, 					Cftulip, 9)
shopModule:addBuyableItem({'stone herb'}, 					Cfstoneherb, 28)
shopModule:addBuyableItem({'star herb'}, 					Cfstarherb, 21)
shopModule:addBuyableItem({'fern'}, 					Cffern, 24)
 


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm called Luna."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell various herbs, mushrooms, and flowers."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't know."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about the king, sorry."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about the king, sorry."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sometimes heal soldiers with my herbal mixtures."})
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sometimes heal soldiers with my herbal mixtures."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mentioning his name makes me shiver."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not an expert for weapons."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I prefer the wilderness to cities."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I prefer the wilderness to cities."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I prefer the wilderness to cities."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I prefer the wilderness to cities."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I fear I know nothing new that is of any importance."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I fear I know nothing new that is of any importance."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling various herbs, mushrooms, and flowers."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling various herbs, mushrooms, and flowers."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling various herbs, mushrooms, and flowers."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling various herbs, mushrooms, and flowers."})
keywordHandler:addKeyword({'herbs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have stone herbs, star herbs, and ferns. What do you want?"})
keywordHandler:addKeyword({'mushroom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have white, red, and brown mushrooms. Which one do you want?"})
keywordHandler:addKeyword({'flowers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have red roses and tulips. What do you want?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
