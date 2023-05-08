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

shopModule:addBuyableItem({'bread'}, 					Cfbread, 4)
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 6)
shopModule:addBuyableItem({'meat'}, 					Cfmeat, 5)
shopModule:addBuyableItem({'ham'}, 					Cfham, 8)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the owner of this saloon. I am also selling food."})
keywordHandler:addKeyword({'saloon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the owner of this saloon I am also selling food."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just call me Miriam."})
keywordHandler:addKeyword({'manuel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A loud neighbour, I get a lot of complaints about him."})
keywordHandler:addKeyword({'jonas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know where he gets these fluids."})
keywordHandler:addKeyword({'voldoor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many of his customers visit my Hut, too."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nothing more than a tale for warriors."})

keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Come on! You know that our world is called Tibia."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many travellers tell funny stories about all the emancipated women in this northern town."})
keywordHandler:addKeyword({'casandra'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She makes excellent arrows and bows."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some travelers from Edron told about a great treasure guarded by cruel demons in the dungeons there."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some travelers from Edron told about a great treasure guarded by cruel demons in the dungeons there."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you looking for food? I have bread, cheese, ham, and meat."})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'Lynda') or msgcontains(msg, 'lynda') then
	if getPlayerSex(cid) == 1 then
	npcHandler:say("Just between you and me: What a babe!", 1)
	else
	npcHandler:say("A very noble lady.", 1)
	end
	frodo_talk_state = 0
			
elseif msgcontains(msg, 'hengis wulfson') then
npcHandler:say("He is a great bard. He often graced my hut with his presence, songs, and rhymes. I wonder what happened to him lately.", 1)
frodo_talk_state = 2

elseif frodo_talk_state == 2 and msgcontains(msg, 'killed') or frodo_talk_state == 2 and msgcontains(msg, 'died') or frodo_talk_state == 2 and msgcontains(msg, 'dea') or frodo_talk_state == 2 and msgcontains(msg, 'slain') then
npcHandler:say("Oh, by the gods! What do you say happened to him?", 1)
frodo_talk_state = 3

elseif frodo_talk_state == 3 and msgcontains(msg, 'cyclops') then
npcHandler:say("That's horrible! I am in grief. I will never hear his songs again. I will even miss that strange rhyme he was obsessed with.", 1)
frodo_talk_state = 4

elseif frodo_talk_state == 4 and msgcontains(msg, 'rhyme') then
npcHandler:say("He recitated it that often that I learned it by heart myself. I would recitate it, but I am not skilled in that kind of things.", 1)
frodo_talk_state = 5

elseif frodo_talk_state == 5 and msgcontains(msg, 'recitate') then
npcHandler:say("Uhm. If you insist, but I am so awful. I will stop now and then and wait, so you can tell if I should proceed, ok?", 1)
frodo_talk_state = 6

elseif frodo_talk_state == 2 and msgcontains(msg, 'yes') then
npcHandler:say("Well ok, but don't blame me. Chhrrr... chhrrrr,... it goes like this... chhrrr: and when the dead feast at midnight...", 1)
frodo_talk_state = 7

elseif frodo_talk_state == 7 and msgcontains(msg, 'proceed') then
npcHandler:say("... the ancient enemy will no longer guard the place of his unlucky heir and the living will walk the paths of the old way...", 1)
frodo_talk_state = 8

elseif frodo_talk_state == 8 and msgcontains(msg, 'proceed') then
npcHandler:say("... Death awaits the greedy and the brave alike and many will be mourned until the long lost treasure is unearthed.", 1)
frodo_talk_state = 9

elseif frodo_talk_state == 9 and msgcontains(msg, 'proceed') then
npcHandler:say("That's all. He recitated it when he was in one of his melancholy moods.", 1)
frodo_talk_state = 0

elseif msgcontains(msg, '') then
npcHandler:say("Maybe next time.", 1)
frodo_talk_state = 0

end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
