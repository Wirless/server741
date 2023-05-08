local iid = 2173 -- AOL itemid
function onDeath(cid, corpse, killer)
if isPlayer(cid) then
local aol = getPlayerSlotItem(cid, 2)
if aol ~= false then
if aol.itemid == iid then
doRemoveItem(aol.uid)

end
end
end
return true
end