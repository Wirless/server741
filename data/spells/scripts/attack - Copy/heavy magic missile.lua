local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(cid, level, maglevel)
	local base = 20
	local variation = 10

	local min = math.max((base - variation), ((0.1 * maglevel ) * (base - variation) / 100))
	local max = math.max((base + variation), ((3 * maglevel ) * (base + variation) / 100))

	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
