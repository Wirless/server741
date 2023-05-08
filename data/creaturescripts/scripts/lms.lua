function loseOnLMSArena(cid)
    kickPlayerFromLMSArea(cid)
    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    doCreatureAddMana(cid, getCreatureMaxMana(cid))
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "BOOM! You are dead.")
    setPlayerStorageValue(cid, ZEAA_JOIN, 0)
    local players = getLMSEventPlayers()
    if(#players <= 1) then
        local winner = players[1]
        if(winner) then
            doPlayerAddItem(winner, 2160, 5, true)
        doCreatureAddHealth(winner, getCreatureMaxHealth(winner))
        doCreatureAddMana(winner, getCreatureMaxMana(winner))
            local item = doPlayerAddItem(winner, 7369, 1, true)
            doItemSetAttribute(item, "description", getPlayerName(winner) .. " was the winner of Last Man Standing Event.")
        setPlayerStorageValue(winner, ZEA_JOIN, 0)
            doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "You won Last Man Standing Event.")
            doBroadcastMessage("After " .. os.time() - getPlayerLMSEventStatus(winner) .. " seconds of fight " .. getCreatureName(winner) .. " won Last Man Standing Event in game versus " ..  getLMSEventPlayersLimit() - #getLMSEventPlayers() .. " players!")
            kickPlayerFromLMSArea(winner)
        else
            doBroadcastMessage("Last Man Standing Event finished! No one win?!?!?! WTF!")
        end
        doSetStorage(ZEA_STATUS, 0)
        doSetStorage(ZEA_PLAYERS_NUMBER, ZEA_DEFAULT_NUMBER_OF_PLAYERS)
        doSetStorage(ZEA_LMS_TO_SPAWN, 0)
        doSetStorage(ZEA_LMS_SPAWNED, 0)
        local width = (math.max(ZEA_spawnFromPosition.x, ZEA_spawnToPosition.x) - math.min(ZEA_spawnFromPosition.x, ZEA_spawnToPosition.x)) / 2 + 1
        local height = (math.max(ZEA_spawnFromPosition.y, ZEA_spawnToPosition.y) - math.min(ZEA_spawnFromPosition.y, ZEA_spawnToPosition.y)) / 2 + 1
        local centerPos = {x=math.min(ZEA_spawnFromPosition.x, ZEA_spawnToPosition.x)+width,y=math.min(ZEA_spawnFromPosition.y, ZEA_spawnToPosition.y)+height,z=ZEA_spawnFromPosition.z}
        for z = math.min(ZEA_spawnFromPosition.z, ZEA_spawnToPosition.z), math.max(ZEA_spawnFromPosition.z, ZEA_spawnToPosition.z) do
            centerPos.z = z
        end
    end
end
 
function onStatsChange(target, cid, changetype, combat, value)
    if isPlayer(target) and getPlayerStorageValue(target, ZEA_JOIN) == 1 then if(getStorage(ZEA_STATUS) == 1) then return false end end
    corpse_ids = {
        [0] = 3065, -- female
        [1] = 3058 -- male
}
    if((isInRange(getThingPosition(target), ZEA_spawnFromPosition, ZEA_spawnToPosition) and changetype == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(target))) then
        lose = addEvent(loseOnLMSArena, 1, target)
        corpse = doCreateItem(corpse_ids[getPlayerSex(cid)], 1, getThingPos(target))
        doCreateItem(2016, 2, getThingPos(target))
        doItemSetAttribute(corpse, "description", "You recogniZEA "..getCreatureName(target)..". He was killed by "..(isMonster(target) and "a "..string.lower(getCreatureName(cid)) or isCreature(cid) and getCreatureName(cid) or "a field item")..". In [LMS-Event]")
        return false
    end
    return true
end
 
function onTarget(cid, target)
    if isPlayer(target) and getPlayerStorageValue(target, ZEA_JOIN) == 1 then
    if(getStorage(ZEA_STATUS) == 1) then
        doPlayerSendCancel(cid, "Wait until the Last Man Standing Event Starts.")
        return false
        end
    end
    return true
end
 
function onThink(cid)
    local summons = getCreatureSummons(cid)
    if not summons >= 1 then return true end
    if summons >= 1 then
    if isCreature(summons[1]) and getPlayerStorageValue(cid, ZEA_JOIN) == 1 then
        doRemoveCreature(summons[1])
        end
    return true
    end
end
 
function onLogin(cid)
       if getPlayerStorageValue(cid, ZEA_JOIN) == 1 then
          setPlayerStorageValue(cid, ZEA_JOIN, 0)
     end
     return true
end