function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
     if getPlayerLevel(cid) < 40 and getPlayerSkullType(cid) < 3 then
         doCreatureSetDropLoot(cid, false)
		 else
		 doCreatureSetDropLoot(cid, true)
     end
     return true
end