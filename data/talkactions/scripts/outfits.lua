local outfits = {
	{577, 14112, "malecitizen", 2157, 5, "golden nugget"}, -- {outfit_id, storage, "outfit_name", itemid, count, "item_name"}
	{578, 14113, "malehunter", 2157, 25, "golden nugget"},
	{579, 14114, "malemage", 2157, 200, "golden nugget"},
	{580, 14144, "maleknight", 2157, 25, "golden nugget"},
	{581, 14146, "malenobleman", 2160, 25, "crystal coins"},
	{582, 14147, "malesummoner", 2157, 25, "golden nugget"},
	{583, 14148, "malewarrior",2157, 25, "golden nugget"},
	{584, 14115, "malebarbarian", 2157, 25, "golden nugget"},
	{585, 14116, "maledruid", 2157, 25, "golden nugget"},
	{586, 14117, "malewizard", 2157, 25, "golden nugget"},
	{587, 14119, "maleoriental", 2157, 25, "golden nugget"},
	{588, 14120, "malepirate", 2157, 50, "golden nugget"},
	{589, 14121, "maleassassin", 2157, 50, "golden nugget"},
	{590, 14131, "malebeggar", 2157, 50, "golden nugget"},
	{591, 14132, "maleshaman", 2157, 50, "golden nugget"},
	{592, 14133, "malenorseman", 2157, 50, "golden nugget"},
	{593, 14140, "malenightmare", 2157, 100, "golden nugget"},
	{594, 14180, "maledemonhunter", 2157, 100, "golden nugget"},
	{602, 14160, "femalecitizen", 2157, 5, "golden nugget"},
	{603, 14161, "femalehunter", 2157, 25, "golden nugget"},
	{604, 14162, "femalemage", 2157, 100, "golden nugget"},
	{605, 14163, "femaleknight", 2157, 25, "golden nugget"},
	{606, 14164, "femalenoble", 2157, 25, "golden nugget"},
	{607, 14165, "femalesummoner", 2157, 25, "golden nugget"},
	{608, 14166, "femalewarrior", 2157, 25, "golden nugget"},
	{609, 14167, "femalebarbarian", 2157, 25, "golden nugget"},
	{610, 14168, "femaledruid", 2157, 25, "golden nugget"},
	{611, 14169, "femalewizard", 2157, 25, "golden nugget"},
	{612, 14171, "femaleoriental", 2157, 25, "golden nugget"},
	{613, 14172, "femalepirate", 2157, 50, "golden nugget"},
	{614, 14173, "femalebeggar", 2157, 50, "golden nugget"},
	{615, 14174, "femaleshaman", 2157, 50, "golden nugget"},
	{616, 14175, "femalenorsewoman", 2157, 100, "golden nugget"},
	{617, 14177, "femaledemonhunter", 2157, 100, "golden nugget"}

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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use '!outfit info' for a list of available commands. and remember no spaces between ,")
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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit ' " .. t[2] .. " ' doesn't exist. Please use '!outfit unlock,outfit_name' < imporant no space between unlock,name to unlock an outfit. If you are unsure of the outfit's spelling use '!outfit all' to see all outfits available.")
		return true
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unknown command used. Use '!outfit info' for a list of available commands.")
	return true
end