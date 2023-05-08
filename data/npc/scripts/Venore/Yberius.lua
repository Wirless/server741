dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? I have no job. I just live for the gods of Tibia."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Quentin."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created Tibia and all life on it."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "On Tibia there are many forms of life. There are plants and people and monsters."})
keywordHandler:addKeyword({'plant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just walk around, you will see grass, trees, and bushes."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a simple monk. I just know Sam, Frodo, and Gorn. They all live in the main street to the north."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is our blacksmith. He sells weapons and armour."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the owner of Frodo's Hut, the tavern north of this temple."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is selling equipment. If you still have no backpack you should go and ask him for one."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the leader of the local Paladins' guild."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Muriel is a famous sorcerer. She is the keeper of arcane secrets that are known only to few mortals."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The leader of the Knights' guild is a man of few words."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I admire the healing skills of Marvik."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king resides in the castle to the west."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is where we are. The world of Tibia. Admire it's beauty."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is a highly competent priest."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A hard man but his heart is in the right right place."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about the Tibian army. Ask general Harkath Bloodblade about that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hush! Do not mention the Evil One in these walls."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Harkath Bloodblade is his name."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the king's jester, but he believes himself to be the king of fools."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the guard of the royal castle."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This man is spreading horrible rumours all the time."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please do not mention the fallen one."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Legends tell us that that Excalibug is a gift of the gods. Banor used in his battles.  They say it was passed on to one of his followers."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I know nothing new. Please ask Frodo about that topic."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are really too many of them in Tibia. But who am I to challenge the wisdom of the gods?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'task'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'what'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'spider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are spiders' nests beyond our city near Gorn's shop and at the McRonalds' farm in the east."})
keywordHandler:addKeyword({'rat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are sewers underneath the city. They say these sewers are brimming with rats."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can enter the sewers thorugh a sewer grate. But watch out. There are many rats. And don't forget to bring a torch."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should buy a bag or backpack. That way your hands will be free to hold a weapon and a shield."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'eat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you would like to heal your wounds you should eat some food. Frodo sells excellent meals. But if you are very weak you can also come to me. I will heal you."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Gorn for a watch, if you need one."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)

if msgcontains(msg, 'heal') then
	if getCreatureHealth(cid) <= 39 then
	npcHandler:say("You are looking really bad. Let me heal your wounds.", 1)
	doCreatureAddHealth(cid, -getCreatureHealth(cid)+40)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	name_talk_state = 0
	return true
	else
	npcHandler:say("You aren't looking really bad. Sorry, I can't help you.", 1)
	return true
	end
	name_talk_state = 0	
    return 1
end

	local crystalValue = getCreatureStorage(cid, 1345)

--bless function
if msgcontains(msg, 'blessings') then
	npcHandler:say("There are five different blessings available in five sacred places. I can sell all of them for you if you ask me for {all} or {bless}", 1)
	name_talk_state = 0

elseif msgcontains(msg, 'all') or msgcontains(msg, 'bless') then
	npcHandler:say("I can provide you with all blessings. But you will have to sacrifice 40.000 gold to receive it. Are you still interested?", 1)
	name_talk_state = 1894


elseif name_talk_state == 1894 and msgcontains(msg, 'yes') then
if crystalValue >= 0 then
	if getPlayerMoney(cid) >= 40000 then
		for i = 1,5 do
                if(not getPlayerBlessing(cid, i)) then
                    doPlayerAddBlessing(cid, i)
					doSendMagicEffect(getPlayerPosition(cid), 13)
					npcHandler:say("So you receive all the blessings, pilgrim", 1)
					doPlayerRemoveMoney(cid, 8000)
                else
                    npcHandler:say("You have already recived my blessings!", 1)
				end
		end
		else
		npcHandler:say("Oh. You do not have enough money.", 1)
		name_talk_state = 0	
		end
	else
	npcHandler:say("Only special players can use this.", 1)
	name_talk_state = 0	
end
	

end
--blessend	

end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
