local from1 = {x = 1042, y = 1165, z = 7}
local to1 = {x = 1070, y = 1186, z = 7}

function getZombiesEventPlayers()
local players = {}
for _, cid in pairs(getPlayersOnline()) do
if getCreatureStorage(cid, 1288) == 1 and getPlayerAccess(cid) < 4 then
table.insert(players, cid)
end
end
return players
end

function kickPlayerFromZombiesArea(cid)
doSendMagicEffect(getThingPosition(cid), CONST_ME_MORTAREA)
doTeleportThing(cid, {x = 994, y = 993, z = 7}, true)
doSendMagicEffect(getThingPosition(cid), CONST_ME_MORTAREA)
doCreatureSetStorage(cid, 1288, 0)
return true
end

function loseOnZombieArena(cid)
    kickPlayerFromZombiesArea(cid)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You got EATEN!.')
	local players = getZombiesEventPlayers()
       doBroadcastMessage("[" .. getCreatureName(cid) .. "] got eaten in zombie event ".. #players .." players left!", MESSAGE_EVENT_ORANGE)
    if(#players <= 1) then
        local winner = players[1]
        if(winner) then
            doPlayerAddItem(winner, 2157, 100, true)
            doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "You won zombies arena event.")
            doBroadcastMessage("[" .. getCreatureName(winner) .. "] won Zombie Arena Event!")
            kickPlayerFromZombiesArea(winner)
        else
            doBroadcastMessage("Zombie arena event finished! No one win?!?!?! WTF!")
        end
    end
end

function onStatsChange(target, cid, changetype, combat, value)
    if((cid and isMonster(cid) and getCreatureName(cid) == "Psycho Pumpkin") or (isInRange(getThingPosition(target), from1, to1) and changetype == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(target))) then
        doCreatureAddHealth(target, getCreatureMaxHealth(target))
        doSendAnimatedText(getThingPosition(target), "BAM!", 180)
        loseOnZombieArena(target)
        return false
    end
    return true
end  