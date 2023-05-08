
function onSay(cid, words, param)
if getPlayerStorageValue(cid, 100100900) < 1 then
return setPlayerStorageValue(cid, 100100900, 1)
else
return setPlayerStorageValue(cid, 100100900, 0)
end
return true
end