local centeroffight = {x = 32245, y = 32206, z = 8}
local waitingplace = {x = 32245, y = 32206, z = 7}
local depotcenter = {x = 32345, y = 32223, z = 7}
local MinimumPlayers = 2
local rewardpoints = 2





local function lmsclosed1()
	broadcastMessage("Last Man Standing event will start in 1 minutes. Portal is opened in depot", MESSAGE_STATUS_WARNING)
end


local function lmsclosed()

count = 0
        local spectators = getSpectators(waitingplace, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then    
                         count = count + 1
                       
                        end
                end
        end
        
        
        
if (count >= MinimumPlayers) then

broadcastMessage("Last Man Standing event portal closed and event started!", MESSAGE_STATUS_WARNING)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,centeroffight)
doSendMagicEffect(center, CONST_ME_TELEPORT)
    end
       
end

else

broadcastMessage("Not enough players to start Last man Standing event! Minimum: "..MinimumPlayers.." players. We have "..count.."!", MESSAGE_STATUS_WARNING)
setGlobalStorageValue(25002, 0)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)

    end
end

end


return true
end





local function lmscheck()


count = 0
        local spectators = getSpectators(centeroffight, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then    
                         count = count + 1
                       
                        end
                end
        end

if count == 1 then


for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(playerids, 25001, 0)
    end
end

        local spectators = getSpectators(centeroffight, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then  

            
            
doTeleportThing(spectator,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
broadcastMessage("Last Man Standing Event ended winner is: "..getPlayerName(spectator)..", reward is 2 premium points.", MESSAGE_STATUS_WARNING)
   
local accid = Player(spectator):getAccountId()
local points = rewardpoints
db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. accid)
                     end
                end
        end
        


for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(pid, 25001, 0)
end
end

stopEvent(lmscheck) 

else
addEvent(lmscheck, 10*1000)
end
end



local function lms()
	broadcastMessage("Last Man Standing event will start in 2 minutes. Portal is opened in depot", MESSAGE_STATUS_WARNING)

	portalwhere = {x= 32349, y=32222, z=7}
	local portal = doCreateItem(11796,1,portalwhere)
  doSetItemActionId(portal, 25001)
  doSendMagicEffect(portalwhere, CONST_ME_TELEPORT)


	iteminfo = {x= 32348, y=32222, z=7}
	local item = doCreateItem(1431,1,iteminfo)
  doSetItemActionId(item, 25002) 
  doSendMagicEffect(iteminfo, CONST_ME_TELEPORT)
  
addEvent(function() doRemoveItem(getTileItemById(portalwhere, 11796).uid) end, 120 * 1000)
addEvent(function() doSendMagicEffect(portalwhere, CONST_ME_TELEPORT) end, 120 * 1000)

addEvent(function() doRemoveItem(getTileItemById(iteminfo, 1431).uid) end, 120 * 1000)
addEvent(function() doSendMagicEffect(iteminfo, CONST_ME_TELEPORT) end, 120 * 1000)

addEvent(lmsclosed, 2*60*1000)
addEvent(lmsclosed1, 1*60*1000)
addEvent(lmscheck, 130*1000)

return true
end



function onThink(interval) 

	broadcastMessage("Last Man Standing event will start in 3 minutes.", MESSAGE_STATUS_WARNING)
	addEvent(lms, 60*1000)

return true
end







