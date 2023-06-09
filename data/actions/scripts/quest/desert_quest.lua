 --Variables used:

 -- player?pos  = The position of the players before teleport.
 -- player?  = Get the thing from playerpos.
 --player?level = Get the players levels.
 --questslevel  = The level you have to be to do this quest.
 --questtatus?  = Get the quest status of the players.
 --demon?pos  = The position of the demons.
 --nplayer?pos  = The position where the players should be teleported too.
 --trash= position to send the demons to when clearing, 1 sqm in middle of nowhere is enough
 -- starting = Upper left point of the annihilator room area.
 -- ending = Bottom right point of the annihilator room area.
 
 --UniqueIDs used:

 --16000 = The switch.
 --999999 = Demon Armor chest.
 --999999 = Magic Sword chest.
 --999999 = Stonecutter Axe chest.
 --999999 = Present chest.


function onUse(cid, item, frompos, item2, topos)
if item.uid == 16000 then
 if item.itemid == 1946 then

 player1pos = {x=32673, y=32085, z=8, stackpos=253} --pally
 player1 = getThingfromPos(player1pos)

 player2pos = {x=32669, y=32089, z=8, stackpos=253} --druid
 player2 = getThingfromPos(player2pos)

 player3pos = {x=32677, y=32089, z=8, stackpos=253} --sorc
 player3 = getThingfromPos(player3pos)

 player4pos = {x=32673, y=32093, z=8, stackpos=253} --knight
 player4 = getThingfromPos(player4pos)



  player1level = getPlayerLevel(player1.uid)
  player2level = getPlayerLevel(player2.uid)
  player3level = getPlayerLevel(player3.uid)
  player4level = getPlayerLevel(player4.uid)

  questlevel = 20

  if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

	  queststatus1 = getPlayerVocation(player1.uid)
	  queststatus2 = getPlayerVocation(player2.uid)
	  queststatus3 = getPlayerVocation(player3.uid)
	  queststatus4 = getPlayerVocation(player4.uid)

	  if queststatus1 == 3 or queststatus1 == 7 and queststatus2 == 2 or queststatus1 == 6 and queststatus3 == 1 or queststatus1 == 5 and queststatus4 == 4 or queststatus1 == 8 then
	--if 1==1 then
	demon1pos = {x=32669, y=32067, z=8}
	demon2pos = {x=32670, y=32067, z=8}
	demon3pos = {x=32671, y=32067, z=8}
	demon4pos = {x=32672, y=32071, z=8}
	demon5pos = {x=32673, y=32071, z=8}
	demon6pos = {x=32673, y=32071, z=8}
 
   doSummonCreature("Cave rat", demon1pos)
   doSummonCreature("rat", demon2pos)
   doSummonCreature("Cave rat", demon3pos)
   doSummonCreature("rat", demon4pos)
   doSummonCreature("Cave rat", demon5pos)
   doSummonCreature("rat", demon6pos)

	nplayer1pos = {x=32671, y=32069, z=8}
	nplayer2pos = {x=32672, y=32069, z=8}
	nplayer3pos = {x=32671, y=32070, z=8}
	nplayer4pos = {x=32672, y=32070, z=8}

   doSendMagicEffect(player1pos,2)
   doSendMagicEffect(player2pos,2)
   doSendMagicEffect(player3pos,2)
   doSendMagicEffect(player4pos,2)

   doTeleportThing(player1.uid,nplayer1pos)
   doTeleportThing(player2.uid,nplayer2pos)
   doTeleportThing(player3.uid,nplayer3pos)
   doTeleportThing(player4.uid,nplayer4pos)

	 doSendMagicEffect(nplayer1pos,10)
	 doSendMagicEffect(nplayer2pos,10)
	 doSendMagicEffect(nplayer3pos,10)
	 doSendMagicEffect(nplayer4pos,10)

	 doTransformItem(item.uid,1945)

	else
	 doPlayerSendCancel(cid,"All vocations must stand on correct tile!")
	end
   else
	doPlayerSendCancel(cid,"Your level is too low")
   end
 end
 if item.itemid == 1945 then
-- Here is the code start:
starting={x=1632, y=423, z=14, stackpos=253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending={x=1638, y=428, z=14, stackpos=253}
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking)
 if creature.itemid > 0 then
 if getPlayerAccess(creature.uid) == 0 then
 players=players+1
 end
  if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
 totalmonsters=totalmonsters+1
  monster[totalmonsters]=creature.uid
   end
 end
checking.x=checking.x+1
  if checking.x>ending.x then
  checking.x=starting.x
  checking.y=checking.y+1
 end
until checking.y>ending.y
if players==0 then
trash= {x=1715, y=678, z=5}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
doTransformItem(item.uid,1946)
end
-- Here is the end of it

end
end
if item.uid == 999999 then
 queststatus = getPlayerStorageValue(cid,100)
 if queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
  doPlayerAddItem(cid,2494,1)
  setPlayerStorageValue(cid,100,1)
 else
  doPlayerSendTextMessage(cid,22,"It is empty.")
 end
end
if item.uid == 999999 then
 queststatus = getPlayerStorageValue(cid,100)
 if queststatus ~= 1 then
  doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
  doPlayerAddItem(cid,2400,1)
  setPlayerStorageValue(cid,100,1)
 else
  doPlayerSendTextMessage(cid,22,"It is empty.")
 end
end
if item.uid == 999999 then
 queststatus = getPlayerStorageValue(cid,100)
 if queststatus ~= 1 then
  doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
  doPlayerAddItem(cid,2431,1)
  setPlayerStorageValue(cid,100,1)
 else
  doPlayerSendTextMessage(cid,22,"It is empty.")
 end
end
if item.uid == 999999 then
 queststatus = getPlayerStorageValue(cid,100)
 if queststatus ~= 1 then
  doPlayerSendTextMessage(cid,22,"You have found a present.")
  doPlayerAddItem(cid,2326,1)
  setPlayerStorageValue(cid,100,1)
 else
  doPlayerSendTextMessage(cid,22,"It is empty.")
 end
 end
 return 1
end
