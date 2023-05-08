function onSay(cid, words, param)
    if(param == '') then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "!task list, check your current list of undergoing tasks.")
        return true
    end
 
    if(param == 'list' or 'info') then
        local started = getPlayerStartedTasks(cid)
        if(started and #started > 0) then
            local text = ""
            local sep = ", "
            table.sort(started, (function(a, b) return (a < b) end))
            local t = 0
            for _, id in ipairs(started) do
                t = t + 1
                if t == #started - 1 then
                    sep = " and "
                elseif t == #started then
                    sep = "."
                end
                local amount = getPlayerStorageValue(cid, KILLSSTORAGE_BASE + getTaskByName(tasks[id].name or tasks[id].raceName));
             
                text = text .. "" .. (tasks[id].name or tasks[id].raceName) .. " (".. amount.."/"..(tasks[id].killsRequired)..")" .. sep;
            end
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text)
        else
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"You haven't started any task yet.")
        end
    end
    return true
end