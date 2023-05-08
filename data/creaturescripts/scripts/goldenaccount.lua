function onLogin(cid)
local lossPs = getPlayerLossPercent(cid, PLAYERLOSS_EXPERIENCE)

	if getGoldenAccountDays(cid) >= 1 then
		doCreatureSetStorage(cid, 133, 110)
		doCreatureSetStorage(cid, 134, 110)

	
		doPlayerSetRate(cid, SKILL__LEVEL, 1.1)
		doSendMagicEffect(getThingPos(cid), 35)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You have ".. getGoldenAccountDays(cid) .." days of golden account left.")
	else
	doSendMagicEffect(getThingPos(cid), 10)
		doCreatureSetStorage(cid, 133, 0)
	end

	
return true

end