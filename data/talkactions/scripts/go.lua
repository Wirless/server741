local config =
{
        sexChangeable = false
}
 
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
        party = getPlayerParty(cid)
        if (config.sexChangeable == true) then
                sex = getPlayerSex(cid)
        end
        if (party) then
                if (party == cid) then
                        outfit = getCreatureOutfit(cid)
                        members = getPartyMembers(party)
                        if (#members >= 1) then
                                tmp = outfit
                                for i=1,#members do
                                        if (config.sexChangeable == true) then
                                                if (sex ~= getPlayerSex(members[i])) then
                                                        doPlayerSetSex(members[i], sex)
                                                end
                                        end
                                        if(canPlayerWearOutfit(members[i], tmp.lookType, tmp.lookAddons) ~= true) then
                                        local tmpOutfit = getCreatureOutfit(members[i])
                                        tmp.lookType = tmpOutfit.lookType
										tmp.lookHead = outfit.lookHead
										tmp.lookLegs = outfit.lookLegs
										tmp.lookBody = outfit.lookBody
										tmp.lookFeet = outfit.lookFeet
                                            tmp.lookAddons = tmpOutfit.lookAddons
                                        end
										
										
							            changeOutfit(cid,outfit)
                                        doCreatureChangeOutfit(members[i], outfit)
                                        doSendMagicEffect(getCreaturePosition(members[i]), 66)
                                end
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "This command can use only leader of a party!")
                end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You must be in a party!")
        end
        return true
end