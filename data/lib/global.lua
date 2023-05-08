ITEM_GOLD_COIN = 2148
ITEM_PLATINUM_COIN = 2152
ITEM_CRYSTAL_COIN = 2160


function doPlayerGiveItem(cid, itemid, count, charges)
	local hasCharges = (isItemRune(itemid) == TRUE or isItemFluidContainer(itemid) == TRUE or isItemChargeAmulet(itemid) == TRUE or isItemChargeRing(itemid) == TRUE)
	if(hasCharges and charges == nil) then
		charges = 1
	end
	
	while count > 0 do
    	local tempcount = 1
    	
    	if(hasCharges) then
    		tempcount = charges
    	end
    	if(isItemStackable(itemid) == TRUE) then
    		tempcount = math.min (100, count)
   		end
    	
       	local ret = doPlayerAddItem(cid, itemid, tempcount)
       	if(ret == LUA_ERROR) then
        	ret = doCreateItem(itemid, tempcount, getPlayerPosition(cid))
        end
        
        if(ret ~= LUA_ERROR) then
        	if(hasCharges) then
        		count = count-1
        	else
        		count = count-tempcount
        	end
        else
        	return LUA_ERROR
        end
	end
    return LUA_NO_ERROR
end


function doPlayerTakeItem(cid, itemid, count)
	if(getPlayerItemCount(cid,itemid) >= count) then
		
		while count > 0 do
			local tempcount = 0
    		if(isItemStackable(itemid) == TRUE) then
    			tempcount = math.min (100, count)
    		else
    			tempcount = 1
    		end
        	local ret = doPlayerRemoveItem(cid, itemid, tempcount)
        	
            if(ret ~= LUA_ERROR) then
            	count = count-tempcount
            else
            	return LUA_ERROR
            end
		end
		
		if(count == 0) then
			return LUA_NO_ERROR
		end
		
	else
		return LUA_ERROR
	end
end


function doPlayerAddMoney(cid, amount)
	local crystals = math.floor(amount/10000)
	amount = amount - crystals*10000
	local platinum = math.floor(amount/100)
	amount = amount - platinum*100
	local gold = amount
	local ret = 0
	if(crystals > 0) then
		ret = doPlayerGiveItem(cid, ITEM_CRYSTAL_COIN, crystals)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	if(platinum > 0) then
		ret = doPlayerGiveItem(cid, ITEM_PLATINUM_COIN, platinum)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	if(gold > 0) then
		ret = doPlayerGiveItem(cid, ITEM_GOLD_COIN, gold)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	return LUA_NO_ERROR
end


function doPlayerBuyItem(cid, itemid, count, cost, charges)
    if(doPlayerRemoveMoney(cid, cost) == TRUE) then
    	return doPlayerGiveItem(cid, itemid, count, charges)
    else
        return LUA_ERROR
    end
end


function doPlayerSellItem(cid, itemid, count, cost)
	
	if(doPlayerTakeItem(cid, itemid, count) == LUA_NO_ERROR) then
		if(doPlayerAddMoney(cid, cost) ~= LUA_NO_ERROR) then
			error('Could not add money to ' .. getPlayerName(cid) .. '(' .. cost .. 'gp)')
		end
		return LUA_NO_ERROR
	else
		return LUA_ERROR
	end
	
end

function getCount(s)
    local b, e = s:find('%d+')
    return b and e and math.min(4294967295, tonumber(s:sub(b, e))) or -1
end

function findPlayer(name)
    local resultId = db.storeQuery('SELECT name FROM players WHERE name=' .. db.escapeString(name) .. ' LIMIT 1'), nil
    if resultId == false then
        return
    end
    local r = result.getDataString(resultId, "name")
    result.free(resultId)
    return r
end

function getPlayerBiddedMoney(cid)
    local resultId = db.storeQuery('SELECT `bid` FROM `houses` WHERE `highest_bidder`=' .. db.escapeString(getPlayerGUID(cid)) .. ' LIMIT 1')
    if resultId == false then
        return 0
    end
    local r = result.getDataInt(resultId, "bid")
    result.free(resultId)
    return r
end

function updatePlayerBalance(name, value)
    db.query('UPDATE players SET balance=' .. value .. ' WHERE name=' .. db.escapeString(name) .. ' LIMIT 1')
end

function greet(cid)
    Topic[cid], count[cid], transfer[cid] = nil, nil, nil
    return true
end

function decayItem(itempos, toitem)
    local item = getThingFromPos(itempos)
    if (not toitem) or toitem == 0 then
        doRemoveItem(item.uid,1)
    else
        doTransformItem(item.uid,toitem)
    end
end
 
function doDecayItemTo(itempos, toitem, timer)
    addEvent(decayItem, timer*1000, itempos, toitem)
    return true
end

function getGoldenAccountDays(cid) 
        local Info = db.getResult("SELECT `golden_days` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. "") 
                if Info:getID() ~= LUA_ERROR then 
                local Name = Info:getDataInt("golden_days") 
                Info:free() 
                return Name 
        end 
        return LUA_ERROR 
end 

function isInArea(pos, fromPos, toPos)
    if pos.x >= fromPos.x and pos.x <= toPos.x then
        if pos.y >= fromPos.y and pos.y <= toPos.y then
            if pos.z >= fromPos.z and pos.z <= toPos.z then
                return true
            end
        end
    end
    return false
end 

function doAddGoldenDays(cid, days)
db.executeQuery("UPDATE `accounts` SET `golden_days` = `golden_days` + " .. days .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end

function doRemoveGoldenDays(cid, days)
db.executeQuery("UPDATE `accounts` SET `golden_days` = `golden_days` - " .. days .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end
