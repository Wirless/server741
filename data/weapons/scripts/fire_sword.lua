
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0.2, 0, 0.9, 0)
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

local area = createCombatArea(AREA_CROSSTARGET)
setCombatArea(combat, area)


function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end