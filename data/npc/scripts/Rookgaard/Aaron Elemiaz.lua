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
npcHandler:setMessage(MESSAGE_GREET, "What the hell do you want? do you mess with me? do you?!")
name_talk_state = 8547
return true
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
if msgcontains(msg, 'mes') or msgcontains(msg, 'fight') then
	npcHandler:say("What the hell do you want? do you mess with me? do you?!", 1)
	name_talk_state = 8547
			
elseif name_talk_state == 8547 and msgcontains(msg, 'yes') then
	npcHandler:say("Yeah! want to fight?! come on lets fight! okay!?", 1)
	name_talk_state = 852
elseif name_talk_state == 8547 and msgcontains(msg, 'no') then
	npcHandler:say("Pussy, go away you smell like shit!..", 1)
	name_talk_state = 0	

elseif name_talk_state == 852 and msgcontains(msg, 'yes') then
	SPAWNPOS = {x=32080, y=32186, z=6}
	dumppos = {x=32307, y=31945, z=7}
	NPCPOS = getThingfromPos(SPAWNPOS)
	doRelocate(SPAWNPOS, dumppos)
	doSummonCreature("Aaron Elemiaz", SPAWNPOS)
	setGlobalStorageValue(103, 2)
	name_talk_state = 0	
end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
