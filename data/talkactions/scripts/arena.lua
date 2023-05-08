function onSay(cid, words, param)
if getTileInfo(getThingPos(cid)) == nologout then
doPlayerSendCancel(cid, 'working where? XD.')
else
            doPlayerSendCancel(cid, 'not working.')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end
        end
