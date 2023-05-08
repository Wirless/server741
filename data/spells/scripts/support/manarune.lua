local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)

function onCastSpell(cid, var)
doCreatureAddMana(cid,300)
	doCreatureSay(cid,"Aaaah...")
	return doCombat(cid, combat, var)
end
