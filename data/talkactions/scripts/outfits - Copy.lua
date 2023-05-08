local outfits = {
	{549, 14112, "fdemonhunter", 2157, 1, "golden nugget"}, -- {outfit_id, storage, "outfit_name", itemid, count, "item_name"}
	{550, 14113, "fwarrior", 2157, 1, "golden nugget"},
	{551, 14114, "fbarbarian", 2157, 1, "golden nugget"},
	{562, 14144, "fassassin", 2157, 5, "golden nugget"},
	{563, 14146, "noblewoman", 2160, 1, "crystal coins"},
	{564, 14147, "fwizard", 2157, 10, "golden nugget"},
	{565, 14148, "fsummonerl",2157, 10, "golden nugget"},
	{552, 14115, "mwizard", 2157, 1, "golden nugget"},
	{553, 14116, "mdruid", 2157, 1, "golden nugget"},
	{554, 14117, "mpirate", 2157, 1, "golden nugget"},
	{555, 14119, "mwarrior", 2157, 1, "golden nugget"},
	{556, 14120, "mjester", 2157, 10, "golden nugget"},
	{557, 14121, "msummoner", 2157, 10, "golden nugget"},
	{546, 14131, "massassin", 2157, 20, "golden nugget"},
	{547, 14132, "magician", 2157, 1, "golden nugget"},
	{548, 14133, "mage", 2157, 100, "golden nugget"},
	{558, 14140, "mcitizen", 2157, 5, "golden nugget"},
	{559, 14141, "mshaman", 2157, 5, "golden nugget"},
	{561, 14142, "mnightmare", 2157, 5, "golden nugget"},
	{560, 14145, "mbarbarian", 2157, 5, "golden nugget"},
	{144, 14151, "elf", 2157, 100, "golden nugget"},
	{160, 14152, "dwarf", 2157, 100, "golden nugget"}
	
	
}
local vip_item_required_to_unlock_any_outfit_instead_of_regular_item = {"outfit doll", 5811}

local function changeOutfit(cid, new_outfit)
	local outfit = getCreatureOutfit(cid)
	tmp = outfit
	tmp.lookType = new_outfit
	tmp.lookHead = outfit.lookHead
	tmp.lookLegs = outfit.lookLegs
	tmp.lookBody = outfit.lookBody
	tmp.lookFeet = outfit.lookFeet
	tmp.lookAddons = outfit.lookAddons
	doCreatureChangeOutfit(cid, tmp)
	return true
end

function onSay(cid, words, param, channel)
	param = param:lower()
	if param == '' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use '!outfit info' for a list of available commands.")
		return true
	end
	
	if param == 'info' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Available commands..\n-> Use '!outfit change' to change to a random outfit.\n-> Use '!outfit outfit_name' to swap to a specific outfit. \n-> -> Example '!outfit demonhunter'\n-> Use '!outfit list' to show a list of all outfits you own.\n-> Use '!outfit all' to show a list of all outfits available.\n-> Use '!outfit unlock, outfit_name' in order to unlock an outfit.\n-> There is always an item required to unlock an outfit.\n-> If you don't have the item, the system will tell you what item you are missing.")
		return true
	end
	
	if param == 'change' then
		local random_outfits = {}
		for i = 1, #outfits do
			if getPlayerStorageValue(cid, outfits[i][2]) == 1 then
				table.insert(random_outfits, i)
			end
		end
		if #random_outfits < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you don't own any outfits to change into.")
			return true
		end
		local rand = math.random(#random_outfits)
		changeOutfit(cid, outfits[random_outfits[rand]][1])
		return true
	end
	
	if param == 'list' then
		local text = ""
		for i = 1, #outfits do
			if getPlayerStorageValue(cid, outfits[i][2]) == 1 then
				if text ~= "" then
					text = text .. ", "
				end
				text = text .. "".. outfits[i][3] .. ""
			end
		end
		if text == "" then
			text = "none"
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfits you own: " .. text .. ".")
		return true
	end
	
	if param == 'all' then
		local text = ""
		for i = 1, #outfits do
			if text ~= "" then
				text = text .. ", "
			end
			text = text .. "".. outfits[i][3] .. ""
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "List of all outfits: " .. text .. ".")
		return true
	end
	
	for i = 1, #outfits do
		if outfits[i][3] == param then
			if getPlayerStorageValue(cid, outfits[i][2]) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit swapped to " .. param .. ".")
				changeOutfit(cid, outfits[i][1])
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit not unlocked. say !outfit unlock,NAME example !outfit unlock,mwizard Requires " .. outfits[i][5] .. " " .. outfits[i][6] .. ", or 1 " .. vip_item_required_to_unlock_any_outfit_instead_of_regular_item[1] .. ".")
			end
			return true
		end
	end
	
	local t = string.explode(param, ",")
	if t[1] == 'unlock' then
		for i = 1, #outfits do
			if outfits[i][3] == t[2] then
				if getPlayerStorageValue(cid, outfits[i][2]) ~= 1 then
					if getPlayerItemCount(cid, outfits[i][4]) >= outfits[i][5] or getPlayerItemCount(cid, vip_item_required_to_unlock_any_outfit_instead_of_regular_item[2]) >= 1 then
						if getPlayerItemCount(cid, outfits[i][4]) >= outfits[i][5] then
							doPlayerRemoveItem(cid, outfits[i][4], outfits[i][5])
						else
							doPlayerRemoveItem(cid, vip_item_required_to_unlock_any_outfit_instead_of_regular_item[2], 1)
						end
						setPlayerStorageValue(cid, outfits[i][2], 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit " .. t[2] .. " unlocked!")
						changeOutfit(cid, outfits[i][1])
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You require " .. outfits[i][5] .. " " .. outfits[i][6] .. " or 1 " .. vip_item_required_to_unlock_any_outfit_instead_of_regular_item[1] .. " to unlock this outfit.")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit already unlocked.")
				end
				return true
			end
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit ' " .. t[2] .. " ' doesn't exist. Please use '!outfit unlock, outfit_name' to unlock an outfit. If you are unsure of the outfit's spelling use '!outfit all' to see all outfits available.")
		return true
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknown command used. Use '!outfit info' for a list of available commands.")
	return true
end