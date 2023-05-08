
function onSay(cid, words, param)
local config =
{
makeExhaustion = 0, --make exhaust? put the exhaust time in seconds or false if it won't make exhaustion
exhaustionStorage = 51628,
}
if (exhaustion.get (cid, config.exhaustionStorage)) then
return doPlayerSendCancel (cid, "Wait "..exhaustion.get (cid, config.exhaustionStorage).. " seconds to do it again.")
end

if (config.makeExhaustion ~= false and tonumber(config.makeExhaustion)) then


doPlayerRemoveMoney(cid, 1000)
doPlayerSendCancel(cid, 'kappa.')
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_KAPPA)
 exhaustion.set (cid, config.exhaustionStorage, config.makeExhaustion)


				else
		doPlayerSendCancel(cid, 'Also wait 1minute')
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
        end

end

