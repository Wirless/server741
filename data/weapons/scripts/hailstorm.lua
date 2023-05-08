local manareq = 50
local soulrequired = 3

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETPLAYERSORSUMMONS, true)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.8, -30, 1.2, 0) 
 
 
local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

 
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