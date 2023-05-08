function onSay(cid, words, param)
if getPlayerMoney(cid) >= 100 then
doPlayerRemoveMoney(cid, 100)
doPlayerAddItem(cid, 1988, 1)
doPlayerAddItem(cid, 2120, 1)
doPlayerAddItem(cid, 2554, 1)
doPlayerAddItem(cid, Cfmachete, 1)
doPlayerAddItem(cid, Cfpick, 1)
doPlayerAddItem(cid, Cfscythe, 1)
doPlayerSendCancel(cid, 'You purchased tools.')
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_BLUE)
else
            doPlayerSendCancel(cid, 'You don\'t have enough 100 gold.')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end
        end
