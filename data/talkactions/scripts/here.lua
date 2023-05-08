function onSay(cid, words, param)
if getPlayerMoney(cid) >= 1 then
local maxmananow = getCreatureMaxMana(cid)



doCreatureForceAddMana(cid, 100)



 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TUTORIALARROW)
else
            doPlayerSendCancel(cid, 'Youneed to pay 100 gold to pogchamp and own golden account!.')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
 end
end

