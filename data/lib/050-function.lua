function createClass(parent)
	local newClass = {}
	function newClass:new(instance)
		local instance = instance or {}
		setmetatable(instance, {__index = newClass})
		return instance
	end

	if(parent ~= nil) then
		setmetatable(newClass, {__index = parent})
	end

	function newClass:getSelf()
		return newClass
	end

	function newClass:getParent()
		return baseClass
	end

	function newClass:isa(class)
		local tmp = newClass
		while(tmp ~= nil) do
			if(tmp == class) then
				return true
			end

			tmp = tmp:getParent()
		end

		return false
	end
	
	function newClass:setAttributes(attributes)
		for k, v in pairs(attributes) do
			newClass[k] = v
		end
	end

	return newClass
end

InitHistory = 0

function isInRange(pos, fromPos, toPos)
	return (pos.x >= fromPos.x and pos.y >= fromPos.y and pos.z >= fromPos.z and pos.x <= toPos.x and pos.y <= toPos.y and pos.z <= toPos.z) and TRUE or FALSE
end

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

function doPlayerBuyItemContainer(cid, container, itemid, charges, cost, count)
	if(doPlayerRemoveMoney(cid, cost) == TRUE) then
			for i = 1, count do
				local containerItem = doPlayerAddItem(cid, container, 1)
				for x = 1, 20 do
					doAddContainerItem(containerItem, itemid, charges)
				end

		end
		return LUA_NO_ERROR
	end
	return LUA_ERROR
end

function doPlayerBuyContainer(cid, container, itemid, charges, cost, count)
	if(doPlayerRemoveMoney(cid, cost) == TRUE) then
			for i = 1, count do
				local containerItem = doPlayerAddItem(cid, container, 1)
				for x = 1, 20 do
					doAddContainerItem(containerItem, itemid, charges)
				end

		end
		return LUA_NO_ERROR
	end
	return LUA_ERROR
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

function string.explode(str, delimiter)
	if str == nil then
		return {}
	end
	t = {}
	for v in string.gmatch(str, "([^,]*)" .. delimiter .. "?") do
		table.insert(t, v)
	end
	table.remove(t) -- Removes last element (Always "")
	return t
end

function string.strip_whitespace(str)
	if str == nil then return str end
	local start = string.find(str, "[^%s]") -- First non-whitespace character
	local _end = #str + 1 - string.find(str:reverse(), "[^%s]") -- Last non-whitespace character
	
	if start ~= nil and _end ~= nil then
		return string.sub(str, start, _end)
	elseif start ~= nil then
		return string.sub(str, start)
	elseif _end ~= nil then
		return string.sub(str, 1, _end)
	end
	return str
end

function getPlayerByAccountNumber(acc)
	players = getPlayersByAccountNumber(acc)
	if #players == 0 then
		return 0
	end
	return players[1]
end

function convertIntToIP(int, mask)
	local b4 = bit.urshift(bit.uband(int,  4278190080), 24)
	local b3 = bit.urshift(bit.uband(int,  16711680), 16)
	local b2 = bit.urshift(bit.uband(int,  65280), 8)
	local b1 = bit.urshift(bit.uband(int,  255), 0)
	if mask ~= nil then
		local m4 = bit.urshift(bit.uband(mask,  4278190080), 24)
		local m3 = bit.urshift(bit.uband(mask,  16711680), 16)
		local m2 = bit.urshift(bit.uband(mask,  65280), 8)
		local m1 = bit.urshift(bit.uband(mask,  255), 0)
		if (m1 == 255 or m1 == 0) and (m2 == 255 or m2 == 0) and (m3 == 255 or m3 == 0) and (m4 == 255 or m4 == 0) then
			if m1 == 0 then b1 = "x" end
			if m2 == 0 then b2 = "x" end
			if m3 == 0 then b3 = "x" end
			if m4 == 0 then b4 = "x" end
		else
			if m1 ~= 255 or m2 ~= 255 or m3 ~= 255 or m4 ~= 255 then
				return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4 .. " : " .. m1 .. "." .. m2 .. "." .. m3 .. "." .. m4
			end
		end
	end
	
	return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4
