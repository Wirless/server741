 local t = {
 tmp = {
 -- Waiting room destinations
 {x = 31694, y = 32001, z = 7}, -- North west corner of waiting room where players must stand in order to join the event
 {x = 31710, y = 32019, z = 7} -- South east corner of waiting room
 },
 arena = {
 -- Arena destinations
 {x = 31640, y = 32154, z = 7}, -- North west Corner of Arena
 {x = 31753, y = 32205, z = 7}, -- South East corner of Arena
 {x = 31692, y = 32178, z = 7} -- Center of Arena
 },

 from = {x = 31664, y = 32168, z = 7}, -- Top left cornor of the playground (random players teleportation)
 to = {x = 31720, y = 32189, z = 7}, -- Bottom right cornor of the playground (random players teleportation)

 minPlayers = 1, -- min players required to start the battle
 noPlayers = 1, -- Leave it as it is
 prize = {2160} -- Reward that player recives
 }
 local kick = 0
 local teleportPlayer = 0

 function onThink()
 local arenaPlayers = {}

 for x = t.arena[1].x, t.arena[2].x do
 for y = t.arena[1].y, t.arena[2].y do
 for z = t.arena[1].z, t.arena[2].z do
 local pos = {x = x, y = y, z = z}
 local n = getTileInfo(pos).creatures
 if n ~= 0 then
 pos.stackpos = 1
 local c = getThingfromPos(pos)
 while c.uid ~= 0 do
 if c.itemid == 1 and c.type == 1 then
 table.insert(arenaPlayers, c.uid)
 if #arenaPlayers == n then
 break
 end
 end
 pos.stackpos = pos.stackpos + 1
 c = getThingfromPos(pos)
 end
 end
 end
 end
 end

 if #arenaPlayers == 1 then
 local p = getPlayerMasterPos(arenaPlayers[1])
 doTeleportThing(arenaPlayers[1], p)
 doSendMagicEffect(p, CONST_ME_TELEPORT)
 doPlayerSendTextMessage(arenaPlayers[1], MESSAGE_STATUS_CONSOLE_BLUE, "You have won the event and received your reward.")
 doBroadcastMessage(getCreatureName(arenaPlayers[1]) .." won a Last Man Standing Event.")
 doPlayerAddItem(arenaPlayers[1], t.prize[math.random(#t.prize)], 10)
 kick = 0
 elseif #arenaPlayers > 1 then
 if kick == 0 then
 kick = os.time()
 else
 if os.time() - kick >= 840 then
 kick = 0
 for i = 1, #arenaPlayers do
 local mp = getPlayerMasterPos(arenaPlayers[i])
 doTeleportThing(arenaPlayers[i], mp)
 doPlayerSendTextMessage(arenaPlayers[i], MESSAGE_STATUS_WARNING, "Too even, try harder next time.")
 end
 end
 end
 elseif #arenaPlayers == 0 then
 kick = 0

 local players = {}
 for x = t.tmp[1].x, t.tmp[2].x do
 for y = t.tmp[1].y, t.tmp[2].y do
 for z = t.tmp[1].z, t.tmp[2].z do
 local c = getTopCreature({x = x, y = y, z = z})
 if c.type == 1 then
 table.insert(players, c.uid)
 end
 end
 end
 end

 if #players >= t.minPlayers then
 for i = 1, #players do
 local p = {x = math.random(t.from.x, t.to.x), y = math.random(t.from.y, t.to.y), z = math.random(t.from.z, t.to.z)}

 doTeleportThing(players[i], p)
 doSendMagicEffect(p, CONST_ME_TELEPORT)
 doPlayerSendTextMessage(players[i], MESSAGE_STATUS_WARNING, "The battle begins. Survive for glory!")
 end
else
 for i = 1, #players do
  local mplayer = getPlayerMasterPos(players[i])
 doTeleportThing(players[i], mplayer)
 doPlayerSendTextMessage(players[i], MESSAGE_STATUS_WARNING, "The event didn't start because there isn't enough players in area!")
 end
 end
 end
 return true
 end 