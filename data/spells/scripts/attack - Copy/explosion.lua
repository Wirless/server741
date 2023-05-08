local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.15, 0, -0.9, 0)
local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onGetFormulaValues(player, level, maglevel)
	local base = 60
	local variation = 40
	
	local formula = 3 * maglevel
	
	local min = (formula * (base - variation)) / 100
	local max = (formula * (base + variation)) / 100
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
