local manareq = 40
	local combat = createCombatObject()
		setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 0)
		setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 0)
		setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
		setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
		setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
		setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -0, -0.11, 0)

		


local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
setConditionParam(condition, CONDITION_PARAM_MINVALUE, 20)
setConditionParam(condition, CONDITION_PARAM_MAXVALUE, 70)
setConditionParam(condition, CONDITION_PARAM_STARTVALUE, 60)
setConditionParam(condition, CONDITION_PARAM_TICKINTERVAL, 5000)
setConditionParam(condition, CONDITION_PARAM_FORCEUPDATE, true)

setCombatCondition(combat, condition)
	

function onUseWeapon(cid, var)
if getCreatureMana(cid) >= manareq then
doCreatureAddMana(cid, -manareq)
doPlayerAddSpentMana(cid, manareq, true)
local target = getCreatureTarget(cid)
		doCombat(cid, combat, var)
        	doSendAnimatedText(getPlayerPosition(target),"Poisoned!", TEXTCOLOR_GREEN)
end
end

