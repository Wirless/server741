local function isValidMoney(value)
   if(value == nil) then
      return false
   end
 
   return (value > 0 and value <= 99999999999999)
end
 
function onSay(cid, words, param, channel)
   local guild = getPlayerGuildId(cid)
   if(guild == 0) then
      return false
   end
 
   local t = string.explode(param, ' ', 1)
   if(getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER and isInArray({ 'pick' }, t[1])) then
      if(t[1] == 'pick') then
         local money = { tonumber(t[2]) }
         if(not isValidMoney(money[1])) then
            doPlayerSendTextMessage(cid, 20, 'Invalid amount of money specified.')
            return true
         end
 
         local result = db.getResult('SELECT `balance` FROM `guilds` WHERE `id` = ' .. guild)
         if(result:getID() == -1) then
            return false
         end
 
         money[2] = result:getDataLong('balance')
         result:free()
 
         if(money[1] > money[2]) then
            doPlayerSendTextMessage(cid, 20, 'The balance is too low for such amount.')
            return true
         end
 
         if(not db.executeQuery('UPDATE `guilds` SET `balance` = `balance` - ' .. money[1] .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')) then
            return false
         end
 
         doPlayerAddMoney(cid, money[1])
         doPlayerSendTextMessage(cid, 20, 'You have just picked ' .. money[1] .. ' money from your guild balance.')
      else
         doPlayerSendTextMessage(cid, 20, 'Invalid sub-command.')
      end
   elseif(t[1] == 'donate') then
      local money = tonumber(t[2])
      if(not isValidMoney(money)) then
         doPlayerSendTextMessage(cid, 20, 'Invalid amount of money specified.')
         return true
      end
 
      if(getPlayerMoney(cid) < money) then
         doPlayerSendTextMessage(cid, 20, 'You don\'t have enough money.')
         return true
      end
 
      if(not doPlayerRemoveMoney(cid, money)) then
         return false
      end
 
      db.executeQuery('UPDATE `guilds` SET `balance` = `balance` + ' .. money .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')
      doPlayerSendTextMessage(cid, 20, 'You have transfered ' .. money .. ' money to your guild balance.')
   else
      local result = db.getResult('SELECT `name`, `balance` FROM `guilds` WHERE `id` = ' .. guild)
      if(result:getID() == -1) then
         return false
      end
 
      doPlayerSendTextMessage(cid, 20, 'Current balance of guild ' .. result:getDataString('name') .. ' is: ' .. result:getDataLong('balance') .. ' bronze coins.')
      result:free()
   end
 
   return true
end