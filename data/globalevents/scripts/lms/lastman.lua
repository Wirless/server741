 local createpos = {x=32349,y=32222,z=7} -- Every 2h where will the Teleport Appear
 local topos = {x=31702,y=32011,z=7} -- Where will the Teleport take you
 local msg = "Last man standing event Teleporter has now been closed! It will open again in 2 hours! All participants get Ready for a Fight!"
 local timetoclose = 90 -- in second

 local function remove()
 local tp = getTileItemById(createpos,1387).uid
 if tp ~= 0 then
 doRemoveItem(tp)
 doBroadcastMessage(msg)
 end
 end

 function onTime(interval)
 doCreateTeleport(1387, topos, createpos)
 doBroadcastMessage("Last man standing event Teleporter is now open!\nCatch the teleport within "..timetoclose.." seconds! Teleport is located in Thais Depot.")
 addEvent(remove,timetoclose*1000)
 return true
 end 