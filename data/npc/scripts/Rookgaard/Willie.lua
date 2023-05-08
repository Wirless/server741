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


shopModule:addSellableItem({'bread'}, 					Cfbread, 1)
shopModule:addSellableItem({'cheese'}, 					Cfcheese, 2)
shopModule:addSellableItem({'meat'}, 					Cfmeat, 2)
shopModule:addSellableItem({'ham'}, 					Cfham, 4)
shopModule:addSellableItem({'salmon'}, 					Cfsalmon, 2)

shopModule:addBuyableItem({'bread'}, 					Cfbread, 3)
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 5)
shopModule:addBuyableItem({'meat'}, 					Cfmeat, 5)
shopModule:addBuyableItem({'ham'}, 					Cfham, 8)
 


keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fine enough."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a farmer and a cook."})
keywordHandler:addKeyword({'cook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I try out old and new recipes. You can sell me all food you have."})
keywordHandler:addKeyword({'recipe'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to try a banana-pie. But I lack the bananas. If you get me one, I will reward you."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Willie."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Am I a clock or what?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Help yourself, I have not stolen my time."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you afraid of monsters ... you baby?"})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no time for your dungeon nonsense."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What about them? Do you live there?"})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a farmer, not a preacher."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm glad that we don't see many officials here."})
keywordHandler:addKeyword({'obi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This little $&#@& has only #@$*# in his mind. One day I will put a #@$@ in his *@&&#@!"})
keywordHandler:addKeyword({'seymour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This joke of a man thinks he is sooo important."})
keywordHandler:addKeyword({'dallheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm, fine guy I think."})
keywordHandler:addKeyword({'cipfried'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our little monkey."})
keywordHandler:addKeyword({'amber'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Quite a babe."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm not in the weapon business, but if you don't stop to harass me, I will put my hayfork in your &$&#$ and *$!&&*# it."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am magician in the kitchen."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know how to spell and i know how to spit, you little @!#&&. Wanna see?."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If I were you, I would stay here."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you looking for food? I have bread, cheese, ham, and meat."})
keywordHandler:addKeyword({'fish'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Go away with this stinking &*#@@!"})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell food of many kinds."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I buy food of any kind. Since I am a great cook I need much of it."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'banana') and getPlayerStorageValue(cid, 7002) <= 0 then
	npcHandler:say("Have you found a banana for me?", 1)
	willie_talk_state = 99
			
elseif willie_talk_state == 99 and msgcontains(msg, 'yes') and getPlayerStorageValue(cid, 7002) <= 0 then
	if doPlayerRemoveItem(cid,Cfbanana,1) == TRUE then
	doPlayerAddItem(cid, Cfstuddedshield)
	setPlayerStorageValue(cid,7002,1)
	doAddQuestPoint(cid)
	npcHandler:say("A banana! Great. Take this shield, so the &#@&* monsters don't beat the &@*&@ out of you.", 1)
	willie_talk_state = 0
	else
	npcHandler:say("Hm, you don't have it.", 1)
	willie_talk_state = 0
	end
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
