local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, ITEM_MAGIC_WALL)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)


local function magicWallCounter(cid, pos, tempo)
	if tempo > 0 and getTileItemById(pos, 1497).uid > 0 then
		doSendAnimatedText(pos, tempo, TEXTCOLOR_YELLOW)
		addEvent(magicWallCounter, 1000, cid, pos, tempo-1)
	else
		return doSendMagicEffect(pos, 2)
	end
end

function onCastSpell(cid, var)
	local pos = variantToPosition(var)
	if getTileInfo(getThingPos(cid)).protection or getTileInfo(pos).protection then
		return not doPlayerSendDefaultCancel(cid, RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE)
	end
	

	addEvent(magicWallCounter, 0, cid, var.pos, 20)
	doCombat(cid, combat, var)
	return true
end