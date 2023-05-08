local manareq = 40
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 0)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -0, -0.11, 0)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1487)


local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
--[[
addDamageCondition(condition, 3, 2000, -25)
addDamageCondition(condition, 3, 3000, -5)
addDamageCondition(condition, 4, 4000, -4)
addDamageCondition(condition, 6, 6000, -3)
addDamageCondition(condition, 9, 8000, -2)
addDamageCondition(condition, 12, 10000, -1)
]]--
setConditionParam(condition, CONDITION_PARAM_MINVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 5000)
setConditionParam(condition, CONDITION_PARAM_FORCEUPDATE, true)

setCombatCondition(combat, condition)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)


function onUseWeapon(cid, var)
if getCreatureMana(cid) >= manareq then
doCreatureAddMana(cid, -manareq)
doPlayerAddSpentMana(cid, manareq, true)
	return doCombat(cid, combat, var)
	end
end