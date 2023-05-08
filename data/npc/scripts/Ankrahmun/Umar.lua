local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local npcHandlerfocus = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function UmarGreetCallback(cid)
 if (getPlayerStorageValue(cid, 9030) == 1) then
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

    if (msgcontains(msg, "djanni'hah") or msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:greet(cid)
           UmarGreetCallback(cid)

    elseif (msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) ~= 1) then
           npcHandler:say("Whoa! A human! This is no place for you, "..getPlayerName(cid)..". ...", cid, 1000)
           npcHandler:say("Go and play somewhere else.", cid, 7000)

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:greet(cid)

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus == 0) and (getPlayerStorageValue(cid, 9030) ~= 1) then
           npcHandler:say("Hahahaha! ...", cid, 1000)
           npcHandler:say(""..getPlayerName(cid)..", that almost sounded like the word of greeting. Humans - cute they are!", cid, 5000)

    elseif (msgcontains(msg, "djanni'hah") or msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:say('Hey '.. getPlayerName(cid) ..'! Please wait a second!')
        if(not npcHandler.queue:isInQueue(cid)) then
           npcHandler.queue:push(cid)
        end

    elseif (msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "greetings")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 1000) ~= 1) then
           npcHandler:say("Another human! This is no place for you, "..getPlayerName(cid)..". ...", cid, 1000)
           npcHandler:say("Go and play somewhere else.", cid, 7000)

    elseif (msgcontains(msg, "djanni'hah")) and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 9030) == 1) then
           npcHandler:say('Yikes! Another human? Where did you come from? Well, ehm - if you could please wait a second, '.. getPlayerName(cid) ..'?')
        if(not npcHandler.queue:isInQueue(cid)) then
            npcHandler.queue:push(cid)
        end

    elseif msgcontains(msg, "djanni'hah") and (npcHandlerfocus > 0) and (npcHandlerfocus ~= cid) and (getPlayerStorageValue(cid, 9030) ~= 1) then
           npcHandler:say('That almost sounded like the word of greeting, '.. getPlayerName(cid) ..'. Humans - cute they are!')

    elseif (msgcontains(msg:lower(),'bye') or msgcontains(msg:lower(),'farewell')) then
           npcHandler:say("<salutes>Aaaa -tention!")
           npcHandler:onFarewell(cid)
	end

	if(npcHandler.focus ~= cid) then
		return false
	end 
	
	if msgcontains(msg, 'passage') then
		  if (getPlayerStorageValue(cid, 9031) ~= 1) then
			if(getPlayerStorageValue(cid, 9032) ~= 1) then
			   npcHandlerfocus = 1
			   npcHandler:say("If you want to enter our fortress you have to become one of us and fight the Efreet. ...", cid, 1000)
			   npcHandler:say("So, are you willing to do so?", cid, 9000)
			else
			   npcHandler:say("I don't believe you! You better go now.", cid)
			end
		  else
			   npcHandler:say("You already have the permission to enter Ashta'daramai.",cid)
			   npcHandlerfocus = 0
		  end

	elseif npcHandlerfocus == 1 then
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid, 9032) ~= 1 then
				npcHandler:say('Are you sure? You pledge loyalty to king Gabel, who is... you know. And you are willing to never ever set foot on Efreets\' territory, unless you want to kill them? Yes?', cid)
				npcHandlerfocus = 2
			else
				npcHandler:say('I don\'t believe you! You better go now.', cid)
				npcHandlerfocus = 0
			end

		elseif msgcontains(msg, 'no') then
			npcHandler:say('This isn\'t your war anyway, human.', cid)
			npcHandlerfocus = 0
		end

	elseif npcHandlerfocus == 2 then
		if msgcontains(msg, 'yes') then
				npcHandler:say("Oh. Ok. Welcome then. You may pass. ...And don\'t forget to kill some Efreets, now and then.", cid, 1000)
				setPlayerStorageValue(cid, 909001, 1)
			else
			npcHandler:say('This isn\'t your war anyway, human.', cid)
				npcHandlerfocus = 0
			end
			
	end
	
        local keywords = {
        ["name"] = {response = "I am Umar. Pleased to meet you!"},
        ["job"] = {response = "I am the gatekeeper of Ashta'daramai. That's what Gabel told me to do. You know - keeping the courtyard clean, getting rid of salesmen, keeping Efreet scum out... that kind of thing. But in my spare time I work as a part-time philosopher."},
        ["philosopher"] = {response = "Yes. Comes with the job. You see - here I am, sitting on the same chair all day and staring at the same blank wall. So what happens is that my mind starts wandering. And, you know, I start thinking. You know - about all kinds of things."},
        ["things"] = {response = "Yes. About the world and the gods and all that. And about girls. Yes, about girls, mostly."},
        ["girls"] = {response = "You did not know there are female djinns, did you? That's because they are quite rare. They are the greatest treasures of our race, and we guard them jealously."},
        ["gabel"] = {response = "He is our king and leader. Well, he isn't a king, you know. I mean, from a technical point of view he is, but he does not wear a crown or anything, and he says he isn't one, so even though he is one he isn't. Right?"},
        ["djinn"] = {response = "Well, I am a djinn, but only as far as my physical aspect is concerned. As far as my way of thinking is concerned I think I might actually be somebody else. You now - not even a djinn. In fact, I think I might be a dwarf."},
        ["efreet"] = {response = "I have thought long and hard about this and I have come to the conclusion that all Efreet are scum."},
        ["ashta'daramai"] = {response = "This place is the Marids' safe haven. No enemy has ever managed to take this fortress by assault, and we will see to it that it stays this way."},
        ["mal'ouquah"] = {response = "That is the Efreets fortress. I have never seen it, but I'm sure it can't compare to this place."},
        ["marid"] = {response = "That's us. I suppose we are the good guys in this war. Although good is relative, of course. So let's say, we are relatively good. Depends on the point of view, really."},
        ["war"] = {response = "We had thought the war was over for good when Malor was finally imprisoned. That little creep is as obstinate as... as... well, as a really obstinate djinn."},
        ["malor"] = {response = "Malor is evil. I mean - really evil. Things used to be much better when he was still locked away in that lamp."},
        ["tibia"] = {response = "Tibia is a beautiful world. Not that I see much of it, staring at this wall night and day."},
        ["world"] = {response = "Tibia is a beautiful world. Not that I see much of it, staring at this wall night and day."},
        ["gods"] = {response = "I have not made my mind up what to think about the gods yet. I am still struggling with Daraman's teachings."},
        ["daraman"] = {response = "Daraman has changed our lives. I mean, we were not stupid or anything before he came, but still it was different. Fa'hradin says that while Zathroth made us intelligent, Daraman made us think."},
        ["darashia"] = {response = "They say Darashia is a beautiful human city somewhere to the north. I would really love to see it, but I can't abandon my post."},
        ["edron"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["thais"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["venore"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["kazordoon"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["carlin"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["ab'dendriel"] = {response = "I understand the humans have founded some beautiful cities. I would like to see them, but as long as I have to stay here that won't happen. Which means I will not go anywhere as long as the war goes on."},
        ["ankrahmun"] = {response = "I was there, long ago. We had a garrison based in Ankrahmun during the early phases of the war. That was before the whole plains of the Kha'labal were set on fire."},
        ["scarab"] = {response = "I don't care whether or not they are special animals. None of that creeping vermin will enter Ashta'daramai as long as I am here!"},
        ["pharaoh"] = {response = "They say the new pharaoh is mad!"},
        ["palace"] = {response = "I remember the palace. It was a beautiful place. Ah... those were happy days."},
        ["temple"] = {response = "In these heretic times the priests at Ankrahmun's temple are devoted to the teachings of that pompous pharaoh."},
        ["ascension"] = {response = "Apparently that is what the followers of the pharaoh are striving for. It has to do with that pharaoh's teachings."},
        ["rah"] = {response = "That's just some heretic drivel. Don't ask me about it."},
        ["uthun"] = {response = "That's just some heretic drivel. Don't ask me about it."},
        ["akh"] = {response = "That's just some heretic drivel. Don't ask me about it."},
        ["kha'zeel"] = {response = "When I look up from my wall, what do I see? Huge, forbidding mountains! No wonder I feel claustrophobic."},
        ["djema"] = {response = "You know her? She's a human like you. I like her lots because she often comes down here for a chat. Nobody else around here does that."},
        ["bo'ques"] = {response = "That fat old cook. I like his food, but I find him a bit boring. Food and cooking is all he ever talks about."},
        ["alesar"] = {response = "Ah. That guy. He was one of us, a Marid, but he left long ago. I have no idea why. Rumours and hearsay is all I ever get."},
        ["fa'hradin"] = {response = "Fa'hradin is a powerful wizard and the smartest djinn I know. I love talking to him because there is so much he can teach me, but he rarely has time for me."},
        ["lamp"] = {response = "Djinns sleep in lamps. I don't know what is so special about that."},
        }

        for v in pairs(keywords) do
          if (msgcontains(msg, v)) then
               npcHandler:say(keywords[v].response, cid)
               npcHandlerfocus = 0
          end
        end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, '<salutes>Aaaa -tention!')
npcHandler:setMessage(MESSAGE_WALKAWAY, '<salutes>Aaaa -tention!')

npcHandler:setCallback(CALLBACK_GREET, UmarGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, UmarSayCallback)