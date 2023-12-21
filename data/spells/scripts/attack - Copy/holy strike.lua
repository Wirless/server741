local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLYSAN)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.75, -0, -0.15, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
