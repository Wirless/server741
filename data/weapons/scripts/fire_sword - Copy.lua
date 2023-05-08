local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0.0, 0, 0.9, 0)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 1, 1000, -90)
setCombatCondition(combat, condition)

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end