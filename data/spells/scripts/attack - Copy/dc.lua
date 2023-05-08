local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
--setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.00, -0, -1.50, -0)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)



function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end