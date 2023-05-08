dofile(getDataDir() .. 'global/greeting.lua')
dofile(getDataDir() .. 'global/items-config.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
	if getPlayerSex(cid) == 1 then
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir ".. getPlayerName(cid) ..".")
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Madam ".. getPlayerName(cid) ..".")
	return true
	end	
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)
shopModule:addSellableItem({''}, 					0, 2)

shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
shopModule:addBuyableItem({''}, 					0, 2)
 


keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})


function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, '') or msgcontains(msg, '') then
	npcHandler:say("", 1)
	talk_state = 0
			
elseif msgcontains(msg, 'fuck') then


end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())