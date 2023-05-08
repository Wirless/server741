local t = {
	storage = 133
}

local rate = getConfigInfo('rateLoot')

function round(n, s)
	return tonumber(('%.' .. (s or 0) .. 'f'):format(n))
end

function getContentDescription(uid, sep)
	local ret, i, containers = '', 0, {}
	while( i < getContainerSize(uid) )do
		local v, s = getContainerItem(uid, i), ''
		local k = getItemInfo(v.itemid)
		k.name = getItemAttribute(v.uid, 'name') or k.name
		if( k.name ~= '' )then
			if( v.type > 1 and k.stackable and k.showCount )then
				s = v.type .. ' ' .. k.plural
			else
				local article = getItemAttribute(v.uid, 'article') or k.article
				s = (article == '' and '' or article .. ' ') .. k.name
			end
			ret = ret .. (i == 0 and not sep and '' or ', ') .. s
			if( isContainer(v.uid) and getContainerSize(v.uid) ~= 0 )then
				table.insert(containers, v.uid)
			end
		else
			ret = ret .. (i == 0 and not sep and '' or ', ') .. 'an item of type ' .. v.itemid .. ', please report it to gamemaster'
		end
		i = i + 1
	end
	for i = 1, #containers do
		ret = ret .. getContentDescription(containers[i], true)
	end
	return ret
end




local function send(cid, pos, corpseid, monster)
if isPlayer(cid) then
	party = getPlayerParty(cid)
end
if not party or party == 0 then
	party = false
end
	local corpse = getTileItemById(pos, corpseid).uid
	local ret = isContainer(corpse) and getContentDescription(corpse)
	
	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 5788) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Loot of ' .. monster .. ': ' .. (ret ~= '' and ret or 'nothing'))
		end
	end
	
	if party then
		for _, pid in ipairs(getPartyMembers(party)) do
			doPlayerSendChannelMessage(pid, 'Loot of ' .. monster .. '', ' ' .. (ret ~= '' and ret or 'nothing'), 12, CHANNEL_PARTY)
		end
	end
end

function onKill(cid, target, damage, flags)
if isPlayer(cid) then
	storage = getCreatureStorage(cid, t.storage)
else
	storage = 100
end
	if bit.band(flags, 1) == 1 and isMonster(target) then
		local v = getMonsterInfo(getCreatureName(target))
         local master = getCreatureMaster(target)
         if v.lookCorpse > 0 and not master or master == target then
			if isPlayer(cid) then
				addEvent(send, 100, cid, getThingPos(target), v.lookCorpse, v.description)
			end
		end
		
	end
	return true
end