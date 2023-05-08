function onTime()

	local result_plr = db.storeQuery("SELECT * FROM z_golden_system WHERE status = '0'")
    if(result_plr ~= false) then
			local id = tonumber(result.getDataInt(result_plr, "id"))
			db.executeQuery("UPDATE accounts SET golden_days = golden_days - 1 WHERE golden_days > 0;")
			db.executeQuery("UPDATE `z_golden_system` SET `status` = 1 WHERE `id` = " .. id)
    end
	
    return true
end