local PZ = createConditionObject(CONDITION_INFIGHT)
setConditionParam(PZ, CONDITION_PARAM_TICKS, getConfigInfo('whiteSkullTime'))

function onKill(cid, target)
local gdziejestestystarakurwo = getPlayerPosition(target)
local function zzz(cid, target)
doSendMagicEffect(gdziejestestystarakurwo, 32)
end




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
end
end
doSendMagicEffect(gdziejestestystarakurwo, 65)
doSendAnimatedText(getPlayerPosition(cid), "WARKILL", TEXTCOLOR_YELLOW)
addEvent(zzz, 500,cid ,target)
addEvent(zzz, 2500,cid ,target)
addEvent(zzz, 550,cid ,target)
end


return TRUE
end 