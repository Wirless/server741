function onSay(cid, words, param)
if getPlayerLevel(cid) >= 20 and getPlayerStorageValue(cid,56511) == -1 then
doPlayerAddItem(cid, 5811, 1)
doPlayerSendCancel(cid, 'JESTES GITEM KURWA.')
setPlayerStorageValue(cid,56511,1)
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_RED)
else
            doPlayerSendCancel(cid, 'najpierw troche pograj gicie komenda nie ucieknie ;) 20-lvl .')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end
        end