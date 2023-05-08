local manareq = 40
local soulrequired = 2

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
 
function onGetFormulaValues(cid, level, maglevel)
	min = ( maglevel * 1.2) 
	max = ( maglevel * 2.4)

	return min, max
end
 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
 
function onUseWeapon(cid, var)
	if getPlayerSoul(cid) >= soulrequired then
		if getCreatureMana(cid) >= manareq then
			doCreatureAddMana(cid, -manareq)
			doPlayerAddSpentMana(cid, manareq, true)
			doPlayerAddSoul(cid, -soulrequired)
			return doCombat(cid, combat, var)
		else
		return doPlayerSendCancel(cid, "Not enough mana") and doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		end
	else
	return doPlayerSendCancel(cid, "Not enough soul " .. soulrequired .. " .") and doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	
	end
end