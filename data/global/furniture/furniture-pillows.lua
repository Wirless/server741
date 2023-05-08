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

shopModule:addBuyableItem({'small purple pillow'}, 					Cfpurplepillow, 20)
shopModule:addBuyableItem({'small green pillow'}, 					Cfgreenpillow, 20)
shopModule:addBuyableItem({'small red pillow'}, 					Cfredpillow, 20)
shopModule:addBuyableItem({'small blue pillow'}, 					Cfbluepillow, 20)
shopModule:addBuyableItem({'small orange pillow'}, 					Cforangepillow, 20)
shopModule:addBuyableItem({'small turqoise pillow'}, 					Cfturqoisepillow, 20)
shopModule:addBuyableItem({'small white pillow'}, 					Cfwhitepillow, 20)
shopModule:addBuyableItem({'heart pillow'}, 					Cfheartpillow, 30)
shopModule:addBuyableItem({'round blue pillow'}, 					Cfblueroundpillow, 25)
shopModule:addBuyableItem({'round red pillow'}, 					Cfredroundpillow, 25)
shopModule:addBuyableItem({'round purple pillow'}, 					Cfpurpleroundpillow, 25)
shopModule:addBuyableItem({'round turqoise pillow'}, 					Cfturqoiseroundpillow, 25)
shopModule:addBuyableItem({'square blue pillow'}, 					Cfbluesquarepillow, 30)
shopModule:addBuyableItem({'square red pillow'}, 					Cfredsquarepillow, 30)
shopModule:addBuyableItem({'square green pillow'}, 					Cfgreensquarepillow, 30)
shopModule:addBuyableItem({'square yellow pillow'}, 					Cfyellowsquarepillow, 30)

keywordHandler:addKeyword({'pillow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell small purple, green, red, blue, orange, turqoise and white pillows. and round blue, red, purple and turqoise pillows. and square blue, red, green and yellow pillows. and also heart pillows."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())