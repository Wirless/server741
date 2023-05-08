dofile(getDataDir() .. 'global/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods we call the good ones are Fardos, Uman, the Elements, Suon, Crunor, Nornur, Bastesh, Kirok, Toth, and Banor."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, there's no blessings available in this world."})
keywordHandler:addKeyword({'marri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})
keywordHandler:addKeyword({'ceremony'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest of the great pantheon."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, worldly matters are of no concern to me."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world of Tibia is the creation of the gods."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thank you, I'm fine, the gods give me hope and comfort."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The grace of the gods must be earned, it cannot be bought!"})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods of good guard us and guide us, the gods of evil want to destroy us and steal our souls!"})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The teachings of Crunor tell us to honor life and not to harm it."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The things we priests know about the citizens are confidential."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only a man can fall as low as he did. His soul rotted away already."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Queen Eloise is wise to listen to the proposals of the druidic followers of Crunor."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Remind: Not everything you call monster is evil to the core!"})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to bring the teachings of the gods to everyone."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to bring the teachings of the gods to everyone."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is MY mission to teach, it is YOUR mission to fight!"})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is MY mission to teach, it is YOUR mission to fight!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The fallen one should be mourned, not feared."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The mythical blade was hidden in ancient times. Its said that powerful wards protect it."})
keywordHandler:addKeyword({'graveyard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'crypt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'mausoleum'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's something strange in its neighbourhood. But whom we gonna call for help if not the gods?"})
keywordHandler:addKeyword({'fardos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fardos is the creator. The great obsever. He is our caretaker."})
keywordHandler:addKeyword({'uman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uman is the positive aspect of magic. He brings us the secrets of the arcane arts."})
keywordHandler:addKeyword({'suon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Suon is the lifebringing sun. He observes the creation with love."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor, the great tree, is the father of all plantlife. He is a prominent god for many druids."})
keywordHandler:addKeyword({'nornur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nornur is the mysterious god of fate. Who knows if he is its creator or just a chronist?"})
keywordHandler:addKeyword({'bastesh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bastesh, the deep one, is the goddess of the sea and its creatures."})
keywordHandler:addKeyword({'kirok'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kirok, the mad one, is the god of scientists and jesters."})
keywordHandler:addKeyword({'toth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Toth, Lord of Death, is the keeper of the souls, the guardian of the afterlife."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Banor, the heavenly warrior, is the patron of all fighters against evil. He is the gift of the gods to inspire humanity."})
keywordHandler:addKeyword({'tibiasula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibiasula lost her life, but out of her essence the world was created."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia is the essence of the elemental power of earth."})
keywordHandler:addKeyword({'sula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sula is the essence of the elemental power of water."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'evil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods we call the evil ones are Zathroth, Fafnar, Brog, Urgith, and the Archdemons!"})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth is the destructive aspect of magic. He is the deciver and the thief of souls."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is the scorching sun. She observes the creation with hate and jealousy."})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brog, the raging one, is the great destroyer. The berserk of darkness."})
keywordHandler:addKeyword({'urgith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The bonemaster Urgith is the lord of the undead and keeper of the damned souls."})
keywordHandler:addKeyword({'archdemons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The demons are followers of Zathroth. The cruelest are known as the ruthless seven."})
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I dont want to talk about that subject!"})


function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if msgcontains(msg, 'sin') or msgcontains(msg, 'Sin') then
	npcHandler:say("Do you whish to confess your sins?", 1)
	tibra_talk_state = 3

elseif msgcontains(msg, 'name') or msgcontains(msg, 'Name') then
	npcHandler:say("My name is Tibra. Your soul tells me that you are ".. getPlayerName(cid) .."", 1)
	tibra_talk_state = 0

elseif tibra_talk_state == 3 and msgcontains(msg, 'yes') or tibra_talk_state == 3 and msgcontains(msg, 'Yes') then	
	npcHandler:say("So what does trouble your soul, pilgrim?", 1)
	tibra_talk_state = 4
elseif tibra_talk_state == 3 and msgcontains(msg, '') then	
	npcHandler:say("As you wish.", 1)
	tibra_talk_state = 0
elseif tibra_talk_state == 4 and msgcontains(msg, '') then	
	npcHandler:say("Meditate on that and try harder to improve soul.", 1)
	tibra_talk_state = 0

elseif msgcontains(msg, 'gold') or msgcontains(msg, 'money') or msgcontains(msg, 'donation') then
	npcHandler:say("Do you want to make a donation?", 1)
	tibra_talk_state = 1
elseif tibra_talk_state == 1 and msgcontains(msg, 'yes') then
	if doPlayerRemoveMoney(cid, 15) == TRUE then
	npcHandler:say("May Daraman guide your quest for ascension.", 1)
	doSendMagicEffect(getPlayerPosition(cid), 13)
	else
	npcHandler:say("Don't be ashamed, but you lack the gold.", 1)
	end
	tibra_talk_state = 0
elseif tibra_talk_state == 1 and msgcontains(msg, '') then
	npcHandler:say("As you wish.", 1)
	tibra_talk_state = 0
	
elseif msgcontains(msg, 'heal') then
if getCreatureHealth(cid) <= 39 then
	npcHandler:say("You are looking really bad. Let me heal your wounds.", 1)
	doCreatureAddHealth(cid, -getCreatureHealth(cid)+40)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	tibra_talk_state = 0
	return true
	else
	npcHandler:say("You aren't looking really bad. Sorry, I can't help you.", 1)
	return true
	end
	tibra_talk_state = 0

end		
    return 1
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