end

function convertIPToInt(str)
	local maskindex = str:find(":")
	if maskindex ~= nil then
		-- IP:Mask style
		if maskindex <= 1 then
			return 0, 0
		else
			ipstring = str:sub(1, maskindex - 1)
			maskstring = str:sub(maskindex)
			
			local ipint = 0
			local maskint = 0
			
			local index = 0
			for b in ipstring:gmatch("(%d+).?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then -- Invalid
				return 0, 0
			end
			
			index = 0
			for b in maskstring:gmatch("(%d+)%.?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then
				return 0, 0
			end
			
			return ipint, maskint
		end
	else
		local ipint = 0
		local maskint = 0
		local index = 24
		
		for b in str:gmatch("([x%d]+)%.?") do
			if b ~= "x" then
				if b:find("x") ~= nil then
					return 0, 0
				end
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(255, index))
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
			end
			index = index - 8
			if index < 0 then
				break
			end
		end
		if index ~= -8 then -- Invalid
			return 0, 0
		end
		return ipint, maskint
	end
end

--Antibot system


function ABgetCount(msg)
	b, e = string.find(msg, "%d+")
	
	if b == nil or e == nil then
		count = 1
	else
		count = tonumber(string.sub(msg, b, e))
	end	
	return count
end
function getNumberValue(msg)
	b, e = string.find(msg, "%d+")
	
	if b == nil or e == nil then
		count = 1
	else
		count = tonumber(string.sub(msg, b, e))
	end	
	return count
end

function getDirectionTo(pos1, pos2)
	local dir = NORTH
	if(pos1.x > pos2.x) then
		dir = WEST
		if(pos1.y > pos2.y) then
			dir = NORTHWEST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHWEST
		end
	elseif(pos1.x < pos2.x) then
		dir = EAST
		if(pos1.y > pos2.y) then
			dir = NORTHEAST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHEAST
		end
	else
		if(pos1.y > pos2.y) then
			dir = NORTH
		elseif(pos1.y < pos2.y) then
			dir = SOUTH
		end
	end
	return dir
end

function isSorcerer(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isSorcerer: Player not found.")
		return false
	end

	return (isInArray({1,5}, getPlayerVocation(cid)) == TRUE)
end

function isDruid(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isDruid: Player not found.")
		return false
	end

	return (isInArray({2,6}, getPlayerVocation(cid)) == TRUE)
end

function isPaladin(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isPaladin: Player not found.")
		return false
	end

	return (isInArray({3,7}, getPlayerVocation(cid)) == TRUE)
end

function isKnight(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isKnight: Player not found.")
		return false
	end

	return (isInArray({4,8}, getPlayerVocation(cid)) == TRUE)
end

function getPlayerLookPos(cid)
	return getPosByDir(getThingPos(cid), getPlayerLookDir(cid))
end

function getPosByDir(basePos, dir)
	local pos = basePos
	if(dir == NORTH) then
		pos.y = pos.y-1
	elseif(dir == SOUTH) then
		pos.y = pos.y + 1
	elseif(dir == WEST) then
		pos.x = pos.x-1
	elseif(dir == EAST) then
		pos.x = pos.x+1
	elseif(dir == NORTHWEST) then
		pos.y = pos.y-1
		pos.x = pos.x-1
	elseif(dir == NORTHEAST) then
		pos.y = pos.y-1
		pos.x = pos.x+1
	elseif(dir == SOUTHWEST) then
		pos.y = pos.y+1
		pos.x = pos.x-1
	elseif(dir == SOUTHEAST) then
		pos.y = pos.y+1
		pos.x = pos.x+1
	end
	return pos
end

function getPlayerMoney(cid)
	return ((getPlayerItemCount(cid, ITEM_CRYSTAL_COIN) * 10000) + (getPlayerItemCount(cid, ITEM_PLATINUM_COIN) * 100) + getPlayerItemCount(cid, ITEM_GOLD_COIN))
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name)
	return (getPlayerGUIDByName(name) ~= 0)
end

function getOnlinePlayers()
	local tmp = getPlayersOnline()
	local players = {}
	for i, cid in ipairs(tmp) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerFrags(cid)
	return math.ceil((getPlayerRedSkullTicks(cid) / getConfigInfo('timeToDecreaseFrags')) + 1)
end

function doPlayerAddFrags(cid, amount)
	return doPlayerSetRedSkullTicks(cid, getPlayerRedSkullTicks(cid) + getConfigInfo('timeToDecreaseFrags') * amount)
end

function getConfigInfo(info)
	if (type(info) ~= 'string') then return nil end

	dofile('config.lua')
	return _G[info]
end

function getTibiaTime()
	local worldTime = getWorldTime()
	local hours = 0
	while (worldTime > 60) do
		hours = hours + 1
		worldTime = worldTime - 60
	end

	return {hours = hours, minutes = worldTime}
end

exhaustion = 
{

	check = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage)  
		if (os.time() >= exhaust) then
			return FALSE
		else
			return TRUE
		end
	end,

	get = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage) 
		local left = exhaust - os.time()
		if (left >= 0) then
			return left
		else
			return FALSE
		end
	end,
	
	set = function (cid, storage, time)
		setPlayerStorageValue(cid, storage, os.time()+time)  
	end,

	make = function (cid, storage, time)
		local exhaust = exhaustion.get(cid, storage)
		if (exhaust > 0) then
			return FALSE
		else
			exhaustion.set(cid, storage, time)
			return TRUE
		end
	end
}


	table.find = function (table, value)
		for i,v in pairs(table) do
			if (v == value) then
				return i
			end
		end
		return nil
	end
	table.getPos = table.find

	table.isStrIn = function (txt, str)
		local result = false
		for i, v in pairs(str) do          
			result = (string.find(txt, v) and not string.find(txt, '(%w+)' .. v) and not string.find(txt, v .. '(%w+)'))
			if (result) then
				break
			end
		end
		return result
	end

	table.countElements = function (table, item)
		local count = 0
		for i, n in pairs(table) do
			if (item == n) then count = count + 1 end
		end
		return count
	end
	
	table.getCombinations = function (table, num)
		local a, number, select, newlist = {}, #table, num, {}
		for i = 1, select do
			a[#a + 1] = i
		end
		local newthing = {}
		while (1) do
			local newrow = {}
			for i = 1, select do
				newrow[#newrow + 1] = table[a[i]]
			end
			newlist[#newlist + 1] = newrow
			i = select
			while (a[i] == (number - select + i)) do
				i = i - 1
			end
			if (i < 1) then break end
				a[i] = a[i] + 1
				for j = i, select do
					a[j] = a[i] + j - i
				end
			end
		return newlist
	end


	string.split = function (str)
		local t = {}
		local function helper(word) table.insert(t, word) return "" end
		if (not str:gsub("%w+", helper):find"%S") then return t end
	end
	
	string.separate = function(separator, string)
		local a, b = {}, 0
		if (#string == 1) then return string end
	    while (true) do
			local nextSeparator = string.find(string, separator, b + 1, true)
			if (nextSeparator ~= nil) then
				table.insert(a, string.sub(string,b,nextSeparator-1)) 
				b = nextSeparator + 1 
			else
				table.insert(a, string.sub(string, b))
				break 
			end
	    end
		return a
	end
	
	function doCopyItem(item, attributes)
	local attributes = attributes or false

	local ret = doCreateItemEx(item.itemid, item.type)
	if(attributes) then
		if(item.actionid > 0) then
			doItemSetAttribute(ret, "aid", item.actionid)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doPlayerAddAchievement(cid, playerId, achievementName, creatureName, amountKill, modus, grade)
db.executeQuery("INSERT INTO `player_achievement` (`player_id`, `achievement`, `date`, `monster`, `amount`, `modus`, `grade`) VALUES ("..playerId..", '"..achievementName.."', ".. os.time() ..", '"..creatureName.."', "..amountKill..", "..modus..", "..grade..");")
end

function doPlayerAddEvent(event, playerId, wonItem)
db.executeQuery("INSERT INTO `events` (`event`, `player_id`, `won_item`, `time`) VALUES ('"..event.."', '"..playerId.."', '"..wonItem.."', ".. os.time() ..");")
end

function UpdateHouseLeaveTime(cid)
mysqlQuery("UPDATE `accounts` SET `page_lastday`='".. os.time() .."' WHERE `id`=".. getAccountNumberByPlayerName(getPlayerName(cid)) ..";", "UPDATE")
mysqlQuery("UPDATE `houses_one` SET `acc_lastlogin` = '".. os.time() .."' WHERE `houses_one`.`owner_acc` =".. getAccountNumberByPlayerName(getPlayerName(cid)) ..";", "UPDATE")
return 1
end

function SellPlayerEmptyVials(cid)
emptyvialmoney = 0
	while doPlayerRemoveItem(cid, 2006, 1, 0) == 1 do
		emptyvialmoney = (emptyvialmoney+5)
	end
	
if getNumberValue(emptyvialmoney) > 0 then
doPlayerAddMoney(cid, getNumberValue(emptyvialmoney))
return true
else
return false
end
end

function BridgeRelocate(frompos, topos)
GETMAGICPOS = getThingfromPos({x=frompos.x, y=frompos.y, z=frompos.z, stackpos=254})
doRelocate(frompos, topos)
if GETMAGICPOS.itemid >= 1 then
doRemoveItem(GETMAGICPOS.uid)
end
DUSTBIN = {x=32243, y=32220, z=7}
doRelocate(frompos, DUSTBIN)
return true
end

function getDistanceBetween(pos1, pos2)
	local xDif = math.abs(pos1.x - pos2.x)
	local yDif = math.abs(pos1.y - pos2.y)

	local posDif = math.max(xDif, yDif)
	if (pos1.z ~= pos2.z) then
		posDif = (posDif + 9 + 6)
	end
	return posDif
end

function TalkState(cid, state)
setPlayerStorageValue(cid, 6507, state)
	return 1
end

function GetTalkState(cid)
	return getPlayerStorageValue(cid, 6507)
end

if(result == nil) then
	print("> WARNING: Couldn't load database lib.")
	return
end

Result = createClass(nil)
Result:setAttributes({
	id = -1,
	query = ""
})

function Result:getID()
	return self.id
end

function Result:setID(_id)
	self.id = _id
end

function Result:getQuery()
	return self.query
end

function Result:setQuery(_query)
	self.query = _query
end

function Result:create(_query)
	self:setQuery(_query)
	local _id = db.storeQuery(self:getQuery())
	if(_id) then
		self:setID(_id)
	end

	return self:getID()
end

function Result:getRows(free)
	local free = free or false
	if(self:getID() == -1) then
		error("[Result:getRows] Result not set!")
	end

	local c = 0
	repeat
		c = c + 1
	until not self:next()

	local _query = self:getQuery()
	self:free()
	if(not free) then
		self:create(_query)
	end

	return c
end

function Result:getDataInt(s)
	if(self:getID() == -1) then
		error("[Result:getDataInt] Result not set!")
	end

	return result.getDataInt(self:getID(), s)
end

function Result:getDataLong(s)
	if(self:getID() == -1) then
		error("[Result:getDataLong] Result not set!")
	end

	return result.getDataLong(self:getID(), s)
end

function Result:getDataString(s)
	if(self:getID() == -1) then
		error("[Result:getDataString] Result not set!")
	end

	return result.getDataString(self:getID(), s)
end

function Result:getDataStream(s)
	if(self:getID() == -1) then
		error("[Result:getDataStream] Result not set!")
	end

	return result.getDataStream(self:getID(), s)
end

function Result:next()
	if(self:getID() == -1) then
		error("[Result:next] Result not set!")
	end

	return result.next(self:getID())
end

function Result:free()
	if(self:getID() == -1) then
		error("[Result:free] Result not set!")
	end

	self:setQuery("")
	local ret = result.free(self:getID())
	self:setID(-1)
	return ret
end

Result.numRows = Result.getRows
function db.getResult(query)
	if(type(query) ~= 'string') then
		return nil
	end

	local ret = Result:new()
	ret:create(query)
	return ret
end

DelayToCancel = 24 -- hours 

Maps = { 
        ["map1"] = 
                { 
                        Guild1Pos = {x=238, y=442, z=12}, 
                        Guild2Pos = {x=244, y=442, z=12} 
                }, 
        ["map2"] = 
                { 
                        Guild1Pos = {x=994, y=1004, z=6}, 
                        Guild2Pos = {x=1000, y=1003, z=6}                       
                } 
        } 

TimeToTeleport = 1 --minutes, when start a challenge 
StopBattle = TRUE --Stop battle after X time ? TRUE  /  FALSE 
TimeToStop = 60 --Minutes Time to Stop if StopBattle = TRUE. 

--Cancel messages~ 
CancelMessagesWar = { 
        --Message when player try accept/reject/cancel a war but there is no a invitation. 
        [1] = "Not pending invitations.", 
        --Message when the player is not the guild leader. 
        [2] = "Only Guild Leader can execute this command.", 
        --Message when try Cancel the invitation but the war is already accepted. 
        [3] = "The war is already accepted.", 
        --MEssage when the invited guild name is not correct or does not exist. 
        [4] = "Not correct guild name.", 
        --Message when try invite any guild to a war but his guild already have a war or a pending invitation. 
        [5] = "Your guild is already in war or have a pending invitation.", 
        --Same of the cancel message 5 but the the enemy guild. 
        [6] = "This guild is already in war or have a pending invitation.", 
        --Message when use invite command but not write guild name. 
        [7] = "Command needs param.", 
        --Message when try invite his guild. 
        [8] = "You can\'t invite you guild.", 
        --Message when the map name is not correct. 
        [9] = "Please write a correct name.", 
        --Message when try go to any map but the guild is have no received/sent any war invitation 
        [10] = "Your guild is not in any war.", 
        --When try to cancel a war before the delay 
        [11] = "You should wait ".. DelayToCancel .." hours to cancel the war" 
        } 
        
--Broadcast messages when invite/accept/reject/cancel ~ Remember the Spaces. 
BroadCast_Type = MESSAGE_EVENT_ADVANCE 
BroadCast = { 
        --Message when inviting 
        [1] = 
                { 
                        "Guild ", 
                        --Here will be the guild name 
                        " have invited guild ", 
                        --Here will be the invited guild name 
                        " to have a war." 
                }, 
        --Message when accept. 
        [2] = 
                { 
                        "Guild ", 
                        --Here will be the guild name 
                        " have accepted the invitation of the guild " , 
                        --Here will be the name of the guild who have invited em. 
                        " to have a war." 
                }, 
        --Message when reject. 
        [3] = 
                { 
                        "Guild ", 
                        --Here will be the guild name 
                        " have rejected the invitation of the guild " , 
                        --Here will be the name of the guild who have invited em. 
                        " to have a war." 
                }, 
        --Message when cancel. 
        [4] = 
                { 
                        "Guild ", 
                        --Here will be the guild name 
                        " have canceled the invitation to the guild " , 
                        --Here will be the name of the guild who have invited em. 
                        " to have a war." 
                }, 
        --Message whenstar a battle.. 
        [5] = 
                { 
                        "Guild ", 
                        --Here will be the guild name 
                        " and guild " , 
                        --Here will be the name of the guild who have invited em. 
                        " will have a battle in the map :" 
                }, 
        --message when a battle ends. 
        [6] = 
                { 
                        "The battle betwen guild ", 
                        --Here will be the guild name 
                        " and guild " , 
                        --Here will be the name of the guild who have invited em. 
                        " its over." 
                }, 
        } 

--Functions ~. 

function getShowInfo(id) 
        local Info = db.getResult("SELECT `show` FROM `guilds` WHERE `id` = " .. id .. "") 
        if Info:getID() ~= LUA_ERROR then 
                local showy = Info:getDataInt("show") 
                Info:free() 
                return {S = showy} 
        end 
        return LUA_ERROR 
end 

function getGuildWarInfo(id) 
        local Info = db.getResult("SELECT `invited_to`, `invited_by`, `in_war_with`,`war_time` FROM `guilds` WHERE `id` = " .. id .. "") 
        if Info:getID() ~= LUA_ERROR then 
                local invTo, invBy, warWith, Time = Info:getDataInt("invited_to"), Info:getDataInt("invited_by"), Info:getDataInt("in_war_with"), Info:getDataInt("war_time") 
                Info:free() 
                return {To = invTo, By = invBy, With = warWith, T = Time} 
        end 
        return LUA_ERROR 
end 

function getGuildNameById(id) 
        local Info = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. id .. "") 
                if Info:getID() ~= LUA_ERROR then 
                local Name = Info:getDataString("name") 
                Info:free() 
                return Name 
        end 
        return LUA_ERROR 
end 

function getGuildWarKills(id) 
        local Info = db.getResult("SELECT `kills` FROM `guilds` WHERE `id` = " .. id .. "") 
        if Info:getID() ~= LUA_ERROR then 
                local killy = Info:getDataInt("kills") 
                Info:free() 
                return {K = killy} 
        end 
        return LUA_ERROR 
end 

function addGuildWarPoints(id, amount) 
        db.executeQuery("UPDATE `guilds` SET `guild_points` = ".. amount .." WHERE `id` = ".. id .."") 
end 

function GuildIsInPEace(id) 
        local Info = getGuildWarInfo(id) 
        return (Info.To == 0 and Info.By == 0 and Info.With == 0) 
end 

function doInviteToWar(myGuild, enemyGuild) 
        local StartTime = os.time() 
        db.executeQuery("UPDATE `guilds` SET `invited_to` = ".. enemyGuild ..", `war_time` = ".. StartTime .." WHERE `id` = ".. myGuild .."") 
        db.executeQuery("UPDATE `guilds` SET `invited_by` = ".. myGuild .." WHERE `id` = ".. enemyGuild .."") 
end 

function WarAccept(myGuild, enemyGuild) 
        local StartTime = os.time() 
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `in_war_with`  =  ".. myGuild ..", `kills` = 0, `show` = 1 WHERE `id` = ".. enemyGuild .."") 
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = ".. StartTime ..", `in_war_with`  =  ".. enemyGuild ..", `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."") 
end 

function cleanInfo(myGuild) 
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = 0, `in_war_with`  =  0, `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."") 
end 

function registerDeathOne(myGuild, enemyGuild, cid, target) 
        db.executeQuery("INSERT INTO `deaths_in_wars` (`guild_id`, `player_id`, `killer_guild`, `killer`, `date`, `result1`, `result2`) VALUES ("..enemyGuild..", "..getPlayerGUID(target)..", "..myGuild..", "..getPlayerGUID(cid)..", " .. os.time() ..", 1, 0);")       
        db.executeQuery("UPDATE `guilds` SET `kills` = `kills` + 1 WHERE `id` = ".. myGuild .."") 
end 

function registerDeathTwo(myGuild, enemyGuild, cid, target) 
        db.executeQuery("INSERT INTO `deaths_in_wars` (`guild_id`, `player_id`, `killer_guild`, `killer`, `date`, `result1`, `result2`) VALUES ("..enemyGuild..", "..getPlayerGUID(target)..", "..myGuild..", "..getPlayerGUID(cid)..", " .. os.time() ..", 0, 1);")       
        db.executeQuery("UPDATE `guilds` SET `kills` = `kills` + 1 WHERE `id` = ".. myGuild .."") 
end 

function removeDeaths(id) 
        db.executeQuery("DELETE FROM `deaths_in_wars` WHERE `guild_id` = " ..id .. ";") 
end 

function StopWar(myGuild, enemyGuild) 
        cleanInfo(myGuild) 
        cleanInfo(enemyGuild) 
        removeDeaths(myGuild) 
        removeDeaths(enemyGuild) 
end 

function WeAreInWar(myGuild, enemyGuild) 
        local myGuildInfo = getGuildWarInfo(myGuild) 
        local enemyGuildInfo = getGuildWarInfo(enemyGuild) 
        if myGuild == enemyGuildInfo.With and enemyGuild ==  myGuildInfo.With then 
                if enemyGuildInfo.ON == 1 and myGuildInfo.ON == 1 then 
                        return TRUE 
                end             
        end 
        return FALSE 
end 

function getOnlineMembers(id) 
        local PlayersOnline = getPlayersOnline() 
        local MembersOnline = {} 
        for i, pid in ipairs(PlayersOnline) do 
                if id == getPlayerGuildId(PlayersOnline[i]) then 
                        table.insert(MembersOnline, PlayersOnline[i]) 
                end 
        end 
        return MembersOnline 
end 

function teleportGuild(id, pos) 
        local Members = getOnlineMembers(id) 
        if #Members > 0 then 
        for i = 1, #Members do 
                if #Members > 1 then 
                        if getTilePzInfo(getCreaturePosition(Members[i])) == TRUE then 
                                doTeleportThing(Members[i], pos, FALSE) 
                                doSendMagicEffect(pos, CONST_ME_TELEPORT) 
                                doSendMagicEffect(getCreaturePosition(Members[i]), CONST_ME_POFF) 
                                doPlayerSendTextMessage(Members[i], 22, 'Prepare to fight!') 
                        else 
                                doPlayerPopupFYI(Members[i], 'GuildWar challenge error:\n\nBoth guild members must stay in Protection Zone.') 
                        end 
                else 
                        doPlayerPopupFYI(Members[i], 'GuildWar challenge error:\n\nBoth guilds must have more than one player online (leader & any member, at least).') 
                end 
        end 
        end 
end 

function getGuildsWithWar() 
        local res = db.getResult("SELECT `id` FROM `guilds` WHERE `in_war_with` > 0") 
        local GuildW = {} 
        if res:getID() ~= LUA_ERROR then 
                while true do 
                        table.insert(GuildW, res:getDataInt "id") 
                        if not res:next() then 
                                break 
                        end 
                end 
                res:free() 
        end 
        return GuildW 
end 

function guildExist(nom) 
        local Get = db.getResult("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(nom) .. ";") 
        if Get:getID() ~= LUA_ERROR then 
                local ret = Get:getDataInt("id") 
                Get:free() 
                return ret 
        end 
        return LUA_ERROR 
end 

function StartWar(x) 
        teleportGuild(x.myGuild, Maps[x.map].Guild1Pos) 
        teleportGuild(x.enemyGuild, Maps[x.map].Guild2Pos) 

        if StopBattle == TRUE then 
                addEvent(StopWarNow, 60 * 1000, {myGuild = x.myGuild, enemyGuild = x.enemyGuild}) 
        end 
end     

function StopWarNow(c) 
        StopWar(c.myGuild, c.enemyGuild) 
        broadcastMessage(BroadCast_Type, BroadCast[6][1] ..getGuildNameById(c.myGuild).. BroadCast[6][2] ..getGuildNameById(c.enemyGuild).. BroadCast[6][3]) 
end 

function putWarOn(myGuild, enemyGuild) 
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. myGuild .."") 
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. enemyGuild .."") 
end

function isInArray(array, value, caseSensitive)
	if(caseSensitive == nil or caseSensitive == false) and type(value) == "string" then
		local lowerValue = value:lower()
		for _, _value in ipairs(array) do
			if type(_value) == "string" and lowerValue == _value:lower() then
				return true
			end
		end
	else
		for _, _value in ipairs(array) do
			if (value == _value) then return true end
		end
	end

	return false
end

function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end

function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function doPlayerAddStamina(cid, minutes)
	return doPlayerSetStamina(cid, getPlayerStamina(cid) + minutes)
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigValue('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function doNumberFormat(i)
	local str, found = string.gsub(i, "(%d)(%d%d%d)$", "%1,%2", 1), 0
	repeat
		str, found = string.gsub(str, "(%d)(%d%d%d),", "%1,%2,", 1)
	until found == 0
	return str
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function getTibiaTime(num)
	local minutes, hours = getWorldTime(), 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	if(num) then
		return {hours = hours, minutes = minutes}
	end

	return {hours =  hours < 10 and '0' .. hours or '' .. hours, minutes = minutes < 10 and '0' .. minutes or '' .. minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED, (time == -1 and time or time * 1000))
	return doAddCondition(cid, condition, false)

end

function doSummonCreature(name, pos)
	local cid = doCreateMonster(name, pos, false, false)
	if(not cid) then
		cid = doCreateNpc(name, pos)
	end

	return cid
end

function getPlayersOnlineEx()
	local players = {}
	for i, cid in ipairs(getPlayersOnline()) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	return isPlayer(cid) and (getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE, CONDITIONID_DEFAULT) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN))
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	-- Npc IDs are over int32_t range (which is default for lua_pushnumber),
	-- therefore number is always a negative value.
	return isCreature(cid) and (cid < 0 or cid >= AUTOID_NPCS)
end

function isUnderWater(cid)
	return isInArray(underWater, getTileInfo(getCreaturePosition(cid)).itemid)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level, amount = 0, getPlayerLevel(cid), amount or 1
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	local amount = amount or 1
	for i = 1, amount do
		doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid), false)
	end

	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	local amount = amount or 1
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	for i = 1, amount do
		doPlayerAddSkillTry(cid, skill, getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill), false)
	end

	return true
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function doCopyItem(item, attributes)
	local attributes = ((type(attributes) == 'table') and attributes or { "aid" })

	local ret = doCreateItemEx(item.itemid, item.type)
	for _, key in ipairs(attributes) do
		local value = getItemAttribute(item.uid, key)
		if(value ~= nil) then
			doItemSetAttribute(ret, key, value)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	return precission and weight or math.round(weight, 2)
