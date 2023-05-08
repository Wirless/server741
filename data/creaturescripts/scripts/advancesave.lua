local config = {
	savePlayer = true,
	healPlayerOnLevel = false
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if(skill == SKILL__EXPERIENCE) then
		return true
	end

	if(skill == SKILL__LEVEL)  then
		doSendAnimatedText(getPlayerPosition(cid), "LEVEL UP", TEXTCOLOR_WHITE)
		if (config.healPlayeronLevel) then
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
		end
	end
	if(skill == SKILL__MAGLEVEL) then
		doSendAnimatedText(getPlayerPosition(cid), "MAGIC UP", TEXTCOLOR_BLUE)
	end
	
	if(skill == SKILL_AXE) then
		doSendAnimatedText(getPlayerPosition(cid), "AXE UP", TEXTCOLOR_ORANGE)
	end
	if(skill == SKILL_CLUB) then
		doSendAnimatedText(getPlayerPosition(cid), "CLUB UP", TEXTCOLOR_ORANGE)
	end
	if(skill == SKILL_SWORD) then
		doSendAnimatedText(getPlayerPosition(cid), "SWORD UP", TEXTCOLOR_ORANGE)
	end
	if(skill == SKILL_SHIELD) then
		doSendAnimatedText(getPlayerPosition(cid), "SHIELDING UP", TEXTCOLOR_ORANGE)
	end
	if(skill == SKILL_DISTANCE) then
		doSendAnimatedText(getPlayerPosition(cid), "DISTANCE UP", TEXTCOLOR_ORANGE)
	end


	if(config.savePlayer) then
		doPlayerSave(cid, true)
	end

	return true
end
