local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2 + maglevel * 3) * 0.8
	max = (level * 2 + maglevel * 3) * 0.33
	
	if min < 15 then
		min = 15
	end

	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
if getCreatureCondition(cid,CONDITION_PARALYZE) then
doRemoveCondition(cid, CONDITION_PARALYZE)
end
	return doCombat(cid, combat, var)
end
