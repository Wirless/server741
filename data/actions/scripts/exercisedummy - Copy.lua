---@ Create by Sarah Wesker | Tested Version: TFS 0.4
---@ list of training dummies.
local dummies = {
    [6431] = { skillRate = 1, skillSpeed = 1 },
    [6432] = { skillRate = 1, skillSpeed = 1 }
}

---@ Global training parameters of the system.
local staminaTries = 1 --# on minutes
local skillTries = 7 --# tries by blow
local skillSpent = function() return math.random(10, 100) end --# mana consumed by blow

--getCreatureStorage(uid, key)
--doCreatureSetStorage(uid, key, value)
---@ list of weapons to train.
local weapons = {
    [5850] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_POISON, skillType = SKILL_MAGLEVEL }, -- magicLevel Dru
    [5852] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ENERGY, skillType = SKILL_MAGLEVEL }, -- magicLevel Sor
    [5796] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
    [5774] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [5773] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [5775] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB } -- club
}

---@ EDTE is the global event table to control the system correctly.
if not EDTE then EDTE = {} end

---@ functions to assign or obtain the training status of a player.
function getPlayerExerciseTrain(cid) return EDTE[cid] or false end
function setPlayerExerciseTrain(cid, status) EDTE[cid] = status return status end

---@ local training function.
local function exerciseDummyTrainEvent(params, weapon)
    if isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5774 or isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5775 or isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5773 or isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5850 or isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5852 or isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5796 then
        local item = getPlayerItemById(params.cid, true, params.itemid)
        local playerPosition = getCreaturePosition(params.cid)
        if getDistanceBetween(playerPosition, params.currentPos) == 0 then
            local weaponCharges = getItemAttribute(item.uid, "charges") or getItemInfo(params.itemid).charges
            local reloadMs = getVocationInfo(getPlayerVocation(params.cid)).attackSpeed * params.dummy.skillSpeed
            if weaponCharges >= 1 then
                doItemSetAttribute(item.uid, "charges", weaponCharges -1)
                if weapon.shootDistEffect then doSendDistanceShoot(playerPosition, params.dummyPos, weapon.shootDistEffect) end
                if weapon.shootEffect then doSendMagicEffect(params.dummyPos, weapon.shootEffect) end
                if weapon.skillType == SKILL_MAGLEVEL and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5852 or weapon.skillType == SKILL_MAGLEVEL and getPlayerSlotItem(params.cid, CONST_SLOT_RIGHT).itemid == 5850  then
                    doPlayerAddSpentMana(params.cid, (skillSpent() * params.dummy.skillRate) * getConfigValue("rateMagic"))
                else
				if weapon.skillType == SKILL_NONE then
				print("exception")
				return false
				else
                    doPlayerAddSkillTry(params.cid, weapon.skillType, (skillTries * params.dummy.skillRate) * getConfigValue("rateSkill"))
                end
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
        params.item = item.uid
        params.itemid = item.itemid
        params.dummy = dummy
        exerciseDummyTrainEvent(params, weapon)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have started training with dummy.")
    else
        doPlayerSendCancel(cid, "You can not train or you are already training")
    end
    return true
end
