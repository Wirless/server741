local config = {
	needPremium = false, --Need premium?
	needMoney = false, --Need Money?  if need put the money needed or it doesn't put false if it won't need money
	makeExhaustion = 1, --make exhaust? put the exhaust time in seconds or false if it won't make exhaustion
	exhaustionStorage = 3232, --storage for save the exhausted.
	effect = CONST_ME_CRAPS, --will send an effect? if it will do it put the effect number here or false if it won't 
	msg = "You changed your color", -- message it will send
	type = MESSAGE_INFO_DESCR, --the type of msg it will send , here you can see the types :
	
	--[[MESSAGE_EVENT_ADVANCE,
	MESSAGE_EVENT_DEFAULT,
	MESSAGE_STATUS_CONSOLE_ORANGE,
	MESSAGE_INFO_DESCR,
	MESSAGE_STATUS_SMALL,
	MESSAGE_STATUS_CONSOLE_BLUE,
	MESSAGE_STATUS_CONSOLE_RED,
	MESSAGE_STATUS_WARNING,  
	you can see it too in lib/constant.lua :d ]] -- 
}

function onSay(cid, words, param, channel)

	if (exhaustion.get (cid, config.exhaustionStorage)) then
		return doPlayerSendCancel (cid, "Wait "..exhaustion.get (cid, config.exhaustionStorage).. " seconds to do it again.")
	end
	if (config.needPremium and isPremium (cid) == false) then
		return doPlayerSendCancel(cid, "You need premium to use this command.")
	end
	
	if (config.needMoney ~= false and tonumber(config.needMoney) and doPlayerRemoveMoney(cid, config.needMoney) == false ) then
		return doPlayerSendCancel (cid, "You need "..config.needMoney.. " to use this command.")
	end
		
	if (config.makeExhaustion ~= false and tonumber(config.makeExhaustion)) then
		exhaustion.set (cid, config.exhaustionStorage, config.makeExhaustion)
	end
		
	if (config.effect ~= false and tonumber(config.effect)) then
		local pos = getThingPos(cid)
		doSendMagicEffect(pos, config.effect)
	end
		
	if (config.msg ~= false) then
		doPlayerSendTextMessage(cid, config.type, config.msg)
	end
	
	local out = getCreatureOutfit(cid)
		doCreatureChangeOutfit (cid, {lookType = out.lookType, lookHead = math.random(132) , lookBody = math.random(132), lookLegs = math.random(132), lookFeet = math.random(132), lookAddons = out.lookAddons } ) 
	return true
end