dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end



function greetCallback(cid)
	if getGoldenAccountDays(cid) < 1 then
	--if getPlayerLevel(cid) == 8 then
	npcHandler:say("Sorry you do not have the rights to trade with me, ".. getPlayerName(cid) .."!", 1)
	return false
	else
	npcHandler:setMessage(MESSAGE_GREET, "Hello there adventurer, what you want?")
	return true
	end	
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'thornfang axe'}, 5903, 6000, 'thornfang axe')
shopModule:addSellableItem({'wyvern fang'}, 5905, 2500, 'wyvern fang')
shopModule:addSellableItem({'royal axe'}, 5904, 50000, 'royal axe')
shopModule:addSellableItem({'destroyer club'}, 5902, 15000, 'destroyer club')
shopModule:addSellableItem({'abyss club'}, 5886, 12000, 'abyss club')
shopModule:addSellableItem({'quara sceptre'}, 5901, 4000, 'quara sceptre')
shopModule:addSellableItem({'blacksteel sword'}, 5906,15000, 'blacksteel')
shopModule:addSellableItem({'runic sword'}, 5899,15000, 'runic sword')
shopModule:addSellableItem({'death star'}, 5888,10000, 'death star')
shopModule:addSellableItem({'spark hammer'}, 5889,35000, 'spark hammer')
shopModule:addSellableItem({'ice blade'}, 5898,5000, 'ice blade')
shopModule:addSellableItem({'phonic ace'}, 5890,35000, 'phonic ace')
shopModule:addSellableItem({'hadge hammer'}, 5892,4500, 'hadge hammer')


shopModule:addSellableItem({'abyss club'}, 5886, 20000, 'abyss club')
shopModule:addSellableItem({'ice flail'}, 5885, 10000, 'ice flail')
shopModule:addSellableItem({'warlocks spellbook'}, 5791, 60000, 'warlocks spellbook')
shopModule:addSellableItem({'necromantic spellbook'}, 5789, 15000, 'necromantic spellbook')
shopModule:addSellableItem({'archer armor'}, 5828, 50000, 'archer armor')
shopModule:addSellableItem({'zaoan helmet'}, 5827, 45000, 'zaoan helmet')
shopModule:addSellableItem({'zaoan armor'}, 5826, 14000, 'zaoan armor')
shopModule:addSellableItem({'zaoan legs'}, 5839, 14000, 'zaoan legs')
shopModule:addSellableItem({'zaoan shoes'}, 5838, 5000, 'zaoan shoes')

shopModule:addSellableItem({'glacier robe'}, 5872, 11000, 'glacier robe')
shopModule:addSellableItem({'glacier mask'}, 5871, 2500, 'glacier mask')
shopModule:addSellableItem({'glacier kilt'}, 5873, 11000, 'glacier kilt')
shopModule:addSellableItem({'glacier shoes'}, 5874, 2500, 'glacier shoes')
shopModule:addSellableItem({'glacier amulet'}, 5877, 4000, 'glacier amulet')
shopModule:addSellableItem({'magma coat'}, 5862, 11000, 'magma coat')
shopModule:addSellableItem({'magma monocle'}, 5866, 2500, 'magma monocle')
shopModule:addSellableItem({'magma legs'}, 5863, 11000, 'magma legs')
shopModule:addSellableItem({'magma boots'}, 5864, 2500, 'magma boots')
shopModule:addSellableItem({'magma amulet'}, 5875, 4000, 'magma amulet')
shopModule:addSellableItem({'magma shield'}, 5865, 15000, 'magma shield')
shopModule:addSellableItem({'terra mantle'}, 5881, 11000, 'terra mantle')
shopModule:addSellableItem({'terra hood'}, 5882, 2500, 'terra hood')
shopModule:addSellableItem({'terra legs'}, 5880, 11000, 'terra legs')
shopModule:addSellableItem({'terra boots'}, 5879, 2500, 'terra boots')
shopModule:addSellableItem({'terra amulet'}, 5878, 4000, 'terra amulet')
shopModule:addSellableItem({'lightning robe'}, 5868, 11000, 'lightning robe')
shopModule:addSellableItem({'lightning headband'}, 5867, 2500, 'lightning headband')
shopModule:addSellableItem({'lightning legs'}, 5869, 11000, 'lightning legs')
shopModule:addSellableItem({'lightning boots'}, 5870, 2500, 'lightning boots')
shopModule:addSellableItem({'lightning pendant'}, 5876, 4000, 'lightning pendant')
shopModule:addSellableItem({'composite hornbow'}, 5915, 25000, 'composite hornbow')
shopModule:addSellableItem({'spiked squelcher'}, 5900, 5000, 'spiked squelcher')
shopModule:addSellableItem({'dragon slayer'}, 5909, 15000, 'dragon slayer')
shopModule:addSellableItem({'dragonbone staff'}, 5887, 3000, 'dragonbone staff')
shopModule:addSellableItem({'nightmare blade'}, 5908, 35000, 'nightmare blade')
shopModule:addSellableItem({'dragon scale mail'}, 2492, 40000, 'dragon scale mail')
shopModule:addSellableItem({'dwarven armor'}, 2503, 30000, 'dwarven armor')
shopModule:addSellableItem({'golden armor'}, 2466, 20000, 'golden armor')
shopModule:addSellableItem({'leopard armor'}, 3968, 1000, 'leopard armor')
shopModule:addSellableItem({'magic plate armor'}, 2472, 90000, 'magic plate armor')

