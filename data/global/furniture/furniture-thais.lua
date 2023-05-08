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


shopModule:addBuyableItem({'wooden chair'}, 					Cfwoodenchair, 15)
shopModule:addBuyableItem({'sofa chair'}, 					Cfsofachair, 55)
shopModule:addBuyableItem({'red cushioned chair'}, 					Cfredcushionedchair, 40)
shopModule:addBuyableItem({'green cushioned chair'}, 					Cfgreencushionedchair, 40)
shopModule:addBuyableItem({'tusk chair'}, 					Cftuskchair, 25)
shopModule:addBuyableItem({'ivory chair'}, 					Cfivorychair, 25)

keywordHandler:addKeyword({'containers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I seel wooden drawer, bamboo drawer, dresser, locker, large trunk, box, chest, crate and trough."})

shopModule:addBuyableItem({'wooden drawer'}, 					Cfwoodendrawer, 20)
shopModule:addBuyableItem({'dresser'}, 					Cfdresser, 25)
shopModule:addBuyableItem({'locker'}, 					Cflocker, 30)
shopModule:addBuyableItem({'bamboo drawer'}, 					Cfbambodrawer, 20)
shopModule:addBuyableItem({'large trunk'}, 					Cflargetrunk, 10)
shopModule:addBuyableItem({'box'}, 					1738, 10)
shopModule:addBuyableItem({'chest'}, 					1740, 10)
shopModule:addBuyableItem({'crate'}, 					1739, 10)
shopModule:addBuyableItem({'trough'}, 					1775, 7)

keywordHandler:addKeyword({'decoration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell coal basin, birdcage, globe, pendulum clock, table lamp and cuckoo clock."})

shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'birdcage'}, 					Cfbirdcage, 50)
shopModule:addBuyableItem({'globe'}, 					Cfglobe, 50)
shopModule:addBuyableItem({'pendulum clock'}, 					Cfpendulumclock, 75)
shopModule:addBuyableItem({'table lamp'}, 					Cftablelamp, 35)
shopModule:addBuyableItem({'cuckoo clock'}, 					Cfcuckooclock, 40)

keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})

shopModule:addBuyableItem({'potted flower'}, 					Cfpottedflower, 5)
shopModule:addBuyableItem({'indoor plant'}, 					Cfindoorplant, 8)
shopModule:addBuyableItem({'christmas tree'}, 					Cfchristmasthree, 50)

keywordHandler:addKeyword({'instruments'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell harp and piano."})

shopModule:addBuyableItem({'harp'}, 					Cfharp, 50)
shopModule:addBuyableItem({'piano'}, 					Cfpiano, 200)

keywordHandler:addKeyword({'pillows'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell small purple, green, red, blue, orange, turqoise and white pillows. and round blue, red, purple and turqoise pillows. and square blue, red, green and yellow pillows. and also heart pillows."})

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

keywordHandler:addKeyword({'statues'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell knight, goblin and minotaur statues."})

shopModule:addBuyableItem({'knight statue'}, 					1442, 50)
shopModule:addBuyableItem({'goblin statue'}, 					1447, 50)
shopModule:addBuyableItem({'minotaur statue'}, 					1446, 50)

keywordHandler:addKeyword({'tables'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell big, small, small round, square, stone and tusk tables."})

shopModule:addBuyableItem({'big table'}, 					Cfbigtable, 30)
shopModule:addBuyableItem({'square table'}, 					Cfsquaretable, 25)
shopModule:addBuyableItem({'small table'}, 					Cfsmalltable, 20)
shopModule:addBuyableItem({'small round table'}, 					Cfsmallroundtable, 25)
shopModule:addBuyableItem({'stone table'}, 					Cfstonetable, 30)
shopModule:addBuyableItem({'tusk table'}, 					Cftusktable, 25)
shopModule:addBuyableItem({'bamboo table'}, 					Cfbambootable, 25)

keywordHandler:addKeyword({'tapestry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})
keywordHandler:addKeyword({'tapestries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell green, yellow, orange, red, blue and white tapestry."})

shopModule:addBuyableItem({'green tapestry'}, 					Cfgreentapestry, 25)
shopModule:addBuyableItem({'yellow tapestry'}, 					Cfyellowtapestry, 25)
shopModule:addBuyableItem({'orange tapestry'}, 					Cforangetapestry, 25)
shopModule:addBuyableItem({'red tapestry'}, 					Cfredtapestry, 25)
shopModule:addBuyableItem({'blue tapestry'}, 					Cfbluetapestry, 25)
shopModule:addBuyableItem({'white tapestry'}, 					Cfwhitetapestry, 25)


keywordHandler:addKeyword({'chair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden, sofa, red cushioned, green cushioned, tusk and ivory chair."})
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())