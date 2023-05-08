math.randomseed(os.time())
local maxdis = 40
function autoloot(cid, target, pos)
    if not isPlayer(cid) then
        return
    end
    local function scanContainer(cid, uid)
        local added = 0
        local members = getPartyMembers(cid)
        for k = (getContainerSize(uid) - 1), 0, -1 do
            local tmp = getContainerItem(uid, k)
            local stack = 0
            local winner = getPartyMembers(getPartyLeader(cid))[math.random(1, table.maxn(getPartyMembers(getPartyLeader(cid))))]
            if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(winner)) <= maxdis then
                if (isInArray({2148,2152, 2160}, tmp.itemid)) then
                        local money = (tmp.itemid == 2160) and (tmp.type*10000) or (tmp.itemid == 2152) and (tmp.type*100) or tmp.type
                        added = added + money
                        for a = 1,#members do
                            doPlayerAddMoney(members[a], math.floor((money/table.maxn(members))))
                            doPlayerSendTextMessage(members[a], MESSAGE_STATUS_CONSOLE_BLUE, '[Loot System] ' .. math.floor(((added/table.maxn(members)))) .. ' Gold Coin Has Been Added to Your Backpack')
                        end
                elseif isItemStackable(tmp.itemid) then
                    stack = tmp.type
                        for i = 1,#members do
                            doPlayerAddItem(members[i], tmp.itemid,math.floor(stack/table.maxn(members))+1)
                            if doPlayerSendTextMessage(members[i], MESSAGE_STATUS_CONSOLE_BLUE, "[Loot System] " .. math.floor(((stack/table.maxn(members))))+1 .. "x " .. getItemNameById(tmp.itemid) .. " Has Been Added to Your Backpack") then
                            end
                        end
                elseif isContainer(tmp.uid) then
                 scanContainer(cid, tmp.uid)
                else
                    if tmp.type == 0 and not (isInArray({2148, 2152, 2160}, tmp.itemid)) then
                    doPlayerAddItem(winner, tmp.itemid,tmp.type)
                    doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot System] You've won: " .. tmp.type+1 .. "x " .. getItemNameById(tmp.itemid) .. ".")
                    else
                    doPlayerAddItem(winner, tmp.itemid,tmp.type)
                    doPlayerSendTextMessage(winner, MESSAGE_STATUS_CONSOLE_BLUE, "[Loot System] You've won: " .. tmp.type .. "x " .. getItemNameById(tmp.itemid) .. ".")
                    end
                end
            end
            doRemoveItem(tmp.uid)
        end
        return true
    end
    local items = {}
    for i = getTileInfo(pos).items, 1, -1 do
        pos.stackpos = i
        items[i] = getThingFromPos(pos)
    end
    if (#items == 0) then
        return
    end
    local corpse = -1
    for _, item in pairs(items) do
        if not isCreature(item.uid) then
            local name = getItemName(item.uid):lower()
            if name:find(target:lower()) then
                corpse = item.uid
                break
            end
        end
    end
if (corpse ~= -1) and isContainer(corpse) and (getItemAttribute(corpse, "corpseowner") == cid) then
        scanContainer(cid, corpse)
end
end
function onKill(cid, target, lastHit)
        local members = getPartyMembers(cid)
        if isMonster(target) and (isInParty(cid)) and getPlayerStorageValue(members[2], 23305) == 1 then
            addEvent(autoloot, 100, cid, getCreatureName(target), getCreaturePosition(target))
        end
    return true
end