shopModule:addSellableItem({'golden legs'}, 2470, 70000, 'golden legs')

shopModule:addSellableItem({'demon shield'}, 2520, 30000, 'demon shield')
shopModule:addSellableItem({'medusa shield'}, 2536, 9000, 'medusa shield')
shopModule:addSellableItem({'scarab shield'}, 2540, 2000, 'scarab shield')
shopModule:addSellableItem({'mastermind shield'}, 2514,50000, 'mastermind shield')

shopModule:addSellableItem({'beholder helmet'}, 3972, 7500, 'beholder helmet')
shopModule:addSellableItem({'devil helmet'}, 2462, 1000, 'devil helmet')

shopModule:addSellableItem({'crocodile boots'}, 3892, 1000, 'crocodile boots')
shopModule:addSellableItem({'traper boots'}, 2642000, 'traper boots')
shopModule:addSellableItem({'steel boots'}, 2645, 30000, 'steel boots')

shopModule:addSellableItem({'daramanian mace'}, 2439, 110, 'daramanian mace')
shopModule:addSellableItem({'daramanian waraxe'}, 2440, 1000, 'daramanian waraxe')
shopModule:addSellableItem({'guardian halberd'}, 2427, 11000, 'guardian halberd')
shopModule:addSellableItem({'heavy machete'}, 2442, 90, 'heavy machete')
shopModule:addSellableItem({'silver dagger'}, 2402, 500, 'silver dagger')
shopModule:addSellableItem({'war axe'}, 2454, 9000, 'war axe')

shopModule:addSellableItem({'ancient amulet'}, 2142, 200, 'ancient amulet')
shopModule:addSellableItem({'crystal necklace'}, 2125, 400, 'crystal necklace')
shopModule:addSellableItem({'crystal ring'}, 2124, 250, 'crystal ring')
shopModule:addSellableItem({'demonbone amulet'}, 2136, 32000, 'demonbone amulet')
shopModule:addSellableItem({'emerald bangle'}, 2127, 800, 'emerald bangle')
shopModule:addSellableItem({'golden ring'}, 2179, 8000, 'golden ring')
shopModule:addSellableItem({'platinum amulet'}, 2171, 2500, 'platinum amulet')
shopModule:addSellableItem({'ring of the sky'}, 2123, 30000, 'ring of the sky')
shopModule:addSellableItem({'ruby necklace'}, 2133, 2000, 'ruby necklace')
shopModule:addSellableItem({'scarab amulet'}, 2135, 200, 'scarab amulet')
shopModule:addSellableItem({'silver brooch'}, 2134, 150,'silver brooch')

shopModule:addSellableItem({'doll'},2100 , 200, 'doll')
shopModule:addSellableItem({'voodoo doll'}, 3955, 400, 'voodoo doll')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())