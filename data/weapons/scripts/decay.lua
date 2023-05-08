local soulrequired = 2


       local combat = createCombatObject()
    setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
 
	function onGetFormulaValues(cid, level, maglevel)
	min = -(maglevel*1)/3 -50
	max = -(maglevel*1)/3 -80
 
	return min, max
	end
 
	setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
 
    local combat2 = createCombatObject()
    setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, 1)
    setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, 1)
    setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
    setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 0, 0, 3.0, 0)
 
function onUseWeapon(cid, var)
	local target = getCreatureTarget(cid)
	local min = getPlayerMagLevel(cid)/3+50 -- should be the same as the min/max above
	local max = getPlayerMagLevel(cid)/3+80
	local percent = 50 -- change here the % manadrain
	local addmana = math.random(min * 0.5 * (percent/100), max * 0.5 * (percent/100))
 	
 
    if getPlayerLevel(cid) >= 20 then
	if isPlayer(target) and getCreatureMana(target) >= 10 then
	if getPlayerSoul(cid) >= soulrequired then
	doPlayerAddSoul(cid, -soulrequired)
		doCombat(cid, combat, var)
		doCombat(cid, combat2, var)
        	doPlayerAddMana(cid, addmana)
        	doSendAnimatedText(getPlayerPosition(cid),"+"..addmana.."", TEXTCOLOR_LIGHTBLUE)
        	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
			else
				return doPlayerSendCancel(cid, "Not enough soul " .. soulrequired .. " .") and doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	
		end
	
	else
        	doCombat(cid, combat2, var)
			return doPlayerSendCancel(cid, "Target has no mana") and doSendMagicEffect(getPlayerPosition(target), CONST_ME_POFF)
	end
    else
        doPlayerSendCancel(cid, 'You need level 20 to use this weapon.')
    end
end