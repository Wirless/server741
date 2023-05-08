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

shopModule:addBuyableItem({'desintegrate rune'}, 					Cfdesintegraterune, 26, 3)
shopModule:addBuyableItem({'poison bomb rune'}, 					Cfpoisonbombrune, 85, 2)
shopModule:addBuyableItem({'energy bomb rune'}, 					Cfenergybombrune, 162, 2)
shopModule:addBuyableItem({'soulfire rune'}, 					Cfsoulfirerune, 46, 2)
shopModule:addBuyableItem({'magic wall rune'}, 					Cfmagicwallrune, 116, 3)
shopModule:addBuyableItem({'animate dead rune'}, 					Cfanimatedeadrune, 375, 1)
shopModule:addBuyableItem({'paralyze rune'}, 					Cfparalyzerune, 700, 1)
shopModule:addBuyableItem({'fireball rune'}, 					Cffireballrune, 30, 2)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())