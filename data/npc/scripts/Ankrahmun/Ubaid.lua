local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local npcHandlerfocus = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function UmarGreetCallback(cid)
 if (getPlayerStorageValue(cid, 1023) == 1) then
     npcHandler:say(""..getPlayerName(cid).."! How's it going these days?", cid)
 else
     npcHandler:say("Whoa? You know the word! Amazing, "..getPlayerName(cid).."! ...", cid, 1000)
     npcHandler:say("I should go and tell Fa'hradin. ...", cid, 7000)
     npcHandler:say("Well. Why are you here anyway, "..getPlayerName(cid).."?", cid, 12000)
 end
 npcHandlerfocus = 0
 return 1
end

local function UmarSayCallback(cid, type, msg) msg = string.lower(msg)

    if (msgcontains(msg, "djanni'hah") or msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 1023) == 1) then
           npcHandler:greet(cid)
           UmarGreetCallback(cid)

    elseif (msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus == 0) and ((getPlayerStorageValue(cid, 9030) ~= 1) or (getPlayerStorageValue(cid, 9030) == 1)) then
           npcHandler:say('Shove off, little one! Humans are not welcome here, '.. getPlayerName(cid) ..'!')

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:greet(cid)

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) ~= 1) then
           npcHandler:say('Hmmm? Is this human '.. getPlayerName(cid) ..' trying to say something? I don\'t think so.')

    elseif (msgcontains(msg, "djanni'hah") or msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 1023) == 1) then
           npcHandler:say('Oh no! More of you humans! I\'m busy, '.. getPlayerName(cid) ..', so you better hold your tongue until I have time for you.')
        if(not npcHandler.queue:isInQueue(cid)) then
           npcHandler.queue:push(cid)
        end

    elseif (msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and ((getPlayerStorageValue(cid, 9030) == 1) or (getPlayerStorageValue(cid, 9030) ~= 1)) then
           npcHandler:say('Shove off, little one! Humans are not welcome here, '.. getPlayerName(cid) ..'!')

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:say('Oh no! More of you humans! I\'m busy, '.. getPlayerName(cid) ..', so you better hold your tongue until I have time for you.')
        if(not npcHandler.queue:isInQueue(cid)) then
            npcHandler.queue:push(cid)
        end

    elseif msgcontains(msg, "djanni'hah") and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 9030) ~= 1) then
           npcHandler:say('That almost sounded like the word of greeting, '.. getPlayerName(cid) ..'. Humans - cute they are!')

    elseif (msgcontains(msg:lower(),'bye') or msgcontains(msg:lower(),'farewell')) then
           npcHandler:say("Hail King Malor! See you on the battlefield, human worm.")
           npcHandler:onFarewell(cid)
	end

	if(npcHandler.focus ~= cid) then
		return false
	end 
	
	if msgcontains(msg, 'passage') then
		  if (getPlayerStorageValue(cid, 1023) ~= 1) then
			   npcHandlerfocus = 1
                npcHandler:say("Only the mighty Efreet, the true djinn of Tibia, may enter Mal'ouquah! ...", cid, 1000)
                npcHandler:say("All Marids and little worms like yourself should leave now or something bad may happen. Am I right?",cid, 8000)
			else
                npcHandler:say("You already pledged loyalty to king Malor.",cid)
			end

	elseif npcHandlerfocus == 1 then
		if msgcontains(msg, 'no') then
			if getPlayerStorageValue(cid, 1002) == 1 then
				npcHandler:say("Who do you think you are? A Marid? Shove off, moron.", cid)
				npcHandlerfocus = 0
			else
                npcHandler:say("Of cour... Huh!? No!? I can't believe it! ...", cid, 1000)
                npcHandler:say("You... you got some nerves... Hmm. ...", cid, 7000)
                npcHandler:say("Maybe we have some use for someone like you. Would you be interested in working for us. Helping to fight the Marid?", cid, 12000)
				npcHandlerfocus = 2
			end

		elseif msgcontains(msg, 'yes') then
			npcHandler:say("Of course. Then don't waste my time and shove off.", cid)
			npcHandlerfocus = 0
		end

	elseif npcHandlerfocus == 2 then
		if msgcontains(msg, 'yes') then
                npcHandler:say("So you pledge loyalty to king Malor and you are willing to never ever set foot on Marids' territory, unless you want to kill them? Yes?",cid)
				setPlayerStorageValue(cid, 1002, 1)
				npcHandlerfocus = 3
			else
				npcHandler:say("Of course. Then don't waste my time and shove off.", cid)
				npcHandlerfocus = 0
			end
			
			
	elseif npcHandlerfocus == 3 then
		if msgcontains(msg, 'yes') then
			setPlayerStorageValue(cid, 1023, 1)
			npcHandler:say("Well then - welcome to Mal'ouquah. ...", cid, 1000)
			npcHandler:say("Go now to general Baa'leal and don't forget to greet him correctly! ...", cid, 6000)
			npcHandler:say("And don't touch anything!", cid, 13000)

		elseif msgcontains(msg, 'no') then
			npcHandler:say("Of course. Then don't waste my time and shove off.", cid)
			npcHandlerfocus = 0
		end
			
        elseif(msgcontains(msg:lower(),"marid")) and (npcHandler:isFocused(cid)) then
                npcHandler:say("Marid? When? Where? How many? RED ALERT! ...", cid,1000)
                npcHandler:say("Hey! There is nobody here! Don't do that again, human!", cid, 7000)
        elseif(msgcontains(msg:lower(),"ankrahmun")) and (npcHandler:isFocused(cid)) then
                npcHandler:say("I know that damn city well. A long time ago we laid siege to it. ...", cid, 1000)
                npcHandler:say("We would have taken it, but those traitorous humans allowed a Marid garrison to entrench itself there, and we never managed to throw them out. Cowards and traitors the lot of them.", cid, 8000)
	end
	
        local keywords = {
        ["name"] = {response = "My name is Ubaid. Why do you want to know that, human? Hmm... suspicious."},
        ["ubaid"] = {response = "That is my name. I don't like it when a human pronounces it."},
        ["job"] = {response = "Well, what do you think? I keep watch around here to make sure people like you don't enter."},
        ["king"] = {response = "Well, Malor is not officially king of all djinn yet, but now our beloved leader is back that is a mere formality."},
        ["malor"] = {response = "Well, Malor is not officially king of all djinn yet, but now our beloved leader is back that is a mere formality."},
        ["djinn"] = {response = "We are a race of rulers and dominators! Or at least we, the Efreet, are."},
        ["efreet"] = {response = "The Efreet are the true djinn! Those namby-pamby milksops who call themselves the Marid and still follow Gabel, no longer deserve the honour to call themselves djinn."},
        ["gabel"] = {response = "I used to serve under Gabel, but he is no longer my king. If that wacky wimp should ever come here to Mal'ouquah I will personally... you know... turn him away. Yes!"},
        ["mal'ouquah"] = {response = "This place is our home, and as long as I'm here no meddler will trespass!"},
        ["ashta'daramai"] = {response = "The Marids' hideout, isn't it? I have never been there, but I am sure one day I will. That will be the day Ashta'daramai falls into our hands!"},
        ["human"] = {response = "You are an inferior race of feeble, scheming jerks. No offence."},
        ["zathroth"] = {response = "Zathroth is our father! Of course, the son always has a right to hate his father, right."},
        ["tibia"] = {response = "This world is ours by right, and we will take it."},
        ["daraman"] = {response = "How dare you utter that name in my presence, human. Don't strain my patience, worm! You may know the secret word, but... who knows... it is always possible that your head is torn off in some terrible accident."},
        ["darashia"] = {response = "A human settlement to the west? I have not been there yet, but when I do I'm sure I will be remembered."},
        ["scarab"] = {response = "They make good pets if you know how to keep them. Did you know they just adore human flesh?"},
        ["edron"] = {response = "Isn't that the name of some petty human settlement?"},
        ["thais"] = {response = "Isn't that the name of some petty human settlement?"},
        ["venore"] = {response = "Isn't that the name of some petty human settlement?"},
        ["kazordoon"] = {response = "Isn't that the name of some petty human settlement?"},
        ["carlin"] = {response = "Isn't that the name of some petty human settlement?"},
        ["ab'dendriel"] = {response = "Isn't that the name of some petty human settlement?"},
        ["pharaoh"] = {response = "They say Ankrahmun is now ruled by a crazy pharaoh who wants to tell his whole people into drooling undead. That's humans. Sickos and weirdos the lot of them."},
        ["palace"] = {response = "One day we will sack that place and burn it to the ground."},
        ["temple"] = {response = "One day we will sack that place and burn it to the ground."},
        ["ascension"] = {response = "I think I've heard that term before. Has to do with that weirdo pharaoh, right?"},
        ["rah"] = {response = "Are you drunk?"},
        ["uthun"] = {response = "Are you drunk?"},
        ["akh"] = {response = "Are you drunk?"},
        ["kha'zeel"] = {response = "This mountain range is our home. Too bad we have to share it with the Marid. That will change, though. And pretty soon, believe me."},
        ["kha'labal"] = {response = "I like the desert. Just ruins and sand. And no human scum to be seen. The Kha'labal is a foretaste of what the djinn will do to the whole of Tibia!"},
        ["war"] = {response = "I don't know why I am stuck here! I should be at the front, killing Marid and humans. Well, perhaps I will kill you..."},
        ["baa'leal"] = {response = "General Baa'leal is our commander-in-chief of all his minions. He is as tough as an ancient scarab's buttocks and as sly a sand weasel."},
        ["alesar"] = {response = "I am not used to the sight of blueskins here in Mal'ouquah, and it does not make me too happy to see one. I am keeping an eye on this guy, and if I should ever find that he is playing games with us I will personally break his neck!"},
        ["fa'hradin"] = {response = "The old wizard is dangerous, but he will get what he deserves sooner or later."},
        ["lamp"] = {response = "I am not taking a nap! I am on duty!"},
        }

        for v in pairs(keywords) do
          if (msgcontains(msg, v)) then
               npcHandler:say(keywords[v].response, cid)
               npcHandlerfocus = 0
          end
        end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'Hail King Malor! See you on the battlefield, human worm.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Hail King Malor! See you on the battlefield, human worm.')

npcHandler:setCallback(CALLBACK_GREET, UmarGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, UmarSayCallback)