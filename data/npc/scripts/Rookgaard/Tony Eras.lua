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




keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't sell anything."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can help you to deposit money and withdraw them."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Tony Eras, but they use to call me Tony Cash."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no idea actually, I've lost the time while working here."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry I can't answer that, you know I'm just a simple guy working in a bank. I never explore."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I thought you would never ask! I'm a happy guy that work with banking! I've wanted to become employed in a bank everysince my father started his own bank. sadly he died.. ehumm.. lets talk about something else."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm fine, just bit cold in this basement. thank you for asking!"})
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "that's right, this is a bank!"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer my service to you!"})
keywordHandler:addKeyword({'oracle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Oracle? never spoke to her, I thin I'm a bit scared to her actually."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think you'll have to speak with The Oracle for that, not very sure thought."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is Tibia! This world we're living in!"})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Big city! my dad used to have the bank office there before he died.. ehumm, lets talk about something else..."})

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
