local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
npcHandler.talkRadius = 3
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'dragon lance'}, 2414, 9000, 'dragon lance')
shopModule:addSellableItem({'fire axe'}, 2432, 8000, 'fire axe')
shopModule:addSellableItem({'fire sword'}, 2392, 4000, 'fire sword')
shopModule:addSellableItem({'war hammer'}, 2391, 1200, 'war hammer')
shopModule:addSellableItem({'spike sword'}, 2383, 1000, 'spike sword')
shopModule:addSellableItem({'ice rapier'}, 2396, 1000, 'ice rapier')
shopModule:addSellableItem({'broad sword'}, 2413, 500, 'broad sword')
shopModule:addSellableItem({'obsidian lance'}, 2425, 500, 'obsidian lance')
shopModule:addSellableItem({'crown armor'}, 2487, 12000, 'crown armor')
shopModule:addSellableItem({'blue robe'}, 2656, 10000, 'blue robe')
shopModule:addSellableItem({'noble armor'}, 2486, 900, 'noble armor')
shopModule:addSellableItem({'royal helmet'}, 2498, 30000, 'royal helmet')
shopModule:addSellableItem({'crusader helmet'}, 2497, 6000, 'crusader helmet')
shopModule:addSellableItem({'crown helmet'}, 2491, 2500, 'crown helmet')
shopModule:addSellableItem({'crown legs'}, 2488, 12000, 'crown legs')
shopModule:addSellableItem({'boots of haste'}, 2195, 30000, 'boots of haste')
shopModule:addSellableItem({'phoenix shield'}, 2539, 16000, 'phoenix shield')
shopModule:addSellableItem({'crown shield'}, 2519, 8000, 'crown shield')
shopModule:addSellableItem({'dragon shield'}, 2516, 4000, 'dragon shield')
shopModule:addSellableItem({'guardian shield'}, 2515, 2000, 'guardian shield')
shopModule:addSellableItem({'beholder shield'}, 2518, 1200, 'beholder shield')
shopModule:addSellableItem({'sword ring'}, 2207, 500, 'sword ring') 
shopModule:addSellableItem({'club ring'}, 2209, 500, 'club ring') 
shopModule:addSellableItem({'axe ring'}, 2208, 500, 'axe ring') 
shopModule:addSellableItem({'power ring'}, 2166, 100, 'power ring') 
shopModule:addSellableItem({'stealth ring'}, 2165, 200, 'stealth ring')

shopModule:addSellableItem({'elven amulet'}, 2198, 500, 'elven amulet') 
shopModule:addSellableItem({'bronze amulet'}, 2172, 100, 'bronze amulet') 
shopModule:addSellableItem({'garlic necklace'}, 2199, 100, 'garlic necklace')  
shopModule:addSellableItem({'magic light wand'}, 2162, 35, 'magic light wand') 
shopModule:addSellableItem({'blue spell wand'}, 2190, 100, 'blue spell wand') 
shopModule:addSellableItem({'red spell wand'}, 2191, 200, 'red spell wand') 
shopModule:addSellableItem({'green spell wand'}, 2188, 1000, 'green spell wand') 
shopModule:addSellableItem({'yellow spell wand'}, 2189, 2000, 'yellow spell wand') 
shopModule:addSellableItem({'ritual wand'}, 2187, 3000, 'ritual wand') 
shopModule:addSellableItem({'orb'}, 2176, 750, 'orb') 
shopModule:addSellableItem({'mind stone'}, 2178, 100, 'mind stone') 
shopModule:addSellableItem({'life crystal'}, 2177, 50, 'life crystal') 
shopModule:addSellableItem({'scimitar'}, 2419, 150, 'scimitar')
shopModule:addSellableItem({'giant sword'}, 2393, 17000, 'giant sword')
shopModule:addSellableItem({'serpent sword'}, 2409, 900, 'serpent sword')
shopModule:addSellableItem({'poison dagger'}, 2411, 50, 'poison dagger')
shopModule:addSellableItem({'knight axe'}, 2430, 2000, 'knight axe')
shopModule:addSellableItem({'dragon hammer'}, 2434, 2000, 'dragon hammer')
shopModule:addSellableItem({'skull staff'}, 2436, 6000, 'skull staff')
shopModule:addSellableItem({'dark armor'}, 2489, 400, 'dark armor')
shopModule:addSellableItem({'knight armor'}, 2476, 5000, 'knight armor')
shopModule:addSellableItem({'dark helmet'}, 2490, 250, 'dark helmet')
shopModule:addSellableItem({'warrior helmet'}, 2475, 5000, 'warrior helmet')
shopModule:addSellableItem({'strange helmet'}, 2479, 500, 'strange helmet')
shopModule:addSellableItem({'mystic turban'}, 2663, 150, 'mystic turban')
shopModule:addSellableItem({'knight legs'}, 2477, 5000, 'knight legs')
shopModule:addSellableItem({'tower shield'}, 2528, 8000, 'tower shield')
shopModule:addSellableItem({'black shield'}, 2529, 800, 'black shield')
shopModule:addSellableItem({'ancient shield'}, 2532, 900, 'ancient shield')
shopModule:addSellableItem({'vampire shield'}, 2534, 15000, 'vampire shield')
shopModule:addSellableItem({'might ring'}, 2164, 250, 'might ring') 
shopModule:addSellableItem({'energy ring'}, 2167, 100, 'energy ring') 
shopModule:addSellableItem({'life ring'}, 2168, 50, 'life ring') 
shopModule:addSellableItem({'time ring'}, 2169, 100, 'time ring') 
shopModule:addSellableItem({'dwarven ring'}, 2213, 100, 'dwarven ring')
shopModule:addSellableItem({'ring of healing'}, 2214, 100, 'ring of healing') 
shopModule:addSellableItem({'strange talisman'}, 2161, 30, 'strange talisman') 
shopModule:addSellableItem({'silver amulet'}, 2170, 50, 'silver amulet') 
shopModule:addSellableItem({'protection amulet'}, 2200, 100, 'protection amulet')  
shopModule:addSellableItem({'dragon necklace'}, 2201, 100, 'dragon necklace') 
shopModule:addSellableItem({'golden wand'}, 2182, 100, 'golden wand') 
shopModule:addSellableItem({'conjurer wand'}, 2186, 200, 'conjurer wand') 
shopModule:addSellableItem({'wand of might'}, 2185, 1000, 'wand of might') 
shopModule:addSellableItem({'wooden wand'}, 2181, 2000, 'wooden wand') 
shopModule:addSellableItem({'elven wand'}, 2183, 3000, 'elven wand') 
shopModule:addSellableItem({'ankh'}, 2193, 100, 'ankh') 
shopModule:addSellableItem({'mysterious fetish'}, 2194, 50, 'mysterious fetish') 
 
shopModule:addBuyableItem({'life ring'}, 2168, 900, 'life ring') 


npcHandler:addModule(FocusModule:new())

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell and buy different kinds of armors.'})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Why would I need that rubbish? Just fooling you... I buy dragon lances, fire axes, fire swords, war hammers, spike swords, ice rapiers, broad swords, obsidian lances, crown armors, blue robes, noble armors, royal helmets, crusader helmets, crown helmets, crown legs, boots of hastes, phoenix shields, crown shields, dragon shields, guardian shields and beholder shields.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I seel all kinds of tools.'})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A quest is nothing I want to be involved in.'})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can\'t help you in that area, son.'})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sorry but I do not sell those. Just fooling you... I sell war hammers, spike swords, noble armors and beholder shields.'})