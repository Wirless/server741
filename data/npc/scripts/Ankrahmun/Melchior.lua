local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function MelchiorGreetCallback(cid)
 talkState[talkUser] = 0
  if (getPlayerSex(cid) == 0) then
     npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! The lovely sound of your voice shines like a beam of light through my solitary darkness!")
  else
     npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. I do not see your face, but I can read a thousand things in your voice!")
  end
  return 1
end

function MelchiorSayCallback (cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end	

    if msgcontains(msg, 'Word of Greeting') or msgcontains(msg, 'word of greeting') and getPlayerStorageValue(cid, 9030) == -1 then
		npcHandler:say("The djinns have an ancient code of honour. This code includes a special concept of hospitality. Anybody who utters the word of greeting must not be attacked even if he is an enemy. Well, at least that is what the code says. ...", cid)
		npcHandler:say("I have found out, though, that this does not work at all times. There is no point to say the word of greeting to an enraged djinn. ...", cid, 6000)
		npcHandler:say("I can tell you the word of greeting if you're interested. It is {DJANNI'HAH}. Remember this word well, stranger. It might save your life one day. ...",cid,12000)
		npcHandler:say("And keep in mind that you must choose sides in this conflict. You can only follow the Efreet or the Marid - once you have made your choice there is no way back. I know from experience that djinn do not tolerate double-crossing.", cid, 18000)
		setPlayerStorageValue(cid,9030, 1)
		setPlayerStorageValue(cid,10028500, 1)
	else
		npcHandler:say("I dont feel to talk.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		end
	return true
end

  local keywords = {
  ["job"] = {response = "I am a poor beggar. I try to make a meagre living here since a cruel fate has left me a blind man."},
  ["gabel"] = {response = "He is the leader of the Marid! I have never met him myself, but everybody was full of praise for him back at Ashta daramai. The legend has it that it was him who introduced the djinns to wise Daramans teachings."},
  ["malor"] = {response = "Malor is the Efreets leader. He is perhaps not the strongest of all efreet, but his treachery and cruelty are certainly unrivalled. He was defeated a long, long time ago, but he was not killed!"},
  ["akh"] = {response = "In the pharaohs creed, this is what the physical body is called."},
  ["melchior"] = {response = "That is my name."},
  ["blind"] = {response = "Yes, I am. I was not born that way, but a cruel fate caused me to lose my eyesight."},
  ["name"] = {response = "My late father, may he rest in peace, chose to call me Melchior."},
  ["mal'ouquah"] = {response = "That is the Efreet's gloomy fortress, home of Malor, hidden high up in the Kha'zeel mountains. I used to go there often. Don't make the same mistake, stranger! I would love to think there is somebody who profited from the lesson I had to learn!"},
  ["ashta'daramai"] = {response = "Aah yes - the Marids' fortress. Perched high on the Kha'zeel, it is a marvel to behold. They say Gabel built it on the ruins of his original palace."},
  ["fa'hradin"] = {response = "I know that name. He is a Marid, right? I have met him once. He seemed pretty important."},
  ["baa'leal"] = {response = "Cursed be that djinn! It was him who blinded me, and I bet casting me out into the Kha'labal was his idea, too. Believe me, I would try to kill him if only I could."},
  ["haroun"] = {response = "A Marid trader. I have often had dealings with him. He drove me mad because he never accepted any haggling, but then he never ever tried to trick me. He was not really a trader at heart, I suppose. He was more of a monk or maybe a preacher."},
  ["bas'saam"] = {response = "Yes, I know him. He is an Efreet trader. I met him often during my travels, and even though there was no real sympathy we had a certain mutual respect for each other. But all that changed when he found out I had dealings with the Marid."},
  ["tibia"] = {response = "Tibia is such a beautiful place. I would give it all if I could see it again."},
  ["daraman"] = {response = "Daraman was a holy man, a true prophet. He showed us how we can master grief and affliction through dignity and brotherliness. It is a shame I only came to fully appreciate his teachings when fate had cast me into darkness."},
  ["darashia"] = {response = "<Sighs> Aah yes... Darashia. I would give anything if I could see it again."},
  ["edron"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["thais"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["venore"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["kazordoon"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["carlin"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["ab'dendriel"] = {response = "I have never been to cities on other continents. And I suppose now I never will. I would be glad enough to leave this place."},
  ["ruler"] = {response = "The pharaoh? He is always in the palace, so I have heard only rumors about him. But I know one thing for sure - he is mad. End of story."},
  ["old pharaoh"] = {response = "The old pharaoh? I keep on hearing rumours about him, but I do not know if they are true."},
  ["palace"] = {response = "The palace lies to the south of the arena and to the west of the temple. Better stay clear of that place. If but half the things I have heard about it are true this palace is not a place for the living anymore."},
  ["arena"] = {response = "Ah yes, the arena. I do not really know what's going on there, because I have never seen it myself. However, I often hear strange noises from there, cheers and jeers and sometimes pityful screams."},
  ["temple"] = {response = "That temple is very old, and for centuries it used to be a place of worship and of contemplation. Now that the priests there are fanatic followers of the pharaoh this is no longer a holy place."},
  ["ascension"] = {response = "The concept of ascension is central to the pharaoh's creed. I am not sure I really understand it, but apparently it has to do with transformation to undeath. Nice, isn't it?"},
  ["rah"] = {response = "Ah yes - I recognise that. According to the pharaoh that is a living being's soul."},
  ["uthun"] = {response = "According to the pharaoh's teachings this is the total of a living being's memories and personal experiences."},
  ["akh"] = {response = "In the pharaoh's creed, this is what the physical body is called."},
  ["mourn"] = {response = "Spare me that inane twaddle, will you? I am glad enough to be alive, thank you."},
  ["pharaoh"] = {response = "The pharaoh? He is always in the palace, so I have heard only rumors about him. But I know one thing for sure - he is mad. End of story."}
  }

  
npcHandler:setCallback(CALLBACK_GREET, MelchiorGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, MelchiorSayCallback)
npcHandler:addModule(FocusModule:new())