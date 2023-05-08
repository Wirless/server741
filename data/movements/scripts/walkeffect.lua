

function onStepIn(cid, item, pos)

	return true
end

function onStepOut(cid, item, pos)
local outfit2 = getCreatureOutfit(cid)

if (outfit2.lookType == 77) then

doSendMagicEffect(pos, 15)
end

if (outfit2.lookType == 150 ) then
doSendMagicEffect(pos, 15)
		end
		
if getPlayerStorageValue(cid, 100100900) > 0 then
local out = getCreatureOutfit(cid)
		doCreatureChangeOutfit (cid, {lookType = out.lookType, lookHead = math.random(132) , lookBody = math.random(132), lookLegs = math.random(132), lookFeet = math.random(132), lookAddons = out.lookAddons } ) 
		end



		return true
end