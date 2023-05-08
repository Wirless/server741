local c = {
	aid = 9926, -- ActionID you want, you put to objects.
	msg = "You cannot move this object.", -- Message that appear when trying to move it.
}

function onMoveItem(moveItem, frompos, position, cid)
	if getItemAttribute(moveItem.uid, "aid") == c.aid then
      return doPlayerSendCancel(cid, c.msg) and false
    end

  return true
end