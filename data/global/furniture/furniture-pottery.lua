shopModule:addBuyableItem({'vase'}, 					Cfvase, 3, 0)
shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'large amphora'}, 					Cflargeamphora, 50)
shopModule:addBuyableItem({'amphora'}, 					Cfamphora, 4)

keywordHandler:addKeyword({'pottery'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell vase, coal basin, amphora and large amphora."})