
function onSay(cid, words, param)
local config =
{
makeExhaustion = 3600, --make exhaust? put the exhaust time in seconds or false if it won't make exhaustion
exhaustionStorage = 51629,
}
if (exhaustion.get (cid, config.exhaustionStorage)) then
return doPlayerSendCancel (cid, "Wait "..exhaustion.get (cid, config.exhaustionStorage).. " seconds to do it again.")
end

if (config.makeExhaustion ~= false and tonumber(config.makeExhaustion)) then



 doSendMagicEffect(getPlayerPosition(cid), 85)
 exhaustion.set (cid, config.exhaustionStorage, config.makeExhaustion)
				else
		doPlayerSendCancel(cid, '5 second exhaust')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end

end

