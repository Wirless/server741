function onSay(cid, words, param)
if getPlayerMoney(cid) >= 70000 and getGoldenAccountDays(cid) >= 1 then
doPlayerRemoveMoney(cid, 70000)
doPlayerAddItem(cid, 2173, 1)
doPlayerSendCancel(cid, 'You purchased aol.')
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_BLUE)
else
            doPlayerSendCancel(cid, 'You don\'t have enough money 7cc or golden account status.')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end
        end
