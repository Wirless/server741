function onUse(cid, item, frompos, item2, topos)
	doRemoveItem(item.uid, 1)
	doPlayerAddPremiumDays(cid, 14)
	doPlayerSendTextMessage(cid, 22, "14 days of golden account have been added to your account, relog your whole account to activate it!")
end