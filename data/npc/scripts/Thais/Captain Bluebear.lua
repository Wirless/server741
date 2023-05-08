local config = {
   ["ab'dendriel"] = {cost = 80, location = {x = 32730, y = 31669, z = 7}},
   ["carlin"] = {cost = 80, location = {x = 32389, y = 31820, z = 7}},
   ["edron"] = {cost = 80, location = {x = 33178, y = 31767, z = 7}},
   ["venore"] = {cost = 80, location = {x = 32956, y = 32023, z = 7}},
} 

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState, xmsg = {}, {}

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid)  end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid)  end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()  npcHandler:onThink()  end

function creatureSayCallback(cid, type, msg)

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     local tm = config[msg:lower()]
     if msgcontains(msg, "bring me to") then
         for mes, t in pairs(config) do
             if msgcontains(msg, mes) then
                 if doPlayerRemoveMoney(cid, t.cost) then
                     npcHandler:say("Set the sails!", cid)
                     doTeleportThing(cid, t.location)
                 else
                     npcHandler:say("I am sorry you have ".. getPlayerMoney(cid) .." gold coins and it costs ".. t.cost .." gold coins to travel.", cid)
                 end
             end
         end
     elseif tm then
         if getPlayerMoney(cid) >= tm.cost then
             npcHandler:say("Do you want to go to ".. msg .." for ".. tm.cost .." gold coins?", cid)
             talkState[talkUser] = 1
             xmsg[cid] = msg
         else
             npcHandler:say("I am sorry you have ".. getPlayerMoney(cid) .." gold coins and it t.cost's ".. tm.cost .." gold coins to travel.", cid)
         end
     elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         local tm = config[xmsg[cid]:lower()]
         if doPlayerRemoveMoney(cid, tm.cost) == true then
             npcHandler:say("Set the sails!", cid)
             doTeleportThing(cid, tm.location)
         else
             npcHandler:say("I am sorry you have ".. getPlayerMoney(cid) .." gold coins and it t.cost's ".. cost[cid] .." gold coins to travel.", cid)
         end
         talkState[talkUser] = 0
     elseif msgcontains(msg, "no") and talkState[talkUser] > 0 then
         npcHandler:say("Ok.", cid)
         talkState[talkUser] = 0
     end
     return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())