local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SWORD)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal / 3 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end


--- getItemWeaponType(uid)    getPlayerSlotItem(cid, slot) weapontype(axe) setcombatparam CONST_EFFECT_AXE SWORD CLUB setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, LOCALVARIABLEX local x = if weapon type in slot id both hands check?