shopModule:addBuyableItem({'antidote rune'}, 					Cfantidoterune, 65, 1)
shopModule:addBuyableItem({'blank rune'}, 					Cfblankrune, 10)
shopModule:addBuyableItem({'convince creature rune'}, 					Cfconvincecreaturerune, 80, 1)
shopModule:addBuyableItem({'destroy field rune'}, 					Cfdestroyfieldrune, 45, 3)
shopModule:addBuyableItem({'energy field rune'}, 					Cfenergyfieldrune, 115, 3)
shopModule:addBuyableItem({'energy wall rune'}, 					Cfenergywallrune, 340, 4)
shopModule:addBuyableItem({'explosion rune'}, 					Cfexplosionrune, 190, 3)
shopModule:addBuyableItem({'fire bomb rune'}, 					Cffirebombrune, 235, 2)
shopModule:addBuyableItem({'fire field rune'}, 					Cffirefieldrune, 85, 3)
shopModule:addBuyableItem({'fire wall rune'}, 					Cffirewallrune, 245, 4)
shopModule:addBuyableItem({'great fireball rune'}, 					Cfgreatfireballrune, 180, 2)
shopModule:addBuyableItem({'heavy magic missile rune'}, 					Cfheavymagicmissilerune, 120, 5)
shopModule:addBuyableItem({'intense healing rune'}, 					Cfintensehealingrune, 95, 1)
shopModule:addBuyableItem({'light magic missile rune'}, 					Cflightmagicmissilerune, 40, 5)
shopModule:addBuyableItem({'poison field rune'}, 					Cfpoisonfieldrune, 65, 3)
shopModule:addBuyableItem({'poison wall rune'}, 					Cfpoisonwallrune, 210, 4)
shopModule:addBuyableItem({'sudden death rune'}, 					Cfsuddendeathrune, 325, 1)
shopModule:addBuyableItem({'ultimate healing rune'}, 					Cfultimatehealingrune, 175, 1)
shopModule:addBuyableItem({'desintegrate rune'}, 					Cfdesintegraterune, 80, 3)
shopModule:addBuyableItem({'poison bomb rune'}, 					Cfpoisonbombrune, 255, 3)
shopModule:addBuyableItem({'energy bomb rune'}, 					Cfenergybombrune, 325, 2)
shopModule:addBuyableItem({'soulfire rune'}, 					Cfsoulfirerune, 140, 3)
shopModule:addBuyableItem({'magic wall rune'}, 					Cfmagicwallrune, 350, 4)
shopModule:addBuyableItem({'animate dead rune'}, 					Cfanimatedeadrune, 375, 1)
shopModule:addBuyableItem({'paralyze rune'}, 					Cfparalyzerune, 700, 1)
shopModule:addBuyableItem({'fireball rune'}, 					Cffireballrune, 150, 5)

keywordHandler:addKeyword({'spell rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell missile runes, explosive runes, field runes, wall runes, bomb runes, healing runes, convince creature runes, chameleon runes, paralyze runes and animate dead runes."})
keywordHandler:addKeyword({'missile rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you light magic missile runes, heavy magic missile runes, sudden death runes and soul fire runes."})
keywordHandler:addKeyword({'explosive runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you fireball runes, great fireball runes, fireball runes and explosion runes."})
keywordHandler:addKeyword({'field runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you fire field runes, energy field runes, poison field runes, destroy field runes and desintegrate runes."})
keywordHandler:addKeyword({'wall rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you fire wall runes, energy wall runes, poison wall runes and magic wall runes."})
keywordHandler:addKeyword({'bomb runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you firebomb runes, poison bomb runes and energy bomb runes."})
keywordHandler:addKeyword({'healing runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you antidote runes, intense healing runes and ultimate healing runes."})
keywordHandler:addKeyword({'rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell blank runes and spell runes."})