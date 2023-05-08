shopModule:addBuyableItem({'wand of cosmic energy'}, 					Cfwandofcosmicenergy, 10000)
shopModule:addBuyableItem({'wand of plague'}, 					Cfwanfofplague, 5000)
shopModule:addBuyableItem({'wand of dragonbreath'}, 					Cfwandofdragonbreath, 1000)
shopModule:addBuyableItem({'wand of vortex'}, 					Cfwandofvortex, 500)
shopModule:addBuyableItem({'moonlight rod'}, 					Cfmoonlightrod, 1000)
shopModule:addBuyableItem({'volcanic rod'}, 					Cfvolcanicrod, 5000)
shopModule:addBuyableItem({'snakebite rod'}, 					Cfsnakebiterod, 500)
shopModule:addBuyableItem({'quagmire rod'}, 					Cfquagmirerod, 1000)
shopModule:addBuyableItem({'tempest rod'}, 					Cftempestrod, 15000)
shopModule:addBuyableItem({'wand of inferno'}, 					Cfwandofinferno, 15000)

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
if getPlayerStorageValue(cid, 999) == -1 and msgcontains(msg, 'rod') or getPlayerStorageValue(cid, 999) == -1 and msgcontains(msg, 'Rod') or getPlayerStorageValue(cid, 999) == -1 and msgcontains(msg, 'wand') or getPlayerStorageValue(cid, 999) == -1 and msgcontains(msg, 'Wand') then	
	if getPlayerStorageValue(cid, 999) == -1 then
	if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
    doPlayerAddItem(cid,2190,1)
	selfSay('Here\'s your wand!')
	setPlayerStorageValue(cid, 999, 1)
	elseif getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
    doPlayerAddItem(cid,2182,1)
	selfSay('Here\'s your rod!')
	setPlayerStorageValue(cid, 999, 1)
	elseif getPlayerVocation(cid) < 1 or getPlayerVocation(cid) > 6 then
	selfSay('I\'m sorry, but you\'re neither sorcerer nor druid!')
	setPlayerStorageValue(cid, 999, 1)
	elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then
	selfSay('I\'m sorry, but you\'re neither sorcerer nor druid!')
	setPlayerStorageValue(cid, 999, 1)	
	end	
	talk_state = 0
end

elseif msgcontains(msg, 'rod') or msgcontains(msg, 'Rod') then
	selfSay("Rods can be wielded by druids only and have a certain level requirement. There are five different rods, would you like to hear about them?")
	talk_state = 7613
			
elseif talk_state == 7613 and msgcontains(msg, 'yes') or talk_state == 7613 and msgcontains(msg, 'Yes') then
	selfSay("The names of the rods are 'Snakebite Rod', 'Moonlight Rod', 'Volcanic Rod', 'Quagmire Rod', and 'Tempest Rod'. Which one would you like to buy?")
	talk_state = 7613

elseif msgcontains(msg, 'wand') or msgcontains(msg, 'Wand') then
	selfSay("Wands can be wielded by sorcerers only and have a certain level requirement. There are five different wands, would you like to hear about them?")
	talk_state = 7624
			
elseif talk_state == 7624 and msgcontains(msg, 'yes') or talk_state == 7624 and msgcontains(msg, 'Yes') then
	selfSay("The names of the wands are 'Wand of Vortex', 'Wand of Dragonbreath', 'Wand of Plague', 'Wand of Cosmic Energy' and 'Wand of Inferno'. Which one would you like to buy?")
	talk_state = 7624

elseif  msgcontains(msg, 'vial') or msgcontains(msg, 'flask') then
    selfSay('I will give you 5 gold per vial, how many vials do you wish to sell?')
    talk_state = 985  
		
		elseif talk_state == 985 then
		TEXTMSG = msg
		amount = getCount(msg)
		if amount >= 1 then
			if doPlayerRemoveItem(cid, 2006, amount, 0) == TRUE then
			doPlayerAddMoney(cid, amount*5)
			selfSay("Thank you! here's your money!")
			else
			selfSay("You don't have that many vials!")
			end
		else
		selfSay("I'm sorry, but you must give me an valid amount of how many vials you would like to sell.")
		end
		talk_state = 0

        end
    return 1
end