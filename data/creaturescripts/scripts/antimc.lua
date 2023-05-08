local config = {
max = 2, -- Maximum Clients Allowed Connected
text = "Sorry, we only allow up to 2 Multi-Clients.", -- PopupFYI Text
group_id = 1 -- This will only kick players with Group 1 (Player)
}

local accepted_ip_list = {"1.0.12.12"} -- IP's allowed to MC

local function AntiMC(p)
    if #getPlayersByIp(getPlayerIp(p.pid)) >= p.max then	
		addEvent(doRemoveCreature, 100, p.pid)
    end
    return TRUE
end




function onLogin(cid)

    if getPlayerGroupId(cid) < 2 then
        if isInArray(accepted_ip_list,getPlayerIp(cid)) == FALSE then
			   addEvent(AntiMC, 250, {pid = cid, max = config.max+1})
            end
        end
    return TRUE
end