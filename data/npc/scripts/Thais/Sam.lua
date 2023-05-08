local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
if getPlayerItemCount(cid, 3960) then
	if getPlayerItemCount(cid, 3960) >= 1 then
	npcHandler:setMessage(MESSAGE_GREET, "What is... is that my old backpack you've brought?")
	sam_talk_state = 101
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Hi ".. getPlayerName(cid) ..". Can I do something for you?")
	end
else
npcHandler:setMessage(MESSAGE_GREET, "Hi ".. getPlayerName(cid) ..". Can I do something for you?")
end	
return true
end	
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addSellableItem({'two handed sword'}, 					Cftwohandedsword, 450)
shopModule:addSellableItem({'battle axe'}, 					Cfbattleaxe, 80)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 2)
shopModule:addSellableItem({'hand axe'}, 					Cfhandaxe, 4)
shopModule:addSellableItem({'halberd'}, 					Cfhalberd, 400)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 5)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 12)
shopModule:addSellableItem({'axe'}, 					Cfaxe, 7)
shopModule:addSellableItem({'spear'}, 					Cfspear, 3)
shopModule:addSellableItem({'morning star'}, 					Cfmorningstar, 90)
shopModule:addSellableItem({'mace'}, 					Cfmace, 30)
shopModule:addSellableItem({'short sword'}, 					Cfshortsword, 10)
shopModule:addSellableItem({'battle hammer'}, 					Cfbattlehammer, 120)
shopModule:addSellableItem({'sword'}, 					Cfsword, 25)
shopModule:addSellableItem({'leather armor'}, 					Cfleatherarmor, 12)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 70)
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 150)
shopModule:addSellableItem({'plate armor'}, 					Cfplatearmor, 400)
shopModule:addSellableItem({'chain legs'}, 					Cfchainlegs, 25)
shopModule:addSellableItem({'leather helmet'}, 					Cfleatherhelmet, 4)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 17)
shopModule:addSellableItem({'steel helmet'}, 					Cfsteelhelmet, 190)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 5)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 95)
shopModule:addSellableItem({'steel shield'}, 					Cfsteelshield, 80)


shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'hand axe'}, 					Cfhandaxe, 8)
shopModule:addBuyableItem({'spear'}, 					Cfspear, 10)
shopModule:addBuyableItem({'rapier'}, 					Cfrapier, 15)
shopModule:addBuyableItem({'axe'}, 					Cfaxe, 20)
shopModule:addBuyableItem({'sabre'}, 					Cfsabre, 35)
shopModule:addBuyableItem({'sword'}, 					Cfsword, 85)
shopModule:addBuyableItem({'mace'}, 					Cfmace, 90)
shopModule:addBuyableItem({'battle hammer'}, 					Cfbattlehammer, 350)
shopModule:addBuyableItem({'throwing knife', 'throwing knives'}, 					Cfthrowingknife, 25)
shopModule:addBuyableItem({'chain armor'}, 					Cfchainarmor, 200)
shopModule:addBuyableItem({'brass armor'}, 					Cfbrassarmor, 450)
shopModule:addBuyableItem({'leather armor'}, 					Cfleatherarmor, 35)
shopModule:addBuyableItem({'chain helmet'}, 					Cfchainhelmet, 52)
shopModule:addBuyableItem({'leather helmet'}, 					Cfleatherhelmet, 12)
shopModule:addBuyableItem({'steel shield'}, 					Cfsteelshield, 240)
shopModule:addBuyableItem({'wooden shield'}, 					Cfwoodenshield, 15)
shopModule:addBuyableItem({'chain legs'}, 					Cfchainlegs, 80)
 
 
function creatureSayCallback(cid, type, msg) msg = string.lower(msg)

if msgcontains(msg, 'yes') and sam_talk_state == 101 then
	npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", 1)
	sam_talk_state = 102
			
	elseif msgcontains(msg, 'yes') and sam_talk_state == 102 then
		if doPlayerRemoveItem(cid, 3960, 1) == TRUE then
		npcHandler:say("Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...", 1)
		npcHandler:say("I will mail him about you immediately. Just tell him, his old buddy sam is sending you.", 5)
		setPlayerStorageValue(cid, 8111, 1)
		sam_talk_state = 0
		else
		npcHandler:say("What the..", 1)
		npcHandler:say("You don't even have it!!", 3)
		end
		
		elseif msgcontains(msg, 'no') and sam_talk_state == 101 then
			npcHandler:say("ah.. ok then.. just though... never mind...", 1)
			sam_talk_state = 0
		elseif msgcontains(msg, 'no') and sam_talk_state == 102 then
			npcHandler:say("damn, I would really like to see my old backpack again..", 1)
			sam_talk_state = 0			
		
		elseif msgcontains(msg, 'backpack') and getPlayerStorageValue(cid, 8111) >= 1 then
			npcHandler:say("Yeah.. thanks again for bringing it back!", 1)
			sam_talk_state = 0	
		elseif msgcontains(msg, 'backpack') and getPlayerStorageValue(cid, 8111) < 0 then
			npcHandler:say("I lost my backpack in an adventure when I was young.. I would really like to see it again..", 1)
			sam_talk_state = 0	
		elseif msgcontains(msg, 'backpack') and getPlayerStorageValue(cid, 8111) == 0 then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", 1)
			sam_talk_state = 102			
			
		end		
    return 1
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the blacksmith. If you need weapons or armor - just ask me.'})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My offers are weapons, armors, helmets, legs, and shields.'})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My offers are weapons, armors, helmets, legs, and shields.'})
keywordHandler:addKeyword({'weapons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have hand axes, axes, spears, maces, battle hammers, swords, rapiers, daggers, and sabres. What's your choice?"})
keywordHandler:addKeyword({'helmets'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am selling leather helmets and chain helmets. What do you want?'})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am selling leather, chain and brass armors. What do you need?'})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am selling wooden shields and steel shields. What do you want?'})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am selling chain legs. Do you want to buy any?'})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Samuel, but you can call me Sam."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'tibanus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a monk of some kind!"})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm! ---blush---"})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I supply the army with weapons and armor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A threat for mankind! Buy weapons to be ready to face him."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was named after my grandfather."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He can tell a tale or two about his adventures with baxter in their younger days."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like crowded places like his bar."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I hardly know her."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerers seldom need my skills."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His guild relies heavily on my wares."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I never visited his ... cave or whatever it's called."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is funny now and then."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oswald isn't one of the most liked people in this city."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'lurgi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I just know some rumours that he is a follower of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumoured to be a weapon beyond mortal craftsmanship."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing of interest."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armor, helmets, and shields. So you are able to slash the monsters."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah, these awful beasts. They live in the forests near the city and in the sewers and dungeons."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't ask me. I have never been there."})
keywordHandler:addKeyword({'thanks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
