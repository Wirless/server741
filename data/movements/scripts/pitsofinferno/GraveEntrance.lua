local newpos = {x=32791, y=32334, z=10}
function onStepIn(cid, item, position, fromPosition)
      doSendMagicEffect(getPlayerPosition(cid), 2)
      doTeleportThing(cid,newpos)
      doSendMagicEffect(newpos,13)
end