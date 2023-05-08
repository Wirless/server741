local PZ = createConditionObject(CONDITION_INFIGHT)
setConditionParam(PZ, CONDITION_PARAM_TICKS, getConfigInfo('whiteSkullTime'))

function onKill(cid, target)

if isPlayer(cid) == TRUE and isPlayer(target) == TRUE then

local GUID = getPlayerGUID(cid)
local NAME = getPlayerName(cid)
local namet = getPlayerName(target)
local skull = getCreatureSkullType(cid)
local fragTime = getConfigInfo('TimeToDecreaseFrags')
local amount = getPlayerRedSkullTicks(cid)
local frags = math.floor((amount / fragTime) + 1)
local cidd = cid

local function removeFrag(cid)

local amountt = getPlayerRedSkullTicks(cidd)
local fragss = math.floor((amountt / fragTime) + 1)

if fragss > frags then
doPlayerSetRedSkullTicks(cidd, amount)
doPlayerSendTextMessage(cidd, 21, "Frag from "..namet.." wasn't counted.")
end

if skull == SKULL_WHITE then
if getCreatureSkullType(cidd) == SKULL_RED then
doCreatureSetSkullType(cidd, SKULL_WHITE)
doPlayerSetRedSkullTicks(cidd, 0)
end
end
end

local myGuild = getPlayerGuildId(cid)
local enemyGuild = getPlayerGuildId(target)

if myGuild ~= 0 and enemyGuild ~= 0 then
if enemyGuild == getGuildWarInfo(myGuild).With then
doAddCondition(cid, PZ)
if getShowInfo(myGuild).S == 1 then
registerDeathOne(myGuild, enemyGuild, cid, target)
else
registerDeathTwo(myGuild, enemyGuild, cid, target)
end
addEvent(removeFrag, 150)
doPlayerAddItem(cid, 2157, 1) --REWARD
end
end
end
return TRUE
end 