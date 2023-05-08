local itemId = 5542 -- scroll id

function onTextEdit(cid, item, text)
    if item.itemid == itemId then
		if getTilePzInfo(getPlayerPosition(cid)) ~= TRUE then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You can only use this item inside protection zone!")
			return false
		end

		local checkPlayer = findPlayer(text)
		if (checkPlayer) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Character name ' .. text .. ' is already in use.')
		else
			text = text:trim()
			text = text:gsub("(%a)([%w_']*)", function(first, rest) return first:upper()..rest:lower() end)
			local low = text:lower()
			if text:len() < 4 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Name must be atleast 4 letters long.')
			elseif text:len() > 15 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Name must be less than 15 letters long.')
			elseif text:find('[^A-Za-z%s]') then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Name may only contain letters and spaces.')
			elseif text:find('  ') then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Name may not contain double spaces.')
			elseif low:sub(1, 4) == 'god ' or low:sub(1, 3) == 'cm ' or low:sub(1, 3) == 'gm ' or low:find('admin') then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Name is invalid.')
			elseif doPlayerRemoveItem(cid, itemId, 1) then
				local id = getPlayerGUID(cid)
				local saveName = text:gsub(text, "n", "")
				doRemoveCreature(cid)
				db.executeQuery("UPDATE players SET name = '" .. saveName .. "' WHERE id = " .. id)
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to have a namelock scroll.')
			end
		end
		return false
    end
    return true
end