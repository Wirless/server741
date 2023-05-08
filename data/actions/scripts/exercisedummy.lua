---@ Create by Sarah Wesker | Tested Version: TFS 0.4
---@ list of training dummies.
local dummies = {
    [6431] = { skillRate = 0.1, skillSpeed = 1 },
    [6432] = { skillRate = 0.1, skillSpeed = 1 }
}

---@ Global training parameters of the system.
local staminaTries = 1 --# on minutes
local skillTries = 7 --# tries by blow
local skillSpent = function() return math.random(20, 100) end --# mana consumed by blow
local slotForUse = CONST_SLOT_AMMO

--getCreatureStorage(uid, key)
--doCreatureSetStorage(uid, key, value)
---@ list of weapons to train.
local weapons = {
    [6877] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_POISON, skillType = SKILL_MAGLEVEL }, -- magicLevel Dru
    [6876] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ENERGY, skillType = SKILL_MAGLEVEL }, -- magicLevel Sor
    [6878] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
    [6880] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [6879] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [6881] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB } -- club
}

---@ EDTE is the global event table to control the system correctly.

if not EDTE then EDTE = {} end

---@ functions to assign or obtain the training status of a player.
function getPlayerExerciseTrain(cid) return EDTE[cid] or false end
function setPlayerExerciseTrain(cid, status) EDTE[cid] = status return status end

---@ local training function.
local function exerciseDummyTrainEvent(params, weapon)
    if isPlayer(params.cid) then
        local item = getPlayerSlotItem(params.cid, slotForUse)
        local playerPosition = getCreaturePosition(params.cid)
        if getDistanceBetween(playerPosition, params.currentPos) == 0 and item.itemid == params.itemid then
            local weaponCharges = getItemAttribute(item.uid, "charges") or getItemInfo(params.itemid).charges
            local reloadMs = getVocationInfo(getPlayerVocation(params.cid)).attackSpeed * params.dummy.skillSpeed
            if weaponCharges >= 1 then
                doItemSetAttribute(item.uid, "charges", weaponCharges -1)
                if weapon.shootDistEffect then doSendDistanceShoot(playerPosition, params.dummyPos, weapon.shootDistEffect) end
                if weapon.shootEffect then doSendMagicEffect(params.dummyPos, weapon.shootEffect) end
                if weapon.skillType == SKILL_MAGLEVEL then
                    doPlayerAddSpentMana(params.cid, (skillSpent() * params.dummy.skillRate) * getConfigValue("rateMagic"))
                else
                    doPlayerAddSkillTry(params.cid, weapon.skillType, (skillTries * params.dummy.skillRate) * getConfigValue("rateSkill"))
                end
                local currentStamina = getPlayerStamina(params.cid)
                doPlayerSetStamina(params.cid, currentStamina + staminaTries)
                if weaponCharges <= 1 then
                    exerciseDummyTrainEvent(params, weapon)
                else
                    setPlayerExerciseTrain(params.cid, addEvent(exerciseDummyTrainEvent, reloadMs, params, weapon))
                end
                return true
            else
                doRemoveItem(item.uid)
                doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "Your exercise weapon has expired, therefore your training too.")
            end
        else
            doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "You have finished your training.")
        end
    end
    return setPlayerExerciseTrain(params.cid, nil)
end

function onUse(cid, item, fromPos, target, toPos, isHotkey)
    local ammo = getPlayerSlotItem(cid, slotForUse)
    if ammo.uid ~= item.uid then --
        return doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The weapon must be located in your slot ammunition.")
    end
    if not target then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
    local playerPosition = getCreaturePosition(cid)
    if not getTileInfo(playerPosition).protection then
        return doPlayerSendCancel(cid, "You can only train in protection zone.")
    end
    local dummy = dummies[target.itemid]
    local weapon = weapons[item.itemid]
    if not weapon or not dummy then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
    end
    local dummyPosition = getThingPosition(target.uid)
    if getDistanceBetween(playerPosition, dummyPosition) > 1 then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_THEREISNOWAY)
    end
    if not getPlayerExerciseTrain(cid) then
        local params = {}
        params.cid = cid
        params.currentPos = playerPosition
        params.dummyPos = dummyPosition
        params.itemid = item.itemid
        params.dummy = dummy
        exerciseDummyTrainEvent(params, weapon)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have started training with dummy.")
    else
        doPlayerSendCancel(cid, "You can not train")
    end
    return true
end