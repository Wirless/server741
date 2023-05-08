
local manareq = 10
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 0)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.02, -0, -0.10, 0)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1490)


local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

setConditionParam(condition, CONDITION_PARAM_MINVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 5)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 5000)
setConditionParam(condition, CONDITION_PARAM_FORCEUPDATE, true)

setCombatCondition(combat, condition)

local area = createCombatArea(AREA_CROSSTARGET)
setCombatArea(combat, area)


function onUseWeapon(cid, var)

if getCreatureMana(cid) >= manareq then
doCreatureAddMana(cid, -manareq)
doPlayerAddSpentMana(cid, manareq, true)
	return doCombat(cid, combat, var)
	else
	return false
	end
end