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

function onUse(cid, item, frompos, item2, topos)
pos = getCreaturePosition(item2.uid)
getplayer = getThingfromPos(pos)

changeOutfit(getplayer.uid, 311)
end


