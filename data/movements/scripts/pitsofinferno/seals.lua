  local CONFIG =   {
    [56480]={storage = 19551, seal = "first"},
    [56481]={storage = 19552, seal = "second"},
    [56482]={storage = 19553, seal = "third"},
    [56483]={storage = 19554, seal = "fourth"},
    [56484]={storage = 19555, seal = "fifth"},
    [56485]={storage = 19556, seal = "sixth"},  
    [56486]={storage = 19557, seal = "seventh"}        
                 }

function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, CONFIG[item.actionid].storage) == -1 then
        doPlayerSendTextMessage(cid, TALKTYPE_BROADCAST, "You did not completed the " .. CONFIG[item.actionid].seal .. " seal")
        doTeleportThing(cid, fromPosition)
    end
  return TRUE
end 