local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}


local light = createConditionObject(CONDITION_LIGHT, -1, false, 0, CONDITIONID_DEFAULT)
	setConditionParam(light, CONDITION_PARAM_LIGHT_LEVEL, 255)
	setConditionParam(light, CONDITION_PARAM_LIGHT_COLOR, 215)



function onLogin(cid)


	
	
doPlayerSetLossPercent(cid, 0, 240)
doPlayerSetLossPercent(cid, 1, 70)
doPlayerSetLossPercent(cid, 2, 60)
doPlayerSetLossPercent(cid, 3, 100)
doPlayerSetLossPercent(cid, 4, 15)
print("SETLOSS")

if getPlayerStorageValue(cid, 60001) == -1 then
setPlayerStorageValue(cid, 60001, 1)
end
if getPlayerStorageValue(cid, 60002) == -1 then
setPlayerStorageValue(cid, 60002, prizes[1].level)
end
	
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
			setPlayerStorageValue(cid,5788, 0)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type 'account' to manage your account. If you would like to start over, type 'cancel' anywhere.", TALKTYPE_PRIVATE, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type 'account' to create an account or 'recover' to recover an account.", TALKTYPE_PRIVATE, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	local expScroll = getCreatureStorage(cid, 78011)
if expScroll >= os.time() then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Experience Boost active.") --until: " .. os.date("%a %b %d %X %Y", expScroll) .. "
	doPlayerSetRate(cid, SKILL__LEVEL, 10)
else
	doCreatureSetStorage(cid, 78011, -1)
end
	
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "PvP")
	registerCreatureEvent(cid, "KillingInTheNameOf")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "WarKill") 
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "GoldenAccount")
	registerCreatureEvent(cid, "MoveBlock")
	registerCreatureEvent(cid, "aolremove")
	registerCreatureEvent(cid, "levelreward")


	return true
end

