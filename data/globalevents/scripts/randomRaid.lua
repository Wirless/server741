function onThink(interval, lastExecution, thinkInterval)

	local result_plr = db.storeQuery("SELECT * FROM z_raidsystem WHERE started = '0' ORDER BY RAND()")
    if(result_plr ~= false) then
			local id = tonumber(result.getDataInt(result_plr, "id"))
            local raidName = tostring(result.getDataString(result_plr, "raid_name"))
			
			db.query("UPDATE `z_raidsystem` SET `started` = 1 WHERE `id` = " .. id)
			executeRaid(raidName)
    end
	
    return true
end