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


-- iterate over whole table to get all keys

-- now you can reliably return a random key



function onEquip(cid, item, slot, outfit)
	if item.id == 2657 then
	changeOutfit(cid, 78)
	elseif item.id == 2658 then
	changeOutfit(cid, 46)
	elseif item.id == 2659 then
	changeOutfit(cid, 354)
	elseif item.id == 2485 then
	changeOutfit(cid, 20)
	elseif item.id == 2650 then
	changeOutfit(cid, 11)
	elseif item.id == 2651 then
	changeOutfit(cid, 72)
	elseif item.id == 2652 then
	changeOutfit(cid, 5)
	elseif item.id == 2653 then
	changeOutfit(cid, 70)
	
	
	
	end
	return true
end

function onDeEquip(cid, item, slot)
	if item.id == 2657 then
	changeOutfit(cid, 150)
	elseif item.id == 2658 then
	changeOutfit(cid, 47)
	elseif item.id == 2659 then
	changeOutfit(cid, 160)
	elseif item.id == 2485 then
	changeOutfit(cid, 77)
	elseif item.id == 2650 then
	changeOutfit(cid, 12)
	elseif item.id == 2651 then
	changeOutfit(cid, 311)
	elseif item.id == 2652 then
	changeOutfit(cid, 7)
	elseif item.id == 2653 then
	changeOutfit(cid, 69)
	
	end
	return true
end