local manareq = 0
	local combat = createCombatObject()
		setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
		setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
		setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
		setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
		setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
		setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0.2, 0, 0.9, 0)

		


local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
setConditionParam(condition, CONDITION_PARAM_MINVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 120)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 100)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 5000)
setConditionParam(condition, CONDITION_PARAM_FORCEUPDATE, true)

setCombatCondition(combat, condition)
	

function onUseWeapon(cid, var)
local target = getCreatureTarget(cid)
		doCombat(cid, combat, var)
        	doSendAnimatedText(getPlayerPosition(target),"Poisoned!", TEXTCOLOR_GREEN)
end

