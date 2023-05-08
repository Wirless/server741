local AREA_CROSS1X11 = {
	{1, 1, 1},
	{1, 4, 1},
	{1, 1, 1}
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local area = createCombatArea(AREA_CROSS1X11)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
