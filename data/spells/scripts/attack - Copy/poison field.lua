local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1490)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 1, 0, 5)

local area = createCombatArea(AREA_BEAM1)
setCombatArea(combat, area)



function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
