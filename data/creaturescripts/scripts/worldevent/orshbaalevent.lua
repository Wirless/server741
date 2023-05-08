function onDeath(cid, corpse, killer)
local monstName,Storage = "Orshabaal",63536 -- monster name, storage
if isMonster(cid) and string.lower(getCreatureName(cid)) == string.lower(monstName) then
if isInParty(killer[1]) == true then
local players = getPartyMembers(getPartyLeader(killer[1]))
for i, k in ipairs(players) do
local playerGUID = getPlayerGUIDByName(getPlayerName(k))
doPlayerAddAchievement(k, playerGUID, "Orsha...what? Oh yea! Its dead!", "Orshabaal", 1, 2, 4)
end
else
local playerGUID = getPlayerGUIDByName(getPlayerName(killer[1]))
doPlayerAddAchievement(killer[1], playerGUID, "Orsha...what? Oh yea! Its dead!", "Orshabaal", 1, 2, 4)
end
end
return true
end