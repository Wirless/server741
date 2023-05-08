function onUse(cid, item, fromPosition, itemEx, toPosition)
local addpoints = 1 -- amount of points to add
db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + "..addpoints.." WHERE `id` = '" ..getPlayerAccountId(cid).. "';")
doPlayerSendTextMessage(cid,22,""..addpoints.." premium points have been added to your account.")
doRemoveItem(item.uid, 1)
return true
end

