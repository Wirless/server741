function onSay(cid, words, param)
if getPlayerMoney(cid) >= 1 and getGoldenAccountDays(cid) >= 1 then
doPlayerRemoveMoney(cid, 100)
doPlayerSendCancel(cid, 'pogchamp.')
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POGCHAMP)
else
            doPlayerSendCancel(cid, 'Youneed to pay 100 gold to pogchamp and own golden account!.')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end
        end
		
		