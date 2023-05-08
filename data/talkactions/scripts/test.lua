--Remove health/mana by percentages: Evil Hero(Zeriikler:Changed few things)
function doPlayerAddManaPercent(cid, percent)
local mana = getPlayerMaxMana(cid)
doPlayerAddMana(cid, (mana / 100) * percent)
return TRUE
end
function doPlayerAddHealthPercent(cid, percent)
local health = getCreatureMaxHealth(cid)
doCreatureAddHealth(cid, (health / 100) * percent)
return TRUE
end
function doPlayerRemoveManaPercent(cid, percent)
local mana = getPlayerMaxMana(cid)
doPlayerRemoveMana(cid, (mana / 100) * percent)
return TRUE
end
function doPlayerRemoveHealthPercent(cid, percent)
local health = getCreatureMaxHealth(cid)
doPlayerRemoveHealth(cid, (health / 100) * percent)
return TRUE
end
--Remove HP/MANA
function doPlayerRemoveHealth(cid, hp)
doCreatureAddHealth(cid, -hp)
return TRUE
end
function doPlayerRemoveMana(cid, mana)
doPlayerAddMana(cid, -mana)
return TRUE
end

function onSay(cid, words, param, channel)
		local t = string.explode(param, ",")
		local player = getPlayerByNameWildcard(t[1])
		local percent = t[2]
		
	if(not player or (isPlayerGhost(player) and getPlayerGhostAccess(player) > getPlayerGhostAccess(player))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " is not currently online.")
		return true
	end
	
		doPlayerRemoveHealthPercent(player, percent)
		return TRUE
end