end

function choose(arg)
	return arg[math.random(1, table.maxn(arg))]
end

function doPlayerAddExpEx(cid, amount)
	if(not doPlayerAddExp(cid, amount)) then
		return false
	end

	local position = getThingPosition(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "You gained " .. amount .. " experience.", amount, COLOR_WHITE, position)

	local spectators, name = getSpectators(position, 7, 7), getCreatureName(cid)
	for _, pid in ipairs(spectators) do
		if(isPlayer(pid) and cid ~= pid) then
			doPlayerSendTextMessage(pid, MESSAGE_EXPERIENCE_OTHERS, name .. " gained " .. amount .. " experience.", amount, COLOR_WHITE, position)
		end
	end

	return true
end

function getItemTopParent(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			parent = tmp
		else
			break
		end
	end

	return parent
end

function getItemHolder(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	local holder = nil
	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			if(tmp.itemid == 1) then -- a creature
				holder = tmp
				break
			end

			parent = tmp
		else
			break
		end
	end

	return holder
end

function TalkState(cid, state)
setPlayerStorageValue(cid, 6507, state)
	return 1
end

function GetTalkState(cid)
	return getPlayerStorageValue(cid, 6507)
end

function valid(f)
	return function(p, ...)
		if(isCreature(p)) then
			return f(p, ...)
		end
	end
end

function isItemStackable(itemId) return ItemType(itemId):isStackable() end
function isItemRune(itemId) return ItemType(itemId):isRune() end
function isItemDoor(itemId) return ItemType(itemId):isDoor() end
function isItemContainer(itemId) return ItemType(itemId):isContainer() end
function isItemFluidContainer(itemId) return ItemType(itemId):isFluidContainer() end
function isItemChargeAmulet(itemId) return ItemType(itemId):isAmuletCharge() end
function isItemChargeRing(itemId) return ItemType(itemId):isRingCharge() end
function isItemMovable(itemId) return ItemType(itemId):isMovable() end
function isCorpse(uid) local i = Item(uid) return i ~= nil and ItemType(i:getId()):isCorpse() or false end

function doSetItemActionId(lols, actionid)
return doItemSetAttribute(lols, "aid", actionid)
end

function doSetItemUniqueId(lols, uniqueid)
return doItemSetAttribute(lols, "uid", uniqueid)
end

function checkExhausted(cid, storage, seconds)
local v = exhaustion.get(cid, storage)
if(not v) then
exhaustion.set(cid, storage, seconds)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Please wait " .. v .. " seconds before trying this command again.")
return false
end

return true
end