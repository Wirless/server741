
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end



function greetCallback(cid)
	if getCreatureStorage(cid, 533471) ~= 1 then
		if getPlayerItemCount(cid, 3983) ~= 3 then
	npcHandler:say("Little one bring me 3 bast skirt or get away!", 1)
	return false
	
	elseif getPlayerItemCount(cid, 3983) >= 3 then
	doPlayerRemoveItem(cid,3983,3)
	setPlayerStorageValue(cid, 533471, 1)
	npcHandler:say("Thank you for the bast skirt now lets do the talking [obsidian knife] !", 1)
	end
	
	--if msgcontains(msg, "obsidian") and getPlayerItemCount(cid,2404) ~= 1 then
	--npcHandler:say("Little wants to make obsidian knife?",1)
	--obsidianknife = 1
	--end
	
	else
	npcHandler:setMessage(MESSAGE_GREET, "Hello there adventurer, what you want [obsidian knife] [magic longsword]?")
	return true
	end	
	
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function greetCallback(cid)
npcHandler:setMessage(MESSAGE_GREET, "What do you want from me, ".. getPlayerName(cid) .."?")
return true
end	


keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I'll go and look."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me parents live here before town was. Me not care about lil' ones."})
keywordHandler:addKeyword({'old'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mountain in south. Lil' lil' ones living there."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me not fight them, they not fight me."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Always asking me for stuff they can't afford."})
keywordHandler:addKeyword({'orc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Silly ones. Not talk much. Always screaming and hitting."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({'lil lil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You shut up. Me not want to hear."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Working steel is my profession."})
keywordHandler:addKeyword({'steel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Manny kinds of. Like Mesh Kaha Rogh, Za'Kalortith, Uth'Byth, Uth'Morc, Uth'Amon, Uth'Maer, Uth'Doon, and Zatragil"})
keywordHandler:addKeyword({'Mesh Kaha Rogh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Steel that is singing when forged. No one knows where find today."})
keywordHandler:addKeyword({"Za'Kalortith"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's evil. Demon iron is. No good cyclops goes where you can find and need evil flame to melt."})
keywordHandler:addKeyword({"Uth'Byth"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not good to make stuff off. Bad steel it is. But eating magic, so useful is."})
keywordHandler:addKeyword({"Uth'Morc"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Lil' ones it thieves' steel call sometimes. It's dark and making not much noise."})
keywordHandler:addKeyword({"Uth'Amon"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brigthsteel is. Much art made with it. Sorcerers to lazy and afraid to enchant much."})
keywordHandler:addKeyword({"Uth'Maer"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heartiron from heart of big old mountain, found very deep. Lil' lil ones fiercely defend. Not wanting to have it used for stuff but holy stuff."})
keywordHandler:addKeyword({"Uth'Doon"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's high steel called. Only lil' lil' ones know how make."})
keywordHandler:addKeyword({'Zatragil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most ancients use dream silver for different stuff. Now ancients most gone. Most not know about."})
keywordHandler:addKeyword({'Teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'Kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is one of elven family or such thing. Me not understand lil' ones and their busisness."})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me people not live here much. Most are far away."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me wish I could make weapon like it."})

npcHandler:addModule(FocusModule:new())