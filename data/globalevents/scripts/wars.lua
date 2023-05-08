function onThink(interval, lastExecution) 
        for _, id in ipairs(getGuildsWithWar()) do 
                local Check = db.getResult("SELECT name FROM guilds WHERE id = ".. getGuildWarInfo(id).With .."") 
                if Check:getID() == LUA_ERROR then 
                        cleanInfo(id) 
                end 
        end 
        return TRUE 
end  


