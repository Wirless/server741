local light = createConditionObject(CONDITION_LIGHT, -1, false, 0, CONDITIONID_DEFAULT)
	setConditionParam(light, CONDITION_PARAM_LIGHT_LEVEL, 255)
	setConditionParam(light, CONDITION_PARAM_LIGHT_COLOR, 215)

function onSay(cid, words, param, channel)
	if(not getCreatureCondition(cid, type, subId, CONDITIONID_DEFAULT)) then
		doAddCondition(cid, light)
		action = "on"
	else
		doRemoveCondition(cid, type, subId, CONDITIONID_DEFAULT)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have turned full light")
	return true
end