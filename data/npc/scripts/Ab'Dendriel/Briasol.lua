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


shopModule:addSellableItem({'white pearl'}, 					Cfwhitepearl, 160)
shopModule:addSellableItem({'black pearl'}, 					Cfblackpearl, 280)
shopModule:addSellableItem({'small diamond'}, 					Cfsmalldiamond, 300)
shopModule:addSellableItem({'small sapphire'}, 					Cfsmallsapphire, 250)
shopModule:addSellableItem({'small ruby'}, 					Cfsmallruby, 250)
shopModule:addSellableItem({'small emerald'}, 					Cfsmallemerald, 250)
shopModule:addSellableItem({'small amethyst'}, 					Cfsmallamethyst, 200)

shopModule:addBuyableItem({'wedding ring'}, 					Cfweddingring, 990)
shopModule:addBuyableItem({'golden amulet'}, 					Cfgoldenamulet, 6600)
shopModule:addBuyableItem({'ruby necklace'}, 					Cfrubynecklace, 3560)
shopModule:addBuyableItem({'white pearl'}, 					Cfwhitepearl, 320)
shopModule:addBuyableItem({'black pearl'}, 					Cfblackpearl, 560)
shopModule:addBuyableItem({'small diamond'}, 					Cfsmalldiamond, 600)
shopModule:addBuyableItem({'small sapphire'}, 					Cfsmallsapphire, 500)
shopModule:addBuyableItem({'small ruby'}, 					Cfsmallruby, 500)
shopModule:addBuyableItem({'small emerald'}, 					Cfsmallemerald, 500)
shopModule:addBuyableItem({'small amethyst'}, 					Cfsmallamethyst, 400)
 


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a jeweller and exchange money."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Briasol Crithanath."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know the time, sorry. I do not care for this concept. Watches are your master, they tell you what to do and when."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our lifespan is longer then that of other races. We should keep that in mind everytime."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They live that long and make not much out of it."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I mourn them. As soon as you get to know one he's dead."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We take care of them, give them shelter, and a reason to live."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is a quite lovely city, given that its a city of humans."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais has a high demand on the jewelry that I craft."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The tradesmen of Venore offer high prices for my wares."})
keywordHandler:addKeyword({'roderick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only little dealings with him."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only talk to him when I send a parcel to one of my customers in a far away city. He seems friendly and is a bit eager to please."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are the ones responsible for most of the magic and the like in this town."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our caste are workers out of passion."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They hunt for us and patrol the woods."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about them."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are lost in time."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He will be gone sooner or later."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Gods are eternal. They learn so much in their existence."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a weapon of times long gone. It's lost for our time."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing of importance."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell gems, pearls, and jewels."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy and sell small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have white and black pearls for sale, but you also can sell me some."})
keywordHandler:addKeyword({'jewel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can purchase our fine dwarfish wares like wedding rings, golden amulets, and ruby necklaces."})
keywordHandler:addKeyword({'talon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't trade with them."})


local Topic, count, transfer = {}, {}, {}

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
    if(npcHandler.focus ~= cid) then
        return false
    end
    
    if msgcontains(msg, 'balance') then
        local bid = getPlayerBiddedMoney(cid)
        if(bid > 0) then
            npcHandler:say('Your account balance is ' .. getPlayerBalance(cid) .. ' gold, ' .. bid .. ' gold is blocked for house auctioned by you.', cid)
        else
            npcHandler:say('Your account balance is ' .. getPlayerBalance(cid) .. ' gold.', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'deposit') and msgcontains(msg, 'all') then
        if getPlayerMoney(cid) == 0 then
            npcHandler:say('You don\'t have any gold with you.', cid)
            Topic[cid] = nil
        else
            count[cid] = getPlayerMoney(cid)
            npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
            Topic[cid] = 2
        end
    elseif msgcontains(msg, 'deposit') then
        if getCount(msg) == 0 then
            npcHandler:say('You are joking, aren\'t you??', cid)
            Topic[cid] = nil
        elseif getCount(msg) ~= -1 then
            if getPlayerMoney(cid) >= getCount(msg) then
                count[cid] = getCount(msg)
                npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
                Topic[cid] = 2
            else
                npcHandler:say('You do not have enough gold.', cid)
                Topic[cid] = nil
            end
        elseif getPlayerMoney(cid) == 0 then
            npcHandler:say('You don\'t have any gold with you.', cid)
            Topic[cid] = nil
        else
            npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
            Topic[cid] = 1
        end
    elseif Topic[cid] == 1 then
        if getCount(msg) == -1 then
            npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
            Topic[cid] = 1
        elseif getPlayerMoney(cid) >= getCount(msg) then
            count[cid] = getCount(msg)
            npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
            Topic[cid] = 2
        else
            npcHandler:say('You do not have enough gold.', cid)
            Topic[cid] = nil
        end
    elseif msgcontains(msg, 'yes') and Topic[cid] == 2 then
        if doPlayerRemoveMoney(cid, count[cid]) then
            doPlayerSetBalance(cid, getPlayerBalance(cid) + count[cid])
            updatePlayerBalance(getPlayerName(cid), getPlayerBalance(cid))
            npcHandler:say('Alright, we have added the amount of ' .. count[cid] .. ' gold to your balance. You can withdraw your money anytime you want to.', cid)
        else
            npcHandler:say('I am inconsolable, but it seems you have lost your gold. I hope you get it back.', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'no') and Topic[cid] == 2 then
        npcHandler:say('As you wish. Is there something else I can do for you?', cid)
        Topic[cid] = nil
    elseif msgcontains(msg, 'withdraw') then
        if getCount(msg) == 0 then
            npcHandler:say('Sure, you want nothing you get nothing!', cid)
            Topic[cid] = nil
        elseif getCount(msg) ~= -1 then
            if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= getCount(msg) then
                count[cid] = getCount(msg)
                npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
                Topic[cid] = 4
            else
                npcHandler:say('There is not enough gold on your account.', cid)
                Topic[cid] = nil
            end
        elseif getPlayerBalance(cid) == 0 then
            npcHandler:say('You don\'t have any money on your bank account.', cid)
            Topic[cid] = nil
        else
            npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
            Topic[cid] = 3
        end
    elseif Topic[cid] == 3 then
        if getCount(msg) == -1 then
            npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
            Topic[cid] = 3
        elseif getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= getCount(msg) then
            count[cid] = getCount(msg)
            npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
            Topic[cid] = 4
        else
            npcHandler:say('There is not enough gold on your account.', cid)
            Topic[cid] = nil
        end
    elseif msgcontains(msg, 'yes') and Topic[cid] == 4 then
        if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= count[cid] then
            doPlayerAddMoney(cid, count[cid])
            doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
            updatePlayerBalance(getPlayerName(cid), getPlayerBalance(cid))
            npcHandler:say('Here you are, ' .. count[cid] .. ' gold. Please let me know if there is something else I can do for you.', cid)
        else
            npcHandler:say('There is not enough gold on your account.', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'no') and Topic[cid] == 4 then
        npcHandler:say('The customer is king! Come back anytime you want to if you wish to withdraw your money.', cid)
        Topic[cid] = nil
    elseif msgcontains(msg, 'transfer') then
        if getCount(msg) == 0 then
            npcHandler:say('Please think about it. Okay?', cid)
            Topic[cid] = nil
        elseif getCount(msg) ~= -1 then
            count[cid] = getCount(msg)
            if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= count[cid] then
                npcHandler:say('Who would you like to transfer ' .. count[cid] .. ' gold to?', cid)
                Topic[cid] = 6
            else
                npcHandler:say('There is not enough gold on your account.', cid)
                Topic[cid] = nil
            end
        else
            npcHandler:say('Please tell me the amount of gold you would like to transfer.', cid)
            Topic[cid] = 5
        end
    elseif Topic[cid] == 5 then
        if getCount(msg) == -1 then
            npcHandler:say('Please tell me the amount of gold you would like to transfer.', cid)
            Topic[cid] = 5
        else
            count[cid] = getCount(msg)
            if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= count[cid] then
                npcHandler:say('Who would you like to transfer ' .. count[cid] .. ' gold to?', cid)
                Topic[cid] = 6
            else
                npcHandler:say('There is not enough gold on your account.', cid)
                Topic[cid] = nil
            end
        end
    elseif Topic[cid] == 6 then
        local v = getPlayerByName(msg)
        if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= count[cid] then
            if v then
                transfer[cid] = msg
                npcHandler:say('Would you really like to transfer ' .. count[cid] .. ' gold to ' .. getPlayerName(v) .. '?', cid)
                Topic[cid] = 7
            elseif findPlayer(msg):lower() == msg:lower() then
                transfer[cid] = msg
                npcHandler:say('Would you really like to transfer ' .. count[cid] .. ' gold to ' .. findPlayer(msg) .. '?', cid)
                Topic[cid] = 7
            else
                npcHandler:say('This player does not exist.', cid)
                Topic[cid] = nil
            end
        else
            npcHandler:say('There is not enough gold on your account.', cid)
            Topic[cid] = nil
        end
    elseif Topic[cid] == 7 and msgcontains(msg, 'yes') then
        if getPlayerBalance(cid) - getPlayerBiddedMoney(cid) >= count[cid] then
            local v = getPlayerByName(transfer[cid])
            if v then
                doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
                updatePlayerBalance(getPlayerName(cid), getPlayerBalance(cid))
                doPlayerSetBalance(v, getPlayerBalance(v) + count[cid])
                updatePlayerBalance(getPlayerName(v), getPlayerBalance(v))
                npcHandler:say('Very well. You have transferred ' .. count[cid] .. ' gold to ' .. getPlayerName(v) .. '.', cid)
            elseif findPlayer(transfer[cid]):lower() == transfer[cid]:lower() then
                doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
                updatePlayerBalance(getPlayerName(cid), getPlayerBalance(cid))
                db.query('UPDATE players SET balance=balance+' .. count[cid] .. ' WHERE name=' .. db.escapeString(transfer[cid]) .. ' LIMIT 1')
                npcHandler:say('Very well. You have transferred ' .. count[cid] .. ' gold to ' .. findPlayer(transfer[cid]) .. '.', cid)
            else
                npcHandler:say('This player does not exist.', cid)
            end
        else
            npcHandler:say('There is not enough gold on your account.', cid)
        end
        Topic[cid] = nil
    elseif Topic[cid] == 7 and msgcontains(msg, 'no') then
        npcHandler:say('Alright, is there something else I can do for you?', cid)
        Topic[cid] = nil
    elseif msgcontains(msg, 'change gold') then
        npcHandler:say('How many platinum coins would you like to get?', cid)
        Topic[cid] = 8
    elseif Topic[cid] == 8 then
        if getCount(msg) < 1 then
            npcHandler:say('Hmm, can I help you with something else?', cid)
            Topic[cid] = nil
        else
            count[cid] = math.min(500, getCount(msg))
            npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your gold coins into ' .. count[cid] .. ' platinum coins?', cid)
            Topic[cid] = 9
        end
    elseif Topic[cid] == 9 then
        if msgcontains(msg, 'yes') then
            if doPlayerRemoveItem(cid, 2148, count[cid] * 100) then
                npcHandler:say('Here you are.', cid)
                doPlayerAddItem(cid, 2152, count[cid])
            else
                npcHandler:say('Sorry, you do not have enough gold coins.', cid)
            end
        else
            npcHandler:say('Well, can I help you with something else?', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'change platinum') then
        npcHandler:say('Would you like to change your platinum coins into gold or crystal?', cid)
        Topic[cid] = 10
    elseif Topic[cid] == 10 then
        if msgcontains(msg, 'gold') then
            npcHandler:say('How many platinum coins would you like to change into gold?', cid)
            Topic[cid] = 11
        elseif msgcontains(msg, 'crystal') then
            npcHandler:say('How many crystal coins would you like to get?', cid)
            Topic[cid] = 13
        else
            npcHandler:say('Well, can I help you with something else?', cid)
            Topic[cid] = nil
        end
    elseif Topic[cid] == 11 then
        if getCount(msg) < 1 then
            npcHandler:say('Hmm, can I help you with something else?', cid)
            Topic[cid] = nil
        else
            count[cid] = math.min(500, getCount(msg))
            npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your platinum coins into ' .. count[cid] * 100 .. ' gold coins for you?', cid)
            Topic[cid] = 12
        end
    elseif Topic[cid] == 12 then
        if msgcontains(msg, 'yes') then
            if doPlayerRemoveItem(cid, 2152, count[cid]) then
                npcHandler:say('Here you are.', cid)
                doPlayerAddItem(cid, 2148, count[cid] * 100)
            else
                npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
            end
        else
            npcHandler:say('Well, can I help you with something else?', cid)
        end
        Topic[cid] = nil
    elseif Topic[cid] == 13 then
        if getCount(msg) < 1 then
            npcHandler:say('Hmm, can I help you with something else?', cid)
            Topic[cid] = nil
        else
            count[cid] = math.min(500, getCount(msg))
            npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your platinum coins into ' .. count[cid] .. ' crystal coins for you?', cid)
            Topic[cid] = 14
        end
    elseif Topic[cid] == 14 then
        if msgcontains(msg, 'yes') then
            if doPlayerRemoveItem(cid, 2152, count[cid] * 100) then
                npcHandler:say('Here you are.', cid)
                doPlayerAddItem(cid, 2160, count[cid])
            else
                npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
            end
        else
            npcHandler:say('Well, can I help you with something else?', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'change crystal') then
        npcHandler:say('How many crystal coins would you like to change into platinum?', cid)
        Topic[cid] = 15
    elseif Topic[cid] == 15 then
        if getCount(msg) == -1 or getCount(msg) == 0 then
            npcHandler:say('Hmm, can I help you with something else?', cid)
            Topic[cid] = nil
        else
            count[cid] = math.min(500, getCount(msg))
            npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your crystal coins into ' .. count[cid] * 100 .. ' platinum coins for you?', cid)
            Topic[cid] = 16
        end
    elseif Topic[cid] == 16 then
        if msgcontains(msg, 'yes') then
            if doPlayerRemoveItem(cid, 2160, count[cid]) then
                npcHandler:say('Here you are.', cid)
                doPlayerAddItem(cid, 2152, count[cid] * 100)
            else
                npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
            end
        else
            npcHandler:say('Well, can I help you with something else?', cid)
        end
        Topic[cid] = nil
    elseif msgcontains(msg, 'change') then
        npcHandler:say('There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you\'d like to change 100 gold into 1 platinum, simply say \'{change gold}\' and then \'1 platinum\'.', cid)
        Topic[cid] = nil
    elseif msgcontains(msg, 'bank') then
        npcHandler:say('We can change money for you. You can also access your bank account.', cid)
        Topic[cid] = nil
    end
    return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
