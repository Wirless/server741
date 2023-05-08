function onSay(cid, words, param, channel)
    if(getStorage(ZEA_STATUS) ~= 2) then
        local players_on_arena_count = #getLMSEventPlayers()
        if(param == 'force') then
            if(players_on_arena_count > 0) then
                setLMSEventPlayersLimit(players_on_arena_count  )
                addLMSEventBlockEnterPosition()
                doSetStorage(ZEA_STATUS, 2)
                doBroadcastMessage("Last Man Standing Event started.")
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Last Man Standing event started.")
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cannot start Last Man Standing event. There is no players on arena.")
            end
        else
            if(param ~= '' and tonumber(param) > 0) then
                setLMSEventPlayersLimit(tonumber(param))
            end
            removeLMSEventBlockEnterPosition()
            doSetStorage(ZEA_STATUS, 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Event started.")
            doBroadcastMessage( "Last Man Standing teleport is opened. We are waiting for " .. getLMSEventPlayersLimit() - players_on_arena_count .. " players to start.")
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Last Man Standing is already running.")
    end
    return true
end