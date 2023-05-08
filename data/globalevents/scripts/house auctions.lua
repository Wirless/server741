function onThink(interval, lastExecution)
-- Check house auctions
local resultId = db.storeQuery("SELECT `id`, `highest_bidder`, `last_bid`, (SELECT `balance` FROM `players` WHERE `players`.`id` = `highest_bidder`) AS `balance` FROM `houses` WHERE `owner` = 0 AND `bid_end` != 0 AND `bid_end` < " .. os.time())
if resultId ~= false then
    repeat
        local house = (resultId:getDataInt("id"))
        if house ~= nil then
            local highestBidder = result.getDataInt(resultId, "highest_bidder")local balance = result.getDataLong(resultId, "balance")local lastBid = result.getDataInt(resultId, "last_bid")
            if balance >= lastBid then
                db.query("UPDATE `players` SET `balance` = " .. (balance - lastBid) .. " WHERE `id` = " .. highestBidder)
                house:setOwnerGuid(highestBidder)
            end
            -- here new code:
            db.query("UPDATE `houses` SET `last_bid` = 0, `bid_end` = 0, `highest_bidder` = 0, `bid` = 0 WHERE `id` = " .. house:getId())
        end
    until not result.next(resultId)
    result.free(resultId)
end
end
