local stor = 23305

function onSay(cid, words, param, channel)
local party = getPartyMembers(cid)
   if isInParty(cid) then
     if party[2] == cid then
     doCreatureSetStorage(party[2], stor, (getCreatureStorage(party[2], stor) == -1) and 1 or -1)
     doPlayerSendTextMessage(party[2], MESSAGE_STATUS_CONSOLE_BLUE, 'Party Item Share has been ' .. (getCreatureStorage(party[2], stor) == -1 and 'disabled' or 'enabled') .. '.')
     else
     doPlayerSendCancel(cid, "You Aren't The Leader of Party")
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
     end
   else
     doPlayerSendCancel(cid, "You Aren't In Party")
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
   end
  return true
end
