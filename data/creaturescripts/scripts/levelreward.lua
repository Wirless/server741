
function onAdvance(cid, skill, oldLevel, newLevel)


  local st = getPlayerStorageValue(cid, lvlForNext) 

    if st <= newLevel and skill == 8 then
        if st == -100 then
            local tmp = prizes[getPlayerStorageValue(cid, rewardLvl)]
            if tmp then
                setPlayerStorageValue(cid, lvlForNext, tmp.level)
            end
        else
            local rewL = getPlayerStorageValue(cid, rewardLvl)
            local prize = prizes[rewL]
            local reward = prize.reward
            local nextLvl = prizes[rewL+1]
            local bp = doCreateItemEx(1988, 1)
            for i=1,#reward do
                doAddContainerItem(bp, reward[i][1], reward[i][2])
            end
            doPlayerAddItemEx(cid, bp)
            doPlayerSendTextMessage(cid, 19, "You have received backpack with items due to reaching level "..prize.level..".")
            setPlayerStorageValue(cid, rewardLvl, rewL+1)
            if nextLvl then
                setPlayerStorageValue(cid, lvlForNext, nextLvl.level)
            else
                setPlayerStorageValue(cid, lvlForNext, -100)
            end
        end
		
	end
end
	