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
npcHandler:setMessage(MESSAGE_GREET, "<nods silently>")
return true
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the bridgeguard. I defend Rookgaard against the beasts from the wilderness and the dungeons!"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dallheim."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell nothing."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fine."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No idea."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have to stay here, sorry, but I can heal you if you are wounded."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will crush all monsters who dare to attack our base."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dungeons are dangerous, be prepared."})
keywordHandler:addKeyword({'wilderness'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are wolves, bears, snakes, deers, and spiders. You can find some dungeon entrances there, too."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the sewers there are some rats, fine targets for young heroes."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a follower of Banor."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The great one! Read books to learn about him."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "HAIL TO THE KING!"})
keywordHandler:addKeyword({'seymour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Leave me alone with this whimp."})
keywordHandler:addKeyword({'willie'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine cook and farmer he is."})
keywordHandler:addKeyword({'amber'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't trust her."})
keywordHandler:addKeyword({'hyacinth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Strange Fellow, hides somewhere in the mountains of the isle."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "With my spikesword I slice even a cyclops in pieces."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not interested in such party tricks."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A nice place for a hero, but nothing for whelps."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'heal') then
	if getCreatureHealth(cid) <= 64 then
	doCreatureAddHealth(cid, -getCreatureHealth(cid)+65)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	npcHandler:say("You are looking really bad. Let me heal your wounds.", 1)
	else
	npcHandler:say("You aren't looking really bad. Sorry, I can't help you.", 1)
	end
			
elseif msgcontains(msg, 'advice') then
	if getPlayerLevel(cid) >= 4 then
	npcHandler:say("Be careful out there.", 1)
	else
	npcHandler:say("Be careful out there and avoid the dungeons.", 1)
	end

end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
