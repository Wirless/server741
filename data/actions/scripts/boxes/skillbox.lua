--	doAddContainerItem(backpack, Cfredgem, 1)
--			doAddContainerItem(backpack, Cfvioletgem, 1)
	--		doAddContainerItem(backpack, Cfbluegem, 1)
	--		doAddContainerItem(backpack, Cfyellowgem, 1)
	--		doAddContainerItem(backpack, Cfgreengem, 1)
	
	
	function makeffects(cid)
doSendAnimatedText(getPlayerPosition(cid), "SKILLBOX", TEXTCOLOR_YELLOW)
doSendMagicEffect(getPlayerPosition(cid),  math.random(27,30))
end
	

local function f(cid)
doSendAnimatedText(getPlayerPosition(cid), "SKILLBOX", TEXTCOLOR_YELLOW)
end	
	
function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerFreeCap(cid) <= 200 then
		doPlayerSendTextMessage(cid,22,"You need 200 cap or more to use this!")
		return false
else


local generuj = math.random(0,10000)
local skillboxstorage = getPlayerStorageValue(cid, 7142) + 1 
setPlayerStorageValue(cid, 7142, skillboxstorage)
print(generuj)
doRemoveItem(item.uid, 1)	
addEvent(f, 500, cid)
addEvent(f, 600, cid)
addEvent(f, 700, cid)
addEvent(f, 800, cid)
makeffects(cid)
		if generuj <= 2000 then
			-- COMMON
			backpack = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(backpack, Cfredgem, 1)
			doAddContainerItem(backpack, Cfvioletgem, 1)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "COMMON!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 3500 and generuj > 2000 then
			-- COMMON
			backpack = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(backpack, Cfredgem, 1)
			doAddContainerItem(backpack, Cfvioletgem, 1)
			doAddContainerItem(backpack, Cfbluegem, 1)
			--doPlayerRemoveItem(cid,7142, 1)	
			doSendAnimatedText(getPlayerPosition(cid), "COMMON!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(getPlayerPosition(cid), 26)
	
	
	elseif generuj <= 5000 and generuj > 3500 then
			-- COMMON
			backpack = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(backpack, Cfredgem, 1)
			doAddContainerItem(backpack, Cfvioletgem, 1)
			doAddContainerItem(backpack, Cfyellowgem, 1)
			doAddContainerItem(backpack, Cfgreengem, 1)
			--doPlayerRemoveItem(cid,7142, 1)	
			doSendAnimatedText(getPlayerPosition(cid), "COMMON!", TEXTCOLOR_LIGHTGREEN)
			doSendMagicEffect(getPlayerPosition(cid), 26)
	
		elseif generuj <= 5500 and generuj > 5000 then
			-- RARE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 3)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "RARE!", TEXTCOLOR_LIGHTBLUE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 6000 and generuj > 5500 then
			-- RARE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 3)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "RARE!", TEXTCOLOR_LIGHTBLUE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif (generuj <= 6500) and (generuj > 6000) then
			-- RARE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 2)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "RARE!", TEXTCOLOR_LIGHTBLUE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 7000 and generuj > 6500 then
			-- RARE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 2)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 2)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "RARE!", TEXTCOLOR_LIGHTBLUE)
			doSendMagicEffect(getPlayerPosition(cid), 26)

		elseif generuj <= 7300 and generuj > 7000 then
				-- EPIC1 chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 5)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 7600 and generuj > 7300 then
				-- EPIC2 chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 3)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 7900 and generuj > 7600 then
				-- EPIC3 chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 5)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 8200 and generuj > 7900 then
				-- EPIC4 chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 7)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC+!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 8500 and generuj > 8200 then
				-- EPIC5 chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 7)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC+!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 8800 and generuj > 8500 then
			-- EPIC chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 4)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 4)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC+!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9100 and generuj > 8800 then
			-- EPIC chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 2)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 2)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 4)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 4)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 2)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "EPIC++!",  TEXTCOLOR_PURPLE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9300 and generuj > 9100 then
			-- LEGENDARY chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 3)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 3)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 7)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 7)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 3)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "LEGENDARY!", TEXTCOLOR_ORANGE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9500 and generuj > 9300 then
			-- LEGENDARY chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 2)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 2)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 7)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 7)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 4)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "LEGENDARY!", TEXTCOLOR_ORANGE)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9600 and generuj > 9500 then
			-- ULTIMATE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 10)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 10)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "ULTIMATE!", TEXTCOLOR_RED)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9700 and generuj > 9600 then
			-- ULTIMATE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 10)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 10)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 5)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 5)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "ULTIMATE!", TEXTCOLOR_RED)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9800 and generuj > 9700 then
			-- ULTIMATE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 10)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 10)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 5)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "ULTIMATE!", TEXTCOLOR_RED)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj <= 9950 and generuj > 9800 then
			-- ULTIMATE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 10)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 10)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 10)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "ULTIMATE!", TEXTCOLOR_RED)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		elseif generuj >= 9951 then
			-- GODLIKE chance
			backpack = doPlayerAddItem(cid, 1988, 1)
			yellowbackpack = doAddContainerItem(backpack, 1999, 1)
			doAddContainerItem(yellowbackpack, Cfyellowgem, 20)
			greenbackpack = doAddContainerItem(backpack, 1998, 1)
			doAddContainerItem(greenbackpack, Cfgreengem, 20)
			redbackpack = doAddContainerItem(backpack, 2000, 1)
			doAddContainerItem(redbackpack, Cfredgem, 20)
			purplebackpack = doAddContainerItem(backpack, 2001, 1)
			doAddContainerItem(purplebackpack, Cfvioletgem, 20)
			bluebackpack = doAddContainerItem(backpack, 2002, 1)
			doAddContainerItem(bluebackpack, Cfbluegem, 20)
			--doPlayerRemoveItem(cid,7142, 1)
			doSendAnimatedText(getPlayerPosition(cid), "GODLIKE!", TEXTCOLOR_YELLOW)
			doSendMagicEffect(getPlayerPosition(cid), 26)
		end
		
end

end









